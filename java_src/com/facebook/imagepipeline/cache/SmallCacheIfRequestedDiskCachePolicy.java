package com.facebook.imagepipeline.cache;

import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class SmallCacheIfRequestedDiskCachePolicy implements DiskCachePolicy {
    private final CacheKeyFactory mCacheKeyFactory;
    private final BufferedDiskCache mDefaultBufferedDiskCache;
    private final BufferedDiskCache mSmallImageBufferedDiskCache;

    public SmallCacheIfRequestedDiskCachePolicy(BufferedDiskCache defaultBufferedDiskCache, BufferedDiskCache smallImageBufferedDiskCache, CacheKeyFactory cacheKeyFactory) {
        this.mDefaultBufferedDiskCache = defaultBufferedDiskCache;
        this.mSmallImageBufferedDiskCache = smallImageBufferedDiskCache;
        this.mCacheKeyFactory = cacheKeyFactory;
    }

    @Override // com.facebook.imagepipeline.cache.DiskCachePolicy
    public Task<EncodedImage> createAndStartCacheReadTask(ImageRequest imageRequest, Object callerContext, AtomicBoolean isCancelled) {
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, callerContext);
        return imageRequest.getCacheChoice() == ImageRequest.CacheChoice.SMALL ? this.mSmallImageBufferedDiskCache.get(cacheKey, isCancelled) : this.mDefaultBufferedDiskCache.get(cacheKey, isCancelled);
    }

    @Override // com.facebook.imagepipeline.cache.DiskCachePolicy
    public void writeToCache(EncodedImage newResult, ImageRequest imageRequest, Object callerContext) {
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, callerContext);
        if (imageRequest.getCacheChoice() == ImageRequest.CacheChoice.SMALL) {
            this.mSmallImageBufferedDiskCache.put(cacheKey, newResult);
        } else {
            this.mDefaultBufferedDiskCache.put(cacheKey, newResult);
        }
    }
}
