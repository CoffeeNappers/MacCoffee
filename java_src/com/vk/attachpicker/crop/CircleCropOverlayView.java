package com.vk.attachpicker.crop;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.util.AttributeSet;
import com.vk.attachpicker.crop.RectCropOverlayView;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class CircleCropOverlayView extends CropOverlayView implements CropAreaProvider {
    public static final int SIDE_PADDING = Screen.dp(16);
    private final int COLOR_OVERLAY_SOLID;
    private float bottomSidePadding;
    private final Paint eraser;
    private float leftSidePadding;
    private final int minCropSide;
    private RectCropOverlayView.OnCropChangeListener onCropChangeListener;
    private Bitmap overlayBitmap;
    private float rightSidePadding;
    private float topSidePadding;
    private boolean touchEnabled;
    private float x0;
    private float x1;
    private float y0;
    private float y1;

    public CircleCropOverlayView(Context context) {
        super(context);
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.minCropSide = Screen.dp(128);
        this.eraser = new Paint();
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        init();
    }

    public CircleCropOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.minCropSide = Screen.dp(128);
        this.eraser = new Paint();
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        init();
    }

    public CircleCropOverlayView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.minCropSide = Screen.dp(128);
        this.eraser = new Paint();
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        init();
    }

    private void init() {
        this.eraser.setColor(-1);
        this.eraser.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setForcedAspectRatio(float cropAspectRatio, float forcedAspectRatio, boolean doSpringback) {
        initWithAspectRatio(cropAspectRatio);
        if (this.onCropChangeListener != null && doSpringback) {
            this.onCropChangeListener.onCropChange();
            this.onCropChangeListener.onCropEnd();
        }
    }

    private float getXMinCropSide() {
        return this.minCropSide;
    }

    private float getYMinCropSide() {
        return this.minCropSide;
    }

    private float clampX0(float v) {
        if (v > this.x1 || this.x1 - v < getXMinCropSide()) {
            v = this.x1 - getXMinCropSide();
        } else if (this.x1 - v > maxWidth()) {
            v = this.x1 - maxWidth();
        }
        return Utils.clamp(v, this.leftSidePadding, getMeasuredWidth() - this.rightSidePadding);
    }

    private float clampY0(float v) {
        if (v > this.y1 || this.y1 - v < getYMinCropSide()) {
            v = this.y1 - getYMinCropSide();
        } else if (this.y1 - v > maxHeight()) {
            v = this.y1 - maxHeight();
        }
        return Utils.clamp(v, this.topSidePadding, getMeasuredHeight() - this.bottomSidePadding);
    }

    private float clampX1(float v) {
        if (v < this.x0 || v - this.x0 < getXMinCropSide()) {
            v = this.x0 + getXMinCropSide();
        } else if (v - this.x0 > maxWidth()) {
            v = this.x0 + maxWidth();
        }
        return Utils.clamp(v, this.leftSidePadding, getMeasuredWidth() - this.rightSidePadding);
    }

    private float clampY1(float v) {
        if (v < this.y0 || v - this.y0 < getYMinCropSide()) {
            v = this.y0 + getYMinCropSide();
        } else if (v - this.y0 > maxHeight()) {
            v = this.y0 + maxHeight();
        }
        return Utils.clamp(v, this.topSidePadding, getMeasuredHeight() - this.bottomSidePadding);
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setX0(float v) {
        this.x0 = clampX0(v);
        invalidate();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setX1(float v) {
        this.x1 = clampX1(v);
        invalidate();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setY0(float v) {
        this.y0 = clampY0(v);
        invalidate();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setY1(float v) {
        this.y1 = clampY1(v);
        invalidate();
    }

    public void setLeftSidePadding(float leftSidePadding) {
        this.leftSidePadding = leftSidePadding;
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setTopSidePadding(float topSidePadding) {
        this.topSidePadding = topSidePadding;
    }

    public void setRightSidePadding(float rightSidePadding) {
        this.rightSidePadding = rightSidePadding;
    }

    public void setBottomSidePadding(float bottomSidePadding) {
        this.bottomSidePadding = bottomSidePadding;
    }

    public float getLeftSidePadding() {
        return this.leftSidePadding;
    }

    public float getTopSidePadding() {
        return this.topSidePadding;
    }

    public float getRightSidePadding() {
        return this.rightSidePadding;
    }

    public float getBottomSidePadding() {
        return this.bottomSidePadding;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.overlayBitmap == null || this.overlayBitmap.isRecycled() || this.overlayBitmap.getWidth() != canvas.getWidth() || this.overlayBitmap.getHeight() != canvas.getHeight()) {
            Bitmap oldBitmap = this.overlayBitmap;
            this.overlayBitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_4444);
            Canvas c = new Canvas(this.overlayBitmap);
            c.drawColor(-419430401);
            c.drawCircle((this.x1 + this.x0) / 2.0f, (this.y1 + this.y0) / 2.0f, Math.min((this.x1 - this.x0) / 2.0f, (this.y1 - this.y0) / 2.0f), this.eraser);
            if (oldBitmap != null && !oldBitmap.isRecycled()) {
                oldBitmap.recycle();
            }
        }
        canvas.drawBitmap(this.overlayBitmap, 0.0f, 0.0f, (Paint) null);
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setLinesAndTransparentOverlayVisible(boolean visible) {
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void initWithAspectRatio(float aspectRatio) {
        RectF rectF = calculatePosition(1.0f);
        this.x0 = rectF.left;
        this.y0 = rectF.top;
        this.x1 = rectF.right;
        this.y1 = rectF.bottom;
        invalidate();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setOnCropChangeListener(RectCropOverlayView.OnCropChangeListener onCropChangeListener) {
        this.onCropChangeListener = onCropChangeListener;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getX0() {
        return this.x0;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getX1() {
        return this.x1;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getY0() {
        return this.y0;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getY1() {
        return this.y1;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public RectF getCropRect() {
        return new RectF(this.x0, this.y0, this.x1, this.y1);
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCropAspectRatio() {
        return (this.x1 - this.x0) / (this.y1 - this.y0);
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCenterX() {
        return this.x0 + ((this.x1 - this.x0) / 2.0f);
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCenterY() {
        return this.y0 + ((this.y1 - this.y0) / 2.0f);
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCropWidth() {
        return this.x1 - this.x0;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCropHeight() {
        return this.y1 - this.y0;
    }

    @Override // com.vk.attachpicker.crop.CropAreaProvider
    public float getCropScale() {
        return getWidth() < getHeight() ? (this.x1 - this.x0) / getWidth() : (this.y1 - this.y0) / getHeight();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public RectF calculatePosition(float cropAr) {
        return CropUtils.calculatePosition(1.0f, getMeasuredWidth(), getMeasuredHeight(), this.leftSidePadding, this.topSidePadding, this.rightSidePadding, this.bottomSidePadding);
    }

    private float maxWidth() {
        float width = (getMeasuredWidth() - this.leftSidePadding) - this.rightSidePadding;
        float height = (getMeasuredHeight() - this.topSidePadding) - this.bottomSidePadding;
        return Math.min(width, height);
    }

    private float maxHeight() {
        float width = (getMeasuredWidth() - this.leftSidePadding) - this.rightSidePadding;
        float height = (getMeasuredHeight() - this.topSidePadding) - this.bottomSidePadding;
        return Math.min(width, height);
    }

    public boolean isTouchEnabled() {
        return this.touchEnabled;
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setTouchEnabled(boolean touchEnabled) {
        this.touchEnabled = touchEnabled;
    }
}
