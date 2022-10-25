package com.vk.attachpicker.crop;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class RectCropOverlayView extends CropOverlayView implements CropAreaProvider {
    private static final int DRAG_STATE_BOTTOM = 8;
    private static final int DRAG_STATE_LEFT = 5;
    private static final int DRAG_STATE_LEFT_BOTTOM = 4;
    private static final int DRAG_STATE_LEFT_TOP = 1;
    private static final int DRAG_STATE_NONE = 0;
    private static final int DRAG_STATE_RIGHT = 7;
    private static final int DRAG_STATE_RIGHT_BOTTOM = 3;
    private static final int DRAG_STATE_RIGHT_TOP = 2;
    private static final int DRAG_STATE_TOP = 6;
    public static final long HIDE_DELAY = 800;
    private static final String LINES_ALPHA = "linesAlpha";
    private static final String OVERLAY_COLOR = "overlayColor";
    private final int BORDER_LINE;
    private final int COLOR_OVERLAY_SOLID;
    private final int COLOR_OVERLAY_TRANSPARENT;
    private final int THIN_LINE;
    private boolean animationToVisible;
    private final Paint borderPaint;
    private final RectF bottom;
    private float bottomSidePadding;
    private final int cornerSize;
    private final Paint cornersPaint;
    private final Paint darkOverlayPaint;
    private final Path darkOverlayPath;
    private int draggingState;
    private float forcedAspectRatio;
    private final RectF left;
    private final RectF leftBottomCorner;
    private Drawable leftBottomCornerDrawable;
    private float leftSidePadding;
    private final RectF leftTopCorner;
    private Drawable leftTopCornerDrawable;
    private float linesAlpha;
    private AnimatorSet linesAnimator;
    private final Paint linesPaint;
    private final Path linesPath;
    private final int minCropSide;
    private OnCropChangeListener onCropChangeListener;
    private int overlayColor;
    private final RectF right;
    private final RectF rightBottomCorner;
    private Drawable rightBottomCornerDrawable;
    private float rightSidePadding;
    private final RectF rightTopCorner;
    private Drawable rightTopCornerDrawable;
    private int startedTrackingPointerId;
    private final RectF top;
    private float topSidePadding;
    private boolean touchEnabled;
    private float touchX;
    private float touchY;
    private float x0;
    private float x1;
    private float y0;
    private float y1;
    public static final int SIDE_PADDING = Screen.dp(16);
    private static final int CORNER_SIZE = Screen.dp(40);
    private static final int CORNER_DIFF = Screen.dp(10.9f);
    private static final int CORNER_SIZE_M_DIFF = CORNER_SIZE - CORNER_DIFF;

    /* loaded from: classes2.dex */
    public interface OnCropChangeListener {
        void onCropChange();

        void onCropEnd();
    }

    public RectCropOverlayView(Context context) {
        super(context);
        this.THIN_LINE = Screen.dp(0.5f);
        this.BORDER_LINE = Screen.dp(2);
        this.COLOR_OVERLAY_TRANSPARENT = 1728053247;
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.cornerSize = Screen.dp(16);
        this.minCropSide = Screen.dp(64);
        this.leftTopCorner = new RectF();
        this.rightTopCorner = new RectF();
        this.leftBottomCorner = new RectF();
        this.rightBottomCorner = new RectF();
        this.left = new RectF();
        this.top = new RectF();
        this.right = new RectF();
        this.bottom = new RectF();
        this.darkOverlayPath = new Path();
        this.linesPath = new Path();
        this.borderPaint = new Paint();
        this.linesPaint = new Paint();
        this.cornersPaint = new Paint();
        this.darkOverlayPaint = new Paint();
        this.forcedAspectRatio = 0.0f;
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        this.overlayColor = -419430401;
        init();
    }

    public RectCropOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.THIN_LINE = Screen.dp(0.5f);
        this.BORDER_LINE = Screen.dp(2);
        this.COLOR_OVERLAY_TRANSPARENT = 1728053247;
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.cornerSize = Screen.dp(16);
        this.minCropSide = Screen.dp(64);
        this.leftTopCorner = new RectF();
        this.rightTopCorner = new RectF();
        this.leftBottomCorner = new RectF();
        this.rightBottomCorner = new RectF();
        this.left = new RectF();
        this.top = new RectF();
        this.right = new RectF();
        this.bottom = new RectF();
        this.darkOverlayPath = new Path();
        this.linesPath = new Path();
        this.borderPaint = new Paint();
        this.linesPaint = new Paint();
        this.cornersPaint = new Paint();
        this.darkOverlayPaint = new Paint();
        this.forcedAspectRatio = 0.0f;
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        this.overlayColor = -419430401;
        init();
    }

    public RectCropOverlayView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.THIN_LINE = Screen.dp(0.5f);
        this.BORDER_LINE = Screen.dp(2);
        this.COLOR_OVERLAY_TRANSPARENT = 1728053247;
        this.COLOR_OVERLAY_SOLID = -419430401;
        this.cornerSize = Screen.dp(16);
        this.minCropSide = Screen.dp(64);
        this.leftTopCorner = new RectF();
        this.rightTopCorner = new RectF();
        this.leftBottomCorner = new RectF();
        this.rightBottomCorner = new RectF();
        this.left = new RectF();
        this.top = new RectF();
        this.right = new RectF();
        this.bottom = new RectF();
        this.darkOverlayPath = new Path();
        this.linesPath = new Path();
        this.borderPaint = new Paint();
        this.linesPaint = new Paint();
        this.cornersPaint = new Paint();
        this.darkOverlayPaint = new Paint();
        this.forcedAspectRatio = 0.0f;
        this.x0 = SIDE_PADDING;
        this.y0 = SIDE_PADDING;
        this.x1 = Screen.width() - SIDE_PADDING;
        this.y1 = Screen.width() - SIDE_PADDING;
        this.leftSidePadding = SIDE_PADDING;
        this.topSidePadding = SIDE_PADDING;
        this.rightSidePadding = SIDE_PADDING;
        this.bottomSidePadding = SIDE_PADDING;
        this.touchEnabled = true;
        this.overlayColor = -419430401;
        init();
    }

    private void init() {
        this.borderPaint.setStyle(Paint.Style.STROKE);
        this.borderPaint.setStrokeWidth(this.BORDER_LINE);
        this.borderPaint.setColor(-6710887);
        this.linesPaint.setColor(1728053247);
        this.linesPaint.setStrokeWidth(this.THIN_LINE);
        this.linesPaint.setStyle(Paint.Style.STROKE);
        this.darkOverlayPaint.setColor(this.overlayColor);
        this.darkOverlayPaint.setStyle(Paint.Style.FILL);
        this.cornersPaint.setStyle(Paint.Style.FILL);
        this.cornersPaint.setColor(-1);
        this.leftTopCornerDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_ic_gallery_crop_corner_topleft);
        this.rightTopCornerDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_ic_gallery_crop_corner_topright);
        this.rightBottomCornerDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_ic_gallery_crop_corner_bottomright);
        this.leftBottomCornerDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_ic_gallery_crop_corner_bottomleft);
        this.leftTopCornerDrawable.setCallback(this);
        this.rightTopCornerDrawable.setCallback(this);
        this.rightBottomCornerDrawable.setCallback(this);
        this.leftBottomCornerDrawable.setCallback(this);
    }

    private void updateRects() {
        if (this.x1 != 0.0f && this.y1 != 0.0f) {
            this.leftTopCorner.set(this.x0 - this.cornerSize, this.y0 - this.cornerSize, this.x0 + this.cornerSize, this.y0 + this.cornerSize);
            this.rightTopCorner.set(this.x1 - this.cornerSize, this.y0 - this.cornerSize, this.x1 + this.cornerSize, this.y0 + this.cornerSize);
            this.rightBottomCorner.set(this.x1 - this.cornerSize, this.y1 - this.cornerSize, this.x1 + this.cornerSize, this.y1 + this.cornerSize);
            this.leftBottomCorner.set(this.x0 - this.cornerSize, this.y1 - this.cornerSize, this.x0 + this.cornerSize, this.y1 + this.cornerSize);
            this.left.set(this.x0 - this.cornerSize, this.y0, this.x0 + this.cornerSize, this.y1);
            this.top.set(this.x0, this.y0 - this.cornerSize, this.x1, this.y0 + this.cornerSize);
            this.right.set(this.x1 - this.cornerSize, this.y0, this.x1 + this.cornerSize, this.y1);
            this.bottom.set(this.x0, this.y1 - this.cornerSize, this.x1, this.y1 + this.cornerSize);
        }
    }

    public float getLinesAlpha() {
        return this.linesAlpha;
    }

    public void setLinesAlpha(float linesAlpha) {
        this.linesAlpha = linesAlpha;
        invalidate();
    }

    public int getOverlayColor() {
        return this.overlayColor;
    }

    public void setOverlayColor(int overlayColor) {
        this.overlayColor = overlayColor;
        this.darkOverlayPaint.setColor(overlayColor);
        invalidate();
    }

    public float getForcedAspectRatio() {
        return this.forcedAspectRatio;
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setForcedAspectRatio(float cropAspectRatio, float forcedAspectRatio, boolean doSpringback) {
        this.forcedAspectRatio = forcedAspectRatio;
        if (forcedAspectRatio > 0.0f) {
            initWithAspectRatio(cropAspectRatio);
            if (this.onCropChangeListener != null && doSpringback) {
                this.onCropChangeListener.onCropChange();
                this.onCropChangeListener.onCropEnd();
            }
        }
    }

    private float getXMinCropSide() {
        if (this.forcedAspectRatio > 0.0f) {
            if (this.forcedAspectRatio <= 1.0f) {
                return this.minCropSide;
            }
            return this.minCropSide * this.forcedAspectRatio;
        }
        return this.minCropSide;
    }

    private float getYMinCropSide() {
        if (this.forcedAspectRatio > 0.0f) {
            if (this.forcedAspectRatio <= 1.0f) {
                return this.minCropSide / this.forcedAspectRatio;
            }
            return this.minCropSide;
        }
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

    private void diffX0Y0(float diffX, float diffY) {
        if (this.forcedAspectRatio == 0.0f) {
            setX0(this.x0 + diffX);
            setY0(this.y0 + diffY);
        } else if (Math.abs(diffX) > Math.abs(diffY)) {
            setX0(this.x0 + diffX);
            setY0(((this.x0 - this.x1) + (this.y1 * this.forcedAspectRatio)) / this.forcedAspectRatio);
        } else {
            setY0(this.y0 + diffY);
            setX0((this.forcedAspectRatio * (this.y0 - this.y1)) + this.x1);
        }
    }

    private void diffX1Y0(float diffX, float diffY) {
        if (this.forcedAspectRatio == 0.0f) {
            setX1(this.x1 + diffX);
            setY0(this.y0 + diffY);
        } else if (Math.abs(diffX) > Math.abs(diffY)) {
            setX1(this.x1 + diffX);
            setY0(((this.x0 - this.x1) + (this.y1 * this.forcedAspectRatio)) / this.forcedAspectRatio);
        } else {
            setY0(this.y0 + diffY);
            setX1((this.forcedAspectRatio * (this.y1 - this.y0)) + this.x0);
        }
    }

    private void diffX1Y1(float diffX, float diffY) {
        if (this.forcedAspectRatio == 0.0f) {
            setX1(this.x1 + diffX);
            setY1(this.y1 + diffY);
        } else if (Math.abs(diffX) > Math.abs(diffY)) {
            setX1(this.x1 + diffX);
            setY1((((this.forcedAspectRatio * this.y0) - this.x0) + this.x1) / this.forcedAspectRatio);
        } else {
            setY1(this.y1 + diffY);
            setX1((this.forcedAspectRatio * (this.y1 - this.y0)) + this.x0);
        }
    }

    private void diffX0Y1(float diffX, float diffY) {
        if (this.forcedAspectRatio == 0.0f) {
            setX0(this.x0 + diffX);
            setY1(this.y1 + diffY);
        } else if (Math.abs(diffX) > Math.abs(diffY)) {
            setX0(this.x0 + diffX);
            if (this.forcedAspectRatio > 0.0f) {
                this.y1 = clampY1((((this.forcedAspectRatio * this.y0) - this.x0) + this.x1) / this.forcedAspectRatio);
            }
        } else {
            setY1(this.y1 + diffY);
            if (this.forcedAspectRatio > 0.0f) {
                this.x0 = clampX0((this.forcedAspectRatio * (this.y0 - this.y1)) + this.x1);
            }
        }
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
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.touchEnabled) {
            return false;
        }
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (motionEvent.getAction() == 0) {
            updateRects();
            if (this.leftTopCorner.contains(x, y)) {
                this.draggingState = 1;
            } else if (this.rightTopCorner.contains(x, y)) {
                this.draggingState = 2;
            } else if (this.rightBottomCorner.contains(x, y)) {
                this.draggingState = 3;
            } else if (this.leftBottomCorner.contains(x, y)) {
                this.draggingState = 4;
            } else if (this.left.contains(x, y)) {
                this.draggingState = 5;
            } else if (this.top.contains(x, y)) {
                this.draggingState = 6;
            } else if (this.right.contains(x, y)) {
                this.draggingState = 7;
            } else if (this.bottom.contains(x, y)) {
                this.draggingState = 8;
            } else {
                this.draggingState = 0;
            }
            if (this.draggingState == 0) {
                return false;
            }
            this.startedTrackingPointerId = motionEvent.getPointerId(0);
            this.touchX = x;
            this.touchY = y;
            setLinesAndTransparentOverlayVisible(true);
            return true;
        } else if (motionEvent.getAction() == 1 || motionEvent.getAction() == 3) {
            this.draggingState = 0;
            if (this.onCropChangeListener != null) {
                this.onCropChangeListener.onCropEnd();
            }
            setLinesAndTransparentOverlayVisible(false);
            return true;
        } else if (motionEvent.getAction() != 2 || this.draggingState == 0 || this.startedTrackingPointerId != motionEvent.getPointerId(0)) {
            return false;
        } else {
            float diffX = x - this.touchX;
            float diffY = y - this.touchY;
            switch (this.draggingState) {
                case 1:
                    diffX0Y0(diffX, diffY);
                    break;
                case 2:
                    diffX1Y0(diffX, diffY);
                    break;
                case 3:
                    diffX1Y1(diffX, diffY);
                    break;
                case 4:
                    diffX0Y1(diffX, diffY);
                    break;
                case 5:
                    if (this.forcedAspectRatio == 0.0f) {
                        setX0(this.x0 + diffX);
                        break;
                    }
                    break;
                case 6:
                    if (this.forcedAspectRatio == 0.0f) {
                        setY0(this.y0 + diffY);
                        break;
                    }
                    break;
                case 7:
                    if (this.forcedAspectRatio == 0.0f) {
                        setX1(this.x1 + diffX);
                        break;
                    }
                    break;
                case 8:
                    if (this.forcedAspectRatio == 0.0f) {
                        setY1(this.y1 + diffY);
                        break;
                    }
                    break;
            }
            this.touchX = x;
            this.touchY = y;
            if (this.onCropChangeListener != null) {
                this.onCropChangeListener.onCropChange();
            }
            return true;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        this.darkOverlayPath.reset();
        this.darkOverlayPath.addRect(0.0f, 0.0f, canvas.getWidth(), this.y0, Path.Direction.CW);
        this.darkOverlayPath.addRect(0.0f, this.y1, canvas.getWidth(), canvas.getHeight(), Path.Direction.CW);
        this.darkOverlayPath.addRect(0.0f, 0.0f, this.x0, canvas.getHeight(), Path.Direction.CW);
        this.darkOverlayPath.addRect(this.x1, 0.0f, canvas.getWidth(), canvas.getHeight(), Path.Direction.CW);
        canvas.drawPath(this.darkOverlayPath, this.darkOverlayPaint);
        this.linesPath.reset();
        int smallSquareWidth = (int) ((this.x1 - this.x0) / 3.0f);
        int smallSquareHeight = (int) ((this.y1 - this.y0) / 3.0f);
        this.linesPath.moveTo(this.x0 + smallSquareWidth, this.y0);
        this.linesPath.lineTo(this.x0 + smallSquareWidth, this.y1);
        this.linesPath.moveTo(this.x0 + (smallSquareWidth * 2), this.y0);
        this.linesPath.lineTo(this.x0 + (smallSquareWidth * 2), this.y1);
        this.linesPath.moveTo(this.x0, this.y0 + smallSquareHeight);
        this.linesPath.lineTo(this.x1, this.y0 + smallSquareHeight);
        this.linesPath.moveTo(this.x0, this.y0 + (smallSquareHeight * 2));
        this.linesPath.lineTo(this.x1, this.y0 + (smallSquareHeight * 2));
        this.linesPaint.setAlpha((int) (this.linesAlpha * 255.0f));
        canvas.drawPath(this.linesPath, this.linesPaint);
        canvas.drawRect(this.x0, this.y0, this.x1, this.y1, this.borderPaint);
        int ix0 = (int) this.x0;
        int ix1 = (int) this.x1;
        int iy0 = (int) this.y0;
        int iy1 = (int) this.y1;
        this.leftTopCornerDrawable.setBounds(ix0 - CORNER_DIFF, iy0 - CORNER_DIFF, CORNER_SIZE_M_DIFF + ix0, CORNER_SIZE_M_DIFF + iy0);
        this.leftTopCornerDrawable.draw(canvas);
        this.rightTopCornerDrawable.setBounds(ix1 - CORNER_SIZE_M_DIFF, iy0 - CORNER_DIFF, CORNER_DIFF + ix1, CORNER_SIZE_M_DIFF + iy0);
        this.rightTopCornerDrawable.draw(canvas);
        this.rightBottomCornerDrawable.setBounds(ix1 - CORNER_SIZE_M_DIFF, iy1 - CORNER_SIZE_M_DIFF, CORNER_DIFF + ix1, CORNER_DIFF + iy1);
        this.rightBottomCornerDrawable.draw(canvas);
        this.leftBottomCornerDrawable.setBounds(ix0 - CORNER_DIFF, iy1 - CORNER_SIZE_M_DIFF, CORNER_SIZE_M_DIFF + ix0, CORNER_DIFF + iy1);
        this.leftBottomCornerDrawable.draw(canvas);
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setLinesAndTransparentOverlayVisible(boolean visible) {
        if (this.linesAnimator != null && visible != this.animationToVisible) {
            this.linesAnimator.cancel();
            this.linesAnimator = null;
        } else if (this.linesAnimator != null && visible == this.animationToVisible) {
            return;
        }
        this.animationToVisible = visible;
        this.linesAnimator = new AnimatorSet();
        AnimatorSet animatorSet = this.linesAnimator;
        Animator[] animatorArr = new Animator[2];
        float[] fArr = new float[1];
        fArr[0] = visible ? 1.0f : 0.0f;
        animatorArr[0] = ObjectAnimator.ofFloat(this, LINES_ALPHA, fArr);
        int[] iArr = new int[1];
        iArr[0] = visible ? 1728053247 : -419430401;
        animatorArr[1] = AnimationUtils.ofArgb(this, OVERLAY_COLOR, iArr);
        animatorSet.playTogether(animatorArr);
        this.linesAnimator.setDuration(visible ? 200L : 400L);
        if (!visible) {
            this.linesAnimator.setStartDelay(800L);
        }
        this.linesAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.crop.RectCropOverlayView.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                RectCropOverlayView.this.linesAnimator = null;
            }
        });
        this.linesAnimator.start();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void initWithAspectRatio(float aspectRatio) {
        RectF rectF;
        if (this.forcedAspectRatio > 0.0f) {
            rectF = calculatePosition(this.forcedAspectRatio);
        } else {
            rectF = calculatePosition(aspectRatio);
        }
        this.x0 = rectF.left;
        this.y0 = rectF.top;
        this.x1 = rectF.right;
        this.y1 = rectF.bottom;
        invalidate();
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setOnCropChangeListener(OnCropChangeListener onCropChangeListener) {
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
        return CropUtils.calculatePosition(cropAr, getMeasuredWidth(), getMeasuredHeight(), this.leftSidePadding, this.topSidePadding, this.rightSidePadding, this.bottomSidePadding);
    }

    private float maxWidth() {
        float targetWidth;
        float width = (getMeasuredWidth() - this.leftSidePadding) - this.rightSidePadding;
        float height = (getMeasuredHeight() - this.topSidePadding) - this.bottomSidePadding;
        if (this.forcedAspectRatio != 0.0f) {
            float availableAspectRatio = width / height;
            if (this.forcedAspectRatio == 1.0f) {
                targetWidth = Math.min(width, height);
            } else if (this.forcedAspectRatio > 1.0f) {
                if (availableAspectRatio <= this.forcedAspectRatio) {
                    targetWidth = width;
                } else {
                    targetWidth = (int) (this.forcedAspectRatio * height);
                }
            } else if (availableAspectRatio >= this.forcedAspectRatio) {
                targetWidth = (int) (this.forcedAspectRatio * height);
            } else {
                targetWidth = width;
            }
            return targetWidth;
        }
        return width;
    }

    private float maxHeight() {
        float targetHeight;
        float width = (getMeasuredWidth() - this.leftSidePadding) - this.rightSidePadding;
        float height = (getMeasuredHeight() - this.topSidePadding) - this.bottomSidePadding;
        if (this.forcedAspectRatio != 0.0f) {
            float availableAspectRatio = width / height;
            if (this.forcedAspectRatio == 1.0f) {
                targetHeight = Math.min(width, height);
            } else if (this.forcedAspectRatio > 1.0f) {
                if (availableAspectRatio <= this.forcedAspectRatio) {
                    targetHeight = (int) (width / this.forcedAspectRatio);
                } else {
                    targetHeight = height;
                }
            } else if (availableAspectRatio >= this.forcedAspectRatio) {
                targetHeight = height;
            } else {
                targetHeight = (int) (width / this.forcedAspectRatio);
            }
            return targetHeight;
        }
        return height;
    }

    public boolean isTouchEnabled() {
        return this.touchEnabled;
    }

    @Override // com.vk.attachpicker.crop.CropOverlayView
    public void setTouchEnabled(boolean touchEnabled) {
        this.touchEnabled = touchEnabled;
    }
}
