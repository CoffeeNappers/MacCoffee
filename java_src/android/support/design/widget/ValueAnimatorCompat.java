package android.support.design.widget;

import android.support.annotation.NonNull;
import android.view.animation.Interpolator;
/* loaded from: classes.dex */
class ValueAnimatorCompat {
    private final Impl mImpl;

    /* loaded from: classes.dex */
    interface AnimatorListener {
        void onAnimationCancel(ValueAnimatorCompat valueAnimatorCompat);

        void onAnimationEnd(ValueAnimatorCompat valueAnimatorCompat);

        void onAnimationStart(ValueAnimatorCompat valueAnimatorCompat);
    }

    /* loaded from: classes.dex */
    interface AnimatorUpdateListener {
        void onAnimationUpdate(ValueAnimatorCompat valueAnimatorCompat);
    }

    /* loaded from: classes.dex */
    interface Creator {
        @NonNull
        ValueAnimatorCompat createAnimator();
    }

    /* loaded from: classes.dex */
    static abstract class Impl {

        /* loaded from: classes.dex */
        interface AnimatorListenerProxy {
            void onAnimationCancel();

            void onAnimationEnd();

            void onAnimationStart();
        }

        /* loaded from: classes.dex */
        interface AnimatorUpdateListenerProxy {
            void onAnimationUpdate();
        }

        abstract void addListener(AnimatorListenerProxy animatorListenerProxy);

        abstract void addUpdateListener(AnimatorUpdateListenerProxy animatorUpdateListenerProxy);

        abstract void cancel();

        abstract void end();

        abstract float getAnimatedFloatValue();

        abstract float getAnimatedFraction();

        abstract int getAnimatedIntValue();

        abstract long getDuration();

        abstract boolean isRunning();

        abstract void setDuration(long j);

        abstract void setFloatValues(float f, float f2);

        abstract void setIntValues(int i, int i2);

        abstract void setInterpolator(Interpolator interpolator);

        abstract void start();
    }

    /* loaded from: classes.dex */
    static class AnimatorListenerAdapter implements AnimatorListener {
        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationStart(ValueAnimatorCompat animator) {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationEnd(ValueAnimatorCompat animator) {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationCancel(ValueAnimatorCompat animator) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ValueAnimatorCompat(Impl impl) {
        this.mImpl = impl;
    }

    public void start() {
        this.mImpl.start();
    }

    public boolean isRunning() {
        return this.mImpl.isRunning();
    }

    public void setInterpolator(Interpolator interpolator) {
        this.mImpl.setInterpolator(interpolator);
    }

    public void addUpdateListener(final AnimatorUpdateListener updateListener) {
        if (updateListener != null) {
            this.mImpl.addUpdateListener(new Impl.AnimatorUpdateListenerProxy() { // from class: android.support.design.widget.ValueAnimatorCompat.1
                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy
                public void onAnimationUpdate() {
                    updateListener.onAnimationUpdate(ValueAnimatorCompat.this);
                }
            });
        } else {
            this.mImpl.addUpdateListener(null);
        }
    }

    public void addListener(final AnimatorListener listener) {
        if (listener != null) {
            this.mImpl.addListener(new Impl.AnimatorListenerProxy() { // from class: android.support.design.widget.ValueAnimatorCompat.2
                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationStart() {
                    listener.onAnimationStart(ValueAnimatorCompat.this);
                }

                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationEnd() {
                    listener.onAnimationEnd(ValueAnimatorCompat.this);
                }

                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationCancel() {
                    listener.onAnimationCancel(ValueAnimatorCompat.this);
                }
            });
        } else {
            this.mImpl.addListener(null);
        }
    }

    public void setIntValues(int from, int to) {
        this.mImpl.setIntValues(from, to);
    }

    public int getAnimatedIntValue() {
        return this.mImpl.getAnimatedIntValue();
    }

    public void setFloatValues(float from, float to) {
        this.mImpl.setFloatValues(from, to);
    }

    public float getAnimatedFloatValue() {
        return this.mImpl.getAnimatedFloatValue();
    }

    public void setDuration(long duration) {
        this.mImpl.setDuration(duration);
    }

    public void cancel() {
        this.mImpl.cancel();
    }

    public float getAnimatedFraction() {
        return this.mImpl.getAnimatedFraction();
    }

    public void end() {
        this.mImpl.end();
    }

    public long getDuration() {
        return this.mImpl.getDuration();
    }
}
