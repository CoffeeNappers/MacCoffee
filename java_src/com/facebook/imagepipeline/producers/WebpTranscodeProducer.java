package com.facebook.imagepipeline.producers;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.TriState;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imageformat.ImageFormat;
import com.facebook.imageformat.ImageFormatChecker;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.memory.PooledByteBufferOutputStream;
import com.facebook.imagepipeline.nativecode.WebpTranscoder;
import com.facebook.imagepipeline.nativecode.WebpTranscoderFactory;
import java.io.InputStream;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class WebpTranscodeProducer implements Producer<EncodedImage> {
    private static final int DEFAULT_JPEG_QUALITY = 80;
    public static final String PRODUCER_NAME = "WebpTranscodeProducer";
    private final Executor mExecutor;
    private final Producer<EncodedImage> mInputProducer;
    private final PooledByteBufferFactory mPooledByteBufferFactory;

    public WebpTranscodeProducer(Executor executor, PooledByteBufferFactory pooledByteBufferFactory, Producer<EncodedImage> inputProducer) {
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
        this.mPooledByteBufferFactory = (PooledByteBufferFactory) Preconditions.checkNotNull(pooledByteBufferFactory);
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext context) {
        this.mInputProducer.produceResults(new WebpTranscodeConsumer(consumer, context), context);
    }

    /* loaded from: classes.dex */
    private class WebpTranscodeConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private final ProducerContext mContext;
        private TriState mShouldTranscodeWhenFinished;

        public WebpTranscodeConsumer(Consumer<EncodedImage> consumer, ProducerContext context) {
            super(consumer);
            this.mContext = context;
            this.mShouldTranscodeWhenFinished = TriState.UNSET;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(@Nullable EncodedImage newResult, boolean isLast) {
            if (this.mShouldTranscodeWhenFinished == TriState.UNSET && newResult != null) {
                this.mShouldTranscodeWhenFinished = WebpTranscodeProducer.shouldTranscode(newResult);
            }
            if (this.mShouldTranscodeWhenFinished == TriState.NO) {
                getConsumer().onNewResult(newResult, isLast);
            } else if (isLast) {
                if (this.mShouldTranscodeWhenFinished == TriState.YES && newResult != null) {
                    WebpTranscodeProducer.this.transcodeLastResult(newResult, getConsumer(), this.mContext);
                } else {
                    getConsumer().onNewResult(newResult, isLast);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void transcodeLastResult(EncodedImage originalResult, Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        Preconditions.checkNotNull(originalResult);
        final EncodedImage encodedImageCopy = EncodedImage.cloneOrNull(originalResult);
        StatefulProducerRunnable<EncodedImage> runnable = new StatefulProducerRunnable<EncodedImage>(consumer, producerContext.getListener(), PRODUCER_NAME, producerContext.getId()) { // from class: com.facebook.imagepipeline.producers.WebpTranscodeProducer.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.common.executors.StatefulRunnable
            /* renamed from: getResult */
            public EncodedImage mo244getResult() throws Exception {
                PooledByteBufferOutputStream outputStream = WebpTranscodeProducer.this.mPooledByteBufferFactory.mo234newOutputStream();
                try {
                    WebpTranscodeProducer.doTranscode(encodedImageCopy, outputStream);
                    CloseableReference<PooledByteBuffer> ref = CloseableReference.of(outputStream.mo236toByteBuffer());
                    EncodedImage encodedImage = new EncodedImage(ref);
                    encodedImage.copyMetaDataFrom(encodedImageCopy);
                    CloseableReference.closeSafely(ref);
                    return encodedImage;
                } finally {
                    outputStream.close();
                }
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void disposeResult(EncodedImage result) {
                EncodedImage.closeSafely(result);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void onSuccess(EncodedImage result) {
                EncodedImage.closeSafely(encodedImageCopy);
                super.onSuccess((AnonymousClass1) result);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void onFailure(Exception e) {
                EncodedImage.closeSafely(encodedImageCopy);
                super.onFailure(e);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void onCancellation() {
                EncodedImage.closeSafely(encodedImageCopy);
                super.onCancellation();
            }
        };
        this.mExecutor.execute(runnable);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static TriState shouldTranscode(EncodedImage encodedImage) {
        Preconditions.checkNotNull(encodedImage);
        ImageFormat imageFormat = ImageFormatChecker.getImageFormat_WrapIOException(encodedImage.getInputStream());
        if (DefaultImageFormats.isStaticWebpFormat(imageFormat)) {
            WebpTranscoder webpTranscoder = WebpTranscoderFactory.getWebpTranscoder();
            if (webpTranscoder == null) {
                return TriState.NO;
            }
            return TriState.valueOf(!webpTranscoder.isWebpNativelySupported(imageFormat));
        } else if (imageFormat == ImageFormat.UNKNOWN) {
            return TriState.UNSET;
        } else {
            return TriState.NO;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void doTranscode(EncodedImage encodedImage, PooledByteBufferOutputStream outputStream) throws Exception {
        InputStream imageInputStream = encodedImage.getInputStream();
        ImageFormat imageFormat = ImageFormatChecker.getImageFormat_WrapIOException(imageInputStream);
        if (imageFormat == DefaultImageFormats.WEBP_SIMPLE || imageFormat == DefaultImageFormats.WEBP_EXTENDED) {
            WebpTranscoderFactory.getWebpTranscoder().transcodeWebpToJpeg(imageInputStream, outputStream, 80);
        } else if (imageFormat == DefaultImageFormats.WEBP_LOSSLESS || imageFormat == DefaultImageFormats.WEBP_EXTENDED_WITH_ALPHA) {
            WebpTranscoderFactory.getWebpTranscoder().transcodeWebpToPng(imageInputStream, outputStream);
        } else {
            throw new IllegalArgumentException("Wrong image format");
        }
    }
}
