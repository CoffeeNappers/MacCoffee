package com.facebook.imagepipeline.cache;

import bolts.Continuation;
import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class SplitCachesByImageSizeDiskCachePolicy implements DiskCachePolicy {
    private final CacheKeyFactory mCacheKeyFactory;
    private final BufferedDiskCache mDefaultBufferedDiskCache;
    private final int mForceSmallCacheThresholdBytes;
    private final BufferedDiskCache mSmallImageBufferedDiskCache;

    public SplitCachesByImageSizeDiskCachePolicy(BufferedDiskCache defaultBufferedDiskCache, BufferedDiskCache smallImageBufferedDiskCache, CacheKeyFactory cacheKeyFactory, int forceSmallCacheThresholdBytes) {
        this.mDefaultBufferedDiskCache = defaultBufferedDiskCache;
        this.mSmallImageBufferedDiskCache = smallImageBufferedDiskCache;
        this.mCacheKeyFactory = cacheKeyFactory;
        this.mForceSmallCacheThresholdBytes = forceSmallCacheThresholdBytes;
    }

    @Override // com.facebook.imagepipeline.cache.DiskCachePolicy
    public Task<EncodedImage> createAndStartCacheReadTask(ImageRequest imageRequest, Object callerContext, final AtomicBoolean isCancelled) {
        BufferedDiskCache firstCache;
        final BufferedDiskCache secondCache;
        final CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, callerContext);
        boolean alreadyInSmall = this.mSmallImageBufferedDiskCache.containsSync(cacheKey);
        boolean alreadyInMain = this.mDefaultBufferedDiskCache.containsSync(cacheKey);
        if (alreadyInSmall || !alreadyInMain) {
            firstCache = this.mSmallImageBufferedDiskCache;
            secondCache = this.mDefaultBufferedDiskCache;
        } else {
            firstCache = this.mDefaultBufferedDiskCache;
            secondCache = this.mSmallImageBufferedDiskCache;
        }
        return firstCache.get(cacheKey, isCancelled).continueWithTask(new Continuation<EncodedImage, Task<EncodedImage>>() { // from class: com.facebook.imagepipeline.cache.SplitCachesByImageSizeDiskCachePolicy.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // bolts.Continuation
            /* renamed from: then */
            public Task<EncodedImage> mo533then(Task<EncodedImage> task) throws Exception {
                if (!SplitCachesByImageSizeDiskCachePolicy.isTaskCancelled(task)) {
                    return (task.isFaulted() || task.getResult() == null) ? secondCache.get(cacheKey, isCancelled) : task;
                }
                return task;
            }
        });
    }

    @Override // com.facebook.imagepipeline.cache.DiskCachePolicy
    public void writeToCache(EncodedImage newResult, ImageRequest imageRequest, Object callerContext) {
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, callerContext);
        int size = newResult.getSize();
        if (size > 0 && size < this.mForceSmallCacheThresholdBytes) {
            this.mSmallImageBufferedDiskCache.put(cacheKey, newResult);
        } else {
            this.mDefaultBufferedDiskCache.put(cacheKey, newResult);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isTaskCancelled(Task<?> task) {
        return task.isCancelled() || (task.isFaulted() && (task.getError() instanceof CancellationException));
    }
}
