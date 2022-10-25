package com.vkontakte.android.cache;

import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class LruCache<K, V> {
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private final LinkedHashMap<K, V> map;
    private int maxSize;
    private int missCount;
    private int putCount;
    private int size;

    public LruCache(int maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.maxSize = maxSize;
        this.map = new LinkedHashMap<>(0, 0.75f, true);
    }

    public final V get(K key) {
        V mapValue;
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            V mapValue2 = this.map.get(key);
            if (mapValue2 != null) {
                this.hitCount++;
                return mapValue2;
            }
            this.missCount++;
            V createdValue = create(key);
            if (createdValue == null) {
                return null;
            }
            synchronized (this) {
                this.createCount++;
                mapValue = this.map.put(key, createdValue);
                if (mapValue != null) {
                    this.map.put(key, mapValue);
                } else {
                    this.size += safeSizeOf(key, createdValue);
                }
            }
            if (mapValue != null) {
                entryRemoved(false, key, createdValue, mapValue);
                return mapValue;
            }
            trimToSize(this.maxSize);
            return createdValue;
        }
    }

    public final V put(K key, V value) {
        V previous;
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.putCount++;
            this.size += safeSizeOf(key, value);
            previous = this.map.put(key, value);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, value);
        }
        trimToSize(this.maxSize);
        return previous;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0032, code lost:
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void trimToSize(int r7) {
        /*
            r6 = this;
        L0:
            monitor-enter(r6)
            int r3 = r6.size     // Catch: java.lang.Throwable -> L33
            if (r3 < 0) goto L11
            java.util.LinkedHashMap<K, V> r3 = r6.map     // Catch: java.lang.Throwable -> L33
            boolean r3 = r3.isEmpty()     // Catch: java.lang.Throwable -> L33
            if (r3 == 0) goto L36
            int r3 = r6.size     // Catch: java.lang.Throwable -> L33
            if (r3 == 0) goto L36
        L11:
            java.lang.IllegalStateException r3 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L33
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L33
            r4.<init>()     // Catch: java.lang.Throwable -> L33
            java.lang.Class r5 = r6.getClass()     // Catch: java.lang.Throwable -> L33
            java.lang.String r5 = r5.getName()     // Catch: java.lang.Throwable -> L33
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> L33
            java.lang.String r5 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> L33
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> L33
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L33
            throw r3     // Catch: java.lang.Throwable -> L33
        L33:
            r3 = move-exception
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L33
            throw r3
        L36:
            int r3 = r6.size     // Catch: java.lang.Throwable -> L33
            if (r3 <= r7) goto L42
            java.util.LinkedHashMap<K, V> r3 = r6.map     // Catch: java.lang.Throwable -> L33
            boolean r3 = r3.isEmpty()     // Catch: java.lang.Throwable -> L33
            if (r3 == 0) goto L44
        L42:
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L33
            return
        L44:
            java.util.LinkedHashMap<K, V> r3 = r6.map     // Catch: java.lang.Throwable -> L33
            java.util.Set r3 = r3.entrySet()     // Catch: java.lang.Throwable -> L33
            java.util.Iterator r3 = r3.iterator()     // Catch: java.lang.Throwable -> L33
            java.lang.Object r1 = r3.next()     // Catch: java.lang.Throwable -> L33
            java.util.Map$Entry r1 = (java.util.Map.Entry) r1     // Catch: java.lang.Throwable -> L33
            java.lang.Object r0 = r1.getKey()     // Catch: java.lang.Throwable -> L33
            java.lang.Object r2 = r1.getValue()     // Catch: java.lang.Throwable -> L33
            java.util.LinkedHashMap<K, V> r3 = r6.map     // Catch: java.lang.Throwable -> L33
            r3.remove(r0)     // Catch: java.lang.Throwable -> L33
            int r3 = r6.size     // Catch: java.lang.Throwable -> L33
            int r4 = r6.safeSizeOf(r0, r2)     // Catch: java.lang.Throwable -> L33
            int r3 = r3 - r4
            r6.size = r3     // Catch: java.lang.Throwable -> L33
            int r3 = r6.evictionCount     // Catch: java.lang.Throwable -> L33
            int r3 = r3 + 1
            r6.evictionCount = r3     // Catch: java.lang.Throwable -> L33
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L33
            r3 = 1
            r4 = 0
            r6.entryRemoved(r3, r0, r2, r4)
            goto L0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.cache.LruCache.trimToSize(int):void");
    }

    public final V remove(K key) {
        V previous;
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            previous = this.map.remove(key);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, null);
        }
        return previous;
    }

    public boolean contains(K key) {
        return this.map.containsKey(key);
    }

    protected void entryRemoved(boolean evicted, K key, V oldValue, V newValue) {
    }

    protected V create(K key) {
        return null;
    }

    private int safeSizeOf(K key, V value) {
        int result = sizeOf(key, value);
        if (result < 0) {
            throw new IllegalStateException("Negative size: " + key + "=" + value);
        }
        return result;
    }

    protected int sizeOf(K key, V value) {
        return 1;
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    public final synchronized int size() {
        return this.size;
    }

    public final synchronized int maxSize() {
        return this.maxSize;
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int createCount() {
        return this.createCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }

    public final synchronized Map<K, V> snapshot() {
        return new LinkedHashMap(this.map);
    }

    public final synchronized String toString() {
        String format;
        int hitPercent = 0;
        synchronized (this) {
            int accesses = this.hitCount + this.missCount;
            if (accesses != 0) {
                hitPercent = (this.hitCount * 100) / accesses;
            }
            format = String.format("LruCacheWithContains[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", Integer.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(hitPercent));
        }
        return format;
    }
}
