package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.ImageView;
import com.vk.imageloader.view.VKStickerImageView;
/* loaded from: classes3.dex */
public class StickerImageView extends ImageView {
    public StickerImageView(Context context) {
        super(context);
    }

    public StickerImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public StickerImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (ev.getAction() == 0) {
            setPressedState(true);
        }
        if (ev.getAction() == 1 || ev.getAction() == 3) {
            setPressedState(false);
        }
        return super.onTouchEvent(ev);
    }

    private void setPressedState(boolean pressed) {
        if (pressed) {
            setColorFilter(VKStickerImageView.OVERLAY_COLOR);
        } else {
            setColorFilter(0);
        }
    }
}
