package com.vkontakte.android.media;

import com.vkontakte.android.media.VigoPool;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public class VigoApiEvent {
    private static final short POOL_SIZE = 256;
    private static final VigoPool<VigoApiEvent> pool = new VigoPool<>(new VigoPool.ObjectFactory<VigoApiEvent>() { // from class: com.vkontakte.android.media.VigoApiEvent.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.media.VigoPool.ObjectFactory
        /* renamed from: newInstance */
        public VigoApiEvent mo1082newInstance() {
            return new VigoApiEvent();
        }
    }, 256);
    public VigoBinaryBuffer info;
    private final AtomicBoolean inPool = new AtomicBoolean();
    public final Map<Byte, VigoApiMeasurement> apiMeasurements = new HashMap();

    public static VigoApiEvent getObject() {
        VigoApiEvent obj = pool.getObject();
        obj.inPool.set(false);
        return obj;
    }

    public void returnObject() {
        if (this.inPool.compareAndSet(false, true)) {
            reset();
            pool.setFree(this);
        }
    }

    public VigoApiEvent() {
        this.inPool.set(true);
    }

    public void reset() {
        for (VigoApiMeasurement measurement : this.apiMeasurements.values()) {
            measurement.returnObject();
        }
        this.apiMeasurements.clear();
    }
}
