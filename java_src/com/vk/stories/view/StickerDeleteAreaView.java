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
import android.view.View;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class StickerDeleteAreaView extends View {
    private static final float SHADOW_RATIO = 1.5454545f;
    private static final int redColor = -1621181;
    private static final int whiteColor = -1;
    private AnimatorSet animator;
    private Bitmap bgShadow;
    private final Paint bitmapPaint;
    private final RectF bitmapRectF;
    private final Paint circlePaint;
    private Bitmap closedTrash;
    private Bitmap openedTrash;
    private float progress;
    public static final Property<StickerDeleteAreaView, Float> PROGRESS = new Property<StickerDeleteAreaView, Float>(Float.class, "progress") { // from class: com.vk.stories.view.StickerDeleteAreaView.1
        @Override // android.util.Property
        public void set(StickerDeleteAreaView object, Float value) {
            object.setProgress(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(StickerDeleteAreaView object) {
            return Float.valueOf(object.getProgress());
        }
    };
    private static final int MIN_RADIUS = Screen.dp(56) / 2;
    private static final int MAX_RADIUS = Screen.dp(64) / 2;

    public StickerDeleteAreaView(Context context) {
        super(context);
        this.circlePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.bitmapRectF = new RectF();
        this.progress = 0.0f;
        init();
    }

    public StickerDeleteAreaView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.circlePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.bitmapRectF = new RectF();
        this.progress = 0.0f;
        init();
    }

    public StickerDeleteAreaView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.circlePaint = new Paint(1);
        this.bitmapPaint = new Paint(7);
        this.bitmapRectF = new RectF();
        this.progress = 0.0f;
        init();
    }

    private void init() {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = false;
        this.bgShadow = BitmapFactory.decodeResource(getResources(), R.drawable.bg_fab_nofill_shadow, options);
        this.closedTrash = BitmapFactory.decodeResource(getResources(), R.drawable.ic_deleting_tip_56dp, options);
        this.openedTrash = BitmapFactory.decodeResource(getResources(), R.drawable.ic_deleting_tip_hover_56dp, options);
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
        float circleRadius = AnimationUtils.mix(this.progress, MIN_RADIUS, MAX_RADIUS);
        float shadowSize = circleRadius * SHADOW_RATIO;
        this.bitmapRectF.set(cx - shadowSize, cy - shadowSize, cx + shadowSize, cy + shadowSize);
        this.bitmapPaint.setAlpha(255);
        canvas.drawBitmap(this.bgShadow, (Rect) null, this.bitmapRectF, this.bitmapPaint);
        int circleColor = AnimationUtils.mixArgb(this.progress, -1, redColor);
        this.circlePaint.setColor(circleColor);
        canvas.drawCircle(cx, cy, circleRadius, this.circlePaint);
        this.bitmapRectF.set(cx - MIN_RADIUS, cy - MIN_RADIUS, MIN_RADIUS + cx, MIN_RADIUS + cy);
        if (this.progress < 0.5d) {
            float dissapearingProgress = this.progress / 0.5f;
            this.bitmapPaint.setAlpha(AnimationUtils.mix(dissapearingProgress, 255, 0));
            canvas.drawBitmap(this.closedTrash, (Rect) null, this.bitmapRectF, this.bitmapPaint);
            return;
        }
        float appearingProgress = (this.progress - 0.5f) / 0.5f;
        this.bitmapPaint.setAlpha(AnimationUtils.mix(appearingProgress, 0, 255));
        canvas.drawBitmap(this.openedTrash, (Rect) null, this.bitmapRectF, this.bitmapPaint);
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        this.progress = progress;
        invalidate();
    }

    public AnimatorSet closedState() {
        return setProgressAnimated(0.0f);
    }

    public AnimatorSet openedState() {
        return setProgressAnimated(1.0f);
    }

    public AnimatorSet setProgressAnimated(float progress) {
        cancelCurrentAnimator();
        this.animator = createAnimatorSet();
        this.animator.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this, PROGRESS, progress).setDuration(225L)));
        this.animator.start();
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
        defaultAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.StickerDeleteAreaView.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                onAnimationEnd(animation);
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                StickerDeleteAreaView.this.animator = null;
            }
        });
        return defaultAnimator;
    }
}
