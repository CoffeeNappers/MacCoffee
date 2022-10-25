package com.facebook.imagepipeline.cache;

import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.Supplier;
import com.facebook.common.memory.MemoryTrimmableRegistry;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.cache.CountingMemoryCache;
import com.facebook.imagepipeline.image.CloseableImage;
/* loaded from: classes.dex */
public class BitmapCountingMemoryCacheFactory {
    public static CountingMemoryCache<CacheKey, CloseableImage> get(Supplier<MemoryCacheParams> bitmapMemoryCacheParamsSupplier, MemoryTrimmableRegistry memoryTrimmableRegistry, PlatformBitmapFactory platformBitmapFactory, boolean isExternalCreatedBitmapLogEnabled) {
        ValueDescriptor<CloseableImage> valueDescriptor = new ValueDescriptor<CloseableImage>() { // from class: com.facebook.imagepipeline.cache.BitmapCountingMemoryCacheFactory.1
            @Override // com.facebook.imagepipeline.cache.ValueDescriptor
            public int getSizeInBytes(CloseableImage value) {
                return value.getSizeInBytes();
            }
        };
        CountingMemoryCache.CacheTrimStrategy trimStrategy = new BitmapMemoryCacheTrimStrategy();
        CountingMemoryCache<CacheKey, CloseableImage> countingCache = new CountingMemoryCache<>(valueDescriptor, trimStrategy, bitmapMemoryCacheParamsSupplier, platformBitmapFactory, isExternalCreatedBitmapLogEnabled);
        memoryTrimmableRegistry.registerMemoryTrimmable(countingCache);
        return countingCache;
    }
}
