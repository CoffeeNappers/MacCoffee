package com.vkontakte.android.upload;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Parcelable;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes3.dex */
public class UploadListener {
    private final BroadcastReceiver broadcastReceiver;
    private UploadListenerCallback uploadListenerCallback;

    /* loaded from: classes3.dex */
    public interface UploadListenerCallback {
        void onDone(int i, Attachment attachment);

        void onFailed(int i, Attachment attachment);

        void onProgress(int i, int i2, int i3);
    }

    public UploadListener(int uploadTaskId, UploadListenerCallback uploadListenerCallback) {
        this.uploadListenerCallback = uploadListenerCallback;
        this.broadcastReceiver = createBroadcastReceiver(uploadTaskId);
    }

    public void setUploadListenerCallback(UploadListenerCallback uploadListenerCallback) {
        this.uploadListenerCallback = uploadListenerCallback;
    }

    public void startListener() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(Upload.ACTION_UPLOAD_PROGRESS);
        filter.addAction(Upload.ACTION_UPLOAD_STARTED);
        filter.addAction(Upload.ACTION_UPLOAD_DONE);
        filter.addAction(Upload.ACTION_UPLOAD_FAILED);
        VKApplication.context.registerReceiver(this.broadcastReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    public void stopListener() {
        try {
            VKApplication.context.unregisterReceiver(this.broadcastReceiver);
        } catch (Exception e) {
        }
    }

    private BroadcastReceiver createBroadcastReceiver(final int targetId) {
        return new BroadcastReceiver() { // from class: com.vkontakte.android.upload.UploadListener.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                int id = intent.getIntExtra("id", 0);
                if (id == targetId) {
                    if (Upload.ACTION_UPLOAD_PROGRESS.equals(intent.getAction())) {
                        int done = intent.getIntExtra("done", 0);
                        int total = intent.getIntExtra(ArgKeys.TOTAL, 0);
                        if (UploadListener.this.uploadListenerCallback != null) {
                            UploadListener.this.uploadListenerCallback.onProgress(targetId, done, total);
                        }
                    } else if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                        if (UploadListener.this.uploadListenerCallback != null) {
                            Parcelable o = intent.getParcelableExtra("result");
                            if (o instanceof Attachment) {
                                UploadListener.this.uploadListenerCallback.onDone(id, (Attachment) o);
                            } else {
                                UploadListener.this.uploadListenerCallback.onDone(id, null);
                            }
                        }
                        UploadListener.this.stopListener();
                    } else if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                        if (UploadListener.this.uploadListenerCallback != null) {
                            Parcelable o2 = intent.getParcelableExtra("result");
                            if (o2 instanceof Attachment) {
                                UploadListener.this.uploadListenerCallback.onFailed(id, (Attachment) o2);
                            } else {
                                UploadListener.this.uploadListenerCallback.onFailed(id, null);
                            }
                        }
                        UploadListener.this.stopListener();
                    }
                }
            }
        };
    }
}
