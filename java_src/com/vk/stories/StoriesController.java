package com.vk.stories;

import android.content.Context;
import android.os.Looper;
import bolts.Continuation;
import bolts.Task;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.util.Prefs;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.model.StoryUploadParams;
import com.vk.stories.util.VideoCompressor;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.stories.StoriesAddBan;
import com.vkontakte.android.api.stories.StoriesDelete;
import com.vkontakte.android.api.stories.StoriesDeleteBan;
import com.vkontakte.android.api.stories.StoriesGet;
import com.vkontakte.android.api.stories.StoriesMarkAsSeen;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.upload.PhotoStoryUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.VideoStoryUploadTask;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.Callable;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoriesController {
    public static final int EVENT_STORIES_LIST_INVALIDATED = 101;
    public static final int EVENT_STORY_MARKED_AS_SEEN = 100;
    public static final int EVENT_STORY_UPLOAD_DONE = 102;
    public static final int EVENT_STORY_UPLOAD_FAILED = 104;
    public static final int EVENT_STORY_UPLOAD_PROGRESS = 103;
    public static final int EVENT_STORY_UPLOAD_VIDEO_COMPRESS_FINISHED = 105;
    private static final String KEY_CACHED_STORIES = "stories";
    private static final NotificationCenter storiesNotificationsCenter = new NotificationCenter();
    private static final HashSet<String> markedAsSeen = new HashSet<>();
    private static final HashSet<String> markedAsSeenRequestsInProgress = new HashSet<>();
    private static final Prefs storiesInstance = new Prefs("stories_default");
    private static final LinkedList<StoryUpload> storiesUploadQueue = new LinkedList<>();

    /* loaded from: classes2.dex */
    public enum SourceType {
        LIST(ArgKeys.LIST),
        SNIPPET("snippet"),
        PROFILE("profile");
        
        private final String text;

        SourceType(String text) {
            this.text = text;
        }

        public String getText() {
            return this.text;
        }
    }

    public static NotificationCenter notificationCenter() {
        return storiesNotificationsCenter;
    }

    public static void markAsSeen(StoryEntry storyEntry, SourceType sourceType) {
        if (storyEntry != null && !storyEntry.local) {
            String stringId = storyEntry.stringId();
            if (!markedAsSeen.contains(stringId) && !markedAsSeenRequestsInProgress.contains(stringId)) {
                markedAsSeenRequestsInProgress.add(stringId);
                new StoriesMarkAsSeen(storyEntry.ownerId, storyEntry.id, storyEntry.accessKey, sourceType.getText()).toObservable().subscribe(StoriesController$$Lambda$1.lambdaFactory$(stringId, storyEntry), StoriesController$$Lambda$2.lambdaFactory$(stringId));
            }
        }
    }

    public static /* synthetic */ void lambda$markAsSeen$0(String stringId, StoryEntry storyEntry, Object o) throws Exception {
        markedAsSeen.add(stringId);
        markedAsSeenRequestsInProgress.remove(stringId);
        storiesNotificationsCenter.fireEvent(100, (int) storyEntry);
    }

    public static void banUser(int userId, Context progressContext, final Callback<GetStoriesResponse> callback) {
        VKAPIRequest<GetStoriesResponse> req = new StoriesAddBan(userId).setCallback(new Callback<GetStoriesResponse>() { // from class: com.vk.stories.StoriesController.1
            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                StoriesController.setCachedStories(result.originalJsonObject);
                StoriesController.storiesNotificationsCenter.fireEvent(101, (int) StoriesController.postProcessDisplayStoryList(result.storiesResponse));
                if (callback != null) {
                    callback.success(result);
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (callback != null) {
                    callback.fail(error);
                }
            }
        });
        if (progressContext != null) {
            req.wrapProgress(progressContext);
        }
        req.exec(Looper.getMainLooper());
    }

    public static void unbanUser(int userId, Context progressContext, final Callback<GetStoriesResponse> callback) {
        VKAPIRequest<GetStoriesResponse> req = new StoriesDeleteBan(userId).setCallback(new Callback<GetStoriesResponse>() { // from class: com.vk.stories.StoriesController.2
            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                StoriesController.setCachedStories(result.originalJsonObject);
                StoriesController.storiesNotificationsCenter.fireEvent(101, (int) StoriesController.postProcessDisplayStoryList(result.storiesResponse));
                if (callback != null) {
                    callback.success(result);
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (callback != null) {
                    callback.fail(error);
                }
            }
        }).exec(Looper.getMainLooper());
        if (progressContext != null) {
            req.wrapProgress(progressContext);
        }
        req.exec(Looper.getMainLooper());
    }

    public static GetStoriesResponse getCachedStories() {
        try {
            String storiesJson = storiesInstance.getString(KEY_CACHED_STORIES);
            return new GetStoriesResponse(new JSONObject(storiesJson));
        } catch (Exception e) {
            return null;
        }
    }

    public static void setCachedStories(JSONObject jsonObject) {
        if (jsonObject != null) {
            storiesInstance.edit().putString(KEY_CACHED_STORIES, jsonObject.toString()).apply();
        }
    }

    public static void deleteStory(StoryEntry se, final Callback<GetStoriesResponse> callback) {
        if (se != null) {
            new StoriesDelete(se.ownerId, se.id).setCallback(new Callback<GetStoriesResponse>() { // from class: com.vk.stories.StoriesController.3
                @Override // com.vkontakte.android.api.Callback
                public void success(GetStoriesResponse result) {
                    StoriesController.setCachedStories(result.originalJsonObject);
                    StoriesController.storiesNotificationsCenter.fireEvent(101, (int) StoriesController.postProcessDisplayStoryList(result.storiesResponse));
                    if (callback != null) {
                        callback.success(result);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (callback != null) {
                        callback.fail(error);
                    }
                }
            }).exec(Looper.getMainLooper());
        }
    }

    public static void loadNewStories() {
        new StoriesGet().setCallback(new Callback<GetStoriesResponse>() { // from class: com.vk.stories.StoriesController.4
            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                StoriesController.setCachedStories(result.originalJsonObject);
                StoriesController.storiesNotificationsCenter.fireEvent(101, (int) StoriesController.postProcessDisplayStoryList(result.storiesResponse));
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
            }
        }).exec(Looper.getMainLooper());
    }

    public static void reloadStoriesFromCache() {
        Callable callable;
        callable = StoriesController$$Lambda$3.instance;
        Task.call(callable).onSuccess(new Continuation<GetStoriesResponse, Void>() { // from class: com.vk.stories.StoriesController.5
            @Override // bolts.Continuation
            /* renamed from: then */
            public Void mo533then(Task<GetStoriesResponse> task) throws Exception {
                GetStoriesResponse res = task.getResult();
                if (res != null) {
                    StoriesController.storiesNotificationsCenter.fireEvent(101, (int) StoriesController.postProcessDisplayStoryList(res.storiesResponse));
                    return null;
                }
                return null;
            }
        }, Task.UI_THREAD_EXECUTOR);
    }

    public static void clear() {
        storiesUploadQueue.clear();
        storiesInstance.clear();
    }

    public static void markStoryInJsonAsSeen(JSONObject r, StoryEntry storyEntry) {
        if (r != null && storyEntry != null) {
            Task.call(StoriesController$$Lambda$4.lambdaFactory$(r, storyEntry));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:58:0x0040, code lost:
        r3.put("seen", 1);
        setCachedStories(r8);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ java.lang.Object lambda$markStoryInJsonAsSeen$3(org.json.JSONObject r8, com.vk.stories.model.StoryEntry r9) throws java.lang.Exception {
        /*
            r7 = 0
            java.lang.String r5 = "items"
            org.json.JSONArray r0 = r8.optJSONArray(r5)     // Catch: java.lang.Exception -> L51
            if (r0 == 0) goto L4a
            r1 = 0
        Lb:
            int r5 = r0.length()     // Catch: java.lang.Exception -> L51
            if (r1 >= r5) goto L4a
            org.json.JSONArray r4 = r0.getJSONArray(r1)     // Catch: java.lang.Exception -> L51
            if (r4 == 0) goto L4e
            int r5 = r4.length()     // Catch: java.lang.Exception -> L51
            if (r5 <= 0) goto L4e
            r2 = 0
        L1e:
            int r5 = r4.length()     // Catch: java.lang.Exception -> L51
            if (r2 >= r5) goto L4e
            org.json.JSONObject r3 = r4.optJSONObject(r2)     // Catch: java.lang.Exception -> L51
            if (r3 == 0) goto L4b
            java.lang.String r5 = "id"
            int r5 = r3.optInt(r5)     // Catch: java.lang.Exception -> L51
            int r6 = r9.id     // Catch: java.lang.Exception -> L51
            if (r5 != r6) goto L4b
            java.lang.String r5 = "owner_id"
            int r5 = r3.optInt(r5)     // Catch: java.lang.Exception -> L51
            int r6 = r9.ownerId     // Catch: java.lang.Exception -> L51
            if (r5 != r6) goto L4b
            java.lang.String r5 = "seen"
            r6 = 1
            r3.put(r5, r6)     // Catch: java.lang.Exception -> L51
            setCachedStories(r8)     // Catch: java.lang.Exception -> L51
        L4a:
            return r7
        L4b:
            int r2 = r2 + 1
            goto L1e
        L4e:
            int r1 = r1 + 1
            goto Lb
        L51:
            r5 = move-exception
            goto L4a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vk.stories.StoriesController.lambda$markStoryInJsonAsSeen$3(org.json.JSONObject, com.vk.stories.model.StoryEntry):java.lang.Object");
    }

    public static ArrayList<StoriesContainer> postProcessDisplayStoryList(ArrayList<StoriesContainer> stories) {
        if (stories == null) {
            stories = new ArrayList<>();
        }
        if ((stories.size() > 0 && !stories.get(0).myStory()) || (stories.size() == 0 && storiesUploadQueue.size() > 0)) {
            UserProfile up = new UserProfile(VKAccountManager.getCurrent());
            StoriesContainer sc = new StoriesContainer(up, new ArrayList());
            stories.add(0, sc);
        }
        if (storiesUploadQueue.size() > 0) {
            StoriesContainer myStories = stories.get(0);
            Iterator<StoryUpload> it = storiesUploadQueue.iterator();
            while (it.hasNext()) {
                StoryUpload su = it.next();
                myStories.storyEntries.add(new StoryEntry(su));
            }
        }
        return stories;
    }

    public static void onUploadDone(int id, Object o) {
        StoryUpload us;
        if (o != null && (o instanceof StoryEntry) && (us = findStoryUploadByUploadId(id)) != null) {
            us.resultStory((StoryEntry) o);
            storiesNotificationsCenter.fireEvent(102, (int) us);
            storiesUploadQueue.remove(us);
            loadNewStories();
        }
    }

    public static void onUploadProgress(int id, int loaded, int total, boolean indeterminate) {
        StoryUpload us = findStoryUploadByUploadId(id);
        if (us != null && total > 0) {
            float p = loaded / total;
            us.storyUploadProgress(p);
            storiesNotificationsCenter.fireEvent(103, (int) us);
        }
    }

    public static void onUploadFailed(int id) {
        StoryUpload us = findStoryUploadByUploadId(id);
        if (us != null) {
            us.uploadFailed(true);
            storiesNotificationsCenter.fireEvent(104, (int) us);
            reloadStoriesFromCache();
        }
    }

    public static void onVideoUploadTaskCompressFinish(int id, File file) {
        StoryUpload us = findStoryUploadByUploadId(id);
        if (us != null) {
            us.fullFile(file);
            storiesNotificationsCenter.fireEvent(105, (int) us);
        }
    }

    private static StoryUpload findStoryUploadByUploadId(int id) {
        Iterator<StoryUpload> it = storiesUploadQueue.iterator();
        while (it.hasNext()) {
            StoryUpload su = it.next();
            if (su.uploadTaskId == id) {
                return su;
            }
        }
        return null;
    }

    private static StoryUpload findStoryUploadByStoryId(int id) {
        Iterator<StoryUpload> it = storiesUploadQueue.iterator();
        while (it.hasNext()) {
            StoryUpload su = it.next();
            if (su.localId == id) {
                return su;
            }
        }
        return null;
    }

    public static boolean isCurrentlyUploading(StoryEntry storyEntry) {
        return (storyEntry == null || findStoryUploadByStoryId(storyEntry.id) == null) ? false : true;
    }

    public static StoryUpload getUploadState(StoryEntry storyEntry) {
        return findStoryUploadByStoryId(storyEntry.id);
    }

    public static void cancelUpload(StoryEntry storyEntry) {
        StoryUpload su;
        if (storyEntry != null && (su = findStoryUploadByStoryId(storyEntry.id)) != null) {
            Upload.cancel(su.uploadTaskId());
            storiesUploadQueue.remove(su);
            reloadStoriesFromCache();
        }
    }

    public static void retryUpload(StoryEntry storyEntry) {
        StoryUpload su;
        if (storyEntry != null && (su = findStoryUploadByStoryId(storyEntry.id)) != null) {
            su.uploadFailed(false);
            su.storyUploadProgress(0.0f);
            Upload.retry(VKApplication.context, su.uploadTaskId());
            reloadStoriesFromCache();
        }
    }

    public static void startStoryUpload(File file, StoryUploadParams params) {
        PhotoStoryUploadTask task = new PhotoStoryUploadTask(VKApplication.context, file.getAbsolutePath(), params);
        Upload.start(VKApplication.context, task);
        if (params.isAddToNews()) {
            StoryUpload storyUpload = StoryUpload.photoStoryUpload(file, task.getID());
            storiesUploadQueue.add(storyUpload);
            reloadStoriesFromCache();
        }
    }

    public static void startStoryUpload(VideoCompressor.VideoCompressorParameters parameters, StoryUploadParams storyUploadParams) {
        VideoStoryUploadTask task = new VideoStoryUploadTask(VKApplication.context, storyUploadParams, parameters);
        Upload.start(VKApplication.context, task);
        if (storyUploadParams.isAddToNews()) {
            StoryUpload storyUpload = StoryUpload.videoStoryUpload(parameters.previewFile(), task.getID());
            storiesUploadQueue.add(storyUpload);
            reloadStoriesFromCache();
        }
    }

    /* loaded from: classes2.dex */
    public static class StoryUpload {
        private static int lastId = 0;
        private final long date;
        private File fullFile;
        private final int localId;
        private File previewFile;
        private StoryEntry resultStory;
        private float storyUploadProgress;
        private final String type;
        private boolean uploadFailed;
        private final int uploadTaskId;

        public static StoryUpload videoStoryUpload(File file, int uploadTaskId) {
            StoryUpload su = new StoryUpload("video", uploadTaskId);
            su.previewFile(file);
            return su;
        }

        public static StoryUpload photoStoryUpload(File file, int uploadTaskId) {
            StoryUpload su = new StoryUpload("photo", uploadTaskId);
            su.previewFile(file);
            return su;
        }

        private StoryUpload(String type, int uploadTaskId) {
            int i = lastId;
            lastId = i + 1;
            this.localId = i;
            this.date = System.currentTimeMillis() / 1000;
            this.uploadTaskId = uploadTaskId;
            this.type = type;
        }

        public int localId() {
            return this.localId;
        }

        public String type() {
            return this.type;
        }

        public long date() {
            return this.date;
        }

        public File previewFile() {
            return this.previewFile;
        }

        public void previewFile(File file) {
            this.previewFile = file;
        }

        public File fullFile() {
            return this.fullFile;
        }

        public void fullFile(File file) {
            this.fullFile = file;
        }

        public int uploadTaskId() {
            return this.uploadTaskId;
        }

        public StoryEntry resultStory() {
            return this.resultStory;
        }

        public void resultStory(StoryEntry resultStory) {
            this.resultStory = resultStory;
        }

        public float storyUploadProgress() {
            return this.storyUploadProgress;
        }

        public void storyUploadProgress(float storyUploadProgress) {
            this.storyUploadProgress = storyUploadProgress;
        }

        public boolean uploadFailed() {
            return this.uploadFailed;
        }

        public void uploadFailed(boolean uploadFailed) {
            this.uploadFailed = uploadFailed;
        }
    }
}
