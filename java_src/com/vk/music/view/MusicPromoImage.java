package com.vk.music.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
/* loaded from: classes2.dex */
public class MusicPromoImage extends View {
    private boolean initialized;
    private BitmapDrawable maskDrawable;
    private Paint maskPaint;
    private BitmapDrawable phoneDrawable;
    private BitmapDrawable screenDrawable;
    private Bitmap tmpBitmap;
    private Canvas tmpCanvas;
    private int tmpDx;

    public MusicPromoImage(Context context) {
        super(context);
        this.initialized = false;
    }

    public MusicPromoImage(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.initialized = false;
    }

    public MusicPromoImage(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.initialized = false;
    }

    public void initialize(@DrawableRes int phoneDrawable, @DrawableRes int screenDrawable, @DrawableRes int bottomMask) {
        this.phoneDrawable = drawable(phoneDrawable);
        this.screenDrawable = drawable(screenDrawable);
        this.maskDrawable = drawable(bottomMask);
        this.tmpBitmap = Bitmap.createBitmap(this.phoneDrawable.getIntrinsicWidth(), this.phoneDrawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        this.tmpCanvas = new Canvas(this.tmpBitmap);
        this.maskPaint = new Paint();
        this.maskPaint.setAntiAlias(true);
        this.maskPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        this.initialized = true;
    }

    private BitmapDrawable drawable(@DrawableRes int drawableRes) {
        BitmapDrawable bd = (BitmapDrawable) getResources().getDrawable(drawableRes);
        bd.setBounds(0, 0, bd.getIntrinsicWidth(), bd.getIntrinsicHeight());
        return bd;
    }

    @Override // android.view.View
    protected int getSuggestedMinimumWidth() {
        int maxWidth = super.getSuggestedMinimumWidth();
        if (this.initialized) {
            return Math.max(Math.max(maxWidth, this.phoneDrawable.getMinimumWidth()), this.screenDrawable.getMinimumWidth());
        }
        return maxWidth;
    }

    @Override // android.view.View
    protected int getSuggestedMinimumHeight() {
        int maxHeight = super.getSuggestedMinimumHeight();
        if (this.initialized) {
            return Math.max(Math.max(maxHeight, this.phoneDrawable.getMinimumHeight()), this.screenDrawable.getMinimumHeight());
        }
        return maxHeight;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int w = Math.max(getPaddingLeft() + getPaddingRight(), getSuggestedMinimumWidth());
        int h = Math.max(getPaddingTop() + getPaddingBottom(), getSuggestedMinimumHeight());
        setMeasuredDimension(resolveSizeAndState(w, widthMeasureSpec, 0), resolveSizeAndState(h, heightMeasureSpec, 0));
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.initialized) {
            this.tmpCanvas.drawColor(0);
            this.tmpCanvas.drawBitmap(this.phoneDrawable.getBitmap(), 0.0f, 0.0f, (Paint) null);
            int dw = (this.phoneDrawable.getIntrinsicWidth() - this.screenDrawable.getIntrinsicWidth()) / 2;
            int dh = (this.phoneDrawable.getIntrinsicHeight() - this.screenDrawable.getIntrinsicHeight()) / 2;
            this.tmpCanvas.save();
            this.tmpCanvas.translate(dw, dh);
            this.tmpCanvas.drawBitmap(this.screenDrawable.getBitmap(), 0.0f, 0.0f, (Paint) null);
            this.tmpCanvas.restore();
            if (this.phoneDrawable.getBitmap().getHeight() > getHeight()) {
                this.tmpDx = 0;
                while (this.tmpDx < getWidth()) {
                    this.tmpCanvas.drawBitmap(this.maskDrawable.getBitmap(), this.tmpDx, getHeight() - this.maskDrawable.getBitmap().getHeight(), this.maskPaint);
                    this.tmpDx += this.maskDrawable.getBitmap().getWidth();
                }
            }
            canvas.drawBitmap(this.tmpBitmap, 0.0f, 0.0f, (Paint) null);
        }
    }
}
