package com.vkontakte.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.sharing.SharingService;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.wall.WallRepost;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.RepostAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.groups.AdminedGroupsFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.statistics.Statistic;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class RepostActivity extends Activity {
    private static final int SEL_CHAT_RESULT = 102;
    private static final int SEL_GROUP_RESULT = 101;
    private String groupName;
    private String groupPhoto;
    private LogoutReceiver logoutReceiver;
    private boolean newPost;
    private NewsEntry post;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        overridePendingTransition(0, 0);
        this.post = (NewsEntry) getIntent().getParcelableExtra(ArgKeys.POST);
        this.newPost = getIntent().getBooleanExtra(UserNotification.LAYOUT_NEWSFEED_NEW_POST, false);
        ArrayList<String> items = new ArrayList<>();
        ArrayList<String> acts = new ArrayList<>();
        if ((this.post.flag(1) || ((this.post.ownerID == VKAccountManager.getCurrent().getUid() && this.post.ownerID == this.post.userID) || this.post.type == 1 || this.post.type == 5 || this.post.type == 2 || this.post.type == 16)) && !this.post.flag(512)) {
            if ((!this.post.flag(4) && this.post.ownerID != VKAccountManager.getCurrent().getUid()) || ((this.post.type == 5 && this.post.userID != VKAccountManager.getCurrent().getUid()) || (this.post.type == 16 && this.post.userID != VKAccountManager.getCurrent().getUid()))) {
                items.add(getString(R.string.repost_own_wall));
                acts.add("me");
            }
            items.add(getString(R.string.repost_group));
            acts.add("group");
        }
        if (this.post.type != 5) {
            items.add(getString(R.string.repost_message));
            acts.add("msg");
        }
        setContentView(new View(this));
        if (getIntent().hasExtra("msg")) {
            startChatChooser();
        } else {
            new VKAlertDialog.Builder(this).setTitle(this.post.type == 5 ? R.string.repost_dlg_title_comment : R.string.repost_dlg_title).setItems((CharSequence[]) items.toArray(new String[items.size()]), RepostActivity$$Lambda$1.lambdaFactory$(this, acts)).setOnCancelListener(RepostActivity$$Lambda$2.lambdaFactory$(this)).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(ArrayList acts, DialogInterface dialog, int which) {
        String valueOf = String.valueOf(acts.get(which));
        char c = 65535;
        switch (valueOf.hashCode()) {
            case 3480:
                if (valueOf.equals("me")) {
                    c = 0;
                    break;
                }
                break;
            case 108417:
                if (valueOf.equals("msg")) {
                    c = 2;
                    break;
                }
                break;
            case 98629247:
                if (valueOf.equals("group")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                if (this.newPost) {
                    NewPostFragment.Builder builder = new NewPostFragment.Builder();
                    builder.attachGroup(this.groupName, this.groupPhoto);
                    builder.uid(VKAccountManager.getCurrent().getUid());
                    builder.suggest(false);
                    builder.isPublic(false);
                    builder.send(true);
                    if (this.post.attachments != null) {
                        builder.attachAttachments((Attachment[]) this.post.attachments.toArray(new Attachment[this.post.attachments.size()]));
                    }
                    builder.go(this);
                    finish();
                    return;
                }
                repostWithComment(0);
                return;
            case 1:
                startGroupChooser();
                return;
            case 2:
                startChatChooser();
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog) {
        finish();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void startGroupChooser() {
        new AdminedGroupsFragment.Builder(2).select(true).forResult(this, 101);
    }

    private void startChatChooser() {
        new DialogsFragment.Builder().setSelectMode().forResult(this, 102);
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (resCode != -1) {
            finish();
            return;
        }
        if (reqCode == 101) {
            this.groupName = data.getStringExtra("name");
            this.groupPhoto = data.getStringExtra("photo");
            if (this.newPost) {
                NewPostFragment.Builder builder = new NewPostFragment.Builder();
                builder.attachGroup(this.groupName, this.groupPhoto);
                builder.uid(data.getIntExtra("gid", 0));
                builder.suggest(false);
                builder.isPublic(true);
                builder.send(true);
                if (this.post.attachments != null) {
                    builder.attachAttachments((Attachment[]) this.post.attachments.toArray(new Attachment[this.post.attachments.size()]));
                }
                builder.go(this);
                finish();
            } else {
                repostWithComment(data.getIntExtra("gid", 0));
            }
        }
        if (reqCode == 102) {
            UserProfile profile = (UserProfile) data.getParcelableExtra("profile");
            ChatFragment.Builder builder2 = new ChatFragment.Builder(profile.uid, profile.fullName);
            if (this.post.type == 18) {
                builder2.setAttachments(new Attachment[]{this.post.attachments.get(0)});
            } else {
                builder2.setPost(this.post);
            }
            if (profile.uid < 2000000000) {
                builder2.setPhoto(profile.photo);
            }
            builder2.go(this);
            Analytics.sendPromoPostActionByType(this.post, Statistic.TYPE_POST_SHARE);
            finish();
        }
    }

    private void repostWithComment(int gid) {
        EditText ed = new EditText(this);
        ed.setLines(4);
        ed.setGravity(51);
        FrameLayout fl = new FrameLayout(this);
        fl.addView(ed);
        if (Build.VERSION.SDK_INT >= 21) {
            fl.setPadding(V.dp(16.0f), 0, V.dp(16.0f), 0);
        }
        AlertDialog dlg = new VKAlertDialog.Builder(this).setTitle(R.string.repost_comment_title).setView(fl).setPositiveButton(R.string.ok, RepostActivity$$Lambda$3.lambdaFactory$(this, gid, ed)).setNegativeButton(R.string.cancel, RepostActivity$$Lambda$4.lambdaFactory$(this)).setOnCancelListener(RepostActivity$$Lambda$5.lambdaFactory$(this)).create();
        dlg.setOnShowListener(RepostActivity$$Lambda$6.lambdaFactory$(this, ed));
        dlg.setCanceledOnTouchOutside(false);
        dlg.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$repostWithComment$2(int gid, EditText ed, DialogInterface dialog, int which) {
        doRepostWithComment(gid, ed.getText().toString());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$repostWithComment$3(DialogInterface dialog, int which) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$repostWithComment$4(DialogInterface dialog) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$repostWithComment$5(EditText ed, DialogInterface dialog) {
        InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        imm.showSoftInput(ed, 1);
    }

    private void doRepostWithComment(final int gid, final String comment) {
        String type = ReportAppInputData.REPORT_TYPE_WALL;
        String akey = null;
        if (this.post.type == 1) {
            type = "photo";
            akey = ((PhotoAttachment) this.post.attachments.get(0)).accessKey;
        }
        if (this.post.type == 2) {
            type = "video";
            akey = ((VideoAttachment) this.post.attachments.get(0)).video.accessKey;
        }
        if (this.post.type == 18) {
            type = ReportAppInputData.REPORT_TYPE_MARKET;
        }
        if (this.post.type == 12) {
            type = "wall_ads";
        }
        new WallRepost(type + this.post.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.post.postID, gid, comment, akey, getIntent().getStringExtra(SharingService.EXTRA_REFERER), this.post.getTrackCode()).setCallback(new SimpleCallback<WallRepost.Result>(this) { // from class: com.vkontakte.android.RepostActivity.1
            @Override // com.vkontakte.android.api.Callback
            public void success(WallRepost.Result res) {
                VKAccount account = VKAccountManager.getCurrent();
                NewsEntry newPost = new NewsEntry(RepostActivity.this.post);
                if (gid == 0) {
                    RepostActivity.this.post.flags |= 12;
                }
                newPost.postID = res.postID;
                newPost.time = TimeUtils.getCurrentTime();
                int uid = gid != 0 ? -gid : VKAccountManager.getCurrent().getUid();
                newPost.userID = uid;
                newPost.ownerID = uid;
                newPost.userName = gid == 0 ? account.getName() : RepostActivity.this.groupName;
                newPost.userPhotoURL = gid == 0 ? account.getPhoto() : RepostActivity.this.groupPhoto;
                newPost.retweetText = comment;
                newPost.retweetType = RepostActivity.this.post.type;
                newPost.numLikes = 0;
                newPost.numRetweets = 0;
                newPost.flags &= -13;
                newPost.flags |= 162;
                if ((RepostActivity.this.post.retweetText == null || RepostActivity.this.post.retweetText.length() <= 0) && RepostActivity.this.post.repostAttachments.size() <= 0) {
                    if (RepostActivity.this.post.flag(32)) {
                        newPost.retweetOrigId = RepostActivity.this.post.retweetOrigId;
                        newPost.retweetOrigTime = RepostActivity.this.post.retweetOrigTime;
                        newPost.retweetUID = RepostActivity.this.post.retweetUID;
                        newPost.retweetUserName = RepostActivity.this.post.retweetUserName;
                        newPost.retweetUserPhoto = RepostActivity.this.post.retweetUserPhoto;
                    } else {
                        newPost.retweetOrigId = RepostActivity.this.post.postID;
                        newPost.retweetOrigTime = RepostActivity.this.post.time;
                        newPost.retweetUID = RepostActivity.this.post.ownerID;
                        newPost.retweetUserName = RepostActivity.this.post.userName;
                        newPost.retweetUserPhoto = RepostActivity.this.post.userPhotoURL;
                    }
                } else {
                    newPost.text = RepostActivity.this.post.retweetText;
                    newPost.attachments = RepostActivity.this.post.repostAttachments;
                    if (newPost.attachments.size() > 0 && (newPost.attachments.get(newPost.attachments.size() - 1) instanceof RepostAttachment)) {
                        newPost.attachments.remove(newPost.attachments.size() - 1);
                    }
                    newPost.attachments.add(new RepostAttachment(RepostActivity.this.post.retweetUID, RepostActivity.this.post.retweetOrigId, RepostActivity.this.post.retweetOrigTime, RepostActivity.this.post.retweetUserName, RepostActivity.this.post.retweetUserPhoto, 0));
                    newPost.retweetOrigId = RepostActivity.this.post.postID;
                    newPost.retweetOrigTime = RepostActivity.this.post.time;
                    newPost.retweetUID = RepostActivity.this.post.ownerID;
                    newPost.retweetUserName = RepostActivity.this.post.userName;
                    newPost.retweetUserPhoto = RepostActivity.this.post.userPhotoURL;
                }
                NewsfeedCache.addToTop(newPost);
                Intent intent = new Intent(Posts.ACTION_NEW_POST_BROADCAST);
                intent.putExtra("entry", newPost);
                RepostActivity.this.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                if (gid == 0) {
                    Toast.makeText(RepostActivity.this, (int) R.string.repost_ok_wall, 0).show();
                } else {
                    Toast.makeText(RepostActivity.this, (int) R.string.repost_ok_group, 0).show();
                }
                RepostActivity.this.post.numRetweets = res.retweets;
                RepostActivity.this.post.numLikes = res.likes;
                Analytics.sendPromoPostActionByType(RepostActivity.this.post, Statistic.TYPE_POST_SHARE);
                RepostActivity.this.broadcastUpdate();
                RepostActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                super.fail(err);
                RepostActivity.this.finish();
            }
        }).wrapProgress(this).exec((Context) this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void broadcastUpdate() {
        if (this.post.type == 0) {
            Intent intent = new Intent(Posts.ACTION_POST_UPDATED_BROADCAST);
            intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.post.postID);
            intent.putExtra("owner_id", this.post.ownerID);
            intent.putExtra("comments", this.post.numComments);
            intent.putExtra("retweets", this.post.numRetweets);
            intent.putExtra(ServerKeys.LIKES, this.post.numLikes);
            intent.putExtra("liked", this.post.flag(8));
            intent.putExtra("retweeted", this.post.flag(4));
            sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            NewsfeedCache.update(this.post.ownerID, this.post.postID, this.post.numLikes, this.post.numComments, this.post.numRetweets, this.post.flag(8), this.post.flag(4));
        }
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }
}
