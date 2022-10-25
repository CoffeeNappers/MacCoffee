package io.sentry.jvmti;

import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes3.dex */
public final class FrameCache {
    private static ThreadLocal<WeakHashMap<Throwable, Frame[]>> result = new ThreadLocal<WeakHashMap<Throwable, Frame[]>>() { // from class: io.sentry.jvmti.FrameCache.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.ThreadLocal
        public WeakHashMap<Throwable, Frame[]> initialValue() {
            return new WeakHashMap<>();
        }
    };

    private FrameCache() {
    }

    public static void add(Throwable throwable, Frame[] frames) {
        Map<Throwable, Frame[]> weakMap = result.get();
        weakMap.put(throwable, frames);
    }

    public static Frame[] get(Throwable throwable) {
        Map<Throwable, Frame[]> weakMap = result.get();
        return weakMap.get(throwable);
    }
}
