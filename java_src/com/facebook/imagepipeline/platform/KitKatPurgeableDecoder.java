package com.facebook.imagepipeline.platform;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.FlexByteArrayPool;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
@TargetApi(19)
/* loaded from: classes.dex */
public class KitKatPurgeableDecoder extends DalvikPurgeableDecoder {
    private final FlexByteArrayPool mFlexByteArrayPool;

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder, com.facebook.imagepipeline.platform.PlatformDecoder
    public /* bridge */ /* synthetic */ CloseableReference decodeFromEncodedImage(EncodedImage encodedImage, Bitmap.Config config) {
        return super.decodeFromEncodedImage(encodedImage, config);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder, com.facebook.imagepipeline.platform.PlatformDecoder
    public /* bridge */ /* synthetic */ CloseableReference decodeJPEGFromEncodedImage(EncodedImage encodedImage, Bitmap.Config config, int i) {
        return super.decodeJPEGFromEncodedImage(encodedImage, config, i);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    public /* bridge */ /* synthetic */ CloseableReference pinBitmap(Bitmap bitmap) {
        return super.pinBitmap(bitmap);
    }

    public KitKatPurgeableDecoder(FlexByteArrayPool flexByteArrayPool) {
        this.mFlexByteArrayPool = flexByteArrayPool;
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    protected Bitmap decodeByteArrayAsPurgeable(CloseableReference<PooledByteBuffer> bytesRef, BitmapFactory.Options options) {
        PooledByteBuffer pooledByteBuffer = bytesRef.get();
        int length = pooledByteBuffer.size();
        CloseableReference<byte[]> encodedBytesArrayRef = this.mFlexByteArrayPool.get(length);
        try {
            byte[] encodedBytesArray = encodedBytesArrayRef.get();
            pooledByteBuffer.read(0, encodedBytesArray, 0, length);
            Bitmap bitmap = BitmapFactory.decodeByteArray(encodedBytesArray, 0, length, options);
            return (Bitmap) Preconditions.checkNotNull(bitmap, "BitmapFactory returned null");
        } finally {
            CloseableReference.closeSafely((CloseableReference<?>) encodedBytesArrayRef);
        }
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    protected Bitmap decodeJPEGByteArrayAsPurgeable(CloseableReference<PooledByteBuffer> bytesRef, int length, BitmapFactory.Options options) {
        boolean z = false;
        byte[] suffix = endsWithEOI(bytesRef, length) ? null : EOI;
        PooledByteBuffer pooledByteBuffer = bytesRef.get();
        if (length <= pooledByteBuffer.size()) {
            z = true;
        }
        Preconditions.checkArgument(z);
        CloseableReference<byte[]> encodedBytesArrayRef = this.mFlexByteArrayPool.get(length + 2);
        try {
            byte[] encodedBytesArray = encodedBytesArrayRef.get();
            pooledByteBuffer.read(0, encodedBytesArray, 0, length);
            if (suffix != null) {
                putEOI(encodedBytesArray, length);
                length += 2;
            }
            Bitmap bitmap = BitmapFactory.decodeByteArray(encodedBytesArray, 0, length, options);
            return (Bitmap) Preconditions.checkNotNull(bitmap, "BitmapFactory returned null");
        } finally {
            CloseableReference.closeSafely((CloseableReference<?>) encodedBytesArrayRef);
        }
    }

    private static void putEOI(byte[] imageBytes, int offset) {
        imageBytes[offset] = -1;
        imageBytes[offset + 1] = -39;
    }
}
