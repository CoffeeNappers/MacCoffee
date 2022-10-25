package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.imagepipeline.request.BasePostprocessor;
/* loaded from: classes2.dex */
public class TintPostProcessor extends BasePostprocessor {
    private final CacheKey cacheKey;
    private final int color;
    private final String name;
    private final Paint paint = new Paint(2);

    public TintPostProcessor(int color) {
        this.color = color;
        this.name = "TintPostProcessor#" + color;
        this.cacheKey = new SimpleCacheKey(this.name);
        this.paint.setColorFilter(new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN));
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor
    public void process(Bitmap destBitmap, Bitmap sourceBitmap) {
        Canvas canvas = new Canvas(destBitmap);
        canvas.drawBitmap(sourceBitmap, 0.0f, 0.0f, this.paint);
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return this.name;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CacheKey getPostprocessorCacheKey() {
        return this.cacheKey;
    }
}
