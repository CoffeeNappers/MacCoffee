package com.facebook.imagepipeline.nativecode;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import com.facebook.common.internal.DoNotStrip;
import com.facebook.common.internal.Preconditions;
import com.facebook.imageutils.BitmapUtil;
import java.nio.ByteBuffer;
@DoNotStrip
/* loaded from: classes.dex */
public class Bitmaps {
    @DoNotStrip
    private static native void nativeCopyBitmap(Bitmap bitmap, int i, Bitmap bitmap2, int i2, int i3);

    @DoNotStrip
    private static native ByteBuffer nativeGetByteBuffer(Bitmap bitmap, long j, long j2);

    @DoNotStrip
    private static native void nativePinBitmap(Bitmap bitmap);

    @DoNotStrip
    private static native void nativeReleaseByteBuffer(Bitmap bitmap);

    static {
        ImagePipelineNativeLoader.load();
    }

    public static void pinBitmap(Bitmap bitmap) {
        Preconditions.checkNotNull(bitmap);
        nativePinBitmap(bitmap);
    }

    public static ByteBuffer getByteBuffer(Bitmap bitmap, long start, long size) {
        Preconditions.checkNotNull(bitmap);
        return nativeGetByteBuffer(bitmap, start, size);
    }

    public static void releaseByteBuffer(Bitmap bitmap) {
        Preconditions.checkNotNull(bitmap);
        nativeReleaseByteBuffer(bitmap);
    }

    public static void copyBitmap(Bitmap dest, Bitmap src) {
        boolean z = true;
        Preconditions.checkArgument(src.getConfig() == dest.getConfig());
        Preconditions.checkArgument(dest.isMutable());
        Preconditions.checkArgument(dest.getWidth() == src.getWidth());
        if (dest.getHeight() != src.getHeight()) {
            z = false;
        }
        Preconditions.checkArgument(z);
        nativeCopyBitmap(dest, dest.getRowBytes(), src, src.getRowBytes(), dest.getHeight());
    }

    @TargetApi(19)
    public static void reconfigureBitmap(Bitmap bitmap, int width, int height, Bitmap.Config bitmapConfig) {
        Preconditions.checkArgument(bitmap.getAllocationByteCount() >= (width * height) * BitmapUtil.getPixelSizeForBitmapConfig(bitmapConfig));
        bitmap.reconfigure(width, height, bitmapConfig);
    }
}
