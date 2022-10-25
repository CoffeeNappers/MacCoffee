package com.vkontakte.android.utils;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.ToastUtils;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.upload.PhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadListener;
import com.vkontakte.android.upload.WallPhotoUploadTask;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class PostPublisher {
    @NonNull
    private final PostPublisherCallback callback;
    private ProgressDialog progressDialog = null;
    private AtomicBoolean isPublishing = new AtomicBoolean(false);

    /* loaded from: classes3.dex */
    public interface PostPublisherCallback {
        void onError(@Nullable VKAPIRequest.VKErrorResponse vKErrorResponse);

        void onSuccess();
    }

    public PostPublisher(@NonNull PostPublisherCallback callback) {
        this.callback = callback;
    }

    private void showProgress(Context context) {
        this.progressDialog = new ProgressDialog(context);
        this.progressDialog.setMessage(context.getResources().getString(R.string.loading));
        this.progressDialog.setCancelable(false);
        this.progressDialog.setCanceledOnTouchOutside(false);
        this.progressDialog.show();
        if (Build.VERSION.SDK_INT < 21) {
            this.progressDialog.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        }
    }

    private void hideProgress() {
        if (this.progressDialog != null) {
            ViewUtils.dismissDialogSafety(this.progressDialog);
            this.progressDialog = null;
        }
    }

    private void startPublishing(Context ctx) {
        this.isPublishing.set(true);
        showProgress(ctx);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void endPublishing() {
        this.isPublishing.set(false);
        hideProgress();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onError(@Nullable VKAPIRequest.VKErrorResponse error) {
        endPublishing();
        this.callback.onError(error);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSuccess() {
        endPublishing();
        this.callback.onSuccess();
    }

    public void publishPost(final Context ctx, @Nullable final CharSequence message, @Nullable ArrayList<Uri> uris) {
        if (!this.isPublishing.get()) {
            if (!TextUtils.isEmpty(message) || (uris != null && !uris.isEmpty())) {
                startPublishing(ctx);
                if (uris == null || uris.isEmpty()) {
                    publishPostInner(ctx, message, null);
                    return;
                }
                final int startId = new Random().nextInt(1000000000) + 192873;
                int oid = VKAccountManager.getCurrent().getUid();
                final PhotoUploadTask[] uploadTasks = new PhotoUploadTask[uris.size()];
                final UploadListener[] listeners = new UploadListener[uploadTasks.length];
                for (int i = 0; i < uploadTasks.length; i++) {
                    uploadTasks[i] = new WallPhotoUploadTask(ctx, uris.get(i).toString(), oid);
                    int taskId = startId + i;
                    uploadTasks[i].setID(taskId);
                    listeners[i] = new UploadListener(taskId, null);
                }
                final Attachment[] attachments = new Attachment[uploadTasks.length];
                final AtomicInteger counter = new AtomicInteger(attachments.length);
                UploadListener.UploadListenerCallback uploadListenerCallback = new UploadListener.UploadListenerCallback() { // from class: com.vkontakte.android.utils.PostPublisher.1
                    @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                    public void onProgress(int id, int done, int total) {
                    }

                    @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                    public void onDone(int id, Attachment attachment) {
                        if (id >= startId && id < startId + attachments.length) {
                            if (attachments[id - startId] == null) {
                                attachments[id - startId] = attachment;
                                counter.decrementAndGet();
                                if (counter.get() == 0) {
                                    end();
                                    PostPublisher.this.publishPostInner(ctx, message, attachments);
                                    return;
                                }
                                return;
                            }
                            onFailed(0, null);
                        }
                    }

                    @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                    public void onFailed(int id, Attachment attachment) {
                        PhotoUploadTask[] photoUploadTaskArr;
                        for (PhotoUploadTask uploadTask : uploadTasks) {
                            Upload.cancel(uploadTask.getID());
                        }
                        end();
                        PostPublisher.this.onError(null);
                    }

                    void end() {
                        UploadListener[] uploadListenerArr;
                        for (UploadListener uploadListener : listeners) {
                            uploadListener.stopListener();
                        }
                    }
                };
                for (int i2 = 0; i2 < listeners.length; i2++) {
                    listeners[i2].setUploadListenerCallback(uploadListenerCallback);
                    listeners[i2].startListener();
                    Upload.start(ctx, uploadTasks[i2]);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void publishPostInner(final Context ctx, @Nullable CharSequence inputText, @Nullable Attachment[] atts) {
        Callback<? super JSONObject> callback = new Callback<JSONObject>() { // from class: com.vkontakte.android.utils.PostPublisher.2
            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject result) {
                try {
                    SparseArray<String> names = new SparseArray<>();
                    SparseArray<String> photos = new SparseArray<>();
                    VKAccount account = VKAccountManager.getCurrent();
                    names.put(account.getUid(), account.getName());
                    photos.put(account.getUid(), account.getPhoto());
                    NewsEntry e = new NewsEntry(result.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0), null, names, photos);
                    ToastUtils.showToast((int) R.string.wall_ok);
                    Intent intent = new Intent(Posts.ACTION_NEW_POST_BROADCAST);
                    intent.putExtra("entry", e);
                    ctx.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    if (NewsfeedCache.hasEntries()) {
                        NewsfeedCache.addToTop(e);
                    }
                    PostPublisher.this.onSuccess();
                } catch (JSONException x) {
                    Log.w("vk", x);
                    fail(new VKAPIRequest.VKErrorResponse(-2, x.getMessage()));
                } finally {
                    PostPublisher.this.endPublishing();
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                PostPublisher.this.onError(error);
            }
        };
        boolean exportToTwitter = false;
        boolean exportToFacebook = false;
        VKAccount account = VKAccountManager.getCurrent();
        int uid = VKAccountManager.getCurrent().getUid();
        if (account.isExportTwitterAvail()) {
            exportToTwitter = true;
        }
        if (account.isExportFacebookAvail()) {
            exportToFacebook = true;
        }
        String exportParam = null;
        if (exportToFacebook && exportToTwitter) {
            exportParam = "twitter,facebook";
        } else if (exportToTwitter) {
            exportParam = "twitter";
        } else if (exportToFacebook) {
            exportParam = "facebook";
        }
        VKAPIRequest<JSONObject> req = new VKAPIRequest<>("execute.wallPost");
        req.param("device", Build.BRAND + ":" + Build.MANUFACTURER + ":" + Build.MODEL + ":" + Build.PRODUCT);
        req.param("owner_id", uid);
        if (atts != null && atts.length > 0) {
            req.param("attachments", TextUtils.join(",", atts));
        } else {
            req.param("attachments", MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        if (!TextUtils.isEmpty(inputText)) {
            req.param("message", inputText.toString());
        }
        req.param("ref", "advice_post");
        req.param("friends_only", (String) null);
        req.param("services", exportParam).setCallback(callback).exec(ctx);
    }
}
