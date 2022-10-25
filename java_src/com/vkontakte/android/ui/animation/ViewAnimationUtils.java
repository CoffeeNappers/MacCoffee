package com.vkontakte.android.ui.animation;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.os.Build;
import android.view.View;
import com.vkontakte.android.ui.animation.RevealAnimator;
/* loaded from: classes3.dex */
public class ViewAnimationUtils {
    private ViewAnimationUtils() {
    }

    public static Animator createCircularReveal(View view, int centerX, int centerY, float startRadius, float endRadius) {
        if (Build.VERSION.SDK_INT >= 21) {
            return android.view.ViewAnimationUtils.createCircularReveal(view, centerX, centerY, startRadius, endRadius);
        }
        if (!(view instanceof RevealAnimator)) {
            throw new IllegalArgumentException("View must implement RevealAnimator.");
        }
        RevealAnimator revealLayout = (RevealAnimator) view;
        revealLayout.attachRevealInfo(new RevealAnimator.RevealInfo(centerX, centerY, startRadius, endRadius));
        ObjectAnimator reveal = ObjectAnimator.ofFloat(revealLayout, "revealRadius", startRadius, endRadius);
        reveal.addListener(getRevealFinishListener(revealLayout));
        return reveal;
    }

    private static Animator.AnimatorListener getRevealFinishListener(RevealAnimator target) {
        if (Build.VERSION.SDK_INT >= 18) {
            return new RevealAnimator.RevealFinishedJellyBeanMr2(target);
        }
        if (Build.VERSION.SDK_INT >= 14) {
            return new RevealAnimator.RevealFinishedIceCreamSandwich(target);
        }
        return new RevealAnimator.RevealFinishedGingerbread(target);
    }
}
