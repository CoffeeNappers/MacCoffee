package com.google.android.exoplayer2.upstream.cache;

import com.google.android.exoplayer2.upstream.DataSink;
/* loaded from: classes.dex */
public final class CacheDataSinkFactory implements DataSink.Factory {
    private final Cache cache;
    private final long maxCacheFileSize;

    public CacheDataSinkFactory(Cache cache, long maxCacheFileSize) {
        this.cache = cache;
        this.maxCacheFileSize = maxCacheFileSize;
    }

    @Override // com.google.android.exoplayer2.upstream.DataSink.Factory
    public DataSink createDataSink() {
        return new CacheDataSink(this.cache, this.maxCacheFileSize);
    }
}
