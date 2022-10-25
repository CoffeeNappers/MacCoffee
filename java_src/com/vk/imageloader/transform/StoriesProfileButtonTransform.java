package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.attachpicker.jni.Native;
import com.vk.imageloader.ImageLoaderUtils;
import com.vk.imageloader.view.VKStickerImageView;
/* loaded from: classes2.dex */
public class StoriesProfileButtonTransform extends BasePostprocessor {
    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "StoriesProfileButtonTransform";
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap sourceBitmap, PlatformBitmapFactory bitmapFactory) {
        CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap(50, 50);
        try {
            Bitmap destBitmap = bitmapRef.get();
            ImageLoaderUtils.fastResizeBitmap(sourceBitmap, destBitmap);
            Native.blurBitmap(destBitmap, 5);
            Canvas canvas = new Canvas(destBitmap);
            Paint paint = new Paint();
            paint.setColor(VKStickerImageView.OVERLAY_COLOR);
            canvas.drawRect(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight(), paint);
            return CloseableReference.cloneOrNull(bitmapRef);
        } finally {
            CloseableReference.closeSafely(bitmapRef);
        }
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CacheKey getPostprocessorCacheKey() {
        return new SimpleCacheKey("StoriesProfileButtonTransform");
    }
}
