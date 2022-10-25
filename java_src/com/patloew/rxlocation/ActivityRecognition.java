package com.patloew.rxlocation;

import android.app.PendingIntent;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.common.api.Status;
import io.reactivex.Single;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class ActivityRecognition {
    private final RxLocation rxLocation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActivityRecognition(RxLocation rxLocation) {
        this.rxLocation = rxLocation;
    }

    @RequiresPermission("com.google.android.gms.permission.ACTIVITY_RECOGNITION")
    public Single<Status> requestUpdates(long detectionIntervalMillis, @NonNull PendingIntent pendingIntent) {
        return requestUpdatesInternal(detectionIntervalMillis, pendingIntent, null, null);
    }

    @RequiresPermission("com.google.android.gms.permission.ACTIVITY_RECOGNITION")
    public Single<Status> requestUpdates(long detectionIntervalMillis, @NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return requestUpdatesInternal(detectionIntervalMillis, pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> requestUpdatesInternal(long detectionIntervalMillis, PendingIntent pendingIntent, Long timeout, TimeUnit timeUnit) {
        return Single.create(new ActivityRequestUpdatesSingleOnSubscribe(this.rxLocation, detectionIntervalMillis, pendingIntent, timeout, timeUnit));
    }

    @RequiresPermission("com.google.android.gms.permission.ACTIVITY_RECOGNITION")
    public Single<Status> removeUpdates(@NonNull PendingIntent pendingIntent) {
        return removeUpdatesInternal(pendingIntent, null, null);
    }

    @RequiresPermission("com.google.android.gms.permission.ACTIVITY_RECOGNITION")
    public Single<Status> removeUpdates(@NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return removeUpdatesInternal(pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> removeUpdatesInternal(PendingIntent pendingIntent, Long timeout, TimeUnit timeUnit) {
        return Single.create(new ActivityRemoveUpdatesSingleOnSubscribe(this.rxLocation, pendingIntent, timeout, timeUnit));
    }
}
