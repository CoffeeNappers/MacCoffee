package android.support.design.widget;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.design.widget.ValueAnimatorCompat;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import java.util.ArrayList;
/* loaded from: classes.dex */
class ValueAnimatorCompatImplGingerbread extends ValueAnimatorCompat.Impl {
    private static final int DEFAULT_DURATION = 200;
    private static final int HANDLER_DELAY = 10;
    private static final Handler sHandler = new Handler(Looper.getMainLooper());
    private float mAnimatedFraction;
    private Interpolator mInterpolator;
    private boolean mIsRunning;
    private ArrayList<ValueAnimatorCompat.Impl.AnimatorListenerProxy> mListeners;
    private long mStartTime;
    private ArrayList<ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy> mUpdateListeners;
    private final int[] mIntValues = new int[2];
    private final float[] mFloatValues = new float[2];
    private long mDuration = 200;
    private final Runnable mRunnable = new Runnable() { // from class: android.support.design.widget.ValueAnimatorCompatImplGingerbread.1
        @Override // java.lang.Runnable
        public void run() {
            ValueAnimatorCompatImplGingerbread.this.update();
        }
    };

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void start() {
        if (!this.mIsRunning) {
            if (this.mInterpolator == null) {
                this.mInterpolator = new AccelerateDecelerateInterpolator();
            }
            this.mIsRunning = true;
            this.mAnimatedFraction = 0.0f;
            startInternal();
        }
    }

    final void startInternal() {
        this.mStartTime = SystemClock.uptimeMillis();
        dispatchAnimationUpdate();
        dispatchAnimationStart();
        sHandler.postDelayed(this.mRunnable, 10L);
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public boolean isRunning() {
        return this.mIsRunning;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void setInterpolator(Interpolator interpolator) {
        this.mInterpolator = interpolator;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void addListener(ValueAnimatorCompat.Impl.AnimatorListenerProxy listener) {
        if (this.mListeners == null) {
            this.mListeners = new ArrayList<>();
        }
        this.mListeners.add(listener);
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void addUpdateListener(ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy updateListener) {
        if (this.mUpdateListeners == null) {
            this.mUpdateListeners = new ArrayList<>();
        }
        this.mUpdateListeners.add(updateListener);
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void setIntValues(int from, int to) {
        this.mIntValues[0] = from;
        this.mIntValues[1] = to;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public int getAnimatedIntValue() {
        return AnimationUtils.lerp(this.mIntValues[0], this.mIntValues[1], getAnimatedFraction());
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void setFloatValues(float from, float to) {
        this.mFloatValues[0] = from;
        this.mFloatValues[1] = to;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public float getAnimatedFloatValue() {
        return AnimationUtils.lerp(this.mFloatValues[0], this.mFloatValues[1], getAnimatedFraction());
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void setDuration(long duration) {
        this.mDuration = duration;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void cancel() {
        this.mIsRunning = false;
        sHandler.removeCallbacks(this.mRunnable);
        dispatchAnimationCancel();
        dispatchAnimationEnd();
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public float getAnimatedFraction() {
        return this.mAnimatedFraction;
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public void end() {
        if (this.mIsRunning) {
            this.mIsRunning = false;
            sHandler.removeCallbacks(this.mRunnable);
            this.mAnimatedFraction = 1.0f;
            dispatchAnimationUpdate();
            dispatchAnimationEnd();
        }
    }

    @Override // android.support.design.widget.ValueAnimatorCompat.Impl
    public long getDuration() {
        return this.mDuration;
    }

    final void update() {
        if (this.mIsRunning) {
            long elapsed = SystemClock.uptimeMillis() - this.mStartTime;
            float linearFraction = MathUtils.constrain(((float) elapsed) / ((float) this.mDuration), 0.0f, 1.0f);
            if (this.mInterpolator != null) {
                linearFraction = this.mInterpolator.getInterpolation(linearFraction);
            }
            this.mAnimatedFraction = linearFraction;
            dispatchAnimationUpdate();
            if (SystemClock.uptimeMillis() >= this.mStartTime + this.mDuration) {
                this.mIsRunning = false;
                dispatchAnimationEnd();
            }
        }
        if (this.mIsRunning) {
            sHandler.postDelayed(this.mRunnable, 10L);
        }
    }

    private void dispatchAnimationUpdate() {
        if (this.mUpdateListeners != null) {
            int count = this.mUpdateListeners.size();
            for (int i = 0; i < count; i++) {
                this.mUpdateListeners.get(i).onAnimationUpdate();
            }
        }
    }

    private void dispatchAnimationStart() {
        if (this.mListeners != null) {
            int count = this.mListeners.size();
            for (int i = 0; i < count; i++) {
                this.mListeners.get(i).onAnimationStart();
            }
        }
    }

    private void dispatchAnimationCancel() {
        if (this.mListeners != null) {
            int count = this.mListeners.size();
            for (int i = 0; i < count; i++) {
                this.mListeners.get(i).onAnimationCancel();
            }
        }
    }

    private void dispatchAnimationEnd() {
        if (this.mListeners != null) {
            int count = this.mListeners.size();
            for (int i = 0; i < count; i++) {
                this.mListeners.get(i).onAnimationEnd();
            }
        }
    }
}
