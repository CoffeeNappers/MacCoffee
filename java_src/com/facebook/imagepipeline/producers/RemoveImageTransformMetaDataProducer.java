package com.facebook.imagepipeline.producers;

import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
/* loaded from: classes.dex */
public class RemoveImageTransformMetaDataProducer implements Producer<CloseableReference<PooledByteBuffer>> {
    private final Producer<EncodedImage> mInputProducer;

    public RemoveImageTransformMetaDataProducer(Producer<EncodedImage> inputProducer) {
        this.mInputProducer = inputProducer;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<CloseableReference<PooledByteBuffer>> consumer, ProducerContext context) {
        this.mInputProducer.produceResults(new RemoveImageTransformMetaDataConsumer(consumer), context);
    }

    /* loaded from: classes.dex */
    private class RemoveImageTransformMetaDataConsumer extends DelegatingConsumer<EncodedImage, CloseableReference<PooledByteBuffer>> {
        private RemoveImageTransformMetaDataConsumer(Consumer<CloseableReference<PooledByteBuffer>> consumer) {
            super(consumer);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            CloseableReference<PooledByteBuffer> ret = null;
            try {
                if (EncodedImage.isValid(newResult)) {
                    ret = newResult.getByteBufferRef();
                }
                getConsumer().onNewResult(ret, isLast);
            } finally {
                CloseableReference.closeSafely(ret);
            }
        }
    }
}
