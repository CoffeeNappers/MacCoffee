package com.vkontakte.android.upload;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import com.vk.stories.StoriesController;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes3.dex */
public abstract class UploadTask<S extends Parcelable> implements Parcelable {
    protected static final int ID_NOTIFICATION_DONE = 324;
    protected static final int ID_NOTIFICATION_FAIL = 325;
    protected static final int ID_NOTIFICATION_PROGRESS = 323;
    private static final int STATE_DONE = 5;
    private static final int STATE_GOT_SERVER = 2;
    private static final int STATE_NEW = 0;
    private static final int STATE_PRE_UPLOAD = 1;
    private static final int STATE_SAVED = 4;
    private static final int STATE_UPLOADED = 3;
    static int lastID = ((int) System.currentTimeMillis()) / 1000;
    protected boolean canceled;
    protected Context context;
    protected VKAPIRequest currentApiRequest;
    protected PendingIntent doneIntent;
    protected String doneText;
    protected String doneTitle;
    protected int id;
    private Notification.Builder notifyBuilder;
    private ProgressListener progressListener;
    private int state;

    public abstract void doUpload() throws UploadException;

    public abstract void getServer() throws UploadException;

    public abstract void save() throws UploadException;

    public UploadTask(Context context) {
        this.state = 0;
        this.context = context;
        int i = lastID;
        lastID = i + 1;
        this.id = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void dropState() {
        this.state = 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void run() throws UploadException {
        try {
            try {
                if (this.state < 1 && !this.canceled) {
                    beforeUpload();
                    this.state = 1;
                }
                if (this.state < 2 && !this.canceled) {
                    getServer();
                    this.state = 2;
                }
                if (this.state < 3 && !this.canceled) {
                    doUpload();
                    this.state = 3;
                }
                if (this.state < 4 && !this.canceled) {
                    onProgress(10, 10, true);
                    save();
                    this.state = 4;
                }
                if (this.state < 5 && !this.canceled) {
                    afterUpload();
                    this.state = 5;
                }
                if (!this.canceled) {
                    Intent intent = new Intent(Upload.ACTION_UPLOAD_DONE);
                    intent.putExtra("id", this.id);
                    S result = mo1144getResult();
                    if (result != null) {
                        intent.putExtra("result", result);
                        if (result instanceof Attachment) {
                            Messages.uploadDone(this.id, (Attachment) result);
                        } else if (result instanceof MusicTrack) {
                            Messages.uploadDone(this.id, new AudioAttachment((MusicTrack) result));
                        } else if (result instanceof VideoFile) {
                            Messages.uploadDone(this.id, new VideoAttachment((VideoFile) result));
                        }
                        StoriesController.onUploadDone(this.id, result);
                    }
                    this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    if (needShowNotifications()) {
                        showDoneNotification(this.doneTitle, this.doneText, this.doneIntent);
                    }
                }
            } catch (UploadException x) {
                if (x instanceof BadUploadServerException) {
                    this.state = 1;
                }
                StoriesController.onUploadFailed(this.id);
                Messages.uploadFailed(this.id);
                Intent intent2 = new Intent(Upload.ACTION_UPLOAD_FAILED);
                intent2.putExtra("id", this.id);
                this.context.sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
                if (needShowNotifications()) {
                    showFailedNotification();
                }
                throw x;
            }
        } finally {
            hideNotification();
        }
    }

    public void beforeUpload() throws UploadException {
    }

    public void cancel() {
        this.canceled = true;
        if (this.currentApiRequest != null) {
            this.currentApiRequest.cancel();
            this.currentApiRequest = null;
        }
    }

    public boolean isCanceled() {
        return this.canceled;
    }

    /* renamed from: getResult */
    public S mo1144getResult() {
        return null;
    }

    public void afterUpload() throws UploadException {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onProgress(int loaded, int total, boolean indeterminate) {
        StoriesController.onUploadProgress(this.id, loaded, total, indeterminate);
        Log.d("vk", "upload progress " + loaded + " / " + total);
        Intent intent = new Intent(Upload.ACTION_UPLOAD_PROGRESS);
        intent.putExtra("done", loaded);
        intent.putExtra(ArgKeys.TOTAL, total);
        intent.putExtra("indeterminate", indeterminate);
        intent.putExtra("id", this.id);
        this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        if (this.progressListener != null) {
            this.progressListener.onProgress(this, loaded, total, indeterminate);
        }
        if (needShowNotifications()) {
            if (this.notifyBuilder == null) {
                this.notifyBuilder = new Notification.Builder(this.context).setContentTitle(getNotificationTitle()).setOngoing(true).setProgress(total, loaded, indeterminate).setSmallIcon(17301640);
            } else {
                this.notifyBuilder.setProgress(total, loaded, indeterminate);
            }
            Notification notification = this.notifyBuilder.getNotification();
            if (Build.VERSION.SDK_INT >= 21) {
                notification.color = this.context.getResources().getColor(R.color.brand_primary);
                notification.category = "progress";
            }
            ((NotificationManager) this.context.getSystemService("notification")).notify(ID_NOTIFICATION_PROGRESS, notification);
        }
    }

    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.loading);
    }

    public int getID() {
        return this.id;
    }

    public void setID(int id) {
        this.id = id;
    }

    protected boolean needShowNotifications() {
        return false;
    }

    public void setProgressListener(ProgressListener l) {
        this.progressListener = l;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void showDoneNotification(String title, String text, PendingIntent intent) {
        Notification.Builder bldr = new Notification.Builder(this.context).setContentTitle(title).setTicker(text).setContentText(text).setSmallIcon(R.drawable.ic_stat_notify_ok).setAutoCancel(true);
        if (intent != null) {
            bldr.setContentIntent(intent);
        }
        if (Build.VERSION.SDK_INT >= 21) {
            bldr.setColor(this.context.getResources().getColor(R.color.brand_primary));
        }
        ((NotificationManager) this.context.getSystemService("notification")).notify(ID_NOTIFICATION_DONE, bldr.getNotification());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void showFailedNotification() {
        Intent intent = new Intent(this.context, UploaderIntentService.class);
        intent.putExtra("retry", getID());
        PendingIntent pIntent = PendingIntent.getService(this.context, 0, intent, 134217728);
        Notification.Builder bldr = new Notification.Builder(this.context).setContentTitle(this.context.getString(R.string.upload_error)).setTicker(this.context.getString(R.string.upload_error)).setContentText(this.context.getString(R.string.err_text)).setSmallIcon(17301624).setAutoCancel(true).setContentIntent(pIntent);
        if (Build.VERSION.SDK_INT >= 21) {
            bldr.setColor(this.context.getResources().getColor(R.color.brand_primary));
        }
        ((NotificationManager) this.context.getSystemService("notification")).notify(ID_NOTIFICATION_FAIL, bldr.getNotification());
    }

    public void setDoneNotification(String title, String text, PendingIntent intent) {
        this.doneTitle = title;
        this.doneText = text;
        this.doneIntent = intent;
    }

    public void hideNotification() {
        if (needShowNotifications()) {
            ((NotificationManager) this.context.getSystemService("notification")).cancel(ID_NOTIFICATION_PROGRESS);
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.doneTitle);
        dest.writeString(this.doneText);
        dest.writeParcelable(this.doneIntent, 0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UploadTask(Parcel in) {
        this(VKApplication.context);
        this.doneTitle = in.readString();
        this.doneText = in.readString();
        this.doneIntent = (PendingIntent) in.readParcelable(PendingIntent.class.getClassLoader());
    }
}
