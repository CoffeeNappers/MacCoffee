package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.imageloader.ImageLoaderUtils;
/* loaded from: classes2.dex */
public class AvatarCropTransform extends BasePostprocessor {
    private final int maxWidth;
    private final RectF rawCropRect;

    public AvatarCropTransform(RectF rawCropRect, int maxWidth) {
        this.rawCropRect = rawCropRect;
        this.maxWidth = maxWidth;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap bitmap, PlatformBitmapFactory bitmapFactory) {
        Rect cropRect = new Rect(Math.round(this.rawCropRect.left * bitmap.getWidth()), Math.round(this.rawCropRect.top * bitmap.getHeight()), Math.round(this.rawCropRect.right * bitmap.getWidth()), Math.round(this.rawCropRect.bottom * bitmap.getHeight()));
        CloseableReference<Bitmap> croppedBitmapRef = ImageLoaderUtils.createFrescoBitmap(bitmapFactory, bitmap, cropRect.left, cropRect.top, cropRect.width(), cropRect.height());
        if (cropRect.width() > this.maxWidth) {
            float scale = this.maxWidth / cropRect.width();
            try {
                Bitmap croppedBitmap = croppedBitmapRef.get();
                CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap((int) (croppedBitmap.getWidth() * scale), (int) (croppedBitmap.getHeight() * scale));
                Bitmap destBitmap = bitmapRef.get();
                ImageLoaderUtils.fastResizeBitmap(croppedBitmap, destBitmap);
                CloseableReference<Bitmap> croppedBitmapRef2 = CloseableReference.cloneOrNull(bitmapRef);
                CloseableReference.closeSafely(bitmapRef);
                return croppedBitmapRef2;
            } finally {
                CloseableReference.closeSafely(croppedBitmapRef);
            }
        }
        return croppedBitmapRef;
    }
}
