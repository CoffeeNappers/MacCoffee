package com.vk.imageloader.transform;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.vk.imageloader.ImageLoaderUtils;
/* loaded from: classes2.dex */
public class AttachMapPinTransform extends BasePostprocessor {
    private static final Paint bitmapPaint = new Paint();
    private final Drawable markerDrawable;
    private final int resultHeight;
    private final int resultWidth;

    static {
        bitmapPaint.setAntiAlias(true);
        bitmapPaint.setDither(true);
        bitmapPaint.setFilterBitmap(true);
    }

    public AttachMapPinTransform(int resultWidth, int resultHeight, Drawable markerDrawable) {
        this.resultWidth = resultWidth;
        this.resultHeight = resultHeight;
        this.markerDrawable = markerDrawable;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public CloseableReference<Bitmap> process(Bitmap sourceBitmap, PlatformBitmapFactory bitmapFactory) {
        CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap(this.resultWidth, this.resultHeight);
        try {
            Bitmap destBitmap = bitmapRef.get();
            ImageLoaderUtils.fastResizeBitmap(sourceBitmap, destBitmap);
            Canvas c = new Canvas(destBitmap);
            this.markerDrawable.setBounds((this.resultWidth / 2) - (this.markerDrawable.getIntrinsicWidth() / 2), (this.resultHeight / 2) - this.markerDrawable.getIntrinsicHeight(), (this.resultWidth / 2) + (this.markerDrawable.getIntrinsicWidth() / 2), this.resultHeight / 2);
            this.markerDrawable.draw(c);
            return CloseableReference.cloneOrNull(bitmapRef);
        } finally {
            CloseableReference.closeSafely(bitmapRef);
        }
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    public String getName() {
        return "AttachMapPinTransform";
    }
}
