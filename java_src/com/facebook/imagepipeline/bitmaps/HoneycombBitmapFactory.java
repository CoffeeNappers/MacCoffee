package com.facebook.imagepipeline.bitmaps;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import com.facebook.common.references.CloseableReference;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.platform.PlatformDecoder;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
@TargetApi(11)
/* loaded from: classes.dex */
public class HoneycombBitmapFactory extends PlatformBitmapFactory {
    private final EmptyJpegGenerator mJpegGenerator;
    private final PlatformDecoder mPurgeableDecoder;

    public HoneycombBitmapFactory(EmptyJpegGenerator jpegGenerator, PlatformDecoder purgeableDecoder) {
        this.mJpegGenerator = jpegGenerator;
        this.mPurgeableDecoder = purgeableDecoder;
    }

    @Override // com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory
    @TargetApi(12)
    public CloseableReference<Bitmap> createBitmapInternal(int width, int height, Bitmap.Config bitmapConfig) {
        CloseableReference<PooledByteBuffer> jpgRef = this.mJpegGenerator.generate((short) width, (short) height);
        try {
            EncodedImage encodedImage = new EncodedImage(jpgRef);
            encodedImage.setImageFormat(DefaultImageFormats.JPEG);
            CloseableReference<Bitmap> bitmapRef = this.mPurgeableDecoder.decodeJPEGFromEncodedImage(encodedImage, bitmapConfig, jpgRef.get().size());
            bitmapRef.get().setHasAlpha(true);
            bitmapRef.get().eraseColor(0);
            EncodedImage.closeSafely(encodedImage);
            return bitmapRef;
        } finally {
            jpgRef.close();
        }
    }
}
