package com.my.target.core.utils;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
/* compiled from: LruCache.java */
/* loaded from: classes2.dex */
public final class i<K, V> {
    private int b;
    private int d;
    private int e;
    private int f;
    private int g;
    private int c = 10;
    private final LinkedHashMap<K, V> a = new LinkedHashMap<>(0, 0.75f, true);

    public final synchronized V a(K k, V v) {
        V put;
        if (k == null || v == null) {
            throw new NullPointerException("key == null || value == null");
        }
        this.d++;
        this.b++;
        put = this.a.put(k, v);
        if (put != null) {
            this.b--;
        }
        a(this.c);
        return put;
    }

    public final Set<K> a() {
        return this.a.keySet();
    }

    private void a(int i) {
        Map.Entry<K, V> next;
        while (this.b > i && !this.a.isEmpty() && (next = this.a.entrySet().iterator().next()) != null) {
            K key = next.getKey();
            next.getValue();
            this.a.remove(key);
            this.b--;
            this.e++;
        }
        if (this.b < 0 || (this.a.isEmpty() && this.b != 0)) {
            throw new IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
        }
    }

    public final synchronized String toString() {
        String format;
        int i = 0;
        synchronized (this) {
            int i2 = this.f + this.g;
            if (i2 != 0) {
                i = (this.f * 100) / i2;
            }
            format = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", Integer.valueOf(this.c), Integer.valueOf(this.f), Integer.valueOf(this.g), Integer.valueOf(i));
        }
        return format;
    }
}
