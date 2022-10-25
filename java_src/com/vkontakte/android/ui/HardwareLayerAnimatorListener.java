package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.view.View;
/* loaded from: classes3.dex */
public class HardwareLayerAnimatorListener implements Animator.AnimatorListener {
    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animation) {
        if (animation instanceof ObjectAnimator) {
            Object target = ((ObjectAnimator) animation).getTarget();
            if (target instanceof View) {
                ((View) target).setLayerType(2, null);
            }
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animation) {
        if (animation instanceof ObjectAnimator) {
            Object target = ((ObjectAnimator) animation).getTarget();
            if (target instanceof View) {
                ((View) target).setLayerType(0, null);
            }
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animation) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animation) {
    }
}
