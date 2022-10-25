package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.facebook.drawee.drawable.ScalingUtils;
/* loaded from: classes2.dex */
public class VKStickerImageView extends VKImageView {
    public static final int OVERLAY_COLOR = 855638016;
    private static final ColorFilter sEnabled = new PorterDuffColorFilter(OVERLAY_COLOR, PorterDuff.Mode.SRC_ATOP);

    public VKStickerImageView(Context context) {
        super(context);
        init();
    }

    public VKStickerImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public VKStickerImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        if (getHierarchy() != null) {
            getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.FIT_CENTER);
        }
    }

    @Override // com.vk.imageloader.view.VKDraweeView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction() & 255;
        if (action == 0) {
            if (getHierarchy() != null) {
                getHierarchy().setActualImageColorFilter(sEnabled);
            }
        } else if (action != 2 && getHierarchy() != null) {
            getHierarchy().setActualImageColorFilter(null);
        }
        return super.onTouchEvent(event);
    }
}
