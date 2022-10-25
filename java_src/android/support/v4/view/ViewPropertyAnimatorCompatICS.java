package android.support.v4.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.animation.Interpolator;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class ViewPropertyAnimatorCompatICS {
    ViewPropertyAnimatorCompatICS() {
    }

    public static void setDuration(View view, long value) {
        view.animate().setDuration(value);
    }

    public static void alpha(View view, float value) {
        view.animate().alpha(value);
    }

    public static void translationX(View view, float value) {
        view.animate().translationX(value);
    }

    public static void translationY(View view, float value) {
        view.animate().translationY(value);
    }

    public static long getDuration(View view) {
        return view.animate().getDuration();
    }

    public static void setInterpolator(View view, Interpolator value) {
        view.animate().setInterpolator(value);
    }

    public static void setStartDelay(View view, long value) {
        view.animate().setStartDelay(value);
    }

    public static long getStartDelay(View view) {
        return view.animate().getStartDelay();
    }

    public static void alphaBy(View view, float value) {
        view.animate().alphaBy(value);
    }

    public static void rotation(View view, float value) {
        view.animate().rotation(value);
    }

    public static void rotationBy(View view, float value) {
        view.animate().rotationBy(value);
    }

    public static void rotationX(View view, float value) {
        view.animate().rotationX(value);
    }

    public static void rotationXBy(View view, float value) {
        view.animate().rotationXBy(value);
    }

    public static void rotationY(View view, float value) {
        view.animate().rotationY(value);
    }

    public static void rotationYBy(View view, float value) {
        view.animate().rotationYBy(value);
    }

    public static void scaleX(View view, float value) {
        view.animate().scaleX(value);
    }

    public static void scaleXBy(View view, float value) {
        view.animate().scaleXBy(value);
    }

    public static void scaleY(View view, float value) {
        view.animate().scaleY(value);
    }

    public static void scaleYBy(View view, float value) {
        view.animate().scaleYBy(value);
    }

    public static void cancel(View view) {
        view.animate().cancel();
    }

    public static void x(View view, float value) {
        view.animate().x(value);
    }

    public static void xBy(View view, float value) {
        view.animate().xBy(value);
    }

    public static void y(View view, float value) {
        view.animate().y(value);
    }

    public static void yBy(View view, float value) {
        view.animate().yBy(value);
    }

    public static void translationXBy(View view, float value) {
        view.animate().translationXBy(value);
    }

    public static void translationYBy(View view, float value) {
        view.animate().translationYBy(value);
    }

    public static void start(View view) {
        view.animate().start();
    }

    public static void setListener(final View view, final ViewPropertyAnimatorListener listener) {
        if (listener != null) {
            view.animate().setListener(new AnimatorListenerAdapter() { // from class: android.support.v4.view.ViewPropertyAnimatorCompatICS.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    ViewPropertyAnimatorListener.this.onAnimationCancel(view);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ViewPropertyAnimatorListener.this.onAnimationEnd(view);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                    ViewPropertyAnimatorListener.this.onAnimationStart(view);
                }
            });
        } else {
            view.animate().setListener(null);
        }
    }
}
