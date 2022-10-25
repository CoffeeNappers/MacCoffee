package com.facebook.imagepipeline.producers;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.logging.FLog;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
/* loaded from: classes.dex */
public class DownsampleUtil {
    private static final int DEFAULT_SAMPLE_SIZE = 1;
    private static final float INTERVAL_ROUNDING = 0.33333334f;

    private DownsampleUtil() {
    }

    public static int determineSampleSize(ImageRequest imageRequest, EncodedImage encodedImage) {
        int sampleSize;
        if (!EncodedImage.isMetaDataAvailable(encodedImage)) {
            return 1;
        }
        float ratio = determineDownsampleRatio(imageRequest, encodedImage);
        if (encodedImage.getImageFormat() == DefaultImageFormats.JPEG) {
            sampleSize = ratioToSampleSizeJPEG(ratio);
        } else {
            sampleSize = ratioToSampleSize(ratio);
        }
        int maxDimension = Math.max(encodedImage.getHeight(), encodedImage.getWidth());
        ResizeOptions resizeOptions = imageRequest.getResizeOptions();
        float maxBitmapSize = resizeOptions != null ? resizeOptions.maxBitmapSize : 2048.0f;
        while (maxDimension / sampleSize > maxBitmapSize) {
            if (encodedImage.getImageFormat() == DefaultImageFormats.JPEG) {
                sampleSize *= 2;
            } else {
                sampleSize++;
            }
        }
        return sampleSize;
    }

    @VisibleForTesting
    static float determineDownsampleRatio(ImageRequest imageRequest, EncodedImage encodedImage) {
        Preconditions.checkArgument(EncodedImage.isMetaDataAvailable(encodedImage));
        ResizeOptions resizeOptions = imageRequest.getResizeOptions();
        if (resizeOptions == null || resizeOptions.height <= 0 || resizeOptions.width <= 0 || encodedImage.getWidth() == 0 || encodedImage.getHeight() == 0) {
            return 1.0f;
        }
        int rotationAngle = getRotationAngle(imageRequest, encodedImage);
        boolean swapDimensions = rotationAngle == 90 || rotationAngle == 270;
        int widthAfterRotation = swapDimensions ? encodedImage.getHeight() : encodedImage.getWidth();
        int heightAfterRotation = swapDimensions ? encodedImage.getWidth() : encodedImage.getHeight();
        float widthRatio = resizeOptions.width / widthAfterRotation;
        float heightRatio = resizeOptions.height / heightAfterRotation;
        float ratio = Math.max(widthRatio, heightRatio);
        FLog.v("DownsampleUtil", "Downsample - Specified size: %dx%d, image size: %dx%d ratio: %.1f x %.1f, ratio: %.3f for %s", Integer.valueOf(resizeOptions.width), Integer.valueOf(resizeOptions.height), Integer.valueOf(widthAfterRotation), Integer.valueOf(heightAfterRotation), Float.valueOf(widthRatio), Float.valueOf(heightRatio), Float.valueOf(ratio), imageRequest.getSourceUri().toString());
        return ratio;
    }

    @VisibleForTesting
    static int ratioToSampleSize(float ratio) {
        if (ratio > 0.6666667f) {
            return 1;
        }
        int sampleSize = 2;
        while (true) {
            double intervalLength = 1.0d / (Math.pow(sampleSize, 2.0d) - sampleSize);
            double compare = (1.0d / sampleSize) + (0.3333333432674408d * intervalLength);
            if (compare <= ratio) {
                return sampleSize - 1;
            }
            sampleSize++;
        }
    }

    @VisibleForTesting
    static int ratioToSampleSizeJPEG(float ratio) {
        if (ratio > 0.6666667f) {
            return 1;
        }
        int sampleSize = 2;
        while (true) {
            double intervalLength = 1.0d / (sampleSize * 2);
            double compare = (1.0d / (sampleSize * 2)) + (0.3333333432674408d * intervalLength);
            if (compare <= ratio) {
                return sampleSize;
            }
            sampleSize *= 2;
        }
    }

    private static int getRotationAngle(ImageRequest imageRequest, EncodedImage encodedImage) {
        boolean z = false;
        if (!imageRequest.getRotationOptions().useImageMetadata()) {
            return 0;
        }
        int rotationAngle = encodedImage.getRotationAngle();
        if (rotationAngle == 0 || rotationAngle == 90 || rotationAngle == 180 || rotationAngle == 270) {
            z = true;
        }
        Preconditions.checkArgument(z);
        return rotationAngle;
    }

    @VisibleForTesting
    static int roundToPowerOfTwo(int sampleSize) {
        int compare = 1;
        while (compare < sampleSize) {
            compare *= 2;
        }
        return compare;
    }
}
