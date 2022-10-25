package android.support.transition;

import android.animation.Animator;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.ViewGroup;
/* loaded from: classes.dex */
public class Fade extends Visibility {
    public static final int IN = 1;
    public static final int OUT = 2;

    public Fade(int fadingMode) {
        super(true);
        if (Build.VERSION.SDK_INT >= 19) {
            if (fadingMode > 0) {
                this.mImpl = new FadeKitKat(this, fadingMode);
            } else {
                this.mImpl = new FadeKitKat(this);
            }
        } else if (fadingMode > 0) {
            this.mImpl = new FadeIcs(this, fadingMode);
        } else {
            this.mImpl = new FadeIcs(this);
        }
    }

    public Fade() {
        this(-1);
    }

    @Override // android.support.transition.Visibility, android.support.transition.Transition, android.support.transition.TransitionInterface
    public void captureEndValues(@NonNull TransitionValues transitionValues) {
        this.mImpl.captureEndValues(transitionValues);
    }

    @Override // android.support.transition.Visibility, android.support.transition.Transition, android.support.transition.TransitionInterface
    public void captureStartValues(@NonNull TransitionValues transitionValues) {
        this.mImpl.captureStartValues(transitionValues);
    }

    @Override // android.support.transition.Transition, android.support.transition.TransitionInterface
    @Nullable
    public Animator createAnimator(@NonNull ViewGroup sceneRoot, @NonNull TransitionValues startValues, @NonNull TransitionValues endValues) {
        return this.mImpl.createAnimator(sceneRoot, startValues, endValues);
    }
}
