package com.facebook.imagepipeline.producers;

import com.facebook.common.internal.Closeables;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.TriState;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imageformat.ImageFormat;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.memory.PooledByteBufferOutputStream;
import com.facebook.imagepipeline.nativecode.JpegTranscoder;
import com.facebook.imagepipeline.producers.JobScheduler;
import com.facebook.imagepipeline.request.ImageRequest;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class ResizeAndRotateProducer implements Producer<EncodedImage> {
    @VisibleForTesting
    static final int DEFAULT_JPEG_QUALITY = 85;
    private static final String DOWNSAMPLE_ENUMERATOR_KEY = "downsampleEnumerator";
    private static final String FRACTION_KEY = "Fraction";
    private static final int FULL_ROUND = 360;
    @VisibleForTesting
    static final int MAX_JPEG_SCALE_NUMERATOR = 8;
    @VisibleForTesting
    static final int MIN_TRANSFORM_INTERVAL_MS = 100;
    private static final String ORIGINAL_SIZE_KEY = "Original size";
    public static final String PRODUCER_NAME = "ResizeAndRotateProducer";
    private static final String REQUESTED_SIZE_KEY = "Requested size";
    private static final String ROTATION_ANGLE_KEY = "rotationAngle";
    private static final String SOFTWARE_ENUMERATOR_KEY = "softwareEnumerator";
    private final Executor mExecutor;
    private final Producer<EncodedImage> mInputProducer;
    private final PooledByteBufferFactory mPooledByteBufferFactory;
    private final boolean mResizingEnabled;
    private final boolean mUseDownsamplingRatio;

    public ResizeAndRotateProducer(Executor executor, PooledByteBufferFactory pooledByteBufferFactory, boolean resizingEnabled, Producer<EncodedImage> inputProducer, boolean useDownsamplingRatio) {
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
        this.mPooledByteBufferFactory = (PooledByteBufferFactory) Preconditions.checkNotNull(pooledByteBufferFactory);
        this.mResizingEnabled = resizingEnabled;
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
        this.mUseDownsamplingRatio = useDownsamplingRatio;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext context) {
        this.mInputProducer.produceResults(new TransformingConsumer(consumer, context), context);
    }

    /* loaded from: classes.dex */
    private class TransformingConsumer extends DelegatingConsumer<EncodedImage, EncodedImage> {
        private boolean mIsCancelled;
        private final JobScheduler mJobScheduler;
        private final ProducerContext mProducerContext;

        public TransformingConsumer(final Consumer<EncodedImage> consumer, ProducerContext producerContext) {
            super(consumer);
            this.mIsCancelled = false;
            this.mProducerContext = producerContext;
            JobScheduler.JobRunnable job = new JobScheduler.JobRunnable() { // from class: com.facebook.imagepipeline.producers.ResizeAndRotateProducer.TransformingConsumer.1
                @Override // com.facebook.imagepipeline.producers.JobScheduler.JobRunnable
                public void run(EncodedImage encodedImage, boolean isLast) {
                    TransformingConsumer.this.doTransform(encodedImage, isLast);
                }
            };
            this.mJobScheduler = new JobScheduler(ResizeAndRotateProducer.this.mExecutor, job, 100);
            this.mProducerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.ResizeAndRotateProducer.TransformingConsumer.2
                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onIsIntermediateResultExpectedChanged() {
                    if (TransformingConsumer.this.mProducerContext.isIntermediateResultExpected()) {
                        TransformingConsumer.this.mJobScheduler.scheduleJob();
                    }
                }

                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onCancellationRequested() {
                    TransformingConsumer.this.mJobScheduler.clearJob();
                    TransformingConsumer.this.mIsCancelled = true;
                    consumer.onCancellation();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(@Nullable EncodedImage newResult, boolean isLast) {
            if (!this.mIsCancelled) {
                if (newResult != null) {
                    TriState shouldTransform = ResizeAndRotateProducer.shouldTransform(this.mProducerContext.getImageRequest(), newResult, ResizeAndRotateProducer.this.mResizingEnabled);
                    if (isLast || shouldTransform != TriState.UNSET) {
                        if (shouldTransform != TriState.YES) {
                            getConsumer().onNewResult(newResult, isLast);
                        } else if (this.mJobScheduler.updateJob(newResult, isLast)) {
                            if (isLast || this.mProducerContext.isIntermediateResultExpected()) {
                                this.mJobScheduler.scheduleJob();
                            }
                        }
                    }
                } else if (isLast) {
                    getConsumer().onNewResult(null, true);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void doTransform(EncodedImage encodedImage, boolean isLast) {
            CloseableReference<PooledByteBuffer> ref;
            EncodedImage ret;
            this.mProducerContext.getListener().onProducerStart(this.mProducerContext.getId(), ResizeAndRotateProducer.PRODUCER_NAME);
            ImageRequest imageRequest = this.mProducerContext.getImageRequest();
            PooledByteBufferOutputStream outputStream = ResizeAndRotateProducer.this.mPooledByteBufferFactory.mo234newOutputStream();
            Map<String, String> extraMap = null;
            InputStream is = null;
            try {
                try {
                    int softwareNumerator = ResizeAndRotateProducer.getSoftwareNumerator(imageRequest, encodedImage, ResizeAndRotateProducer.this.mResizingEnabled);
                    int downsampleRatio = DownsampleUtil.determineSampleSize(imageRequest, encodedImage);
                    int downsampleNumerator = ResizeAndRotateProducer.calculateDownsampleNumerator(downsampleRatio);
                    int numerator = ResizeAndRotateProducer.this.mUseDownsamplingRatio ? downsampleNumerator : softwareNumerator;
                    int rotationAngle = ResizeAndRotateProducer.getRotationAngle(imageRequest.getRotationOptions(), encodedImage);
                    extraMap = getExtraMap(encodedImage, imageRequest, numerator, downsampleNumerator, softwareNumerator, rotationAngle);
                    is = encodedImage.getInputStream();
                    JpegTranscoder.transcodeJpeg(is, outputStream, rotationAngle, numerator, 85);
                    ref = CloseableReference.of(outputStream.mo236toByteBuffer());
                    try {
                        ret = new EncodedImage(ref);
                    } catch (Throwable th) {
                        th = th;
                    }
                } catch (Exception e) {
                    e = e;
                }
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                ret.setImageFormat(DefaultImageFormats.JPEG);
                ret.parseMetaData();
                this.mProducerContext.getListener().onProducerFinishWithSuccess(this.mProducerContext.getId(), ResizeAndRotateProducer.PRODUCER_NAME, extraMap);
                getConsumer().onNewResult(ret, isLast);
                EncodedImage.closeSafely(ret);
                try {
                    CloseableReference.closeSafely(ref);
                    Closeables.closeQuietly(is);
                    outputStream.close();
                } catch (Exception e2) {
                    e = e2;
                    this.mProducerContext.getListener().onProducerFinishWithFailure(this.mProducerContext.getId(), ResizeAndRotateProducer.PRODUCER_NAME, e, extraMap);
                    getConsumer().onFailure(e);
                    Closeables.closeQuietly(is);
                    outputStream.close();
                } catch (Throwable th3) {
                    th = th3;
                    Closeables.closeQuietly(is);
                    outputStream.close();
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
                CloseableReference.closeSafely(ref);
                throw th;
            }
        }

        private Map<String, String> getExtraMap(EncodedImage encodedImage, ImageRequest imageRequest, int numerator, int downsampleNumerator, int softwareNumerator, int rotationAngle) {
            String requestedSize;
            if (!this.mProducerContext.getListener().requiresExtraMap(this.mProducerContext.getId())) {
                return null;
            }
            String originalSize = encodedImage.getWidth() + "x" + encodedImage.getHeight();
            if (imageRequest.getResizeOptions() != null) {
                requestedSize = imageRequest.getResizeOptions().width + "x" + imageRequest.getResizeOptions().height;
            } else {
                requestedSize = "Unspecified";
            }
            String fraction = numerator > 0 ? numerator + "/8" : "";
            Map<String, String> map = new HashMap<>();
            map.put(ResizeAndRotateProducer.ORIGINAL_SIZE_KEY, originalSize);
            map.put(ResizeAndRotateProducer.REQUESTED_SIZE_KEY, requestedSize);
            map.put(ResizeAndRotateProducer.FRACTION_KEY, fraction);
            map.put("queueTime", String.valueOf(this.mJobScheduler.getQueuedTime()));
            map.put(ResizeAndRotateProducer.DOWNSAMPLE_ENUMERATOR_KEY, Integer.toString(downsampleNumerator));
            map.put(ResizeAndRotateProducer.SOFTWARE_ENUMERATOR_KEY, Integer.toString(softwareNumerator));
            map.put(ResizeAndRotateProducer.ROTATION_ANGLE_KEY, Integer.toString(rotationAngle));
            return ImmutableMap.copyOf((Map) map);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static TriState shouldTransform(ImageRequest request, EncodedImage encodedImage, boolean resizingEnabled) {
        if (encodedImage == null || encodedImage.getImageFormat() == ImageFormat.UNKNOWN) {
            return TriState.UNSET;
        }
        if (encodedImage.getImageFormat() != DefaultImageFormats.JPEG) {
            return TriState.NO;
        }
        return TriState.valueOf(shouldRotate(request.getRotationOptions(), encodedImage) || shouldResize(getSoftwareNumerator(request, encodedImage, resizingEnabled)));
    }

    @VisibleForTesting
    static float determineResizeRatio(ResizeOptions resizeOptions, int width, int height) {
        if (resizeOptions == null) {
            return 1.0f;
        }
        float widthRatio = resizeOptions.width / width;
        float heightRatio = resizeOptions.height / height;
        float ratio = Math.max(widthRatio, heightRatio);
        if (width * ratio > resizeOptions.maxBitmapSize) {
            ratio = resizeOptions.maxBitmapSize / width;
        }
        if (height * ratio > resizeOptions.maxBitmapSize) {
            return resizeOptions.maxBitmapSize / height;
        }
        return ratio;
    }

    @VisibleForTesting
    static int roundNumerator(float maxRatio, float roundUpFraction) {
        return (int) ((8.0f * maxRatio) + roundUpFraction);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getSoftwareNumerator(ImageRequest imageRequest, EncodedImage encodedImage, boolean resizingEnabled) {
        ResizeOptions resizeOptions;
        if (resizingEnabled && (resizeOptions = imageRequest.getResizeOptions()) != null) {
            int rotationAngle = getRotationAngle(imageRequest.getRotationOptions(), encodedImage);
            boolean swapDimensions = rotationAngle == 90 || rotationAngle == 270;
            int widthAfterRotation = swapDimensions ? encodedImage.getHeight() : encodedImage.getWidth();
            int heightAfterRotation = swapDimensions ? encodedImage.getWidth() : encodedImage.getHeight();
            float ratio = determineResizeRatio(resizeOptions, widthAfterRotation, heightAfterRotation);
            int numerator = roundNumerator(ratio, resizeOptions.roundUpFraction);
            if (numerator > 8) {
                return 8;
            }
            if (numerator >= 1) {
                return numerator;
            }
            return 1;
        }
        return 8;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getRotationAngle(RotationOptions rotationOptions, EncodedImage encodedImage) {
        if (!rotationOptions.rotationEnabled()) {
            return 0;
        }
        int rotationFromMetadata = extractOrientationFromMetadata(encodedImage);
        return !rotationOptions.useImageMetadata() ? (rotationOptions.getForcedAngle() + rotationFromMetadata) % 360 : rotationFromMetadata;
    }

    private static int extractOrientationFromMetadata(EncodedImage encodedImage) {
        switch (encodedImage.getRotationAngle()) {
            case 90:
            case RotationOptions.ROTATE_180 /* 180 */:
            case RotationOptions.ROTATE_270 /* 270 */:
                return encodedImage.getRotationAngle();
            default:
                return 0;
        }
    }

    private static boolean shouldResize(int numerator) {
        return numerator < 8;
    }

    private static boolean shouldRotate(RotationOptions rotationOptions, EncodedImage encodedImage) {
        return !rotationOptions.canDeferUntilRendered() && getRotationAngle(rotationOptions, encodedImage) != 0;
    }

    @VisibleForTesting
    static int calculateDownsampleNumerator(int downsampleRatio) {
        return Math.max(1, 8 / downsampleRatio);
    }
}
