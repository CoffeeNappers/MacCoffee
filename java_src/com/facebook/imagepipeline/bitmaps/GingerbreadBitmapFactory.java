package com.facebook.imagepipeline.bitmaps;

import android.graphics.Bitmap;
import com.facebook.common.references.CloseableReference;
/* loaded from: classes.dex */
public class GingerbreadBitmapFactory extends PlatformBitmapFactory {
    @Override // com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory
    public CloseableReference<Bitmap> createBitmapInternal(int width, int height, Bitmap.Config bitmapConfig) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, bitmapConfig);
        return CloseableReference.of(bitmap, SimpleBitmapReleaser.getInstance());
    }
}
