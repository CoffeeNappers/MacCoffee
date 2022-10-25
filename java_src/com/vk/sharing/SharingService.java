package com.vk.sharing;

import android.app.IntentService;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.sharing.attachment.Attachments;
import com.vk.sharing.target.Target;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesSend;
import com.vkontakte.android.api.wall.WallRepost;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.utils.L;
import java.util.List;
import java.util.UUID;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class SharingService extends IntentService {
    public static final int CALL_MESSAGE = 1;
    public static final int CALL_REPOST_GROUP = 3;
    public static final int CALL_REPOST_WALL = 2;
    public static final String EXTRA_ATTACHMENT_INFO = "attachment_info";
    public static final String EXTRA_CALL = "call";
    public static final String EXTRA_REFERER = "referer";
    public static final String EXTRA_TARGET = "target";
    public static final String EXTRA_TEXT = "text";
    public static final String EXTRA_TOTAL_TARGETS = "total_targets";
    private static final String PREF_JOB_CURRENT = "job_current";
    private static final String PREF_JOB_FAILURES = "job_failures";
    private static final String PREF_JOB_ID = "job_id";
    private static final String PREF_JOB_TOTAL = "job_total";
    private static final String PREF_JOB_TYPE = "job_type";
    private static final String PREF_NAME = "sharing_service";
    private JobHandler handler;
    private JobInfo info;
    private SharedPreferences preferences;

    public SharingService() {
        super("Sharing");
        setIntentRedelivery(true);
    }

    @Override // android.app.IntentService, android.app.Service
    public void onCreate() {
        super.onCreate();
        this.preferences = getSharedPreferences(PREF_NAME, 0);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(@Nullable Intent intent) {
        if (intent != null) {
            if (this.info == null) {
                this.info = createJobInfo(intent);
            }
            if (this.handler == null) {
                this.handler = createJobHandler(this.info);
            }
            writeResult(this.handler.onHandle(intent));
            return;
        }
        L.w("Intent is null");
    }

    @NonNull
    private JobInfo createJobInfo(@NonNull Intent intent) {
        String id = this.preferences.getString(PREF_JOB_ID, null);
        if (id == null) {
            JobInfo info = new JobInfo(UUID.randomUUID().toString(), intent.getIntExtra("call", 0), intent.getIntExtra(EXTRA_TOTAL_TARGETS, 1));
            this.preferences.edit().putString(PREF_JOB_ID, info.id).putInt(PREF_JOB_TYPE, info.type).putInt(PREF_JOB_TOTAL, info.total).putInt(PREF_JOB_CURRENT, info.current).putInt(PREF_JOB_FAILURES, info.failures).apply();
            return info;
        }
        return new JobInfo(id, this.preferences.getInt(PREF_JOB_TYPE, 0), this.preferences.getInt(PREF_JOB_TOTAL, 1));
    }

    @NonNull
    private JobHandler createJobHandler(@NonNull JobInfo info) {
        switch (info.type) {
            case 1:
                return new MessageJobHandler(this.preferences);
            case 2:
                return new RepostWallJobHandler();
            case 3:
                return new RepostGroupJobHandler();
            default:
                throw new IllegalArgumentException("Unknown type: " + info.type);
        }
    }

    private void writeResult(boolean success) {
        this.info.complete();
        if (!success) {
            this.info.fail();
        }
        SharedPreferences.Editor editor = this.preferences.edit();
        if (this.info.isCompleted()) {
            this.handler.onDone(this.info);
            this.info = null;
            editor.remove(PREF_JOB_ID);
        } else {
            editor.putInt(PREF_JOB_CURRENT, this.info.current).putInt(PREF_JOB_FAILURES, this.info.failures);
        }
        editor.apply();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class JobInfo {
        private int current;
        private int failures;
        private final String id;
        private final int total;
        private final int type;

        JobInfo(@NonNull String id, int type, int total) {
            this(id, type, total, total, 0);
        }

        JobInfo(@NonNull String id, int type, int total, int current, int failures) {
            this.id = id;
            this.type = type;
            this.total = total;
            this.current = current;
            this.failures = failures;
        }

        boolean isCompleted() {
            return this.current == 0;
        }

        int complete() {
            int i = this.current - 1;
            this.current = i;
            return i;
        }

        int fail() {
            int i = this.failures + 1;
            this.failures = i;
            return i;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class JobHandler {
        abstract void onFailed();

        abstract boolean onHandle(@NonNull Intent intent);

        abstract void onSuccess();

        JobHandler() {
        }

        final void onDone(@NonNull JobInfo info) {
            if (info.failures != info.total) {
                onSuccess();
            } else {
                onFailed();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static final class MessageJobHandler extends JobHandler {
        private static final String PREF_NEXT_ID = "nextId2";
        @NonNull
        private SharedPreferences preferences;

        MessageJobHandler(@NonNull SharedPreferences preferences) {
            this.preferences = preferences;
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        public boolean onHandle(@NonNull Intent intent) {
            AttachmentInfo info = (AttachmentInfo) intent.getParcelableExtra(SharingService.EXTRA_ATTACHMENT_INFO);
            Target target = (Target) intent.getParcelableExtra(SharingService.EXTRA_TARGET);
            String text = intent.getStringExtra("text");
            if (target == null) {
                return false;
            }
            return new MessagesSend(target.id, generateRandomId(), text, Attachments.toString(info)).setCallback(new Callback<Integer>() { // from class: com.vk.sharing.SharingService.MessageJobHandler.1
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer result) {
                    Log.d("vk", "message has been sent successfully: " + String.valueOf(result));
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Log.w("vk", error.toString());
                }
            }).execSync();
        }

        private int generateRandomId() {
            int nextId = nextId();
            try {
                String token = VKAccountManager.getCurrent().getAccessToken();
                if (token != null && token.length() >= 4) {
                    return nextId ^ (((token.charAt(0) | (token.charAt(1) << '\b')) | (token.charAt(2) << 16)) | (token.charAt(3) << 24));
                }
                return nextId;
            } catch (Exception x) {
                L.e(x, new Object[0]);
                return nextId;
            }
        }

        private int nextId() {
            int id = this.preferences.getInt(PREF_NEXT_ID, Integer.MAX_VALUE);
            if (id > 1) {
                this.preferences.edit().putInt(PREF_NEXT_ID, id - 1).apply();
            } else {
                this.preferences.edit().putInt(PREF_NEXT_ID, Integer.MAX_VALUE).apply();
            }
            return id;
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        void onFailed() {
            ToastUtils.showToast((int) R.string.sharing_job_call_message_toast_fail);
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        void onSuccess() {
            ToastUtils.showToast((int) R.string.sharing_job_call_message_toast_success);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class RepostWallJobHandler extends JobHandler {
        RepostWallJobHandler() {
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        public final boolean onHandle(@NonNull Intent intent) {
            boolean result;
            List<Statistic> stats;
            AttachmentInfo info = (AttachmentInfo) intent.getParcelableExtra(SharingService.EXTRA_ATTACHMENT_INFO);
            String text = intent.getStringExtra("text");
            String referer = intent.getStringExtra(SharingService.EXTRA_REFERER);
            String trackCode = info.getData().getString(AttachmentInfo.DATA_TRACK_CODE);
            int ownerId = -getGroupId(intent);
            if (info.getType() == 10) {
                result = doWallPostSync(ownerId, info, text, trackCode);
            } else {
                result = doWallRepostSync(ownerId, info, text, referer, trackCode);
            }
            if (result && 2 == info.getType() && (stats = info.getData().getParcelableArrayList(AttachmentInfo.DATA_STATS)) != null) {
                for (Statistic stat : stats) {
                    Analytics.sendPromoActionByType(stat, Statistic.TYPE_POST_SHARE);
                }
            }
            return result;
        }

        private boolean doWallPostSync(int ownerId, AttachmentInfo info, String text, String trackCode) {
            VKAPIRequest<JSONObject> request = new VKAPIRequest("execute.wallPost").param("owner_id", ownerId).param("from_group", 1).param("attachments", Attachments.toString(info)).param("message", text).setCallback(new Callback<JSONObject>() { // from class: com.vk.sharing.SharingService.RepostWallJobHandler.1
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject result) {
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Log.w("vk", error.toString());
                }
            });
            if (!TextUtils.isEmpty(trackCode)) {
                request.param("track_code", trackCode);
            }
            boolean result = request.execSync();
            return result;
        }

        private boolean doWallRepostSync(int ownerId, final AttachmentInfo info, String text, String referrer, String trackCode) {
            boolean result = new WallRepost(Attachments.toString(info), ownerId, text, referrer, trackCode).setCallback(new Callback<WallRepost.Result>() { // from class: com.vk.sharing.SharingService.RepostWallJobHandler.2
                @Override // com.vkontakte.android.api.Callback
                public void success(WallRepost.Result result2) {
                    Log.d("vk", "reposted successfully: " + result2.postID);
                    int postId = info.getMediaId();
                    int ownerId2 = info.getOwnerId();
                    int likes = result2.likes;
                    int reposts = result2.retweets;
                    boolean liked = RepostWallJobHandler.this.liked();
                    boolean reposted = RepostWallJobHandler.this.reposted();
                    Intent intent = new Intent(Posts.ACTION_POST_UPDATED_BROADCAST).putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postId).putExtra("owner_id", ownerId2).putExtra("retweets", reposts).putExtra(ServerKeys.LIKES, likes).putExtra("liked", liked).putExtra("retweeted", reposted);
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    NewsfeedCache.update(ownerId2, postId, likes, -1, reposts, liked, reposted);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Log.w("vk", error.toString());
                }
            }).execSync();
            return result;
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        void onFailed() {
            ToastUtils.showToast((int) R.string.sharing_job_call_repost_toast_fail);
        }

        @Override // com.vk.sharing.SharingService.JobHandler
        void onSuccess() {
            ToastUtils.showToast((int) R.string.sharing_job_call_repost_toast_success);
        }

        int getGroupId(@NonNull Intent intent) {
            return 0;
        }

        boolean liked() {
            return true;
        }

        boolean reposted() {
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static final class RepostGroupJobHandler extends RepostWallJobHandler {
        RepostGroupJobHandler() {
        }

        @Override // com.vk.sharing.SharingService.RepostWallJobHandler
        int getGroupId(@NonNull Intent intent) {
            return ((Target) intent.getParcelableExtra(SharingService.EXTRA_TARGET)).id;
        }

        @Override // com.vk.sharing.SharingService.RepostWallJobHandler
        boolean liked() {
            return false;
        }

        @Override // com.vk.sharing.SharingService.RepostWallJobHandler
        boolean reposted() {
            return false;
        }
    }
}
