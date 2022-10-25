package com.facebook.imagepipeline.request;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.nativecode.Bitmaps;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public abstract class BasePostprocessor implements Postprocessor {
    public static final Bitmap.Config FALLBACK_BITMAP_CONFIGURATION = Bitmap.Config.ARGB_8888;

    @Override // com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "Unknown postprocessor";
    }

    @Override // com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap sourceBitmap, PlatformBitmapFactory bitmapFactory) {
        Bitmap.Config sourceBitmapConfig = sourceBitmap.getConfig();
        int width = sourceBitmap.getWidth();
        int height = sourceBitmap.getHeight();
        if (sourceBitmapConfig == null) {
            sourceBitmapConfig = FALLBACK_BITMAP_CONFIGURATION;
        }
        CloseableReference<Bitmap> destBitmapRef = bitmapFactory.createBitmapInternal(width, height, sourceBitmapConfig);
        try {
            process(destBitmapRef.get(), sourceBitmap);
            return CloseableReference.cloneOrNull(destBitmapRef);
        } finally {
            CloseableReference.closeSafely(destBitmapRef);
        }
    }

    public void process(Bitmap destBitmap, Bitmap sourceBitmap) {
        internalCopyBitmap(destBitmap, sourceBitmap);
        process(destBitmap);
    }

    public void process(Bitmap bitmap) {
    }

    @Override // com.facebook.imagepipeline.request.Postprocessor
    @Nullable
    public CacheKey getPostprocessorCacheKey() {
        return null;
    }

    private static void internalCopyBitmap(Bitmap destBitmap, Bitmap sourceBitmap) {
        if (destBitmap.getConfig() == sourceBitmap.getConfig()) {
            Bitmaps.copyBitmap(destBitmap, sourceBitmap);
            return;
        }
        Canvas canvas = new Canvas(destBitmap);
        canvas.drawBitmap(sourceBitmap, 0.0f, 0.0f, (Paint) null);
    }
}
