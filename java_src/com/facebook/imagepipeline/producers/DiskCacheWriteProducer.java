package com.facebook.imagepipeline.producers;

import com.facebook.imagepipeline.cache.DiskCachePolicy;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
/* loaded from: classes.dex */
public class DiskCacheWriteProducer implements Producer<EncodedImage> {
    private final DiskCachePolicy mDiskCachePolicy;
    private final Producer<EncodedImage> mInputProducer;

    public DiskCacheWriteProducer(Producer<EncodedImage> inputProducer, DiskCachePolicy diskCachePolicy) {
        this.mInputProducer = inputProducer;
        this.mDiskCachePolicy = diskCachePolicy;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        maybeStartInputProducer(consumer, producerContext);
    }

    private void maybeStartInputProducer(Consumer<EncodedImage> consumerOfDiskCacheWriteProducer, ProducerContext producerContext) {
        Consumer<EncodedImage> consumer;
        if (producerContext.getLowestPermittedRequestLevel().getValue() >= ImageRequest.RequestLevel.DISK_CACHE.getValue()) {
            consumerOfDiskCacheWriteProducer.onNewResult(null, true);
            return;
        }
        if (producerContext.getImageRequest().isDiskCacheEnabled()) {
            consumer = new DiskCacheWriteConsumer(consumerOfDiskCacheWriteProducer, producerContext, this.mDiskCachePolicy);
        } else {
            consumer = consumerOfDiskCacheWriteProducer;
        }
        this.mInputProducer.produceResults(consumer, producerContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class DiskCacheWriteConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private final DiskCachePolicy mDiskCachePolicy;
        private final ProducerContext mProducerContext;

        private DiskCacheWriteConsumer(Consumer<EncodedImage> consumer, ProducerContext producerContext, DiskCachePolicy diskCachePolicy) {
            super(consumer);
            this.mProducerContext = producerContext;
            this.mDiskCachePolicy = diskCachePolicy;
        }

        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            if (newResult != null && isLast) {
                this.mDiskCachePolicy.writeToCache(newResult, this.mProducerContext.getImageRequest(), this.mProducerContext.getCallerContext());
            }
            getConsumer().onNewResult(newResult, isLast);
        }
    }
}
