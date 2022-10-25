package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import com.vk.attachpicker.gesture.MoveGestureDetector;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class AdjusterView extends View implements MoveGestureDetector.OnMoveGestureListener {
    public static final float MAX_ROTATION = 45.0f;
    private final int[] alphas;
    final int bigLine2;
    private final Paint bigLinePaint;
    final int centerCircleRadius;
    final int centerCircleTopOffset;
    private final Paint centerLinePaint;
    private final Paint circlePaint;
    private final float[] coords;
    protected float degrees;
    final int middleLine2;
    protected MoveGestureDetector moveGestureDetector;
    protected ScrollListener scrollListener;
    protected int slicesCount;
    final int smallLine2;
    private final Paint smallLinePaint;
    private boolean touchEnabled;
    private View.OnTouchListener transparentTouchListener;
    private final int visibleSlicesCount;
    private static final AccelerateInterpolator intp = new AccelerateInterpolator(0.5f);
    public static final int MAX_WIDTH = Screen.dp(315);
    private static int BLUE_COLOR = -10707738;
    private static int GRAY_COLOR = -7301991;

    /* loaded from: classes2.dex */
    public interface ScrollListener {
        void onRotate(float f);
    }

    public AdjusterView(Context context) {
        super(context);
        this.slicesCount = 200;
        this.visibleSlicesCount = 56;
        this.smallLine2 = Screen.dp(6.0f);
        this.middleLine2 = Screen.dp(6);
        this.bigLine2 = Screen.dp(16);
        this.centerCircleTopOffset = Screen.dp(4);
        this.centerCircleRadius = Screen.dp(1);
        this.smallLinePaint = new Paint();
        this.bigLinePaint = new Paint();
        this.circlePaint = new Paint();
        this.centerLinePaint = new Paint();
        this.degrees = 0.0f;
        this.touchEnabled = true;
        this.coords = new float[this.slicesCount];
        this.alphas = new int[this.slicesCount];
        init();
    }

    public AdjusterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.slicesCount = 200;
        this.visibleSlicesCount = 56;
        this.smallLine2 = Screen.dp(6.0f);
        this.middleLine2 = Screen.dp(6);
        this.bigLine2 = Screen.dp(16);
        this.centerCircleTopOffset = Screen.dp(4);
        this.centerCircleRadius = Screen.dp(1);
        this.smallLinePaint = new Paint();
        this.bigLinePaint = new Paint();
        this.circlePaint = new Paint();
        this.centerLinePaint = new Paint();
        this.degrees = 0.0f;
        this.touchEnabled = true;
        this.coords = new float[this.slicesCount];
        this.alphas = new int[this.slicesCount];
        init();
    }

    public AdjusterView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.slicesCount = 200;
        this.visibleSlicesCount = 56;
        this.smallLine2 = Screen.dp(6.0f);
        this.middleLine2 = Screen.dp(6);
        this.bigLine2 = Screen.dp(16);
        this.centerCircleTopOffset = Screen.dp(4);
        this.centerCircleRadius = Screen.dp(1);
        this.smallLinePaint = new Paint();
        this.bigLinePaint = new Paint();
        this.circlePaint = new Paint();
        this.centerLinePaint = new Paint();
        this.degrees = 0.0f;
        this.touchEnabled = true;
        this.coords = new float[this.slicesCount];
        this.alphas = new int[this.slicesCount];
        init();
    }

    private void init() {
        this.moveGestureDetector = new MoveGestureDetector(this);
        this.smallLinePaint.setColor(GRAY_COLOR);
        this.smallLinePaint.setStrokeWidth(Screen.dp(1.0f));
        this.bigLinePaint.setColor(BLUE_COLOR);
        this.bigLinePaint.setStrokeWidth(Screen.dp(1.0f));
        this.centerLinePaint.setColor(BLUE_COLOR);
        this.centerLinePaint.setStrokeWidth(Screen.dp(2.0f));
        this.centerLinePaint.setStyle(Paint.Style.STROKE);
        this.centerLinePaint.setAntiAlias(true);
        this.circlePaint.setColor(BLUE_COLOR);
        this.circlePaint.setStyle(Paint.Style.FILL);
        this.circlePaint.setAntiAlias(true);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (View.MeasureSpec.getSize(widthMeasureSpec) > MAX_WIDTH) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(MAX_WIDTH, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    public void setCurrentScroll(float degrees) {
        this.degrees = degrees;
        invalidate();
    }

    public boolean isTouchEnabled() {
        return this.touchEnabled;
    }

    public void setTransparentTouchListener(View.OnTouchListener transparentTouchListener) {
        this.transparentTouchListener = transparentTouchListener;
    }

    public void setTouchEnabled(boolean touchEnabled) {
        this.touchEnabled = touchEnabled;
    }

    public float getCurrentRotation() {
        return this.degrees;
    }

    public ScrollListener getScrollListener() {
        return this.scrollListener;
    }

    public void setScrollListener(ScrollListener scrollListener) {
        this.scrollListener = scrollListener;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (!this.touchEnabled) {
            return true;
        }
        if (this.transparentTouchListener != null) {
            this.transparentTouchListener.onTouch(this, ev);
        }
        try {
            this.moveGestureDetector.onTouchEvent(ev);
            return true;
        } catch (Throwable th) {
            return false;
        }
    }

    @Override // com.vk.attachpicker.gesture.MoveGestureDetector.OnMoveGestureListener
    public void onMove(float deltaX, float deltaY) {
        float viewWidth = getWidth();
        float rotationDelta = 45.0f * (((-deltaX) / viewWidth) / 2.0f);
        float newRot = this.degrees + rotationDelta;
        if (Math.abs(newRot) <= 45.0f) {
            this.degrees += rotationDelta;
        } else if (newRot > 0.0f) {
            this.degrees = 45.0f;
        } else {
            this.degrees = -45.0f;
        }
        if (this.scrollListener != null) {
            this.scrollListener.onRotate(this.degrees);
        }
        invalidate();
    }

    public void dropPosition() {
        this.degrees = 0.0f;
        if (this.scrollListener != null) {
            this.scrollListener.onRotate(0.0f);
        }
        invalidate();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int centerSlice = initCoords(canvas.getWidth() / 2);
        int cy = getPaddingTop() + this.bigLine2 + 1;
        for (int i = 0; i < this.coords.length; i++) {
            if (this.coords[i] >= 0.0f && this.coords[i] < canvas.getWidth()) {
                if (i == this.coords.length / 2) {
                    this.bigLinePaint.setAlpha(this.alphas[i]);
                    this.circlePaint.setAlpha(this.alphas[i]);
                    canvas.drawLine(this.coords[i], cy - this.middleLine2, this.coords[i], this.middleLine2 + cy, this.bigLinePaint);
                    canvas.drawCircle(this.coords[i], this.middleLine2 + cy + this.centerCircleTopOffset, this.centerCircleRadius, this.circlePaint);
                } else {
                    if ((i > centerSlice && i < this.coords.length / 2) || (i <= centerSlice && i > this.coords.length / 2)) {
                        this.smallLinePaint.setColor(BLUE_COLOR);
                    } else {
                        this.smallLinePaint.setColor(GRAY_COLOR);
                    }
                    this.smallLinePaint.setAlpha(this.alphas[i]);
                    canvas.drawLine(this.coords[i], cy - this.smallLine2, this.coords[i], this.smallLine2 + cy, this.smallLinePaint);
                }
            }
        }
        canvas.drawLine(canvas.getWidth() / 2, cy - this.bigLine2, canvas.getWidth() / 2, this.bigLine2 + cy, this.centerLinePaint);
    }

    private int initCoords(float halfWidth) {
        for (int i = 0; i < this.coords.length; i++) {
            this.coords[i] = -1.0f;
        }
        float scrollPosition = getCurrentRotation() / 45.0f;
        float absoluteScroll = (1.0f + scrollPosition) / 2.0f;
        float positionPlusOffset = ((this.coords.length / 2) - 28) + (56.0f * absoluteScroll);
        int centerSlice = (int) positionPlusOffset;
        float centerOffset = positionPlusOffset - centerSlice;
        for (int i2 = 0; i2 < this.slicesCount; i2++) {
            if (i2 == 0) {
                float delta = (float) (halfWidth * Math.sin((centerOffset / 20.0f) * 1.2566371f));
                this.coords[centerSlice] = halfWidth - delta;
                this.alphas[centerSlice] = 255;
            } else {
                if (centerSlice - i2 >= 0) {
                    float scale = (-((i2 - (1.0f - centerOffset)) + 1.0f)) / 20.0f;
                    if (scale <= 0.0f && scale >= -1.0f) {
                        double sin = Math.sin(1.2566371f * scale);
                        float delta2 = (float) (halfWidth * sin);
                        this.coords[centerSlice - i2] = halfWidth + delta2;
                        this.alphas[centerSlice - i2] = (int) (intp.getInterpolation((float) (1.0d + sin)) * 255.0f);
                    }
                }
                if (centerSlice + i2 < this.coords.length) {
                    float scale2 = ((i2 + (1.0f - centerOffset)) - 1.0f) / 20.0f;
                    if (scale2 >= 0.0f && scale2 <= 1.0f) {
                        double sin2 = Math.sin(1.2566371f * scale2);
                        float delta3 = (float) (halfWidth * sin2);
                        this.coords[centerSlice + i2] = halfWidth + delta3;
                        this.alphas[centerSlice + i2] = (int) (intp.getInterpolation((float) (1.0d - sin2)) * 255.0f);
                    }
                }
            }
        }
        return centerSlice;
    }
}
