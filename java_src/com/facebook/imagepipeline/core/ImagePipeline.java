package com.facebook.imagepipeline.core;

import android.net.Uri;
import bolts.Continuation;
import bolts.Task;
import com.android.internal.util.Predicate;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.Objects;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.UriUtil;
import com.facebook.datasource.DataSource;
import com.facebook.datasource.DataSources;
import com.facebook.datasource.SimpleDataSource;
import com.facebook.imagepipeline.cache.BufferedDiskCache;
import com.facebook.imagepipeline.cache.CacheKeyFactory;
import com.facebook.imagepipeline.cache.MemoryCache;
import com.facebook.imagepipeline.common.Priority;
import com.facebook.imagepipeline.datasource.CloseableProducerToDataSourceAdapter;
import com.facebook.imagepipeline.datasource.ProducerToDataSourceAdapter;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.listener.ForwardingRequestListener;
import com.facebook.imagepipeline.listener.RequestListener;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.producers.Producer;
import com.facebook.imagepipeline.producers.SettableProducerContext;
import com.facebook.imagepipeline.producers.ThreadHandoffProducerQueue;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicLong;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class ImagePipeline {
    private static final CancellationException PREFETCH_EXCEPTION = new CancellationException("Prefetching is not enabled");
    private final MemoryCache<CacheKey, CloseableImage> mBitmapMemoryCache;
    private final CacheKeyFactory mCacheKeyFactory;
    private final MemoryCache<CacheKey, PooledByteBuffer> mEncodedMemoryCache;
    private AtomicLong mIdCounter = new AtomicLong();
    private final Supplier<Boolean> mIsPrefetchEnabledSupplier;
    private final BufferedDiskCache mMainBufferedDiskCache;
    private final ProducerSequenceFactory mProducerSequenceFactory;
    private final RequestListener mRequestListener;
    private final BufferedDiskCache mSmallImageBufferedDiskCache;
    private final Supplier<Boolean> mSuppressBitmapPrefetchingSupplier;
    private final ThreadHandoffProducerQueue mThreadHandoffProducerQueue;

    public ImagePipeline(ProducerSequenceFactory producerSequenceFactory, Set<RequestListener> requestListeners, Supplier<Boolean> isPrefetchEnabledSupplier, MemoryCache<CacheKey, CloseableImage> bitmapMemoryCache, MemoryCache<CacheKey, PooledByteBuffer> encodedMemoryCache, BufferedDiskCache mainBufferedDiskCache, BufferedDiskCache smallImageBufferedDiskCache, CacheKeyFactory cacheKeyFactory, ThreadHandoffProducerQueue threadHandoffProducerQueue, Supplier<Boolean> suppressBitmapPrefetchingSupplier) {
        this.mProducerSequenceFactory = producerSequenceFactory;
        this.mRequestListener = new ForwardingRequestListener(requestListeners);
        this.mIsPrefetchEnabledSupplier = isPrefetchEnabledSupplier;
        this.mBitmapMemoryCache = bitmapMemoryCache;
        this.mEncodedMemoryCache = encodedMemoryCache;
        this.mMainBufferedDiskCache = mainBufferedDiskCache;
        this.mSmallImageBufferedDiskCache = smallImageBufferedDiskCache;
        this.mCacheKeyFactory = cacheKeyFactory;
        this.mThreadHandoffProducerQueue = threadHandoffProducerQueue;
        this.mSuppressBitmapPrefetchingSupplier = suppressBitmapPrefetchingSupplier;
    }

    private String generateUniqueFutureId() {
        return String.valueOf(this.mIdCounter.getAndIncrement());
    }

    @Deprecated
    public Supplier<DataSource<CloseableReference<CloseableImage>>> getDataSourceSupplier(ImageRequest imageRequest, Object callerContext, boolean bitmapCacheOnly) {
        ImageRequest.RequestLevel requestLevel = bitmapCacheOnly ? ImageRequest.RequestLevel.BITMAP_MEMORY_CACHE : ImageRequest.RequestLevel.FULL_FETCH;
        return getDataSourceSupplier(imageRequest, callerContext, requestLevel);
    }

    public Supplier<DataSource<CloseableReference<CloseableImage>>> getDataSourceSupplier(final ImageRequest imageRequest, final Object callerContext, final ImageRequest.RequestLevel requestLevel) {
        return new Supplier<DataSource<CloseableReference<CloseableImage>>>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.facebook.common.internal.Supplier
            /* renamed from: get */
            public DataSource<CloseableReference<CloseableImage>> mo486get() {
                return ImagePipeline.this.fetchDecodedImage(imageRequest, callerContext, requestLevel);
            }

            public String toString() {
                return Objects.toStringHelper(this).add("uri", imageRequest.getSourceUri()).toString();
            }
        };
    }

    public Supplier<DataSource<CloseableReference<PooledByteBuffer>>> getEncodedImageDataSourceSupplier(final ImageRequest imageRequest, final Object callerContext) {
        return new Supplier<DataSource<CloseableReference<PooledByteBuffer>>>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.facebook.common.internal.Supplier
            /* renamed from: get */
            public DataSource<CloseableReference<PooledByteBuffer>> mo486get() {
                return ImagePipeline.this.fetchEncodedImage(imageRequest, callerContext);
            }

            public String toString() {
                return Objects.toStringHelper(this).add("uri", imageRequest.getSourceUri()).toString();
            }
        };
    }

    public DataSource<CloseableReference<CloseableImage>> fetchImageFromBitmapCache(ImageRequest imageRequest, Object callerContext) {
        return fetchDecodedImage(imageRequest, callerContext, ImageRequest.RequestLevel.BITMAP_MEMORY_CACHE);
    }

    public DataSource<CloseableReference<CloseableImage>> fetchDecodedImage(ImageRequest imageRequest, Object callerContext) {
        return fetchDecodedImage(imageRequest, callerContext, ImageRequest.RequestLevel.FULL_FETCH);
    }

    public DataSource<CloseableReference<CloseableImage>> fetchDecodedImage(ImageRequest imageRequest, Object callerContext, ImageRequest.RequestLevel lowestPermittedRequestLevelOnSubmit) {
        try {
            Producer<CloseableReference<CloseableImage>> producerSequence = this.mProducerSequenceFactory.getDecodedImageProducerSequence(imageRequest);
            return submitFetchRequest(producerSequence, imageRequest, lowestPermittedRequestLevelOnSubmit, callerContext);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    public DataSource<CloseableReference<PooledByteBuffer>> fetchEncodedImage(ImageRequest imageRequest, Object callerContext) {
        Preconditions.checkNotNull(imageRequest.getSourceUri());
        try {
            Producer<CloseableReference<PooledByteBuffer>> producerSequence = this.mProducerSequenceFactory.getEncodedImageProducerSequence(imageRequest);
            if (imageRequest.getResizeOptions() != null) {
                imageRequest = ImageRequestBuilder.fromRequest(imageRequest).setResizeOptions(null).build();
            }
            return submitFetchRequest(producerSequence, imageRequest, ImageRequest.RequestLevel.FULL_FETCH, callerContext);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    public DataSource<Void> prefetchToBitmapCache(ImageRequest imageRequest, Object callerContext) {
        Producer<Void> producerSequence;
        if (!this.mIsPrefetchEnabledSupplier.mo486get().booleanValue()) {
            return DataSources.immediateFailedDataSource(PREFETCH_EXCEPTION);
        }
        try {
            if (this.mSuppressBitmapPrefetchingSupplier.mo486get().booleanValue()) {
                producerSequence = this.mProducerSequenceFactory.getEncodedImagePrefetchProducerSequence(imageRequest);
            } else {
                producerSequence = this.mProducerSequenceFactory.getDecodedImagePrefetchProducerSequence(imageRequest);
            }
            return submitPrefetchRequest(producerSequence, imageRequest, ImageRequest.RequestLevel.FULL_FETCH, callerContext, Priority.MEDIUM);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    public DataSource<Void> prefetchToDiskCache(ImageRequest imageRequest, Object callerContext) {
        return prefetchToDiskCache(imageRequest, callerContext, Priority.MEDIUM);
    }

    public DataSource<Void> prefetchToDiskCache(ImageRequest imageRequest, Object callerContext, Priority priority) {
        if (!this.mIsPrefetchEnabledSupplier.mo486get().booleanValue()) {
            return DataSources.immediateFailedDataSource(PREFETCH_EXCEPTION);
        }
        try {
            Producer<Void> producerSequence = this.mProducerSequenceFactory.getEncodedImagePrefetchProducerSequence(imageRequest);
            return submitPrefetchRequest(producerSequence, imageRequest, ImageRequest.RequestLevel.FULL_FETCH, callerContext, priority);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    public void evictFromMemoryCache(Uri uri) {
        Predicate<CacheKey> predicate = predicateForUri(uri);
        this.mBitmapMemoryCache.removeAll(predicate);
        this.mEncodedMemoryCache.removeAll(predicate);
    }

    public void evictFromDiskCache(Uri uri) {
        evictFromDiskCache(ImageRequest.fromUri(uri));
    }

    public void evictFromDiskCache(ImageRequest imageRequest) {
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, null);
        this.mMainBufferedDiskCache.remove(cacheKey);
        this.mSmallImageBufferedDiskCache.remove(cacheKey);
    }

    public void evictFromCache(Uri uri) {
        evictFromMemoryCache(uri);
        evictFromDiskCache(uri);
    }

    public void clearMemoryCaches() {
        Predicate<CacheKey> allPredicate = new Predicate<CacheKey>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.3
            public boolean apply(CacheKey key) {
                return true;
            }
        };
        this.mBitmapMemoryCache.removeAll(allPredicate);
        this.mEncodedMemoryCache.removeAll(allPredicate);
    }

    public void clearDiskCaches() {
        this.mMainBufferedDiskCache.clearAll();
        this.mSmallImageBufferedDiskCache.clearAll();
    }

    public void clearCaches() {
        clearMemoryCaches();
        clearDiskCaches();
    }

    public boolean isInBitmapMemoryCache(Uri uri) {
        if (uri == null) {
            return false;
        }
        Predicate<CacheKey> bitmapCachePredicate = predicateForUri(uri);
        return this.mBitmapMemoryCache.contains(bitmapCachePredicate);
    }

    public MemoryCache<CacheKey, CloseableImage> getBitmapMemoryCache() {
        return this.mBitmapMemoryCache;
    }

    public boolean isInBitmapMemoryCache(ImageRequest imageRequest) {
        if (imageRequest == null) {
            return false;
        }
        CacheKey cacheKey = this.mCacheKeyFactory.getBitmapCacheKey(imageRequest, null);
        CloseableReference<CloseableImage> ref = this.mBitmapMemoryCache.get(cacheKey);
        try {
            return CloseableReference.isValid(ref);
        } finally {
            CloseableReference.closeSafely(ref);
        }
    }

    public boolean isInDiskCacheSync(Uri uri) {
        return isInDiskCacheSync(uri, ImageRequest.CacheChoice.SMALL) || isInDiskCacheSync(uri, ImageRequest.CacheChoice.DEFAULT);
    }

    public boolean isInDiskCacheSync(Uri uri, ImageRequest.CacheChoice cacheChoice) {
        ImageRequest imageRequest = ImageRequestBuilder.newBuilderWithSource(uri).setCacheChoice(cacheChoice).build();
        return isInDiskCacheSync(imageRequest);
    }

    public boolean isInDiskCacheSync(ImageRequest imageRequest) {
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, null);
        ImageRequest.CacheChoice cacheChoice = imageRequest.getCacheChoice();
        switch (cacheChoice) {
            case DEFAULT:
                return this.mMainBufferedDiskCache.diskCheckSync(cacheKey);
            case SMALL:
                return this.mSmallImageBufferedDiskCache.diskCheckSync(cacheKey);
            default:
                return false;
        }
    }

    public DataSource<Boolean> isInDiskCache(Uri uri) {
        return isInDiskCache(ImageRequest.fromUri(uri));
    }

    public DataSource<Boolean> isInDiskCache(ImageRequest imageRequest) {
        final CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, null);
        final SimpleDataSource<Boolean> dataSource = SimpleDataSource.create();
        this.mMainBufferedDiskCache.contains(cacheKey).continueWithTask(new Continuation<Boolean, Task<Boolean>>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.5
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // bolts.Continuation
            /* renamed from: then */
            public Task<Boolean> mo533then(Task<Boolean> task) throws Exception {
                if (task.isCancelled() || task.isFaulted() || !task.getResult().booleanValue()) {
                    return ImagePipeline.this.mSmallImageBufferedDiskCache.contains(cacheKey);
                }
                return Task.forResult(true);
            }
        }).continueWith(new Continuation<Boolean, Void>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.4
            @Override // bolts.Continuation
            /* renamed from: then  reason: collision with other method in class */
            public Void mo533then(Task<Boolean> task) throws Exception {
                dataSource.setResult(Boolean.valueOf(!task.isCancelled() && !task.isFaulted() && task.getResult().booleanValue()));
                return null;
            }
        });
        return dataSource;
    }

    private <T> DataSource<CloseableReference<T>> submitFetchRequest(Producer<CloseableReference<T>> producerSequence, ImageRequest imageRequest, ImageRequest.RequestLevel lowestPermittedRequestLevelOnSubmit, Object callerContext) {
        boolean z = false;
        RequestListener requestListener = getRequestListenerForRequest(imageRequest);
        try {
            ImageRequest.RequestLevel lowestPermittedRequestLevel = ImageRequest.RequestLevel.getMax(imageRequest.getLowestPermittedRequestLevel(), lowestPermittedRequestLevelOnSubmit);
            String generateUniqueFutureId = generateUniqueFutureId();
            if (imageRequest.getProgressiveRenderingEnabled() || imageRequest.getMediaVariations() != null || !UriUtil.isNetworkUri(imageRequest.getSourceUri())) {
                z = true;
            }
            SettableProducerContext settableProducerContext = new SettableProducerContext(imageRequest, generateUniqueFutureId, requestListener, callerContext, lowestPermittedRequestLevel, false, z, imageRequest.getPriority());
            return CloseableProducerToDataSourceAdapter.create(producerSequence, settableProducerContext, requestListener);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    private DataSource<Void> submitPrefetchRequest(Producer<Void> producerSequence, ImageRequest imageRequest, ImageRequest.RequestLevel lowestPermittedRequestLevelOnSubmit, Object callerContext, Priority priority) {
        RequestListener requestListener = getRequestListenerForRequest(imageRequest);
        try {
            ImageRequest.RequestLevel lowestPermittedRequestLevel = ImageRequest.RequestLevel.getMax(imageRequest.getLowestPermittedRequestLevel(), lowestPermittedRequestLevelOnSubmit);
            SettableProducerContext settableProducerContext = new SettableProducerContext(imageRequest, generateUniqueFutureId(), requestListener, callerContext, lowestPermittedRequestLevel, true, false, priority);
            return ProducerToDataSourceAdapter.create(producerSequence, settableProducerContext, requestListener);
        } catch (Exception exception) {
            return DataSources.immediateFailedDataSource(exception);
        }
    }

    private RequestListener getRequestListenerForRequest(ImageRequest imageRequest) {
        return imageRequest.getRequestListener() == null ? this.mRequestListener : new ForwardingRequestListener(this.mRequestListener, imageRequest.getRequestListener());
    }

    private Predicate<CacheKey> predicateForUri(final Uri uri) {
        return new Predicate<CacheKey>() { // from class: com.facebook.imagepipeline.core.ImagePipeline.6
            public boolean apply(CacheKey key) {
                return key.containsUri(uri);
            }
        };
    }

    public void pause() {
        this.mThreadHandoffProducerQueue.startQueueing();
    }

    public void resume() {
        this.mThreadHandoffProducerQueue.stopQueuing();
    }

    public boolean isPaused() {
        return this.mThreadHandoffProducerQueue.isQueueing();
    }

    public CacheKeyFactory getCacheKeyFactory() {
        return this.mCacheKeyFactory;
    }
}
