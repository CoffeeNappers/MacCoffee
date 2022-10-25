package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Build;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class CircularProgressView extends View {
    private static final float INDETERMINANT_MIN_SWEEP = 15.0f;
    private float actualProgress;
    private int animDuration;
    private int animSteps;
    private int animSwoopDuration;
    private int animSyncDuration;
    private boolean autostartAnimation;
    private RectF bounds;
    private int color;
    private float currentProgress;
    private AnimatorSet indeterminateAnimator;
    private float indeterminateRotateOffset;
    private float indeterminateSweep;
    private float initialStartAngle;
    private boolean isIndeterminate;
    private float maxProgress;
    private Paint paint;
    private ValueAnimator progressAnimator;
    private int size;
    private float startAngle;
    private ValueAnimator startAngleRotate;
    private int thickness;

    public CircularProgressView(Context context) {
        super(context);
        this.size = 0;
        init(null, 0);
    }

    public CircularProgressView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.size = 0;
        init(attrs, 0);
    }

    public CircularProgressView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.size = 0;
        init(attrs, defStyle);
    }

    protected void init(AttributeSet attrs, int defStyle) {
        initAttributes(attrs, defStyle);
        this.paint = new Paint(1);
        updatePaint();
        this.bounds = new RectF();
    }

    private void initAttributes(AttributeSet attrs, int defStyle) {
        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.CircularProgressView, defStyle, 0);
        Resources resources = getResources();
        this.currentProgress = a.getFloat(0, resources.getInteger(R.integer.cpv_default_progress));
        this.maxProgress = a.getFloat(1, resources.getInteger(R.integer.cpv_default_max_progress));
        this.thickness = a.getDimensionPixelSize(6, resources.getDimensionPixelSize(R.dimen.cpv_default_thickness));
        this.isIndeterminate = a.getBoolean(7, resources.getBoolean(R.bool.cpv_default_is_indeterminate));
        this.autostartAnimation = a.getBoolean(8, resources.getBoolean(R.bool.cpv_default_anim_autostart));
        this.initialStartAngle = a.getFloat(10, resources.getInteger(R.integer.cpv_default_start_angle));
        this.startAngle = this.initialStartAngle;
        int accentColor = getContext().getResources().getIdentifier("colorAccent", "attr", getContext().getPackageName());
        if (a.hasValue(5)) {
            this.color = a.getColor(5, resources.getColor(R.color.cpv_default_color));
        } else if (accentColor != 0) {
            TypedValue t = new TypedValue();
            getContext().getTheme().resolveAttribute(accentColor, t, true);
            this.color = t.data;
        } else if (Build.VERSION.SDK_INT >= 21) {
            this.color = getContext().obtainStyledAttributes(new int[]{16843829}).getColor(0, resources.getColor(R.color.cpv_default_color));
        } else {
            this.color = resources.getColor(R.color.cpv_default_color);
        }
        this.animDuration = a.getInteger(2, resources.getInteger(R.integer.cpv_default_anim_duration));
        this.animSwoopDuration = a.getInteger(3, resources.getInteger(R.integer.cpv_default_anim_swoop_duration));
        this.animSyncDuration = a.getInteger(4, resources.getInteger(R.integer.cpv_default_anim_sync_duration));
        this.animSteps = a.getInteger(9, resources.getInteger(R.integer.cpv_default_anim_steps));
        a.recycle();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int xPad = getPaddingLeft() + getPaddingRight();
        int yPad = getPaddingTop() + getPaddingBottom();
        int width = getMeasuredWidth() - xPad;
        int height = getMeasuredHeight() - yPad;
        if (width >= height) {
            width = height;
        }
        this.size = width;
        setMeasuredDimension(this.size + xPad, this.size + yPad);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w >= h) {
            w = h;
        }
        this.size = w;
        updateBounds();
    }

    private void updateBounds() {
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        this.bounds.set(this.thickness + paddingLeft, this.thickness + paddingTop, (this.size - paddingLeft) - this.thickness, (this.size - paddingTop) - this.thickness);
    }

    private void updatePaint() {
        this.paint.setColor(this.color);
        this.paint.setStyle(Paint.Style.STROKE);
        this.paint.setStrokeWidth(this.thickness);
        this.paint.setStrokeCap(Paint.Cap.ROUND);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float sweepAngle = isInEditMode() ? (this.currentProgress / this.maxProgress) * 360.0f : (this.actualProgress / this.maxProgress) * 360.0f;
        if (!this.isIndeterminate) {
            canvas.drawArc(this.bounds, this.startAngle, sweepAngle, false, this.paint);
        } else {
            canvas.drawArc(this.bounds, this.startAngle + this.indeterminateRotateOffset, this.indeterminateSweep, false, this.paint);
        }
    }

    public boolean isIndeterminate() {
        return this.isIndeterminate;
    }

    public void setIndeterminate(boolean isIndeterminate) {
        boolean reset = this.isIndeterminate == isIndeterminate;
        this.isIndeterminate = isIndeterminate;
        if (reset) {
            resetAnimation();
        }
    }

    public int getThickness() {
        return this.thickness;
    }

    public void setThickness(int thickness) {
        this.thickness = thickness;
        updatePaint();
        updateBounds();
        invalidate();
    }

    public int getColor() {
        return this.color;
    }

    public void setColor(int color) {
        this.color = color;
        updatePaint();
        invalidate();
    }

    public float getMaxProgress() {
        return this.maxProgress;
    }

    public void setMaxProgress(float maxProgress) {
        this.maxProgress = maxProgress;
        invalidate();
    }

    public float getProgress() {
        return this.currentProgress;
    }

    public void setProgress(float currentProgress) {
        this.currentProgress = currentProgress;
        if (!this.isIndeterminate) {
            if (this.progressAnimator != null && this.progressAnimator.isRunning()) {
                this.progressAnimator.cancel();
            }
            this.progressAnimator = ValueAnimator.ofFloat(this.actualProgress, currentProgress);
            this.progressAnimator.setDuration(this.animSyncDuration);
            this.progressAnimator.setInterpolator(new LinearInterpolator());
            this.progressAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.1
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator animation) {
                    CircularProgressView.this.actualProgress = ((Float) animation.getAnimatedValue()).floatValue();
                    CircularProgressView.this.invalidate();
                }
            });
            this.progressAnimator.start();
        }
        invalidate();
    }

    public void setProgressNoAnim(float currentProgress) {
        this.actualProgress = currentProgress;
        this.currentProgress = currentProgress;
        invalidate();
    }

    public void startAnimation() {
        resetAnimation();
    }

    public void resetAnimation() {
        if (this.startAngleRotate != null && this.startAngleRotate.isRunning()) {
            this.startAngleRotate.cancel();
        }
        if (this.progressAnimator != null && this.progressAnimator.isRunning()) {
            this.progressAnimator.cancel();
        }
        if (this.indeterminateAnimator != null && this.indeterminateAnimator.isRunning()) {
            this.indeterminateAnimator.cancel();
        }
        if (!this.isIndeterminate) {
            this.startAngle = this.initialStartAngle;
            this.startAngleRotate = ValueAnimator.ofFloat(this.startAngle, this.startAngle + 360.0f);
            if (this.animSwoopDuration > 0) {
                this.startAngleRotate.setDuration(this.animSwoopDuration);
                this.startAngleRotate.setInterpolator(new DecelerateInterpolator(2.0f));
            } else {
                this.startAngleRotate.setDuration(2500L);
                this.startAngleRotate.setRepeatCount(-1);
                this.startAngleRotate.setInterpolator(new LinearInterpolator());
            }
            this.startAngleRotate.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.2
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator animation) {
                    CircularProgressView.this.startAngle = ((Float) animation.getAnimatedValue()).floatValue();
                    CircularProgressView.this.invalidate();
                }
            });
            this.startAngleRotate.start();
            this.actualProgress = 0.0f;
            this.progressAnimator = ValueAnimator.ofFloat(this.actualProgress, this.currentProgress);
            this.progressAnimator.setDuration(this.animSyncDuration);
            this.progressAnimator.setInterpolator(new LinearInterpolator());
            this.progressAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.3
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator animation) {
                    CircularProgressView.this.actualProgress = ((Float) animation.getAnimatedValue()).floatValue();
                    CircularProgressView.this.invalidate();
                }
            });
            this.progressAnimator.start();
            return;
        }
        this.indeterminateSweep = INDETERMINANT_MIN_SWEEP;
        this.indeterminateAnimator = new AnimatorSet();
        AnimatorSet prevSet = null;
        for (int k = 0; k < this.animSteps; k++) {
            AnimatorSet nextSet = createIndeterminateAnimator(k);
            AnimatorSet.Builder builder = this.indeterminateAnimator.play(nextSet);
            if (prevSet != null) {
                builder.after(prevSet);
            }
            prevSet = nextSet;
        }
        this.indeterminateAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.CircularProgressView.4
            boolean wasCancelled = false;

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                this.wasCancelled = true;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                if (!this.wasCancelled) {
                    CircularProgressView.this.resetAnimation();
                }
            }
        });
        this.indeterminateAnimator.start();
    }

    public void stopAnimation() {
        if (this.startAngleRotate != null) {
            this.startAngleRotate.cancel();
            this.startAngleRotate = null;
        }
        if (this.progressAnimator != null) {
            this.progressAnimator.cancel();
            this.progressAnimator = null;
        }
        if (this.indeterminateAnimator != null) {
            this.indeterminateAnimator.cancel();
            this.indeterminateAnimator = null;
        }
    }

    private AnimatorSet createIndeterminateAnimator(float step) {
        final float maxSweep = ((360.0f * (this.animSteps - 1)) / this.animSteps) + INDETERMINANT_MIN_SWEEP;
        final float start = (-90.0f) + ((maxSweep - INDETERMINANT_MIN_SWEEP) * step);
        ValueAnimator frontEndExtend = ValueAnimator.ofFloat(INDETERMINANT_MIN_SWEEP, maxSweep);
        frontEndExtend.setDuration((this.animDuration / this.animSteps) / 2);
        frontEndExtend.setInterpolator(new DecelerateInterpolator(1.0f));
        frontEndExtend.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.5
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                CircularProgressView.this.indeterminateSweep = ((Float) animation.getAnimatedValue()).floatValue();
                CircularProgressView.this.invalidate();
            }
        });
        ValueAnimator rotateAnimator1 = ValueAnimator.ofFloat((720.0f * step) / this.animSteps, ((0.5f + step) * 720.0f) / this.animSteps);
        rotateAnimator1.setDuration((this.animDuration / this.animSteps) / 2);
        rotateAnimator1.setInterpolator(new LinearInterpolator());
        rotateAnimator1.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.6
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                CircularProgressView.this.indeterminateRotateOffset = ((Float) animation.getAnimatedValue()).floatValue();
            }
        });
        ValueAnimator backEndRetract = ValueAnimator.ofFloat(start, (start + maxSweep) - INDETERMINANT_MIN_SWEEP);
        backEndRetract.setDuration((this.animDuration / this.animSteps) / 2);
        backEndRetract.setInterpolator(new DecelerateInterpolator(1.0f));
        backEndRetract.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.7
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                CircularProgressView.this.startAngle = ((Float) animation.getAnimatedValue()).floatValue();
                CircularProgressView.this.indeterminateSweep = (maxSweep - CircularProgressView.this.startAngle) + start;
                CircularProgressView.this.invalidate();
            }
        });
        ValueAnimator rotateAnimator2 = ValueAnimator.ofFloat(((0.5f + step) * 720.0f) / this.animSteps, ((1.0f + step) * 720.0f) / this.animSteps);
        rotateAnimator2.setDuration((this.animDuration / this.animSteps) / 2);
        rotateAnimator2.setInterpolator(new LinearInterpolator());
        rotateAnimator2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.CircularProgressView.8
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                CircularProgressView.this.indeterminateRotateOffset = ((Float) animation.getAnimatedValue()).floatValue();
            }
        });
        AnimatorSet set = new AnimatorSet();
        set.play(frontEndExtend).with(rotateAnimator1);
        set.play(backEndRetract).with(rotateAnimator2).after(rotateAnimator1);
        return set;
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.autostartAnimation) {
            startAnimation();
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        stopAnimation();
    }

    @Override // android.view.View
    public void setVisibility(int visibility) {
        int currentVisibility = getVisibility();
        super.setVisibility(visibility);
        if (visibility != currentVisibility) {
            if (visibility == 0) {
                resetAnimation();
            } else if (visibility == 8 || visibility == 4) {
                stopAnimation();
            }
        }
    }
}
