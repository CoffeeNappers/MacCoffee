package android.support.transition;

import android.animation.Animator;
import android.os.Build;
import android.support.annotation.NonNull;
import android.view.ViewGroup;
/* loaded from: classes.dex */
public abstract class Visibility extends Transition implements VisibilityInterface {
    public Visibility() {
        this(false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Visibility(boolean deferred) {
        super(true);
        if (!deferred) {
            if (Build.VERSION.SDK_INT >= 19) {
                this.mImpl = new VisibilityKitKat();
            } else {
                this.mImpl = new VisibilityIcs();
            }
            this.mImpl.init(this);
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

    @Override // android.support.transition.VisibilityInterface
    public boolean isVisible(TransitionValues values) {
        return ((VisibilityImpl) this.mImpl).isVisible(values);
    }

    @Override // android.support.transition.VisibilityInterface
    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((VisibilityImpl) this.mImpl).onAppear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
    }

    @Override // android.support.transition.VisibilityInterface
    public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((VisibilityImpl) this.mImpl).onDisappear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
    }
}
