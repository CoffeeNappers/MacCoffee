package com.vkontakte.android.upload;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.VKApplication;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class BatchUploadTask extends UploadTask<Parcelable> implements Parcelable, ProgressListener {
    public static final Parcelable.Creator<BatchUploadTask> CREATOR = new Parcelable.Creator<BatchUploadTask>() { // from class: com.vkontakte.android.upload.BatchUploadTask.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public BatchUploadTask mo1120createFromParcel(Parcel source) {
            return new BatchUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public BatchUploadTask[] mo1121newArray(int size) {
            return new BatchUploadTask[size];
        }
    };
    private int currentTask;
    private String progressTitle;
    private List<UploadTask> subTasks;

    public BatchUploadTask(Context context, List<UploadTask> tasks, String progressTitle, String doneTitle, String doneText, PendingIntent doneIntent) {
        super(context);
        this.subTasks = new ArrayList();
        this.currentTask = 0;
        this.subTasks.addAll(tasks);
        this.progressTitle = progressTitle;
        this.doneTitle = doneTitle;
        this.doneText = doneText;
        this.doneIntent = doneIntent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.upload.UploadTask
    public void run() throws UploadException {
        while (this.currentTask < this.subTasks.size()) {
            try {
                try {
                    UploadTask task = this.subTasks.get(this.currentTask);
                    task.setProgressListener(this);
                    task.run();
                    task.setProgressListener(null);
                    this.currentTask++;
                } catch (UploadException x) {
                    if (needShowNotifications()) {
                        showFailedNotification();
                    }
                    throw x;
                }
            } catch (Throwable th) {
                ((NotificationManager) this.context.getSystemService("notification")).cancel(323);
                throw th;
            }
        }
        ((NotificationManager) this.context.getSystemService("notification")).cancel(323);
        showDoneNotification(this.doneTitle, this.doneText, this.doneIntent);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void doUpload() throws UploadException {
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
    }

    @Override // com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return true;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.progressTitle;
    }

    @Override // com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeList(this.subTasks);
        dest.writeString(this.progressTitle);
        dest.writeString(this.doneTitle);
        dest.writeString(this.doneText);
        dest.writeParcelable(this.doneIntent, 0);
    }

    private BatchUploadTask(Parcel in) {
        super(VKApplication.context);
        this.subTasks = new ArrayList();
        this.currentTask = 0;
        this.subTasks = in.readArrayList(UploadTask.class.getClassLoader());
        this.progressTitle = in.readString();
        this.doneTitle = in.readString();
        this.doneText = in.readString();
        this.doneIntent = (PendingIntent) in.readParcelable(PendingIntent.class.getClassLoader());
    }

    @Override // com.vkontakte.android.upload.ProgressListener
    public void onProgress(UploadTask task, int done, int total, boolean indeterminate) {
        int percent = Math.round((done / total) * 100.0f);
        if (this.currentTask == 0 || this.currentTask == this.subTasks.size()) {
            onProgress((this.currentTask * 100) + percent, this.subTasks.size() * 100, indeterminate);
        } else {
            onProgress((this.currentTask * 100) + percent, this.subTasks.size() * 100, false);
        }
    }
}
