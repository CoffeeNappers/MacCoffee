package com.facebook.imagepipeline.cache;

import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.image.CloseableImage;
/* loaded from: classes.dex */
public class BitmapMemoryCacheFactory {
    public static MemoryCache<CacheKey, CloseableImage> get(CountingMemoryCache<CacheKey, CloseableImage> bitmapCountingMemoryCache, final ImageCacheStatsTracker imageCacheStatsTracker) {
        imageCacheStatsTracker.registerBitmapMemoryCache(bitmapCountingMemoryCache);
        MemoryCacheTracker memoryCacheTracker = new MemoryCacheTracker<CacheKey>() { // from class: com.facebook.imagepipeline.cache.BitmapMemoryCacheFactory.1
            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCacheHit(CacheKey cacheKey) {
                ImageCacheStatsTracker.this.onBitmapCacheHit(cacheKey);
            }

            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCacheMiss() {
                ImageCacheStatsTracker.this.onBitmapCacheMiss();
            }

            @Override // com.facebook.imagepipeline.cache.MemoryCacheTracker
            public void onCachePut() {
                ImageCacheStatsTracker.this.onBitmapCachePut();
            }
        };
        return new InstrumentedMemoryCache(bitmapCountingMemoryCache, memoryCacheTracker);
    }
}
