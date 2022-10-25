package com.facebook.imagepipeline.producers;

import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.cache.CacheKeyFactory;
import com.facebook.imagepipeline.cache.MemoryCache;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.Map;
/* loaded from: classes.dex */
public class EncodedMemoryCacheProducer implements Producer<EncodedImage> {
    public static final String EXTRA_CACHED_VALUE_FOUND = "cached_value_found";
    public static final String PRODUCER_NAME = "EncodedMemoryCacheProducer";
    private final CacheKeyFactory mCacheKeyFactory;
    private final Producer<EncodedImage> mInputProducer;
    private final MemoryCache<CacheKey, PooledByteBuffer> mMemoryCache;

    public EncodedMemoryCacheProducer(MemoryCache<CacheKey, PooledByteBuffer> memoryCache, CacheKeyFactory cacheKeyFactory, Producer<EncodedImage> inputProducer) {
        this.mMemoryCache = memoryCache;
        this.mCacheKeyFactory = cacheKeyFactory;
        this.mInputProducer = inputProducer;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        Map<String, String> map = null;
        String requestId = producerContext.getId();
        ProducerListener listener = producerContext.getListener();
        listener.onProducerStart(requestId, PRODUCER_NAME);
        ImageRequest imageRequest = producerContext.getImageRequest();
        CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, producerContext.getCallerContext());
        CloseableReference<PooledByteBuffer> cachedReference = this.mMemoryCache.get(cacheKey);
        try {
            if (cachedReference != null) {
                EncodedImage cachedEncodedImage = new EncodedImage(cachedReference);
                cachedEncodedImage.setEncodedCacheKey(cacheKey);
                if (listener.requiresExtraMap(requestId)) {
                    map = ImmutableMap.of("cached_value_found", "true");
                }
                listener.onProducerFinishWithSuccess(requestId, PRODUCER_NAME, map);
                consumer.onProgressUpdate(1.0f);
                consumer.onNewResult(cachedEncodedImage, true);
                EncodedImage.closeSafely(cachedEncodedImage);
            } else if (producerContext.getLowestPermittedRequestLevel().getValue() >= ImageRequest.RequestLevel.ENCODED_MEMORY_CACHE.getValue()) {
                if (listener.requiresExtraMap(requestId)) {
                    map = ImmutableMap.of("cached_value_found", "false");
                }
                listener.onProducerFinishWithSuccess(requestId, PRODUCER_NAME, map);
                consumer.onNewResult(null, true);
            } else {
                Consumer consumerOfInputProducer = new EncodedMemoryCacheConsumer(consumer, this.mMemoryCache, cacheKey);
                if (listener.requiresExtraMap(requestId)) {
                    map = ImmutableMap.of("cached_value_found", "false");
                }
                listener.onProducerFinishWithSuccess(requestId, PRODUCER_NAME, map);
                this.mInputProducer.produceResults(consumerOfInputProducer, producerContext);
            }
        } finally {
            CloseableReference.closeSafely(cachedReference);
        }
    }

    /* loaded from: classes.dex */
    private static class EncodedMemoryCacheConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private final MemoryCache<CacheKey, PooledByteBuffer> mMemoryCache;
        private final CacheKey mRequestedCacheKey;

        public EncodedMemoryCacheConsumer(Consumer<EncodedImage> consumer, MemoryCache<CacheKey, PooledByteBuffer> memoryCache, CacheKey requestedCacheKey) {
            super(consumer);
            this.mMemoryCache = memoryCache;
            this.mRequestedCacheKey = requestedCacheKey;
        }

        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            if (!isLast || newResult == null) {
                getConsumer().onNewResult(newResult, isLast);
                return;
            }
            CloseableReference<PooledByteBuffer> ref = newResult.getByteBufferRef();
            if (ref != null) {
                try {
                    CacheKey cacheKey = newResult.getEncodedCacheKey() != null ? newResult.getEncodedCacheKey() : this.mRequestedCacheKey;
                    CloseableReference<PooledByteBuffer> cachedResult = this.mMemoryCache.cache(cacheKey, ref);
                    if (cachedResult != null) {
                        try {
                            EncodedImage cachedEncodedImage = new EncodedImage(cachedResult);
                            cachedEncodedImage.copyMetaDataFrom(newResult);
                            try {
                                getConsumer().onProgressUpdate(1.0f);
                                getConsumer().onNewResult(cachedEncodedImage, true);
                                return;
                            } finally {
                                EncodedImage.closeSafely(cachedEncodedImage);
                            }
                        } finally {
                            CloseableReference.closeSafely(cachedResult);
                        }
                    }
                } finally {
                    CloseableReference.closeSafely(ref);
                }
            }
            getConsumer().onNewResult(newResult, true);
        }
    }
}
