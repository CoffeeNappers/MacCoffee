package com.facebook.imagepipeline.producers;

import android.graphics.Bitmap;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.ExceptionWithNoStacktrace;
import com.facebook.common.util.UriUtil;
import com.facebook.imageformat.ImageFormat;
import com.facebook.imagepipeline.common.ImageDecodeOptions;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.decoder.ImageDecoder;
import com.facebook.imagepipeline.decoder.ProgressiveJpegConfig;
import com.facebook.imagepipeline.decoder.ProgressiveJpegParser;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.CloseableStaticBitmap;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.image.ImmutableQualityInfo;
import com.facebook.imagepipeline.image.QualityInfo;
import com.facebook.imagepipeline.memory.ByteArrayPool;
import com.facebook.imagepipeline.producers.JobScheduler;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class DecodeProducer implements Producer<CloseableReference<CloseableImage>> {
    public static final String ENCODED_IMAGE_SIZE = "encodedImageSize";
    public static final String EXTRA_BITMAP_SIZE = "bitmapSize";
    public static final String EXTRA_HAS_GOOD_QUALITY = "hasGoodQuality";
    public static final String EXTRA_IMAGE_FORMAT_NAME = "imageFormat";
    public static final String EXTRA_IS_FINAL = "isFinal";
    public static final String PRODUCER_NAME = "DecodeProducer";
    public static final String REQUESTED_IMAGE_SIZE = "requestedImageSize";
    public static final String SAMPLE_SIZE = "sampleSize";
    private final ByteArrayPool mByteArrayPool;
    private final boolean mDecodeCancellationEnabled;
    private final boolean mDownsampleEnabled;
    private final boolean mDownsampleEnabledForNetwork;
    private final Executor mExecutor;
    private final ImageDecoder mImageDecoder;
    private final Producer<EncodedImage> mInputProducer;
    private final ProgressiveJpegConfig mProgressiveJpegConfig;

    public DecodeProducer(ByteArrayPool byteArrayPool, Executor executor, ImageDecoder imageDecoder, ProgressiveJpegConfig progressiveJpegConfig, boolean downsampleEnabled, boolean downsampleEnabledForNetwork, boolean decodeCancellationEnabled, Producer<EncodedImage> inputProducer) {
        this.mByteArrayPool = (ByteArrayPool) Preconditions.checkNotNull(byteArrayPool);
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
        this.mImageDecoder = (ImageDecoder) Preconditions.checkNotNull(imageDecoder);
        this.mProgressiveJpegConfig = (ProgressiveJpegConfig) Preconditions.checkNotNull(progressiveJpegConfig);
        this.mDownsampleEnabled = downsampleEnabled;
        this.mDownsampleEnabledForNetwork = downsampleEnabledForNetwork;
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
        this.mDecodeCancellationEnabled = decodeCancellationEnabled;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<CloseableReference<CloseableImage>> consumer, ProducerContext producerContext) {
        ProgressiveDecoder progressiveDecoder;
        ImageRequest imageRequest = producerContext.getImageRequest();
        if (!UriUtil.isNetworkUri(imageRequest.getSourceUri())) {
            progressiveDecoder = new LocalImagesProgressiveDecoder(consumer, producerContext, this.mDecodeCancellationEnabled);
        } else {
            ProgressiveJpegParser jpegParser = new ProgressiveJpegParser(this.mByteArrayPool);
            progressiveDecoder = new NetworkImagesProgressiveDecoder(consumer, producerContext, jpegParser, this.mProgressiveJpegConfig, this.mDecodeCancellationEnabled);
        }
        this.mInputProducer.produceResults(progressiveDecoder, producerContext);
    }

    /* loaded from: classes.dex */
    private abstract class ProgressiveDecoder extends DelegatingConsumer<EncodedImage, CloseableReference<CloseableImage>> {
        private final ImageDecodeOptions mImageDecodeOptions;
        @GuardedBy("this")
        private boolean mIsFinished;
        private final JobScheduler mJobScheduler;
        private final ProducerContext mProducerContext;
        private final ProducerListener mProducerListener;

        protected abstract int getIntermediateImageEndOffset(EncodedImage encodedImage);

        protected abstract QualityInfo getQualityInfo();

        public ProgressiveDecoder(Consumer<CloseableReference<CloseableImage>> consumer, final ProducerContext producerContext, final boolean decodeCancellationEnabled) {
            super(consumer);
            this.mProducerContext = producerContext;
            this.mProducerListener = producerContext.getListener();
            this.mImageDecodeOptions = producerContext.getImageRequest().getImageDecodeOptions();
            this.mIsFinished = false;
            JobScheduler.JobRunnable job = new JobScheduler.JobRunnable() { // from class: com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder.1
                @Override // com.facebook.imagepipeline.producers.JobScheduler.JobRunnable
                public void run(EncodedImage encodedImage, boolean isLast) {
                    if (encodedImage != null) {
                        if (DecodeProducer.this.mDownsampleEnabled) {
                            ImageRequest request = producerContext.getImageRequest();
                            if (DecodeProducer.this.mDownsampleEnabledForNetwork || !UriUtil.isNetworkUri(request.getSourceUri())) {
                                encodedImage.setSampleSize(DownsampleUtil.determineSampleSize(request, encodedImage));
                            }
                        }
                        ProgressiveDecoder.this.doDecode(encodedImage, isLast);
                    }
                }
            };
            this.mJobScheduler = new JobScheduler(DecodeProducer.this.mExecutor, job, this.mImageDecodeOptions.minDecodeIntervalMs);
            this.mProducerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder.2
                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onIsIntermediateResultExpectedChanged() {
                    if (ProgressiveDecoder.this.mProducerContext.isIntermediateResultExpected()) {
                        ProgressiveDecoder.this.mJobScheduler.scheduleJob();
                    }
                }

                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onCancellationRequested() {
                    if (decodeCancellationEnabled) {
                        ProgressiveDecoder.this.handleCancellation();
                    }
                }
            });
        }

        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(EncodedImage newResult, boolean isLast) {
            if (isLast && !EncodedImage.isValid(newResult)) {
                handleError(new ExceptionWithNoStacktrace("Encoded image is not valid."));
            } else if (updateDecodeJob(newResult, isLast)) {
                if (isLast || this.mProducerContext.isIntermediateResultExpected()) {
                    this.mJobScheduler.scheduleJob();
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        public void onProgressUpdateImpl(float progress) {
            super.onProgressUpdateImpl(0.99f * progress);
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        public void onFailureImpl(Throwable t) {
            handleError(t);
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        public void onCancellationImpl() {
            handleCancellation();
        }

        protected boolean updateDecodeJob(EncodedImage ref, boolean isLast) {
            return this.mJobScheduler.updateJob(ref, isLast);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void doDecode(EncodedImage encodedImage, boolean isLast) {
            String imageFormatStr;
            String encodedImageSize;
            String sampleSize;
            String requestedSizeStr;
            long queueTime;
            QualityInfo quality;
            if (!isFinished() && EncodedImage.isValid(encodedImage)) {
                ImageFormat imageFormat = encodedImage.getImageFormat();
                if (imageFormat != null) {
                    imageFormatStr = imageFormat.getName();
                } else {
                    imageFormatStr = "unknown";
                }
                if (encodedImage != null) {
                    encodedImageSize = encodedImage.getWidth() + "x" + encodedImage.getHeight();
                    sampleSize = String.valueOf(encodedImage.getSampleSize());
                } else {
                    encodedImageSize = "unknown";
                    sampleSize = "unknown";
                }
                ResizeOptions resizeOptions = this.mProducerContext.getImageRequest().getResizeOptions();
                if (resizeOptions != null) {
                    requestedSizeStr = resizeOptions.width + "x" + resizeOptions.height;
                } else {
                    requestedSizeStr = "unknown";
                }
                try {
                    queueTime = this.mJobScheduler.getQueuedTime();
                    int length = isLast ? encodedImage.getSize() : getIntermediateImageEndOffset(encodedImage);
                    quality = isLast ? ImmutableQualityInfo.FULL_QUALITY : getQualityInfo();
                    this.mProducerListener.onProducerStart(this.mProducerContext.getId(), DecodeProducer.PRODUCER_NAME);
                    CloseableImage image = DecodeProducer.this.mImageDecoder.decode(encodedImage, length, quality, this.mImageDecodeOptions);
                    Map<String, String> extraMap = getExtraMap(image, queueTime, quality, isLast, imageFormatStr, encodedImageSize, requestedSizeStr, sampleSize);
                    this.mProducerListener.onProducerFinishWithSuccess(this.mProducerContext.getId(), DecodeProducer.PRODUCER_NAME, extraMap);
                    handleResult(image, isLast);
                } catch (Exception e) {
                    Map<String, String> extraMap2 = getExtraMap(null, queueTime, quality, isLast, imageFormatStr, encodedImageSize, requestedSizeStr, sampleSize);
                    this.mProducerListener.onProducerFinishWithFailure(this.mProducerContext.getId(), DecodeProducer.PRODUCER_NAME, e, extraMap2);
                    handleError(e);
                } finally {
                    EncodedImage.closeSafely(encodedImage);
                }
            }
        }

        private Map<String, String> getExtraMap(@Nullable CloseableImage image, long queueTime, QualityInfo quality, boolean isFinal, String imageFormatName, String encodedImageSize, String requestImageSize, String sampleSize) {
            if (!this.mProducerListener.requiresExtraMap(this.mProducerContext.getId())) {
                return null;
            }
            String queueStr = String.valueOf(queueTime);
            String qualityStr = String.valueOf(quality.isOfGoodEnoughQuality());
            String finalStr = String.valueOf(isFinal);
            if (image instanceof CloseableStaticBitmap) {
                Bitmap bitmap = ((CloseableStaticBitmap) image).getUnderlyingBitmap();
                String sizeStr = bitmap.getWidth() + "x" + bitmap.getHeight();
                Map<String, String> tmpMap = new HashMap<>(8);
                tmpMap.put(DecodeProducer.EXTRA_BITMAP_SIZE, sizeStr);
                tmpMap.put("queueTime", queueStr);
                tmpMap.put(DecodeProducer.EXTRA_HAS_GOOD_QUALITY, qualityStr);
                tmpMap.put(DecodeProducer.EXTRA_IS_FINAL, finalStr);
                tmpMap.put(DecodeProducer.ENCODED_IMAGE_SIZE, encodedImageSize);
                tmpMap.put(DecodeProducer.EXTRA_IMAGE_FORMAT_NAME, imageFormatName);
                tmpMap.put(DecodeProducer.REQUESTED_IMAGE_SIZE, requestImageSize);
                tmpMap.put(DecodeProducer.SAMPLE_SIZE, sampleSize);
                return ImmutableMap.copyOf((Map) tmpMap);
            }
            Map<String, String> tmpMap2 = new HashMap<>(7);
            tmpMap2.put("queueTime", queueStr);
            tmpMap2.put(DecodeProducer.EXTRA_HAS_GOOD_QUALITY, qualityStr);
            tmpMap2.put(DecodeProducer.EXTRA_IS_FINAL, finalStr);
            tmpMap2.put(DecodeProducer.ENCODED_IMAGE_SIZE, encodedImageSize);
            tmpMap2.put(DecodeProducer.EXTRA_IMAGE_FORMAT_NAME, imageFormatName);
            tmpMap2.put(DecodeProducer.REQUESTED_IMAGE_SIZE, requestImageSize);
            tmpMap2.put(DecodeProducer.SAMPLE_SIZE, sampleSize);
            return ImmutableMap.copyOf((Map) tmpMap2);
        }

        private synchronized boolean isFinished() {
            return this.mIsFinished;
        }

        private void maybeFinish(boolean shouldFinish) {
            synchronized (this) {
                if (shouldFinish) {
                    if (!this.mIsFinished) {
                        getConsumer().onProgressUpdate(1.0f);
                        this.mIsFinished = true;
                        this.mJobScheduler.clearJob();
                    }
                }
            }
        }

        private void handleResult(CloseableImage decodedImage, boolean isFinal) {
            CloseableReference<CloseableImage> decodedImageRef = CloseableReference.of(decodedImage);
            try {
                maybeFinish(isFinal);
                getConsumer().onNewResult(decodedImageRef, isFinal);
            } finally {
                CloseableReference.closeSafely(decodedImageRef);
            }
        }

        private void handleError(Throwable t) {
            maybeFinish(true);
            getConsumer().onFailure(t);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void handleCancellation() {
            maybeFinish(true);
            getConsumer().onCancellation();
        }
    }

    /* loaded from: classes.dex */
    private class LocalImagesProgressiveDecoder extends ProgressiveDecoder {
        public LocalImagesProgressiveDecoder(Consumer<CloseableReference<CloseableImage>> consumer, ProducerContext producerContext, boolean decodeCancellationEnabled) {
            super(consumer, producerContext, decodeCancellationEnabled);
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected synchronized boolean updateDecodeJob(EncodedImage encodedImage, boolean isLast) {
            return !isLast ? false : super.updateDecodeJob(encodedImage, isLast);
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected int getIntermediateImageEndOffset(EncodedImage encodedImage) {
            return encodedImage.getSize();
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected QualityInfo getQualityInfo() {
            return ImmutableQualityInfo.of(0, false, false);
        }
    }

    /* loaded from: classes.dex */
    private class NetworkImagesProgressiveDecoder extends ProgressiveDecoder {
        private int mLastScheduledScanNumber;
        private final ProgressiveJpegConfig mProgressiveJpegConfig;
        private final ProgressiveJpegParser mProgressiveJpegParser;

        public NetworkImagesProgressiveDecoder(Consumer<CloseableReference<CloseableImage>> consumer, ProducerContext producerContext, ProgressiveJpegParser progressiveJpegParser, ProgressiveJpegConfig progressiveJpegConfig, boolean decodeCancellationEnabled) {
            super(consumer, producerContext, decodeCancellationEnabled);
            this.mProgressiveJpegParser = (ProgressiveJpegParser) Preconditions.checkNotNull(progressiveJpegParser);
            this.mProgressiveJpegConfig = (ProgressiveJpegConfig) Preconditions.checkNotNull(progressiveJpegConfig);
            this.mLastScheduledScanNumber = 0;
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected synchronized boolean updateDecodeJob(EncodedImage encodedImage, boolean isLast) {
            boolean ret;
            ret = super.updateDecodeJob(encodedImage, isLast);
            if (!isLast && EncodedImage.isValid(encodedImage)) {
                if (!this.mProgressiveJpegParser.parseMoreData(encodedImage)) {
                    ret = false;
                } else {
                    int scanNum = this.mProgressiveJpegParser.getBestScanNumber();
                    if (scanNum <= this.mLastScheduledScanNumber || scanNum < this.mProgressiveJpegConfig.getNextScanNumberToDecode(this.mLastScheduledScanNumber)) {
                        ret = false;
                    } else {
                        this.mLastScheduledScanNumber = scanNum;
                    }
                }
            }
            return ret;
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected int getIntermediateImageEndOffset(EncodedImage encodedImage) {
            return this.mProgressiveJpegParser.getBestScanEndOffset();
        }

        @Override // com.facebook.imagepipeline.producers.DecodeProducer.ProgressiveDecoder
        protected QualityInfo getQualityInfo() {
            return this.mProgressiveJpegConfig.getQualityInfo(this.mProgressiveJpegParser.getBestScanNumber());
        }
    }
}
