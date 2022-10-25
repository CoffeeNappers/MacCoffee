package com.vk.core.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.view.View;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class ViewShower {
    private Animator currentHideAnimator;
    private Animator currentShowAnimator;
    private final WeakReference<View> targetView;

    public ViewShower(View targetView) {
        this.targetView = new WeakReference<>(targetView);
    }

    public void cancelAllRunningAnimations() {
        if (this.currentHideAnimator != null) {
            this.currentHideAnimator.cancel();
            this.currentHideAnimator = null;
        }
        if (this.currentShowAnimator != null) {
            this.currentShowAnimator.cancel();
            this.currentShowAnimator = null;
        }
    }

    public void show() {
        View v;
        if (this.currentShowAnimator == null && (v = this.targetView.get()) != null) {
            cancelHideAnimator();
            if (v.getVisibility() == 8 || v.getVisibility() == 4) {
                dropViewState(v);
            }
            v.setVisibility(0);
            this.currentShowAnimator = createShowAnimator(v);
            this.currentShowAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.core.widget.ViewShower.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ViewShower.this.currentShowAnimator = null;
                }
            });
            this.currentShowAnimator.start();
        }
    }

    public void hide(final boolean setGoneAfter) {
        final View v;
        if (this.currentHideAnimator == null && (v = this.targetView.get()) != null) {
            cancelShowAnimator();
            this.currentHideAnimator = createHideAnimator(v);
            this.currentHideAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.core.widget.ViewShower.2
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ViewShower.this.currentHideAnimator = null;
                    ViewShower.this.dropViewState(v);
                    if (setGoneAfter) {
                        v.setVisibility(8);
                    }
                }
            });
            this.currentHideAnimator.start();
        }
    }

    public Animator createShowAnimator(View view) {
        return ObjectAnimator.ofFloat(view, View.ALPHA, 1.0f).setDuration(150L);
    }

    public Animator createHideAnimator(View view) {
        return ObjectAnimator.ofFloat(view, View.ALPHA, 0.0f).setDuration(200L);
    }

    public void dropViewState(View v) {
        v.setAlpha(0.0f);
    }

    private void cancelShowAnimator() {
        if (this.currentShowAnimator != null) {
            this.currentShowAnimator.cancel();
            this.currentShowAnimator = null;
        }
    }

    private void cancelHideAnimator() {
        if (this.currentHideAnimator != null) {
            this.currentHideAnimator.cancel();
            this.currentHideAnimator = null;
        }
    }
}
