package android.support.transition;

import android.animation.Animator;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.ViewGroup;
/* loaded from: classes.dex */
public class ChangeBounds extends Transition {
    public ChangeBounds() {
        super(true);
        if (Build.VERSION.SDK_INT < 19) {
            this.mImpl = new ChangeBoundsIcs(this);
        } else {
            this.mImpl = new ChangeBoundsKitKat(this);
        }
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

    public void setResizeClip(boolean resizeClip) {
        ((ChangeBoundsInterface) this.mImpl).setResizeClip(resizeClip);
    }
}
