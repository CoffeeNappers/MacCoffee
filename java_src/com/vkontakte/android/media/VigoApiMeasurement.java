package com.vkontakte.android.media;

import com.vkontakte.android.media.VigoPool;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public class VigoApiMeasurement {
    private static final short POOL_SIZE = 16;
    private static final VigoPool<VigoApiMeasurement> pool = new VigoPool<>(new VigoPool.ObjectFactory<VigoApiMeasurement>() { // from class: com.vkontakte.android.media.VigoApiMeasurement.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.media.VigoPool.ObjectFactory
        /* renamed from: newInstance */
        public VigoApiMeasurement mo1082newInstance() {
            return new VigoApiMeasurement();
        }
    }, 16);
    public int avgErrorApiRequestPt;
    public int avgErrorApiRequestRtt;
    public int avgErrorMeasurementCount;
    public long avgSuccessApiContentLength;
    public int avgSuccessApiRequestPt;
    public int avgSuccessApiRequestRtt;
    public int avgSuccessMeasurementCount;
    public int failedApiMeasurementCounter;
    private final AtomicBoolean inPool = new AtomicBoolean();

    public static VigoApiMeasurement getObject() {
        VigoApiMeasurement obj = pool.getObject();
        obj.inPool.set(false);
        return obj;
    }

    public void returnObject() {
        if (this.inPool.compareAndSet(false, true)) {
            reset();
            pool.setFree(this);
        }
    }

    public void reset() {
        this.avgSuccessApiRequestRtt = 0;
        this.avgSuccessApiRequestPt = 0;
        this.avgSuccessApiContentLength = 0L;
        this.avgSuccessMeasurementCount = 0;
        this.avgErrorApiRequestRtt = 0;
        this.avgErrorApiRequestPt = 0;
        this.avgErrorMeasurementCount = 0;
        this.failedApiMeasurementCounter = 0;
    }
}
