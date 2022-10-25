package com.vk.core.util;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.support.v4.view.animation.FastOutLinearInInterpolator;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.support.v4.view.animation.LinearOutSlowInInterpolator;
import android.util.Property;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
/* loaded from: classes2.dex */
public class AnimationUtils {
    public static final int DELAY_MID = 150;
    public static final int DURATION_LONG = 375;
    public static final int DURATION_MID = 225;
    public static final float DURATION_MULTIPLIER = 1.0f;
    public static final int DURATION_SHORT = 195;
    public static final long START_DELAY = 16;
    public static final AccelerateDecelerateInterpolator accelerateDecelerateInterpolator = new AccelerateDecelerateInterpolator();
    public static final DecelerateInterpolator decelerateInterpolator = new DecelerateInterpolator();
    public static final AccelerateInterpolator accelerateInterpolator = new AccelerateInterpolator();
    public static final DecelerateInterpolator decelerateInterpolator2 = new DecelerateInterpolator(2.0f);
    public static final AccelerateInterpolator accelerateInterpolator2 = new AccelerateInterpolator(2.0f);
    public static final FastOutSlowInInterpolator standartCurve = new FastOutSlowInInterpolator();
    public static final LinearOutSlowInInterpolator decelerationCurve = new LinearOutSlowInInterpolator();
    public static final FastOutLinearInInterpolator accelerationCurve = new FastOutLinearInInterpolator();

    public static void layersForAnimator(Animator animator, final View... views) {
        for (View view : views) {
            view.setLayerType(2, null);
        }
        animator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.core.util.AnimationUtils.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                onAnimationEnd(animation);
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                for (int i = 0; i < views.length; i++) {
                    views[i].setLayerType(0, null);
                }
            }
        });
    }

    public static ObjectAnimator ofArgb(Object target, String propertyName, int... values) {
        ObjectAnimator animator = ObjectAnimator.ofInt(target, propertyName, values);
        animator.setEvaluator(ArgbEvaluator.getInstance());
        return animator;
    }

    public static <T> ObjectAnimator ofArgb(T target, Property<T, Integer> propertyName, int... values) {
        ObjectAnimator animator = ObjectAnimator.ofInt(target, propertyName, values);
        animator.setEvaluator(ArgbEvaluator.getInstance());
        return animator;
    }

    public static Animator decelerate(Animator oa) {
        oa.setInterpolator(decelerateInterpolator);
        return oa;
    }

    public static Animator accelerate(Animator oa) {
        oa.setInterpolator(accelerateInterpolator);
        return oa;
    }

    public static Animator decelerate2(Animator oa) {
        oa.setInterpolator(decelerateInterpolator2);
        return oa;
    }

    public static Animator accelerate2(Animator oa) {
        oa.setInterpolator(accelerateInterpolator2);
        return oa;
    }

    public static Animator accelerateDecelerate(Animator oa) {
        oa.setInterpolator(accelerateDecelerateInterpolator);
        return oa;
    }

    public static Animator accelerateDecelerate2(Animator oa) {
        oa.setInterpolator(accelerateDecelerateInterpolator);
        return oa;
    }

    public static Animator standartCurve(Animator oa) {
        oa.setInterpolator(standartCurve);
        return oa;
    }

    public static Animator accelerateCurve(Animator oa) {
        oa.setInterpolator(accelerationCurve);
        return oa;
    }

    public static Animator decelerateCurve(Animator oa) {
        oa.setInterpolator(decelerationCurve);
        return oa;
    }

    public static Animator delay(Animator oa, int delay) {
        ValueAnimator anim = ValueAnimator.ofFloat(0.0f, 1.0f);
        anim.setDuration(delay);
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(anim, oa);
        return set;
    }

    public static float interpolate(float amount, float min, float max) {
        return ((max - min) * amount) + min;
    }

    public static void reset(View view) {
        view.setAlpha(1.0f);
        view.setTranslationX(0.0f);
        view.setTranslationY(0.0f);
        view.setScaleX(1.0f);
        view.setScaleY(1.0f);
    }

    public static void setScale(View view, float scale) {
        view.setScaleX(scale);
        view.setScaleY(scale);
    }

    public static int mixArgb(float fraction, int startValue, int endValue) {
        int startA = (startValue >> 24) & 255;
        int startR = (startValue >> 16) & 255;
        int startG = (startValue >> 8) & 255;
        int startB = startValue & 255;
        int endA = (endValue >> 24) & 255;
        int endR = (endValue >> 16) & 255;
        int endG = (endValue >> 8) & 255;
        int endB = endValue & 255;
        return ((((int) ((endA - startA) * fraction)) + startA) << 24) | ((((int) ((endR - startR) * fraction)) + startR) << 16) | ((((int) ((endG - startG) * fraction)) + startG) << 8) | (((int) ((endB - startB) * fraction)) + startB);
    }

    public static int mix(float fraction, int startValue, int endValue) {
        return ((int) ((endValue - startValue) * fraction)) + startValue;
    }

    public static float mix(float fraction, float startValue, float endValue) {
        return ((endValue - startValue) * fraction) + startValue;
    }
}
