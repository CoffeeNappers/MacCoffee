package com.facebook.imagepipeline.producers;

import bolts.Continuation;
import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.imagepipeline.cache.BufferedDiskCache;
import com.facebook.imagepipeline.cache.CacheKeyFactory;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.MediaVariations;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class MediaVariationsFallbackProducer implements Producer<EncodedImage> {
    public static final String EXTRA_CACHED_VALUE_FOUND = "cached_value_found";
    public static final String EXTRA_CACHED_VALUE_USED_AS_LAST = "cached_value_used_as_last";
    @VisibleForTesting
    static final String PRODUCER_NAME = "MediaVariationsFallbackProducer";
    private final CacheKeyFactory mCacheKeyFactory;
    private final BufferedDiskCache mDefaultBufferedDiskCache;
    private final Producer<EncodedImage> mInputProducer;
    private final MediaVariationsIndex mMediaVariationsIndex;
    private final BufferedDiskCache mSmallImageBufferedDiskCache;

    public MediaVariationsFallbackProducer(BufferedDiskCache defaultBufferedDiskCache, BufferedDiskCache smallImageBufferedDiskCache, CacheKeyFactory cacheKeyFactory, MediaVariationsIndex mediaVariationsIndex, Producer<EncodedImage> inputProducer) {
        this.mDefaultBufferedDiskCache = defaultBufferedDiskCache;
        this.mSmallImageBufferedDiskCache = smallImageBufferedDiskCache;
        this.mCacheKeyFactory = cacheKeyFactory;
        this.mMediaVariationsIndex = mediaVariationsIndex;
        this.mInputProducer = inputProducer;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(final Consumer<EncodedImage> consumer, final ProducerContext producerContext) {
        final ImageRequest imageRequest = producerContext.getImageRequest();
        final ResizeOptions resizeOptions = imageRequest.getResizeOptions();
        final MediaVariations mediaVariations = imageRequest.getMediaVariations();
        if (!imageRequest.isDiskCacheEnabled() || resizeOptions == null || resizeOptions.height <= 0 || resizeOptions.width <= 0 || mediaVariations == null) {
            startInputProducer(consumer, producerContext);
            return;
        }
        producerContext.getListener().onProducerStart(producerContext.getId(), PRODUCER_NAME);
        final AtomicBoolean isCancelled = new AtomicBoolean(false);
        if (mediaVariations.getVariants() != null) {
            chooseFromVariants(consumer, producerContext, mediaVariations, mediaVariations.getVariants(), imageRequest, resizeOptions, isCancelled);
        } else {
            Task<List<MediaVariations.Variant>> cachedVariantsTask = this.mMediaVariationsIndex.getCachedVariants(mediaVariations.getMediaId());
            cachedVariantsTask.continueWith(new Continuation<List<MediaVariations.Variant>, Object>() { // from class: com.facebook.imagepipeline.producers.MediaVariationsFallbackProducer.1
                @Override // bolts.Continuation
                /* renamed from: then */
                public Object mo533then(Task<List<MediaVariations.Variant>> task) throws Exception {
                    Task<List<MediaVariations.Variant>> task2;
                    if (!task.isCancelled() && !task.isFaulted()) {
                        try {
                            if (task.getResult() == null || task.getResult().isEmpty()) {
                                MediaVariationsFallbackProducer.this.startInputProducer(consumer, producerContext);
                                task2 = null;
                            } else {
                                task2 = MediaVariationsFallbackProducer.this.chooseFromVariants(consumer, producerContext, mediaVariations, task.getResult(), imageRequest, resizeOptions, isCancelled);
                            }
                            return task2;
                        } catch (Exception e) {
                            return null;
                        }
                    }
                    return task;
                }
            });
        }
        subscribeTaskForRequestCancellation(isCancelled, producerContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Task chooseFromVariants(Consumer<EncodedImage> consumer, ProducerContext producerContext, MediaVariations mediaVariations, List<MediaVariations.Variant> variants, ImageRequest imageRequest, ResizeOptions resizeOptions, AtomicBoolean isCancelled) {
        Task<EncodedImage> diskLookupTask;
        boolean useAsLastResult;
        BufferedDiskCache preferredCache = imageRequest.getCacheChoice() == ImageRequest.CacheChoice.SMALL ? this.mSmallImageBufferedDiskCache : this.mDefaultBufferedDiskCache;
        Object callerContext = producerContext.getCallerContext();
        MediaVariations.Variant preferredVariant = null;
        CacheKey preferredCacheKey = null;
        for (int i = 0; i < variants.size(); i++) {
            MediaVariations.Variant variant = variants.get(i);
            CacheKey cacheKey = this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, variant.getUri(), callerContext);
            if (preferredCache.containsSync(cacheKey) && isCloserToRequest(variant, preferredVariant, resizeOptions)) {
                preferredVariant = variant;
                preferredCacheKey = cacheKey;
            }
        }
        if (preferredCacheKey == null) {
            diskLookupTask = Task.forResult(null);
            useAsLastResult = false;
        } else {
            diskLookupTask = preferredCache.get(preferredCacheKey, isCancelled);
            useAsLastResult = !mediaVariations.shouldForceRequestForSpecifiedUri() && isBigEnoughForRequestedSize(preferredVariant, resizeOptions);
        }
        Continuation<EncodedImage, Void> continuation = onFinishDiskReads(consumer, producerContext, useAsLastResult);
        return diskLookupTask.continueWith(continuation);
    }

    private static boolean isBigEnoughForRequestedSize(MediaVariations.Variant variant, ResizeOptions resizeOptions) {
        return variant.getWidth() >= resizeOptions.width && variant.getHeight() >= resizeOptions.height;
    }

    private static boolean isCloserToRequest(MediaVariations.Variant variant, MediaVariations.Variant comparison, ResizeOptions resizeOptions) {
        if (comparison == null) {
            return true;
        }
        return isBigEnoughForRequestedSize(comparison, resizeOptions) ? variant.getWidth() < comparison.getWidth() && isBigEnoughForRequestedSize(variant, resizeOptions) : variant.getWidth() > comparison.getWidth();
    }

    private Continuation<EncodedImage, Void> onFinishDiskReads(final Consumer<EncodedImage> consumer, final ProducerContext producerContext, final boolean useAsLastResult) {
        final String requestId = producerContext.getId();
        final ProducerListener listener = producerContext.getListener();
        return new Continuation<EncodedImage, Void>() { // from class: com.facebook.imagepipeline.producers.MediaVariationsFallbackProducer.2
            @Override // bolts.Continuation
            /* renamed from: then  reason: collision with other method in class */
            public Void mo533then(Task<EncodedImage> task) throws Exception {
                boolean triggerNextProducer = true;
                if (MediaVariationsFallbackProducer.isTaskCancelled(task)) {
                    listener.onProducerFinishWithCancellation(requestId, MediaVariationsFallbackProducer.PRODUCER_NAME, null);
                    consumer.onCancellation();
                    triggerNextProducer = false;
                } else if (task.isFaulted()) {
                    listener.onProducerFinishWithFailure(requestId, MediaVariationsFallbackProducer.PRODUCER_NAME, task.getError(), null);
                    MediaVariationsFallbackProducer.this.startInputProducer(consumer, producerContext);
                    triggerNextProducer = true;
                } else {
                    EncodedImage cachedReference = task.getResult();
                    if (cachedReference != null) {
                        listener.onProducerFinishWithSuccess(requestId, MediaVariationsFallbackProducer.PRODUCER_NAME, MediaVariationsFallbackProducer.getExtraMap(listener, requestId, true, useAsLastResult));
                        if (useAsLastResult) {
                            consumer.onProgressUpdate(1.0f);
                        }
                        consumer.onNewResult(cachedReference, useAsLastResult);
                        cachedReference.close();
                        if (useAsLastResult) {
                            triggerNextProducer = false;
                        }
                    } else {
                        listener.onProducerFinishWithSuccess(requestId, MediaVariationsFallbackProducer.PRODUCER_NAME, MediaVariationsFallbackProducer.getExtraMap(listener, requestId, false, false));
                        triggerNextProducer = true;
                    }
                }
                if (triggerNextProducer) {
                    MediaVariationsFallbackProducer.this.startInputProducer(consumer, producerContext);
                }
                return null;
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startInputProducer(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        this.mInputProducer.produceResults(new MediaVariationsConsumer(consumer, producerContext), producerContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isTaskCancelled(Task<?> task) {
        return task.isCancelled() || (task.isFaulted() && (task.getError() instanceof CancellationException));
    }

    @VisibleForTesting
    static Map<String, String> getExtraMap(ProducerListener listener, String requestId, boolean valueFound, boolean useAsLastResult) {
        if (!listener.requiresExtraMap(requestId)) {
            return null;
        }
        if (valueFound) {
            return ImmutableMap.of("cached_value_found", String.valueOf(true), EXTRA_CACHED_VALUE_USED_AS_LAST, String.valueOf(useAsLastResult));
        }
        return ImmutableMap.of("cached_value_found", String.valueOf(false));
    }

    private void subscribeTaskForRequestCancellation(final AtomicBoolean isCancelled, ProducerContext producerContext) {
        producerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.MediaVariationsFallbackProducer.3
            @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
            public void onCancellationRequested() {
                isCancelled.set(true);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public class MediaVariationsConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private final ProducerContext mProducerContext;

        public MediaVariationsConsumer(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
            super(consumer);
            this.mProducerContext = producerContext;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            if (isLast && newResult != null) {
                storeResultInDatabase(newResult);
            }
            getConsumer().onNewResult(newResult, isLast);
        }

        private void storeResultInDatabase(EncodedImage newResult) {
            ImageRequest imageRequest = this.mProducerContext.getImageRequest();
            MediaVariations mediaVariations = imageRequest.getMediaVariations();
            if (imageRequest.isDiskCacheEnabled() && mediaVariations != null) {
                CacheKey cacheKey = MediaVariationsFallbackProducer.this.mCacheKeyFactory.getEncodedCacheKey(imageRequest, this.mProducerContext.getCallerContext());
                MediaVariationsFallbackProducer.this.mMediaVariationsIndex.saveCachedVariant(mediaVariations.getMediaId(), cacheKey, newResult);
            }
        }
    }
}
