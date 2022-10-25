package com.facebook.imagepipeline.platform;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.v4.util.Pools;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.streams.LimitedInputStream;
import com.facebook.common.streams.TailAppendingInputStream;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.BitmapPool;
import com.facebook.imageutils.BitmapUtil;
import java.io.InputStream;
import java.nio.ByteBuffer;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
@TargetApi(21)
/* loaded from: classes.dex */
public class ArtDecoder implements PlatformDecoder {
    private static final int DECODE_BUFFER_SIZE = 16384;
    private static final byte[] EOI_TAIL = {-1, -39};
    private final BitmapPool mBitmapPool;
    @VisibleForTesting
    final Pools.SynchronizedPool<ByteBuffer> mDecodeBuffers;

    public ArtDecoder(BitmapPool bitmapPool, int maxNumThreads, Pools.SynchronizedPool decodeBuffers) {
        this.mBitmapPool = bitmapPool;
        this.mDecodeBuffers = decodeBuffers;
        for (int i = 0; i < maxNumThreads; i++) {
            this.mDecodeBuffers.release(ByteBuffer.allocate(16384));
        }
    }

    @Override // com.facebook.imagepipeline.platform.PlatformDecoder
    public CloseableReference<Bitmap> decodeFromEncodedImage(EncodedImage encodedImage, Bitmap.Config bitmapConfig) {
        BitmapFactory.Options options = getDecodeOptionsForStream(encodedImage, bitmapConfig);
        boolean retryOnFail = options.inPreferredConfig != Bitmap.Config.ARGB_8888;
        try {
            return decodeStaticImageFromStream(encodedImage.getInputStream(), options);
        } catch (RuntimeException re) {
            if (retryOnFail) {
                return decodeFromEncodedImage(encodedImage, Bitmap.Config.ARGB_8888);
            }
            throw re;
        }
    }

    @Override // com.facebook.imagepipeline.platform.PlatformDecoder
    public CloseableReference<Bitmap> decodeJPEGFromEncodedImage(EncodedImage encodedImage, Bitmap.Config bitmapConfig, int length) {
        boolean isJpegComplete = encodedImage.isCompleteAt(length);
        BitmapFactory.Options options = getDecodeOptionsForStream(encodedImage, bitmapConfig);
        InputStream jpegDataStream = encodedImage.getInputStream();
        Preconditions.checkNotNull(jpegDataStream);
        InputStream jpegDataStream2 = encodedImage.getSize() > length ? new LimitedInputStream(jpegDataStream, length) : jpegDataStream;
        InputStream jpegDataStream3 = !isJpegComplete ? new TailAppendingInputStream(jpegDataStream2, EOI_TAIL) : jpegDataStream2;
        boolean retryOnFail = options.inPreferredConfig != Bitmap.Config.ARGB_8888;
        try {
            return decodeStaticImageFromStream(jpegDataStream3, options);
        } catch (RuntimeException re) {
            if (retryOnFail) {
                return decodeFromEncodedImage(encodedImage, Bitmap.Config.ARGB_8888);
            }
            throw re;
        }
    }

    protected CloseableReference<Bitmap> decodeStaticImageFromStream(InputStream inputStream, BitmapFactory.Options options) {
        Preconditions.checkNotNull(inputStream);
        int sizeInBytes = BitmapUtil.getSizeInByteForBitmap(options.outWidth, options.outHeight, options.inPreferredConfig);
        Bitmap bitmapToReuse = this.mBitmapPool.get(sizeInBytes);
        if (bitmapToReuse == null) {
            throw new NullPointerException("BitmapPool.get returned null");
        }
        options.inBitmap = bitmapToReuse;
        ByteBuffer byteBuffer = this.mDecodeBuffers.acquire();
        if (byteBuffer == null) {
            byteBuffer = ByteBuffer.allocate(16384);
        }
        try {
            try {
                options.inTempStorage = byteBuffer.array();
                Bitmap decodedBitmap = BitmapFactory.decodeStream(inputStream, null, options);
                if (bitmapToReuse != decodedBitmap) {
                    this.mBitmapPool.release(bitmapToReuse);
                    decodedBitmap.recycle();
                    throw new IllegalStateException();
                }
                return CloseableReference.of(decodedBitmap, this.mBitmapPool);
            } catch (RuntimeException re) {
                this.mBitmapPool.release(bitmapToReuse);
                throw re;
            }
        } finally {
            this.mDecodeBuffers.release(byteBuffer);
        }
    }

    private static BitmapFactory.Options getDecodeOptionsForStream(EncodedImage encodedImage, Bitmap.Config bitmapConfig) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = encodedImage.getSampleSize();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeStream(encodedImage.getInputStream(), null, options);
        if (options.outWidth == -1 || options.outHeight == -1) {
            throw new IllegalArgumentException();
        }
        options.inJustDecodeBounds = false;
        options.inDither = true;
        options.inPreferredConfig = bitmapConfig;
        options.inMutable = true;
        return options;
    }
}
