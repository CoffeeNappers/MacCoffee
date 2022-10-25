package com.vkontakte.android.ui.drawables;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MessageStatusDrawable extends Drawable {
    protected static TimeInterpolator easeIn = new CubicEaseIn();
    protected static TimeInterpolator easeOut = new CubicEaseOut();
    @NonNull
    protected final Drawable clock;
    @NonNull
    protected final Drawable dot;
    @NonNull
    protected final Drawable error;
    protected float clockScale = 1.0f;
    protected float dotScale = 1.0f;
    protected float errorScale = 0.0f;
    protected int clockAlpha = 255;
    protected DrawState state = null;
    protected Animator currentAnimator = null;
    protected int color = -8740660;

    /* loaded from: classes3.dex */
    public enum DrawState {
        sending,
        sent,
        haveBeenRed,
        error
    }

    public MessageStatusDrawable(Context context) {
        this.clock = getDrawable(context, R.drawable.ic_chat_sending_13dp);
        this.dot = getDrawable(context, R.drawable.dot_unread);
        this.error = getDrawable(context, R.drawable.ic_msg_error);
        PorterDuffColorFilter colorFilter = new PorterDuffColorFilter(this.color, PorterDuff.Mode.SRC_ATOP);
        this.clock.setColorFilter(colorFilter);
        this.dot.setColorFilter(colorFilter);
        setDrawState(DrawState.haveBeenRed, false);
    }

    protected static Drawable getDrawable(Context context, @DrawableRes int res) {
        return Build.VERSION.SDK_INT >= 21 ? context.getResources().getDrawable(res, context.getTheme()) : context.getResources().getDrawable(res);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.save();
        canvas.translate(getBounds().centerX(), getBounds().centerY());
        canvas.save();
        canvas.scale(this.dotScale, this.dotScale);
        this.dot.draw(canvas);
        canvas.restore();
        canvas.save();
        canvas.scale(this.clockScale, this.clockScale);
        ((BitmapDrawable) this.clock).getPaint().setAlpha(this.clockAlpha);
        this.clock.draw(canvas);
        canvas.restore();
        canvas.save();
        canvas.scale(this.errorScale, this.errorScale);
        this.error.draw(canvas);
        canvas.restore();
        canvas.restore();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.clockAlpha = alpha;
        this.dot.setAlpha(alpha);
        this.error.setAlpha(alpha);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.clock.setColorFilter(colorFilter);
        this.dot.setColorFilter(colorFilter);
        this.error.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return getIntrinsicWidth(this.clock, this.dot, this.error);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return getIntrinsicHeight(this.clock, this.dot, this.error);
    }

    protected static int getIntrinsicWidth(Drawable... drawables) {
        int maxH = 0;
        for (int i = drawables.length - 1; i >= 0; i--) {
            if (drawables[i].getIntrinsicWidth() > maxH) {
                maxH = drawables[i].getIntrinsicWidth();
            }
        }
        return maxH;
    }

    protected static int getIntrinsicHeight(Drawable... drawables) {
        int maxH = 0;
        for (int i = drawables.length - 1; i >= 0; i--) {
            if (drawables[i].getIntrinsicHeight() > maxH) {
                maxH = drawables[i].getIntrinsicHeight();
            }
        }
        return maxH;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int left, int top, int right, int bottom) {
        super.setBounds(left, top, right, bottom);
        int halfWidth = Math.min(right - left, this.clock.getIntrinsicWidth()) / 2;
        int halfHeight = Math.min(bottom - top, this.clock.getIntrinsicHeight()) / 2;
        this.clock.setBounds(-halfWidth, -halfHeight, halfWidth, halfHeight);
        int halfWidth2 = Math.min(right - left, this.dot.getIntrinsicWidth()) / 2;
        int halfHeight2 = Math.min(bottom - top, this.dot.getIntrinsicHeight()) / 2;
        this.dot.setBounds(-halfWidth2, -halfHeight2, halfWidth2, halfHeight2);
        int halfWidth3 = Math.min(right - left, this.error.getIntrinsicWidth()) / 2;
        int halfHeight3 = Math.min(bottom - top, this.error.getIntrinsicHeight()) / 2;
        this.error.setBounds(-halfWidth3, -halfHeight3, halfWidth3, halfHeight3);
    }

    public DrawState getDrawState() {
        return this.state;
    }

    public void setDrawState(DrawState state, boolean animate) {
        if (this.state != state) {
            int[] iArr = AnonymousClass1.$SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState;
            this.state = state;
            switch (iArr[state.ordinal()]) {
                case 1:
                    if (animate) {
                        startCurrentAnimator(animateForHaveBeenRed(), animateForShowError());
                        return;
                    }
                    this.errorScale = 1.0f;
                    this.clockScale = 0.0f;
                    this.clockAlpha = 255;
                    this.dotScale = 0.0f;
                    this.dot.setAlpha(255);
                    invalidateSelf();
                    return;
                case 2:
                    if (animate) {
                        startCurrentAnimator(animateForSending(), animateForHideError());
                        return;
                    }
                    this.errorScale = 0.0f;
                    this.clockScale = 1.0f;
                    this.clockAlpha = 255;
                    this.dotScale = toClockSize(1.0f);
                    this.dot.setAlpha(0);
                    invalidateSelf();
                    return;
                case 3:
                    if (animate) {
                        startCurrentAnimator(animateForSent(), animateForHideError());
                        return;
                    }
                    this.errorScale = 0.0f;
                    this.clockScale = toDotSize(1.0f);
                    this.clockAlpha = 120;
                    this.dotScale = 1.0f;
                    this.dot.setAlpha(255);
                    invalidateSelf();
                    return;
                case 4:
                    if (animate) {
                        startCurrentAnimator(animateForHaveBeenRed(), animateForHideError());
                        return;
                    }
                    this.errorScale = 0.0f;
                    this.clockScale = 0.0f;
                    this.clockAlpha = 255;
                    this.dotScale = 0.0f;
                    this.dot.setAlpha(255);
                    invalidateSelf();
                    return;
                default:
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.drawables.MessageStatusDrawable$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState = new int[DrawState.values().length];

        static {
            try {
                $SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState[DrawState.error.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState[DrawState.sending.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState[DrawState.sent.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$vkontakte$android$ui$drawables$MessageStatusDrawable$DrawState[DrawState.haveBeenRed.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public static class ThemeConfig {
        static float duration1 = 0.2f;
        static float duration2 = 0.07f;
        static float duration3 = 0.07f;
        static float totalDurationK = 0.85f;
        static float scale1K = 0.9f;
        static float scale2K = 1.06f;
        static float alphaDuration = 0.1f;

        protected ThemeConfig() {
        }
    }

    protected static int duration(float t) {
        return (int) (1000.0f * t * 0.865f);
    }

    protected void cancelCurrentAnimator() {
        if (this.currentAnimator != null) {
            this.currentAnimator.cancel();
            this.currentAnimator = null;
        }
    }

    protected void startCurrentAnimator(Animator animator) {
        cancelCurrentAnimator();
        this.currentAnimator = animator;
        animator.start();
    }

    protected void startCurrentAnimator(Animator[] animators1, Animator... animators2) {
        AnimatorSet animatorSet = new AnimatorSet();
        Animator[] animators = new Animator[animators1.length + animators2.length];
        System.arraycopy(animators1, 0, animators, 0, animators1.length);
        System.arraycopy(animators2, 0, animators, animators1.length, animators2.length);
        animatorSet.playTogether(animators);
        startCurrentAnimator(animatorSet);
    }

    protected Animator animateForShowError() {
        return ObjectAnimator.ofFloat(this, "scaleError", this.errorScale, 1.0f).setDuration(100L);
    }

    protected Animator animateForHideError() {
        return ObjectAnimator.ofFloat(this, "scaleError", this.errorScale, 0.0f).setDuration(100L);
    }

    protected Animator[] animateForSending() {
        return new Animator[]{ObjectAnimator.ofInt(this, "alphaClock", 0, 255).setDuration(150L), ObjectAnimator.ofInt(this, "alphaDot", 0, 0).setDuration(150L), ObjectAnimator.ofFloat(this, "scaleClock", 1.0f, 1.0f).setDuration(150L)};
    }

    protected Animator[] animateForHaveBeenRed() {
        Animator a1 = ObjectAnimator.ofFloat(this, "scaleDot", 1.0f, 0.0f).setDuration(100L);
        a1.setInterpolator(easeIn);
        Animator a2 = ObjectAnimator.ofFloat(this, "scaleClock", toDotSize(1.0f), 0.0f).setDuration(100L);
        a2.setInterpolator(easeIn);
        return new Animator[]{a1, a2};
    }

    protected Animator[] animateForSent() {
        AnimatorSet scale1 = new AnimatorSet().setDuration(duration(ThemeConfig.totalDurationK * ThemeConfig.duration1));
        scale1.playTogether(ObjectAnimator.ofFloat(this, "scaleDot", toClockSize(1.0f), ThemeConfig.scale1K), ObjectAnimator.ofFloat(this, "scaleClock", 1.0f, toDotSize(ThemeConfig.scale1K)));
        scale1.setInterpolator(easeIn);
        AnimatorSet scale2 = new AnimatorSet().setDuration(duration(ThemeConfig.totalDurationK * ThemeConfig.duration2));
        scale2.playTogether(ObjectAnimator.ofFloat(this, "scaleDot", ThemeConfig.scale1K, ThemeConfig.scale2K), ObjectAnimator.ofFloat(this, "scaleClock", toDotSize(ThemeConfig.scale1K), toDotSize(ThemeConfig.scale2K)));
        scale2.setInterpolator(easeOut);
        AnimatorSet scale3 = new AnimatorSet().setDuration(duration(ThemeConfig.totalDurationK * ThemeConfig.duration3));
        scale3.playTogether(ObjectAnimator.ofFloat(this, "scaleDot", ThemeConfig.scale2K, 1.0f), ObjectAnimator.ofFloat(this, "scaleClock", toDotSize(ThemeConfig.scale2K), toDotSize(1.0f)));
        scale3.setInterpolator(easeIn);
        AnimatorSet scaleAll = new AnimatorSet();
        scaleAll.playSequentially(scale1, scale2, scale3);
        AnimatorSet alpha = new AnimatorSet().setDuration(duration(ThemeConfig.totalDurationK * ThemeConfig.alphaDuration));
        alpha.playTogether(ObjectAnimator.ofInt(this, "alphaClock", 255, 0), ObjectAnimator.ofInt(this, "alphaDot", 0, 255));
        alpha.setInterpolator(easeIn);
        return new Animator[]{alpha, scaleAll};
    }

    protected float toClockSize(float clockScale) {
        return (this.clock.getIntrinsicWidth() / this.dot.getIntrinsicHeight()) * clockScale;
    }

    protected float toDotSize(float dotScale) {
        return (this.dot.getIntrinsicWidth() / this.clock.getIntrinsicHeight()) * dotScale;
    }

    public void setScaleClock(float scale) {
        if (this.clockScale != scale) {
            this.clockScale = scale;
            invalidateSelf();
        }
    }

    public void setScaleDot(float scale) {
        if (this.dotScale != scale) {
            this.dotScale = scale;
            invalidateSelf();
        }
    }

    public void setScaleError(float scale) {
        if (this.errorScale != scale) {
            this.errorScale = scale;
            invalidateSelf();
        }
    }

    public void setAlphaClock(int alpha) {
        this.clockAlpha = alpha;
        invalidateSelf();
    }

    public void setAlphaDot(int alpha) {
        this.dot.setAlpha(alpha);
    }

    /* loaded from: classes3.dex */
    protected static class CubicEaseIn implements TimeInterpolator {
        protected CubicEaseIn() {
        }

        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float t) {
            return t * t * t;
        }
    }

    /* loaded from: classes3.dex */
    protected static class CubicEaseOut implements TimeInterpolator {
        protected CubicEaseOut() {
        }

        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float t) {
            float t2 = t - 1.0f;
            return (t2 * t2 * t2) + 1.0f;
        }
    }
}
