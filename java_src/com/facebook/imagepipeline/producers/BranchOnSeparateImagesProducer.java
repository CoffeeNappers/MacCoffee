package com.facebook.imagepipeline.producers;

import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
/* loaded from: classes.dex */
public class BranchOnSeparateImagesProducer implements Producer<EncodedImage> {
    private final Producer<EncodedImage> mInputProducer1;
    private final Producer<EncodedImage> mInputProducer2;

    public BranchOnSeparateImagesProducer(Producer<EncodedImage> inputProducer1, Producer<EncodedImage> inputProducer2) {
        this.mInputProducer1 = inputProducer1;
        this.mInputProducer2 = inputProducer2;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext context) {
        OnFirstImageConsumer onFirstImageConsumer = new OnFirstImageConsumer(consumer, context);
        this.mInputProducer1.produceResults(onFirstImageConsumer, context);
    }

    /* loaded from: classes.dex */
    private class OnFirstImageConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private ProducerContext mProducerContext;

        private OnFirstImageConsumer(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
            super(consumer);
            this.mProducerContext = producerContext;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            ImageRequest request = this.mProducerContext.getImageRequest();
            boolean isGoodEnough = ThumbnailSizeChecker.isImageBigEnough(newResult, request.getResizeOptions());
            if (newResult != null && (isGoodEnough || request.getLocalThumbnailPreviewsEnabled())) {
                getConsumer().onNewResult(newResult, isLast && isGoodEnough);
            }
            if (isLast && !isGoodEnough) {
                EncodedImage.closeSafely(newResult);
                BranchOnSeparateImagesProducer.this.mInputProducer2.produceResults(getConsumer(), this.mProducerContext);
            }
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onFailureImpl(Throwable t) {
            BranchOnSeparateImagesProducer.this.mInputProducer2.produceResults(getConsumer(), this.mProducerContext);
        }
    }
}
