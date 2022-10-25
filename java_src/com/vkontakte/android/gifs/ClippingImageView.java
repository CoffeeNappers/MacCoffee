package com.vkontakte.android.gifs;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.util.AttributeSet;
import com.vkontakte.android.ui.widget.RatioImageView;
/* loaded from: classes3.dex */
public class ClippingImageView extends RatioImageView {
    private int mClipBottom;
    private int mClipLeft;
    private int mClipRight;
    private int mClipTop;

    public ClippingImageView(Context context) {
        super(context);
    }

    public ClippingImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ClippingImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ClippingImageView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public int getClipTop() {
        return this.mClipTop;
    }

    public void setClipTop(int value) {
        this.mClipTop = value;
        invalidate();
    }

    public int getClipLeft() {
        return this.mClipLeft;
    }

    public void setClipLeft(int value) {
        this.mClipLeft = value;
        invalidate();
    }

    public int getClipBottom() {
        return this.mClipBottom;
    }

    public void setClipBottom(int value) {
        this.mClipBottom = value;
        invalidate();
    }

    public int getClipRight() {
        return this.mClipRight;
    }

    public void setClipRight(int value) {
        this.mClipRight = value;
        invalidate();
    }

    public void setClipVertical(int value) {
        this.mClipBottom = value;
        this.mClipTop = value;
        invalidate();
    }

    public int getClipVertical() {
        return this.mClipTop;
    }

    public void setClipHorizontal(int value) {
        this.mClipRight = value;
        this.mClipLeft = value;
        invalidate();
    }

    public int getClipHorizontal() {
        return this.mClipRight;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        if (!(getDrawable() instanceof BitmapDrawable) || ((BitmapDrawable) getDrawable()).getBitmap() == null || !((BitmapDrawable) getDrawable()).getBitmap().isRecycled()) {
            int count = canvas.save();
            canvas.clipRect(this.mClipLeft, this.mClipTop, getWidth() - this.mClipRight, getHeight() - this.mClipBottom);
            super.onDraw(canvas);
            canvas.restoreToCount(count);
        }
    }
}
