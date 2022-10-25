package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.attachpicker.jni.Native;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.imageloader.ImageLoaderUtils;
/* loaded from: classes2.dex */
public class StoryPreviewPostProcessor extends BasePostprocessor {
    private final int radius;
    public static final StoryPreviewPostProcessor INSTANCE_5 = new StoryPreviewPostProcessor(5);
    public static final StoryPreviewPostProcessor INSTANCE_15 = new StoryPreviewPostProcessor(15);

    public StoryPreviewPostProcessor(int radius) {
        this.radius = radius;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "StoryPreviewPostProcessor-" + this.radius;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap sourceBitmap, PlatformBitmapFactory bitmapFactory) {
        int w;
        int h;
        float ar = BitmapUtils.getAspectRatio(sourceBitmap);
        if (ar > 1.0f) {
            w = 50;
            h = (int) (50 / ar);
        } else if (ar < 1.0f) {
            h = 50;
            w = (int) (50 * ar);
        } else {
            w = 50;
            h = 50;
        }
        CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap(w, h);
        try {
            Bitmap destBitmap = bitmapRef.get();
            ImageLoaderUtils.fastResizeBitmap(sourceBitmap, destBitmap);
            Native.blurBitmap(destBitmap, this.radius);
            return CloseableReference.cloneOrNull(bitmapRef);
        } finally {
            CloseableReference.closeSafely(bitmapRef);
        }
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CacheKey getPostprocessorCacheKey() {
        return new SimpleCacheKey("StoryPreviewPostProcessor-" + this.radius);
    }
}
