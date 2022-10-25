package com.facebook.imagepipeline.listener;

import android.os.SystemClock;
import android.util.Pair;
import com.facebook.common.logging.FLog;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class RequestLoggingListener implements RequestListener {
    private static final String TAG = "RequestLoggingListener";
    @GuardedBy("this")
    private final Map<Pair<String, String>, Long> mProducerStartTimeMap = new HashMap();
    @GuardedBy("this")
    private final Map<String, Long> mRequestStartTimeMap = new HashMap();

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public synchronized void onRequestStart(ImageRequest request, Object callerContextObject, String requestId, boolean isPrefetch) {
        if (FLog.isLoggable(2)) {
            FLog.v(TAG, "time %d: onRequestSubmit: {requestId: %s, callerContext: %s, isPrefetch: %b}", Long.valueOf(getTime()), requestId, callerContextObject, Boolean.valueOf(isPrefetch));
            this.mRequestStartTimeMap.put(requestId, Long.valueOf(getTime()));
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public synchronized void onProducerStart(String requestId, String producerName) {
        if (FLog.isLoggable(2)) {
            Pair<String, String> mapKey = Pair.create(requestId, producerName);
            long startTime = getTime();
            this.mProducerStartTimeMap.put(mapKey, Long.valueOf(startTime));
            FLog.v(TAG, "time %d: onProducerStart: {requestId: %s, producer: %s}", Long.valueOf(startTime), requestId, producerName);
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public synchronized void onProducerFinishWithSuccess(String requestId, String producerName, @Nullable Map<String, String> extraMap) {
        if (FLog.isLoggable(2)) {
            Pair<String, String> mapKey = Pair.create(requestId, producerName);
            Long startTime = this.mProducerStartTimeMap.remove(mapKey);
            long currentTime = getTime();
            FLog.v(TAG, "time %d: onProducerFinishWithSuccess: {requestId: %s, producer: %s, elapsedTime: %d ms, extraMap: %s}", Long.valueOf(currentTime), requestId, producerName, Long.valueOf(getElapsedTime(startTime, currentTime)), extraMap);
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public synchronized void onProducerFinishWithFailure(String requestId, String producerName, Throwable throwable, @Nullable Map<String, String> extraMap) {
        if (FLog.isLoggable(5)) {
            Pair<String, String> mapKey = Pair.create(requestId, producerName);
            Long startTime = this.mProducerStartTimeMap.remove(mapKey);
            long currentTime = getTime();
            FLog.w(TAG, "time %d: onProducerFinishWithFailure: {requestId: %s, stage: %s, elapsedTime: %d ms, extraMap: %s, throwable: %s}", Long.valueOf(currentTime), requestId, producerName, Long.valueOf(getElapsedTime(startTime, currentTime)), extraMap, throwable.toString());
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public synchronized void onProducerFinishWithCancellation(String requestId, String producerName, @Nullable Map<String, String> extraMap) {
        if (FLog.isLoggable(2)) {
            Pair<String, String> mapKey = Pair.create(requestId, producerName);
            Long startTime = this.mProducerStartTimeMap.remove(mapKey);
            long currentTime = getTime();
            FLog.v(TAG, "time %d: onProducerFinishWithCancellation: {requestId: %s, stage: %s, elapsedTime: %d ms, extraMap: %s}", Long.valueOf(currentTime), requestId, producerName, Long.valueOf(getElapsedTime(startTime, currentTime)), extraMap);
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public synchronized void onProducerEvent(String requestId, String producerName, String producerEventName) {
        if (FLog.isLoggable(2)) {
            Pair<String, String> mapKey = Pair.create(requestId, producerName);
            Long startTime = this.mProducerStartTimeMap.get(mapKey);
            long currentTime = getTime();
            FLog.v(TAG, "time %d: onProducerEvent: {requestId: %s, stage: %s, eventName: %s; elapsedTime: %d ms}", Long.valueOf(getTime()), requestId, producerName, producerEventName, Long.valueOf(getElapsedTime(startTime, currentTime)));
        }
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public synchronized void onRequestSuccess(ImageRequest request, String requestId, boolean isPrefetch) {
        if (FLog.isLoggable(2)) {
            Long startTime = this.mRequestStartTimeMap.remove(requestId);
            long currentTime = getTime();
            FLog.v(TAG, "time %d: onRequestSuccess: {requestId: %s, elapsedTime: %d ms}", Long.valueOf(currentTime), requestId, Long.valueOf(getElapsedTime(startTime, currentTime)));
        }
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public synchronized void onRequestFailure(ImageRequest request, String requestId, Throwable throwable, boolean isPrefetch) {
        if (FLog.isLoggable(5)) {
            Long startTime = this.mRequestStartTimeMap.remove(requestId);
            long currentTime = getTime();
            FLog.w(TAG, "time %d: onRequestFailure: {requestId: %s, elapsedTime: %d ms, throwable: %s}", Long.valueOf(currentTime), requestId, Long.valueOf(getElapsedTime(startTime, currentTime)), throwable.toString());
        }
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public synchronized void onRequestCancellation(String requestId) {
        if (FLog.isLoggable(2)) {
            Long startTime = this.mRequestStartTimeMap.remove(requestId);
            long currentTime = getTime();
            FLog.v(TAG, "time %d: onRequestCancellation: {requestId: %s, elapsedTime: %d ms}", Long.valueOf(currentTime), requestId, Long.valueOf(getElapsedTime(startTime, currentTime)));
        }
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public boolean requiresExtraMap(String id) {
        return FLog.isLoggable(2);
    }

    private static long getElapsedTime(@Nullable Long startTime, long endTime) {
        if (startTime != null) {
            return endTime - startTime.longValue();
        }
        return -1L;
    }

    private static long getTime() {
        return SystemClock.uptimeMillis();
    }
}
