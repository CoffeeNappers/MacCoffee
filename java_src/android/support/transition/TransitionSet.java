package android.support.transition;

import android.animation.Animator;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.ViewGroup;
/* loaded from: classes.dex */
public class TransitionSet extends Transition {
    public static final int ORDERING_SEQUENTIAL = 1;
    public static final int ORDERING_TOGETHER = 0;

    public TransitionSet() {
        super(true);
        if (Build.VERSION.SDK_INT < 19) {
            this.mImpl = new TransitionSetIcs(this);
        } else {
            this.mImpl = new TransitionSetKitKat(this);
        }
    }

    public int getOrdering() {
        return ((TransitionSetImpl) this.mImpl).getOrdering();
    }

    @NonNull
    public TransitionSet setOrdering(int ordering) {
        ((TransitionSetImpl) this.mImpl).mo41setOrdering(ordering);
        return this;
    }

    @NonNull
    public TransitionSet addTransition(@NonNull Transition transition) {
        ((TransitionSetImpl) this.mImpl).mo39addTransition(transition.mImpl);
        return this;
    }

    @NonNull
    public TransitionSet removeTransition(@NonNull Transition transition) {
        ((TransitionSetImpl) this.mImpl).mo40removeTransition(transition.mImpl);
        return this;
    }

    @Override // android.support.transition.Transition, android.support.transition.TransitionInterface
    public void captureEndValues(@NonNull TransitionValues transitionValues) {
        this.mImpl.captureEndValues(transitionValues);
    }

    @Override // android.support.transition.Transition, android.support.transition.TransitionInterface
    public void captureStartValues(@NonNull TransitionValues transitionValues) {
        this.mImpl.captureStartValues(transitionValues);
    }

    @Override // android.support.transition.Transition, android.support.transition.TransitionInterface
    @Nullable
    public Animator createAnimator(@NonNull ViewGroup sceneRoot, @NonNull TransitionValues startValues, @NonNull TransitionValues endValues) {
        return this.mImpl.createAnimator(sceneRoot, startValues, endValues);
    }
}