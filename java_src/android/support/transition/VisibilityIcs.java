package android.support.transition;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class VisibilityIcs extends TransitionIcs implements VisibilityImpl {
    @Override // android.support.transition.TransitionIcs, android.support.transition.TransitionImpl
    public void init(TransitionInterface external, Object internal) {
        this.mExternalTransition = external;
        if (internal == null) {
            this.mTransition = new VisibilityWrapper((VisibilityInterface) external);
        } else {
            this.mTransition = (VisibilityPort) internal;
        }
    }

    @Override // android.support.transition.VisibilityImpl
    public boolean isVisible(TransitionValues values) {
        return ((VisibilityPort) this.mTransition).isVisible(values);
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((VisibilityPort) this.mTransition).onAppear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((VisibilityPort) this.mTransition).onDisappear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
    }

    /* loaded from: classes.dex */
    private static class VisibilityWrapper extends VisibilityPort {
        private VisibilityInterface mVisibility;

        VisibilityWrapper(VisibilityInterface visibility) {
            this.mVisibility = visibility;
        }

        @Override // android.support.transition.VisibilityPort, android.support.transition.TransitionPort
        public void captureStartValues(TransitionValues transitionValues) {
            this.mVisibility.captureStartValues(transitionValues);
        }

        @Override // android.support.transition.VisibilityPort, android.support.transition.TransitionPort
        public void captureEndValues(TransitionValues transitionValues) {
            this.mVisibility.captureEndValues(transitionValues);
        }

        @Override // android.support.transition.VisibilityPort, android.support.transition.TransitionPort
        public Animator createAnimator(ViewGroup sceneRoot, TransitionValues startValues, TransitionValues endValues) {
            return this.mVisibility.createAnimator(sceneRoot, startValues, endValues);
        }

        @Override // android.support.transition.VisibilityPort
        public boolean isVisible(TransitionValues values) {
            return this.mVisibility.isVisible(values);
        }

        @Override // android.support.transition.VisibilityPort
        public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
            return this.mVisibility.onAppear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
        }

        @Override // android.support.transition.VisibilityPort
        public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
            return this.mVisibility.onDisappear(sceneRoot, startValues, startVisibility, endValues, endVisibility);
        }
    }
}
