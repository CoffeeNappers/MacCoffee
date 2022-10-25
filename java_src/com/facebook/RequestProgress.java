package com.facebook;

import android.os.Handler;
import com.facebook.GraphRequest;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class RequestProgress {
    private final Handler callbackHandler;
    private long lastReportedProgress;
    private long maxProgress;
    private long progress;
    private final GraphRequest request;
    private final long threshold = FacebookSdk.getOnProgressThreshold();

    /* JADX INFO: Access modifiers changed from: package-private */
    public RequestProgress(Handler callbackHandler, GraphRequest request) {
        this.request = request;
        this.callbackHandler = callbackHandler;
    }

    long getProgress() {
        return this.progress;
    }

    long getMaxProgress() {
        return this.maxProgress;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addProgress(long size) {
        this.progress += size;
        if (this.progress >= this.lastReportedProgress + this.threshold || this.progress >= this.maxProgress) {
            reportProgress();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addToMax(long size) {
        this.maxProgress += size;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void reportProgress() {
        if (this.progress > this.lastReportedProgress) {
            GraphRequest.Callback callback = this.request.getCallback();
            if (this.maxProgress > 0 && (callback instanceof GraphRequest.OnProgressCallback)) {
                final long currentCopy = this.progress;
                final long maxProgressCopy = this.maxProgress;
                final GraphRequest.OnProgressCallback callbackCopy = (GraphRequest.OnProgressCallback) callback;
                if (this.callbackHandler == null) {
                    callbackCopy.onProgress(currentCopy, maxProgressCopy);
                } else {
                    this.callbackHandler.post(new Runnable() { // from class: com.facebook.RequestProgress.1
                        @Override // java.lang.Runnable
                        public void run() {
                            callbackCopy.onProgress(currentCopy, maxProgressCopy);
                        }
                    });
                }
                this.lastReportedProgress = this.progress;
            }
        }
    }
}
