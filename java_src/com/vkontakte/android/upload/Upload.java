package com.vkontakte.android.upload;

import android.content.Context;
import android.content.Intent;
/* loaded from: classes3.dex */
public class Upload {
    public static final String ACTION_PHOTO_ADDED = "com.vkontakte.android.PHOTO_ADDED";
    public static final String ACTION_PHOTO_REMOVED = "com.vkontakte.android.PHOTO_REMOVED";
    public static final String ACTION_UPLOAD_DONE = "com.vkontakte.android.UPLOAD_DONE";
    public static final String ACTION_UPLOAD_FAILED = "com.vkontakte.android.UPLOAD_FAILED";
    public static final String ACTION_UPLOAD_PROGRESS = "com.vkontakte.android.UPLOAD_PROGRESS";
    public static final String ACTION_UPLOAD_STARTED = "com.vkontakte.android.UPLOAD_STARTED";

    public static void start(Context context, UploadTask t) {
        Intent intent = new Intent(context, UploaderIntentService.class);
        intent.putExtra("task", t);
        context.startService(intent);
    }

    public static void retry(Context context, int taskId) {
        Intent intent = new Intent(context, UploaderIntentService.class);
        intent.putExtra("retry", taskId);
        context.startService(intent);
    }

    public static void cancel(int id) {
        UploaderIntentService.cancel(id);
    }

    public static int getNewID() {
        int i = UploadTask.lastID;
        UploadTask.lastID = i + 1;
        return i;
    }
}
