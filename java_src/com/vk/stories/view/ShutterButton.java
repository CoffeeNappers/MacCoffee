package com.vk.stories.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Property;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class ShutterButton extends View {
    private static final float SHADOW_RATIO = 1.36f;
    public static final int SHUTTER_STATE_MASKS = 1;
    public static final int SHUTTER_STATE_PHOTO = 0;
    public static final int SHUTTER_STATE_RECORDING = 2;
    public static final int SHUTTER_STATE_SHARE = 3;
    private static final int redColor = -1685946;
    private static final int whiteColor = -1;
    private static final int whiteColorPressed = -1315360;
    private AnimatorSet animator;
    private Bitmap bgShadow;
    private final Paint bitmapPaint;
    private float borderSize;
    private final float buttonSize;
    private float circleRadius;
    private Bitmap forwardArrow;
    private float forwardArrowAlpha;
    private final float fullArrowSize;
    private final RectF rectF;
    private final Paint redCirclePaint;
    private float redProgress;
    private float redProgressAlpha;
    private int shutterState;
    private final RectF touchRect;
    private final Paint whiteCirclePaint;
    public static final Property<ShutterButton, Float> CIRCLE_RADIUS = new Property<ShutterButton, Float>(Float.class, "circleRadius") { // from class: com.vk.stories.view.ShutterButton.1
        @Override // android.util.Property
        public void set(ShutterButton object, Float value) {
            object.setCircleRadius(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(ShutterButton object) {
            return Float.valueOf(object.getCircleRadius());
        }
    };
    public static final Property<ShutterButton, Float> BORDER_SIZE = new Property<ShutterButton, Float>(Float.class, "borderSize") { // from class: com.vk.stories.view.ShutterButton.2
        @Override // android.util.Property
        public void set(ShutterButton object, Float value) {
            object.setBorderSize(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(ShutterButton object) {
            return Float.valueOf(object.getBorderSize());
        }
    };
    public static final Property<ShutterButton, Float> RED_PROGRESS = new Property<ShutterButton, Float>(Float.class, "redProgress") { // from class: com.vk.stories.view.ShutterButton.3
        @Override // android.util.Property
        public void set(ShutterButton object, Float value) {
            object.setRedProgress(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(ShutterButton object) {
            return Float.valueOf(object.getRedProgress());
        }
    };
    public static final Property<ShutterButton, Float> RED_PROGRESS_ALPHA = new Property<ShutterButton, Float>(Float.class, "redProgressAlpha") { // from class: com.vk.stories.view.ShutterButton.4
        @Override // android.util.Property
        public void set(ShutterButton object, Float value) {
            object.setRedProgressAlpha(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(ShutterButton object) {
            return Float.valueOf(object.getRedProgressAlpha());
        }
    };
    public static final Property<ShutterButton, Float> FORWARD_ARROW_ALPHA = new Property<ShutterButton, Float>(Float.class, "forwardArrowAlpha") { // from class: com.vk.stories.view.ShutterButton.5
        @Override // android.util.Property
        public void set(ShutterButton object, Float value) {
            object.setForwardArrowAlpha(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(ShutterButton object) {
            return Float.valueOf(object.getForwardArrowAlpha());
        }
    };
    private static final int MASKS_RADIUS = Screen.dp(56) / 2;
    private static final int NORMAL_RADIUS = Screen.dp(72) / 2;
    private static final int VIDEO_RADIUS = Screen.dp(96) / 2;
    private static final int SHARE_RADIUS = Screen.dp(56) / 2;
    private static final int MASKS_BORDER = Screen.dp(6);
    private static final int NORMAL_BORDER = Screen.dp(6);
    private static final int VIDEO_BORDER = Screen.dp(8);
    private static final int SHARE_BORDER = SHARE_RADIUS;

    public ShutterButton(Context context) {
        super(context);
        this.buttonSize = Screen.dp(110);
        this.fullArrowSize = Screen.dp(48);
        this.whiteCirclePaint = new Paint(1);
        this.redCirclePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.rectF = new RectF();
        this.touchRect = new RectF();
        this.circleRadius = NORMAL_RADIUS;
        this.forwardArrowAlpha = 0.0f;
        this.borderSize = NORMAL_BORDER;
        this.redProgress = 0.0f;
        this.redProgressAlpha = 0.0f;
        this.shutterState = 0;
        init();
    }

    public ShutterButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.buttonSize = Screen.dp(110);
        this.fullArrowSize = Screen.dp(48);
        this.whiteCirclePaint = new Paint(1);
        this.redCirclePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.rectF = new RectF();
        this.touchRect = new RectF();
        this.circleRadius = NORMAL_RADIUS;
        this.forwardArrowAlpha = 0.0f;
        this.borderSize = NORMAL_BORDER;
        this.redProgress = 0.0f;
        this.redProgressAlpha = 0.0f;
        this.shutterState = 0;
        init();
    }

    public ShutterButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.buttonSize = Screen.dp(110);
        this.fullArrowSize = Screen.dp(48);
        this.whiteCirclePaint = new Paint(1);
        this.redCirclePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.rectF = new RectF();
        this.touchRect = new RectF();
        this.circleRadius = NORMAL_RADIUS;
        this.forwardArrowAlpha = 0.0f;
        this.borderSize = NORMAL_BORDER;
        this.redProgress = 0.0f;
        this.redProgressAlpha = 0.0f;
        this.shutterState = 0;
        init();
    }

    private void init() {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = false;
        this.bgShadow = BitmapFactory.decodeResource(getResources(), R.drawable.bg_fab_nofill_shadow, options);
        this.forwardArrow = BitmapFactory.decodeResource(getResources(), R.drawable.ic_forward_48dp, options);
        this.whiteCirclePaint.setColor(-1);
        this.whiteCirclePaint.setStyle(Paint.Style.STROKE);
        this.redCirclePaint.setColor(redColor);
        this.redCirclePaint.setStyle(Paint.Style.STROKE);
        toPhotoShutter(false);
    }

    private void fillTouchRect() {
        float cx = getWidth() / 2;
        float cy = getHeight() / 2;
        this.touchRect.set(cx - this.circleRadius, cy - this.circleRadius, this.circleRadius + cx, this.circleRadius + cy);
    }

    public boolean canHandleTouch(MotionEvent event) {
        return this.touchRect.contains(event.getX(), event.getY());
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        fillTouchRect();
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float cx = canvas.getWidth() / 2;
        float cy = canvas.getHeight() / 2;
        float radius = (this.circleRadius - 1.0f) - (this.borderSize / 2.0f);
        float shadowSize = this.circleRadius * SHADOW_RATIO;
        this.rectF.set(cx - shadowSize, cy - shadowSize, cx + shadowSize, cy + shadowSize);
        this.bitmapPaint.setAlpha(255);
        canvas.drawBitmap(this.bgShadow, (Rect) null, this.rectF, this.bitmapPaint);
        this.whiteCirclePaint.setStrokeWidth(this.borderSize);
        canvas.drawCircle(cx, cy, radius, this.whiteCirclePaint);
        this.redCirclePaint.setStrokeWidth(this.borderSize);
        this.redCirclePaint.setAlpha((int) (this.redProgressAlpha * 255.0f));
        fillRectFWithCircleSize(cx, cy, this.rectF, radius);
        canvas.drawArc(this.rectF, -90.0f, this.redProgress * 360.0f, false, this.redCirclePaint);
        int arrowSize = (int) (this.fullArrowSize / 2.0f);
        this.rectF.set(cx - arrowSize, cy - arrowSize, arrowSize + cx, arrowSize + cy);
        this.bitmapPaint.setAlpha((int) (this.forwardArrowAlpha * 255.0f));
        canvas.drawBitmap(this.forwardArrow, (Rect) null, this.rectF, this.bitmapPaint);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction() & 255;
        if (action == 0 && !canHandleTouch(event)) {
            return false;
        }
        if (action == 0) {
            this.whiteCirclePaint.setColor(whiteColorPressed);
        } else if (action == 1 || action == 3) {
            this.whiteCirclePaint.setColor(-1);
        }
        invalidate();
        return super.onTouchEvent(event);
    }

    @Override // android.view.View
    public void setPressed(boolean pressed) {
        super.setPressed(pressed);
        if (pressed) {
            this.whiteCirclePaint.setColor(whiteColorPressed);
        } else {
            this.whiteCirclePaint.setColor(-1);
        }
        invalidate();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec((int) this.buttonSize, 1073741824), View.MeasureSpec.makeMeasureSpec((int) this.buttonSize, 1073741824));
    }

    public int getShutterState() {
        return this.shutterState;
    }

    public float getCircleRadius() {
        return this.circleRadius;
    }

    public void setCircleRadius(float circleRadius) {
        this.circleRadius = circleRadius;
        fillTouchRect();
        invalidate();
    }

    public float getBorderSize() {
        return this.borderSize;
    }

    public void setBorderSize(float borderSize) {
        this.borderSize = borderSize;
        invalidate();
    }

    public float getForwardArrowAlpha() {
        return this.forwardArrowAlpha;
    }

    public void setForwardArrowAlpha(float forwardArrowAlpha) {
        this.forwardArrowAlpha = forwardArrowAlpha;
        invalidate();
    }

    public float getRedProgress() {
        return this.redProgress;
    }

    public void setRedProgress(float redProgress) {
        this.redProgress = redProgress;
        invalidate();
    }

    public float getRedProgressAlpha() {
        return this.redProgressAlpha;
    }

    public void setRedProgressAlpha(float redProgressAlpha) {
        this.redProgressAlpha = redProgressAlpha;
        invalidate();
    }

    public AnimatorSet toPhotoShutter(boolean anim) {
        this.shutterState = 0;
        cancelCurrentAnimator();
        if (anim) {
            this.animator = createAnimatorSet();
            this.animator.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, RED_PROGRESS_ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, FORWARD_ARROW_ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, CIRCLE_RADIUS, NORMAL_RADIUS).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, BORDER_SIZE, NORMAL_BORDER).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_X, 0.0f).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_Y, 0.0f).setDuration(375L)));
            this.animator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.ShutterButton.6
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ShutterButton.this.setRedProgress(0.0f);
                }
            });
            this.animator.start();
        } else {
            setRedProgress(0.0f);
            setRedProgressAlpha(0.0f);
            setForwardArrowAlpha(0.0f);
            setCircleRadius(NORMAL_RADIUS);
            setBorderSize(NORMAL_BORDER);
            setTranslationX(0.0f);
            setTranslationY(0.0f);
        }
        return this.animator;
    }

    public AnimatorSet toRecordingShutter(boolean anim) {
        this.shutterState = 2;
        setRedProgress(0.0f);
        cancelCurrentAnimator();
        if (anim) {
            this.animator = createAnimatorSet();
            this.animator.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, RED_PROGRESS_ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, FORWARD_ARROW_ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, CIRCLE_RADIUS, VIDEO_RADIUS).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, BORDER_SIZE, VIDEO_BORDER).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_X, 0.0f).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_Y, 0.0f).setDuration(375L)));
            this.animator.start();
        } else {
            setRedProgressAlpha(1.0f);
            setForwardArrowAlpha(0.0f);
            setCircleRadius(VIDEO_RADIUS);
            setBorderSize(VIDEO_BORDER);
            setTranslationX(0.0f);
            setTranslationY(0.0f);
        }
        return this.animator;
    }

    public AnimatorSet toArrowShutter(boolean anim) {
        int tx;
        int ty;
        this.shutterState = 3;
        cancelCurrentAnimator();
        if (anim) {
            View vp = (View) getParent();
            if (vp != null) {
                tx = (vp.getWidth() / 2) - Screen.dp(40);
                ty = (vp.getHeight() / 2) - Screen.dp(40);
            } else {
                tx = 0;
                ty = 0;
            }
            this.animator = createAnimatorSet();
            this.animator.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, RED_PROGRESS_ALPHA, 0.0f).setDuration(195L)), AnimationUtils.delay(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, FORWARD_ARROW_ALPHA, 1.0f).setDuration(225L)), AnimationUtils.DELAY_MID), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, CIRCLE_RADIUS, SHARE_RADIUS).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, BORDER_SIZE, SHARE_BORDER).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_X, tx).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_Y, ty).setDuration(375L)));
            this.animator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.ShutterButton.7
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ShutterButton.this.setForwardArrowAlpha(1.0f);
                    ShutterButton.this.setCircleRadius(ShutterButton.SHARE_RADIUS);
                    ShutterButton.this.setBorderSize(ShutterButton.SHARE_BORDER);
                    ShutterButton.this.setRedProgress(0.0f);
                    ShutterButton.this.setRedProgressAlpha(0.0f);
                }
            });
            this.animator.start();
        } else {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.stories.view.ShutterButton.8
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ShutterButton.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    ShutterButton.this.setForwardArrowAlpha(1.0f);
                    ShutterButton.this.setCircleRadius(ShutterButton.SHARE_RADIUS);
                    ShutterButton.this.setBorderSize(ShutterButton.SHARE_BORDER);
                    ShutterButton.this.setRedProgress(0.0f);
                    ShutterButton.this.setRedProgressAlpha(0.0f);
                    View vp2 = (View) ShutterButton.this.getParent();
                    if (vp2 != null) {
                        int tx2 = (vp2.getWidth() / 2) - Screen.dp(40);
                        int ty2 = (vp2.getHeight() / 2) - Screen.dp(40);
                        ShutterButton.this.setTranslationX(tx2);
                        ShutterButton.this.setTranslationY(ty2);
                        return false;
                    }
                    return false;
                }
            });
        }
        return this.animator;
    }

    public AnimatorSet toMasksShutter(boolean anim) {
        int ty;
        this.shutterState = 1;
        cancelCurrentAnimator();
        if (anim) {
            View vp = (View) getParent();
            if (vp != null) {
                ty = (vp.getHeight() / 2) - Screen.dp(48);
            } else {
                ty = 0;
            }
            this.animator = createAnimatorSet();
            this.animator.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, RED_PROGRESS_ALPHA, 0.0f).setDuration(195L)), AnimationUtils.delay(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, FORWARD_ARROW_ALPHA, 0.0f).setDuration(225L)), AnimationUtils.DELAY_MID), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, CIRCLE_RADIUS, MASKS_RADIUS).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, BORDER_SIZE, MASKS_BORDER).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_X, 0.0f).setDuration(375L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, TRANSLATION_Y, ty).setDuration(375L)));
            this.animator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.ShutterButton.9
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ShutterButton.this.setForwardArrowAlpha(0.0f);
                    ShutterButton.this.setCircleRadius(ShutterButton.MASKS_RADIUS);
                    ShutterButton.this.setBorderSize(ShutterButton.MASKS_BORDER);
                    ShutterButton.this.setRedProgress(0.0f);
                    ShutterButton.this.setRedProgressAlpha(0.0f);
                }
            });
            this.animator.start();
        } else {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.stories.view.ShutterButton.10
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ShutterButton.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    ShutterButton.this.setForwardArrowAlpha(0.0f);
                    ShutterButton.this.setCircleRadius(ShutterButton.MASKS_RADIUS);
                    ShutterButton.this.setRedProgress(0.0f);
                    ShutterButton.this.setRedProgressAlpha(0.0f);
                    View vp2 = (View) ShutterButton.this.getParent();
                    if (vp2 != null) {
                        int ty2 = (vp2.getHeight() / 2) - Screen.dp(48);
                        ShutterButton.this.setTranslationX(0.0f);
                        ShutterButton.this.setTranslationY(ty2);
                        return false;
                    }
                    return false;
                }
            });
        }
        return this.animator;
    }

    private void cancelCurrentAnimator() {
        if (this.animator != null) {
            this.animator.cancel();
            this.animator = null;
        }
    }

    private AnimatorSet createAnimatorSet() {
        AnimatorSet defaultAnimator = new AnimatorSet();
        defaultAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.ShutterButton.11
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                onAnimationEnd(animation);
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                ShutterButton.this.animator = null;
            }
        });
        return defaultAnimator;
    }

    private static void fillRectFWithCircleSize(float cx, float cy, RectF rect, float r) {
        rect.set(cx - r, cy - r, cx + r, cy + r);
    }
}
