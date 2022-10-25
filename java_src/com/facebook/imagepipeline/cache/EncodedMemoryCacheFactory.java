package com.facebook.imagepipeline.cache;

import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
/* loaded from: classes.dex */
public class EncodedMemoryCacheFactory {
    public static MemoryCache<CacheKey, PooledByteBuffer> get(CountingMemoryCache<CacheKey, PooledByteBuffer> encodedCountingMemoryCache, final ImageCacheStatsTracker imageCacheStatsTracker) {
        imageCacheStatsTracker.registerEncodedMemoryCache(encodedCountingMemoryCache);
        MemoryCacheTracker memoryCacheTracker = new MemoryCacheTracker<CacheKey>() { // from class: com.facebook.imagepipeline.cache.EncodedMemoryCacheFactory.1
            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCacheHit(CacheKey cacheKey) {
                ImageCacheStatsTracker.this.onMemoryCacheHit(cacheKey);
            }

            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCacheMiss() {
                ImageCacheStatsTracker.this.onMemoryCacheMiss();
            }

            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCachePut() {
                ImageCacheStatsTracker.this.onMemoryCachePut();
            }
        };
        return new InstrumentedMemoryCache(encodedCountingMemoryCache, memoryCacheTracker);
    }
}
