package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v4.view.ViewCompat;
import android.support.v7.graphics.Palette;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.attachpicker.jni.Native;
import com.vk.imageloader.ImageLoaderUtils;
/* loaded from: classes2.dex */
public class BlurPostProcessor extends BasePostprocessor {
    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "BlurPostProcessor";
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap sourceBitmap, PlatformBitmapFactory bitmapFactory) {
        CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap(50, 50);
        try {
            Bitmap destBitmap = bitmapRef.get();
            ImageLoaderUtils.fastResizeBitmap(sourceBitmap, destBitmap);
            Native.blurBitmap(destBitmap, 15);
            Palette palette = Palette.from(destBitmap).generate();
            Canvas canvas = new Canvas(destBitmap);
            Paint paint = new Paint();
            paint.setColor((palette.getDarkMutedColor(-11242343) & ViewCompat.MEASURED_SIZE_MASK) | 1711276032);
            canvas.drawRect(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight(), paint);
            return CloseableReference.cloneOrNull(bitmapRef);
        } finally {
            CloseableReference.closeSafely(bitmapRef);
        }
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CacheKey getPostprocessorCacheKey() {
        return new SimpleCacheKey("BlurPostProcessor");
    }
}
