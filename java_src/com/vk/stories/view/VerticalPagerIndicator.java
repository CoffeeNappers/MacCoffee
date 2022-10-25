package com.vk.stories.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Property;
import android.util.TypedValue;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class VerticalPagerIndicator extends View {
    private int circleInterval;
    private int circleSize;
    private int colorNotSelected;
    private int colorSelected;
    private ObjectAnimator currentOffsetAnimator;
    private int currentPosition;
    private float currentScrollOffset;
    private int itemsCount;
    private final Paint paint;
    private final Paint strokePaint;
    private static final DecelerateInterpolator interpolator = new DecelerateInterpolator();
    public static final Property<VerticalPagerIndicator, Float> CURRENT_SCROLL_OFFSET = new Property<VerticalPagerIndicator, Float>(Float.class, "currentScrollOffset") { // from class: com.vk.stories.view.VerticalPagerIndicator.1
        @Override // android.util.Property
        public void set(VerticalPagerIndicator object, Float value) {
            object.setCurrentScrollOffset(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(VerticalPagerIndicator object) {
            return Float.valueOf(object.getCurrentScrollOffset());
        }
    };

    public VerticalPagerIndicator(Context context) {
        super(context);
        this.paint = new Paint(1);
        this.strokePaint = new Paint(1);
        this.circleSize = 24;
        this.circleInterval = this.circleSize * 2;
        this.colorSelected = -1;
        this.colorNotSelected = Integer.MAX_VALUE;
        init();
    }

    public VerticalPagerIndicator(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.paint = new Paint(1);
        this.strokePaint = new Paint(1);
        this.circleSize = 24;
        this.circleInterval = this.circleSize * 2;
        this.colorSelected = -1;
        this.colorNotSelected = Integer.MAX_VALUE;
        init();
    }

    public VerticalPagerIndicator(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.paint = new Paint(1);
        this.strokePaint = new Paint(1);
        this.circleSize = 24;
        this.circleInterval = this.circleSize * 2;
        this.colorSelected = -1;
        this.colorNotSelected = Integer.MAX_VALUE;
        init();
    }

    private void init() {
        this.circleSize = (int) TypedValue.applyDimension(1, 8.0f, getResources().getDisplayMetrics());
        this.circleInterval = (int) TypedValue.applyDimension(1, 16.0f, getResources().getDisplayMetrics());
        this.paint.setStyle(Paint.Style.FILL);
        this.strokePaint.setStyle(Paint.Style.STROKE);
        this.strokePaint.setColor(1140850688);
        this.strokePaint.setStrokeWidth(Screen.dp(0.5f));
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float realSize;
        if (this.itemsCount > 1) {
            int cx = canvas.getWidth() / 2;
            for (int i = 0; i < this.itemsCount; i++) {
                int cy = (int) (getRawYForPosition(i) + this.currentScrollOffset);
                if (cy > 0 && cy < canvas.getHeight()) {
                    if (cy < canvas.getHeight() / 2 && i == 0) {
                        float sizeScale = cy / this.circleInterval;
                        realSize = this.circleSize * sizeScale;
                    } else if (cy < canvas.getHeight() / 2) {
                        float sizeScale2 = cy / (this.circleInterval * 2);
                        realSize = this.circleSize * sizeScale2;
                    } else if (i == this.itemsCount - 1) {
                        float sizeScale3 = (canvas.getHeight() - cy) / this.circleInterval;
                        realSize = this.circleSize * sizeScale3;
                    } else {
                        float sizeScale4 = (canvas.getHeight() - cy) / (this.circleInterval * 2);
                        realSize = this.circleSize * sizeScale4;
                    }
                    float realSize2 = Math.min(this.circleSize, Math.max(0.0f, realSize));
                    if (this.currentPosition == i) {
                        this.paint.setColor(this.colorSelected);
                    } else {
                        this.paint.setColor(this.colorNotSelected);
                    }
                    canvas.drawCircle(cx, cy, realSize2 / 2.0f, this.paint);
                    canvas.drawCircle(cx, cy, realSize2 / 2.0f, this.strokePaint);
                }
            }
        }
    }

    public int getItemsCount() {
        return this.itemsCount;
    }

    public void setItemsCount(int itemsCount) {
        this.itemsCount = itemsCount;
        invalidate();
    }

    public int getCurrentPosition() {
        return this.currentPosition;
    }

    public void setCurrentPosition(int position) {
        setCurrentPosition(position, false);
    }

    public void setCurrentPosition(final int position, final boolean animated) {
        Runnable r = new Runnable() { // from class: com.vk.stories.view.VerticalPagerIndicator.2
            @Override // java.lang.Runnable
            public void run() {
                int rawY = VerticalPagerIndicator.this.getRawYForPosition(position);
                int currentY = (int) (rawY + VerticalPagerIndicator.this.currentScrollOffset);
                if (currentY <= VerticalPagerIndicator.this.circleInterval || currentY >= VerticalPagerIndicator.this.getMeasuredHeight() - VerticalPagerIndicator.this.circleInterval) {
                    float newOffset = VerticalPagerIndicator.this.currentScrollOffset;
                    if (position >= VerticalPagerIndicator.this.currentPosition || position != 0) {
                        if (position <= VerticalPagerIndicator.this.currentPosition || position != VerticalPagerIndicator.this.itemsCount - 1) {
                            if (position < VerticalPagerIndicator.this.currentPosition) {
                                newOffset = (VerticalPagerIndicator.this.circleInterval * 2) - rawY;
                            } else if (position > VerticalPagerIndicator.this.currentPosition) {
                                newOffset = (VerticalPagerIndicator.this.getMeasuredHeight() - (VerticalPagerIndicator.this.circleInterval * 2)) - rawY;
                            }
                        } else {
                            newOffset = (VerticalPagerIndicator.this.getMeasuredHeight() - VerticalPagerIndicator.this.circleInterval) - rawY;
                        }
                    } else {
                        newOffset = VerticalPagerIndicator.this.circleInterval - rawY;
                    }
                    VerticalPagerIndicator.this.currentPosition = position;
                    if (animated) {
                        VerticalPagerIndicator.this.animateScrollOffsetTo(newOffset);
                        return;
                    } else {
                        VerticalPagerIndicator.this.setCurrentScrollOffset(newOffset);
                        return;
                    }
                }
                VerticalPagerIndicator.this.currentPosition = position;
                VerticalPagerIndicator.this.invalidate();
            }
        };
        if (getMeasuredHeight() > 0) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }

    public float getCurrentScrollOffset() {
        return this.currentScrollOffset;
    }

    public void setCurrentScrollOffset(float currentScrollOffset) {
        this.currentScrollOffset = currentScrollOffset;
        invalidate();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateScrollOffsetTo(float offset) {
        if (this.currentOffsetAnimator != null) {
            this.currentOffsetAnimator.cancel();
        }
        this.currentOffsetAnimator = ObjectAnimator.ofFloat(this, CURRENT_SCROLL_OFFSET, offset);
        this.currentOffsetAnimator.setInterpolator(interpolator);
        this.currentOffsetAnimator.setDuration(200L);
        this.currentOffsetAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.VerticalPagerIndicator.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                VerticalPagerIndicator.this.currentOffsetAnimator = null;
            }
        });
        this.currentOffsetAnimator.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getRawYForPosition(int position) {
        return this.circleInterval + (this.circleInterval * position);
    }
}
