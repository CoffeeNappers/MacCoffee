package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.RectF;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.imageloader.ImageLoaderUtils;
/* loaded from: classes2.dex */
public class ProfileHeaderTransform extends BasePostprocessor {
    private final RectF photoRect;
    private final float ratio = 1.5f;
    private float width;

    public ProfileHeaderTransform(float width, RectF photoRect) {
        this.width = width;
        this.photoRect = photoRect;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "ProfileHeaderTransform";
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap bitmap, PlatformBitmapFactory bitmapFactory) {
        int bmpH;
        int bmpW;
        int bmpX;
        int bmpY;
        double rectOffsetY;
        if (this.photoRect == null) {
            return ImageLoaderUtils.createFrescoBitmap(bitmapFactory, bitmap, 0, 0, bitmap.getWidth(), Math.round(bitmap.getWidth() / 1.5f));
        }
        boolean moveTop = true;
        double d = this.width / 1.5f;
        double photoRatio = bitmap.getWidth() / bitmap.getHeight();
        double photoWidth = bitmap.getWidth();
        double photoHeight = photoWidth / photoRatio;
        if (photoRatio > 1.5d) {
            photoHeight = bitmap.getHeight();
            photoWidth = bitmap.getHeight() * photoRatio;
            moveTop = false;
        }
        int bmpX2 = Math.round(this.photoRect.left * bitmap.getWidth());
        int bmpY2 = Math.round(this.photoRect.top * bitmap.getHeight());
        int bmpW2 = Math.round(this.photoRect.width() * bitmap.getWidth());
        int bmpH2 = Math.round(this.photoRect.height() * bitmap.getHeight());
        double centerX = (bmpW2 / 2) + bmpX2;
        double centerY = bmpY2 + bmpH2;
        if (moveTop) {
            double height = bitmap.getWidth() / 1.5f;
            if (bmpH2 > height) {
                rectOffsetY = 2.56d;
            } else {
                rectOffsetY = 2.0d;
            }
            double centerY2 = centerY - (bmpH2 - (bmpH2 / rectOffsetY));
            double offsetY = (height / 2.0d) - centerY2;
            if (bmpH2 > height && centerY2 - (bmpH2 / 2) >= 0.0d) {
                offsetY = -bmpY2;
            }
            bmpH = (int) (photoWidth / 1.5d);
            double offset = Math.max(0.0d, Math.min(-offsetY, bitmap.getHeight() - bmpH));
            bmpX = 0;
            bmpY = (int) offset;
            bmpW = (int) photoWidth;
        } else {
            this.width = bitmap.getHeight() * 1.5f;
            bmpH = (int) photoHeight;
            bmpW = (int) (1.5d * photoHeight);
            double offset2 = Math.max(0.0d, Math.min(-((this.width / 2.0f) - centerX), bitmap.getWidth() - bmpW));
            bmpX = (int) offset2;
            bmpY = 0;
        }
        return ImageLoaderUtils.createFrescoBitmap(bitmapFactory, bitmap, bmpX, bmpY, bmpW, bmpH);
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CacheKey getPostprocessorCacheKey() {
        return new SimpleCacheKey("ProfileHeaderTransform");
    }
}
