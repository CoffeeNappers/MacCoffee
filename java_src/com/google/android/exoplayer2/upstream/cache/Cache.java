package com.google.android.exoplayer2.upstream.cache;

import java.io.File;
import java.io.IOException;
import java.util.NavigableSet;
import java.util.Set;
/* loaded from: classes.dex */
public interface Cache {

    /* loaded from: classes.dex */
    public interface Listener {
        void onSpanAdded(Cache cache, CacheSpan cacheSpan);

        void onSpanRemoved(Cache cache, CacheSpan cacheSpan);

        void onSpanTouched(Cache cache, CacheSpan cacheSpan, CacheSpan cacheSpan2);
    }

    NavigableSet<CacheSpan> addListener(String str, Listener listener);

    void commitFile(File file) throws CacheException;

    long getCacheSpace();

    NavigableSet<CacheSpan> getCachedSpans(String str);

    long getContentLength(String str);

    Set<String> getKeys();

    boolean isCached(String str, long j, long j2);

    void releaseHoleSpan(CacheSpan cacheSpan);

    void removeListener(String str, Listener listener);

    void removeSpan(CacheSpan cacheSpan) throws CacheException;

    void setContentLength(String str, long j) throws CacheException;

    File startFile(String str, long j, long j2) throws CacheException;

    /* renamed from: startReadWrite */
    CacheSpan mo381startReadWrite(String str, long j) throws InterruptedException, CacheException;

    /* renamed from: startReadWriteNonBlocking */
    CacheSpan mo382startReadWriteNonBlocking(String str, long j) throws CacheException;

    /* loaded from: classes.dex */
    public static class CacheException extends IOException {
        public CacheException(String message) {
            super(message);
        }

        public CacheException(IOException cause) {
            super(cause);
        }
    }
}
