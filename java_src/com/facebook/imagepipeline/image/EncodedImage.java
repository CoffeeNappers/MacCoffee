package com.facebook.imagepipeline.image;

import android.util.Pair;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.references.SharedReference;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imageformat.ImageFormat;
import com.facebook.imageformat.ImageFormatChecker;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferInputStream;
import com.facebook.imageutils.BitmapUtil;
import com.facebook.imageutils.JfifUtil;
import com.facebook.imageutils.WebpUtil;
import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
@Immutable
/* loaded from: classes.dex */
public class EncodedImage implements Closeable {
    public static final int DEFAULT_SAMPLE_SIZE = 1;
    public static final int UNKNOWN_HEIGHT = -1;
    public static final int UNKNOWN_ROTATION_ANGLE = -1;
    public static final int UNKNOWN_STREAM_SIZE = -1;
    public static final int UNKNOWN_WIDTH = -1;
    @Nullable
    private CacheKey mEncodedCacheKey;
    private int mHeight;
    private ImageFormat mImageFormat;
    @Nullable
    private final Supplier<FileInputStream> mInputStreamSupplier;
    @Nullable
    private final CloseableReference<PooledByteBuffer> mPooledByteBufferRef;
    private int mRotationAngle;
    private int mSampleSize;
    private int mStreamSize;
    private int mWidth;

    public EncodedImage(CloseableReference<PooledByteBuffer> pooledByteBufferRef) {
        this.mImageFormat = ImageFormat.UNKNOWN;
        this.mRotationAngle = -1;
        this.mWidth = -1;
        this.mHeight = -1;
        this.mSampleSize = 1;
        this.mStreamSize = -1;
        Preconditions.checkArgument(CloseableReference.isValid(pooledByteBufferRef));
        this.mPooledByteBufferRef = pooledByteBufferRef.m198clone();
        this.mInputStreamSupplier = null;
    }

    public EncodedImage(Supplier<FileInputStream> inputStreamSupplier) {
        this.mImageFormat = ImageFormat.UNKNOWN;
        this.mRotationAngle = -1;
        this.mWidth = -1;
        this.mHeight = -1;
        this.mSampleSize = 1;
        this.mStreamSize = -1;
        Preconditions.checkNotNull(inputStreamSupplier);
        this.mPooledByteBufferRef = null;
        this.mInputStreamSupplier = inputStreamSupplier;
    }

    public EncodedImage(Supplier<FileInputStream> inputStreamSupplier, int streamSize) {
        this(inputStreamSupplier);
        this.mStreamSize = streamSize;
    }

    public static EncodedImage cloneOrNull(EncodedImage encodedImage) {
        if (encodedImage != null) {
            return encodedImage.cloneOrNull();
        }
        return null;
    }

    public EncodedImage cloneOrNull() {
        EncodedImage encodedImage;
        if (this.mInputStreamSupplier != null) {
            encodedImage = new EncodedImage(this.mInputStreamSupplier, this.mStreamSize);
        } else {
            CloseableReference<PooledByteBuffer> pooledByteBufferRef = CloseableReference.cloneOrNull(this.mPooledByteBufferRef);
            if (pooledByteBufferRef == null) {
                encodedImage = null;
            } else {
                try {
                    encodedImage = new EncodedImage(pooledByteBufferRef);
                } finally {
                    CloseableReference.closeSafely(pooledByteBufferRef);
                }
            }
        }
        if (encodedImage != null) {
            encodedImage.copyMetaDataFrom(this);
        }
        return encodedImage;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        CloseableReference.closeSafely(this.mPooledByteBufferRef);
    }

    public synchronized boolean isValid() {
        boolean z;
        if (!CloseableReference.isValid(this.mPooledByteBufferRef)) {
            if (this.mInputStreamSupplier == null) {
                z = false;
            }
        }
        z = true;
        return z;
    }

    public CloseableReference<PooledByteBuffer> getByteBufferRef() {
        return CloseableReference.cloneOrNull(this.mPooledByteBufferRef);
    }

    public InputStream getInputStream() {
        if (this.mInputStreamSupplier != null) {
            return this.mInputStreamSupplier.mo486get();
        }
        CloseableReference<PooledByteBuffer> pooledByteBufferRef = CloseableReference.cloneOrNull(this.mPooledByteBufferRef);
        if (pooledByteBufferRef != null) {
            try {
                return new PooledByteBufferInputStream(pooledByteBufferRef.get());
            } finally {
                CloseableReference.closeSafely(pooledByteBufferRef);
            }
        }
        return null;
    }

    public void setImageFormat(ImageFormat imageFormat) {
        this.mImageFormat = imageFormat;
    }

    public void setHeight(int height) {
        this.mHeight = height;
    }

    public void setWidth(int width) {
        this.mWidth = width;
    }

    public void setRotationAngle(int rotationAngle) {
        this.mRotationAngle = rotationAngle;
    }

    public void setSampleSize(int sampleSize) {
        this.mSampleSize = sampleSize;
    }

    public void setStreamSize(int streamSize) {
        this.mStreamSize = streamSize;
    }

    public void setEncodedCacheKey(@Nullable CacheKey encodedCacheKey) {
        this.mEncodedCacheKey = encodedCacheKey;
    }

    public ImageFormat getImageFormat() {
        return this.mImageFormat;
    }

    public int getRotationAngle() {
        return this.mRotationAngle;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getSampleSize() {
        return this.mSampleSize;
    }

    @Nullable
    public CacheKey getEncodedCacheKey() {
        return this.mEncodedCacheKey;
    }

    public boolean isCompleteAt(int length) {
        if (this.mImageFormat == DefaultImageFormats.JPEG && this.mInputStreamSupplier == null) {
            Preconditions.checkNotNull(this.mPooledByteBufferRef);
            PooledByteBuffer buf = this.mPooledByteBufferRef.get();
            return buf.read(length + (-2)) == -1 && buf.read(length + (-1)) == -39;
        }
        return true;
    }

    public int getSize() {
        return (this.mPooledByteBufferRef == null || this.mPooledByteBufferRef.get() == null) ? this.mStreamSize : this.mPooledByteBufferRef.get().size();
    }

    public void parseMetaData() {
        Pair<Integer, Integer> dimensions;
        ImageFormat imageFormat = ImageFormatChecker.getImageFormat_WrapIOException(getInputStream());
        this.mImageFormat = imageFormat;
        if (DefaultImageFormats.isWebpFormat(imageFormat)) {
            dimensions = readWebPImageSize();
        } else {
            dimensions = readImageSize();
        }
        if (imageFormat == DefaultImageFormats.JPEG && this.mRotationAngle == -1) {
            if (dimensions != null) {
                this.mRotationAngle = JfifUtil.getAutoRotateAngleFromOrientation(JfifUtil.getOrientation(getInputStream()));
                return;
            }
            return;
        }
        this.mRotationAngle = 0;
    }

    private Pair<Integer, Integer> readWebPImageSize() {
        Pair<Integer, Integer> dimensions = WebpUtil.getSize(getInputStream());
        if (dimensions != null) {
            this.mWidth = ((Integer) dimensions.first).intValue();
            this.mHeight = ((Integer) dimensions.second).intValue();
        }
        return dimensions;
    }

    private Pair<Integer, Integer> readImageSize() {
        InputStream inputStream = null;
        try {
            inputStream = getInputStream();
            Pair<Integer, Integer> dimensions = BitmapUtil.decodeDimensions(inputStream);
            if (dimensions != null) {
                this.mWidth = ((Integer) dimensions.first).intValue();
                this.mHeight = ((Integer) dimensions.second).intValue();
            }
            return dimensions;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            }
        }
    }

    public void copyMetaDataFrom(EncodedImage encodedImage) {
        this.mImageFormat = encodedImage.getImageFormat();
        this.mWidth = encodedImage.getWidth();
        this.mHeight = encodedImage.getHeight();
        this.mRotationAngle = encodedImage.getRotationAngle();
        this.mSampleSize = encodedImage.getSampleSize();
        this.mStreamSize = encodedImage.getSize();
        this.mEncodedCacheKey = encodedImage.getEncodedCacheKey();
    }

    public static boolean isMetaDataAvailable(EncodedImage encodedImage) {
        return encodedImage.mRotationAngle >= 0 && encodedImage.mWidth >= 0 && encodedImage.mHeight >= 0;
    }

    public static void closeSafely(@Nullable EncodedImage encodedImage) {
        if (encodedImage != null) {
            encodedImage.close();
        }
    }

    public static boolean isValid(@Nullable EncodedImage encodedImage) {
        return encodedImage != null && encodedImage.isValid();
    }

    @VisibleForTesting
    public synchronized SharedReference<PooledByteBuffer> getUnderlyingReferenceTestOnly() {
        return this.mPooledByteBufferRef != null ? this.mPooledByteBufferRef.getUnderlyingReferenceTestOnly() : null;
    }
}
