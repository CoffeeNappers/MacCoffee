package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.utils.L;
/* loaded from: classes3.dex */
public class AudioSquareImageView extends VKImageView {
    private int opB;
    private int opL;
    private int opR;
    private int opT;
    private Rect rect;

    public AudioSquareImageView(Context context) {
        super(context);
        this.rect = new Rect();
    }

    public AudioSquareImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.rect = new Rect();
    }

    public AudioSquareImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.rect = new Rect();
    }

    @Override // com.vk.imageloader.view.GenericVKImageView, android.widget.ImageView, android.view.View
    public void onMeasure(int wms, int hms) {
        int padding;
        AlbumScrollView sv = (AlbumScrollView) getParent().getParent();
        int sh = View.MeasureSpec.getSize(sv.heightMSpec) - sv.getChildAt(0).getPaddingTop();
        int sw = View.MeasureSpec.getSize(sv.widthMSpec);
        if (this.opL == -1) {
            this.opL = getPaddingLeft();
            this.opR = getPaddingRight();
            this.opT = getPaddingTop();
            this.opB = getPaddingBottom();
        }
        if (sh < sw) {
            setMeasuredDimension(sh, sh);
            padding = 0;
        } else {
            setMeasuredDimension(sw, sh);
            padding = (sh - sw) / 2;
        }
        setPadding(this.opL, this.opT + padding, this.opR, this.opB + padding);
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas c) {
        c.save();
        this.rect.left = getPaddingLeft();
        this.rect.top = getPaddingTop();
        this.rect.right = getWidth() - getPaddingRight();
        this.rect.bottom = getHeight() - getPaddingBottom();
        c.clipRect(this.rect);
        try {
            super.onDraw(c);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        c.restore();
    }
}
