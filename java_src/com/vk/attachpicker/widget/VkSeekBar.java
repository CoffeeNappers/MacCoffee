package com.vk.attachpicker.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import com.vk.attachpicker.gesture.MoveGestureDetector;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.SearchViewWrapper;
/* loaded from: classes2.dex */
public class VkSeekBar extends View implements MoveGestureDetector.OnMoveGestureListener {
    public static final int MAX_WIDTH = Screen.dp((int) SearchViewWrapper.CONFIRM_TIMEOUT);
    private final int DP5;
    private int blueColor;
    private float currentValue;
    private boolean limitWidth;
    private final int lineHeight;
    private final Paint linePaint;
    private OnSeekBarChangeListener listener;
    private final MoveGestureDetector moveGestureDetector;
    private float moveTotalDeltaX;
    private final boolean overlayMode;
    private final Paint selectedPaint;
    private final int startPointHeight;
    private final float startValue;
    private OnSeekBarStateListener stateListener;
    private Drawable thumbDrawable;
    private final int thumbSize;

    /* loaded from: classes2.dex */
    public interface OnSeekBarChangeListener {
        void onOnSeekBarValueChange(VkSeekBar vkSeekBar, float f);
    }

    /* loaded from: classes2.dex */
    public interface OnSeekBarStateListener {
        void onMoveBegin();

        void onMoveEnd(float f);
    }

    public VkSeekBar(Context context) {
        this(context, null);
    }

    public VkSeekBar(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public VkSeekBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.DP5 = Screen.dp(5);
        this.linePaint = new Paint(1);
        this.selectedPaint = new Paint(1);
        this.thumbSize = Screen.dp(16);
        this.lineHeight = Screen.dp(2);
        this.startPointHeight = Screen.dp(2);
        this.currentValue = 0.0f;
        this.moveTotalDeltaX = 0.0f;
        this.limitWidth = true;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.VkSeekBar, 0, 0);
        float startValue = a.getFloat(0, 0.0f);
        boolean overlayMode = a.getBoolean(2, false);
        a.getResourceId(1, 0);
        a.recycle();
        this.startValue = startValue;
        this.overlayMode = overlayMode;
        this.moveGestureDetector = new MoveGestureDetector(this);
        if (overlayMode) {
            this.linePaint.setColor(1056964608);
        } else {
            this.linePaint.setColor(1056964608);
        }
        this.blueColor = ContextCompat.getColor(context, R.color.picker_blue);
        this.selectedPaint.setColor(this.blueColor);
    }

    public void setOnSeekBarChangeListener(OnSeekBarChangeListener listener) {
        this.listener = listener;
    }

    public void setStateListener(OnSeekBarStateListener stateListener) {
        this.stateListener = stateListener;
    }

    public void setValue(float value) {
        setValue(value, true);
    }

    public void setValue(float value, boolean publishProgress) {
        this.currentValue = clamp(value);
        if (publishProgress) {
            publishProgress(true);
        }
        invalidate();
    }

    public void setThumbDrawable(int resId) {
        this.thumbDrawable = getResources().getDrawable(resId);
    }

    public void setLimitWidth(boolean limitWidth) {
        this.limitWidth = limitWidth;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.limitWidth && View.MeasureSpec.getSize(widthMeasureSpec) > MAX_WIDTH) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(MAX_WIDTH, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // com.vk.attachpicker.gesture.MoveGestureDetector.OnMoveGestureListener
    public void onMove(float deltaX, float deltaY) {
        this.moveTotalDeltaX += Math.abs(deltaX);
        if (this.moveTotalDeltaX > this.DP5) {
            attemptClaimDrag();
        }
        int currentPixels = progressToPixels(this.currentValue);
        int newPixels = (int) (currentPixels + deltaX);
        float newProgress = pixelsToProgress(newPixels);
        if (newProgress >= 0.0f && newProgress <= 1.0f) {
            this.currentValue = newProgress;
            invalidate();
            publishProgress(false);
        }
    }

    public void onMoveBegin() {
        this.moveTotalDeltaX = 0.0f;
        if (this.stateListener != null) {
            this.stateListener.onMoveBegin();
        }
    }

    public void onMoveEnd() {
        publishProgress(true);
        if (this.stateListener != null) {
            this.stateListener.onMoveEnd(this.currentValue);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (!isEnabled()) {
            invalidate();
            return false;
        }
        switch (ev.getAction()) {
            case 0:
                onMoveBegin();
                break;
            case 1:
            case 3:
                onMoveEnd();
                break;
        }
        attemptClaimDragFromViewPager();
        return this.moveGestureDetector.onTouchEvent(ev);
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        float left;
        float right;
        super.onDraw(canvas);
        if (isEnabled()) {
            this.selectedPaint.setColor(this.blueColor);
        } else {
            this.selectedPaint.setColor(-9342604);
        }
        canvas.drawRect(getPaddingLeft(), (canvas.getHeight() / 2) - (this.lineHeight / 2), canvas.getWidth() - getPaddingRight(), (canvas.getHeight() / 2) + (this.lineHeight / 2), this.linePaint);
        canvas.drawCircle(getPaddingLeft() + (getSlideArea() * this.startValue), canvas.getHeight() / 2, this.startPointHeight / 2, this.selectedPaint);
        if (this.currentValue < this.startValue) {
            left = getPaddingLeft() + (getSlideArea() * this.currentValue);
            right = getPaddingLeft() + (getSlideArea() * this.startValue);
        } else if (this.currentValue > this.startValue) {
            left = getPaddingLeft() + (getSlideArea() * this.startValue);
            right = getPaddingLeft() + (getSlideArea() * this.currentValue);
        } else {
            left = 0.0f;
            right = 0.0f;
        }
        if (left != right) {
            canvas.drawRect(left, (canvas.getHeight() / 2) - (this.lineHeight / 2), right, (canvas.getHeight() / 2) + (this.lineHeight / 2), this.selectedPaint);
        }
        if (this.thumbDrawable != null) {
            int centerX = (int) (getPaddingLeft() + (getSlideArea() * this.currentValue));
            int centerY = canvas.getHeight() / 2;
            this.thumbDrawable.setBounds((int) (centerX - (this.thumbSize / 1.3f)), (int) (centerY - (this.thumbSize / 1.3f)), (int) (centerX + (this.thumbSize / 1.3f)), (int) (centerY + (this.thumbSize / 1.3f)));
            this.thumbDrawable.draw(canvas);
            return;
        }
        canvas.drawCircle(getPaddingLeft() + (getSlideArea() * this.currentValue), canvas.getHeight() / 2, this.thumbSize / 2, this.selectedPaint);
    }

    private void attemptClaimDrag() {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(true);
        }
    }

    private void attemptClaimDragFromViewPager() {
        for (ViewParent parent = getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof ViewPager) {
                parent.requestDisallowInterceptTouchEvent(true);
                return;
            }
        }
    }

    private float pixelsToProgress(int pixels) {
        return pixels / getSlideArea();
    }

    private int progressToPixels(float progress) {
        return (int) (getSlideArea() * progress);
    }

    private int getSlideArea() {
        return (getWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private float clamp(float value) {
        return Math.min(1.0f, Math.max(0.0f, value));
    }

    private void publishProgress(boolean force) {
        if (this.listener != null) {
            this.listener.onOnSeekBarValueChange(this, this.currentValue);
        }
    }
}
