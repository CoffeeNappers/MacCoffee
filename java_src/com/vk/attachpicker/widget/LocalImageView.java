package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
/* loaded from: classes2.dex */
public class LocalImageView extends VKImageView {
    private final ColorDrawable defaultPlaceholder;
    private MediaStoreEntry entry;
    private final CorruptedFileDrawable imageCorruptedStub;

    public LocalImageView(Context context) {
        super(context);
        this.defaultPlaceholder = new ColorDrawable(-986638);
        this.imageCorruptedStub = new CorruptedFileDrawable();
    }

    public LocalImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.defaultPlaceholder = new ColorDrawable(-986638);
        this.imageCorruptedStub = new CorruptedFileDrawable();
    }

    public LocalImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.defaultPlaceholder = new ColorDrawable(-986638);
        this.imageCorruptedStub = new CorruptedFileDrawable();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setPlaceholderImage(this.defaultPlaceholder);
        builder.setActualImageScaleType(ScalingUtils.ScaleType.FIT_CENTER);
        builder.setFailureImage(this.imageCorruptedStub);
    }

    public void setImage(MediaStoreEntry image, boolean fullSize) {
        if (image != null) {
            this.entry = image;
            if (!fullSize) {
                load(image.path, ImageSize.SMALL);
            } else {
                load(image.path, ImageSize.VERY_BIG);
            }
        }
    }

    public MediaStoreEntry getEntry() {
        return this.entry;
    }

    public static RectF computeBounds(int viewWidth, int viewHeight, int bitmapWidth, int bitmapHeight, boolean isAspectFit) {
        float scaleW = bitmapWidth / viewWidth;
        float scaleH = bitmapHeight / viewHeight;
        RectF drawRegion = new RectF();
        if (isAspectFit) {
            float scale = Math.max(scaleW, scaleH);
            int bitmapW = (int) (bitmapWidth / scale);
            int bitmapH = (int) (bitmapHeight / scale);
            drawRegion.set((viewWidth - bitmapW) / 2, (viewHeight - bitmapH) / 2, (viewWidth + bitmapW) / 2, (viewHeight + bitmapH) / 2);
        } else if (Math.abs(scaleW - scaleH) > 1.0E-5f) {
            if (bitmapWidth / scaleH > viewWidth) {
                int bitmapW2 = (int) (bitmapWidth / scaleH);
                drawRegion.set((-(bitmapW2 - viewWidth)) / 2, 0.0f, (bitmapW2 + viewWidth) / 2, viewHeight);
            } else {
                int bitmapH2 = (int) (bitmapHeight / scaleW);
                drawRegion.set(0.0f, (-(bitmapH2 - viewHeight)) / 2, viewWidth, (bitmapH2 + viewHeight) / 2);
            }
        } else {
            drawRegion.set(0.0f, 0.0f, viewWidth, viewHeight);
        }
        return drawRegion;
    }
}
