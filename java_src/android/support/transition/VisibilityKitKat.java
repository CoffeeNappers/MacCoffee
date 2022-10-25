package android.support.transition;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class VisibilityKitKat extends TransitionKitKat implements VisibilityImpl {
    @Override // android.support.transition.TransitionKitKat, android.support.transition.TransitionImpl
    public void init(TransitionInterface external, Object internal) {
        this.mExternalTransition = external;
        if (internal == null) {
            this.mTransition = new VisibilityWrapper((VisibilityInterface) external);
        } else {
            this.mTransition = (android.transition.Visibility) internal;
        }
    }

    @Override // android.support.transition.VisibilityImpl
    public boolean isVisible(TransitionValues values) {
        return ((android.transition.Visibility) this.mTransition).isVisible(convertToPlatform(values));
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((android.transition.Visibility) this.mTransition).onAppear(sceneRoot, convertToPlatform(startValues), startVisibility, convertToPlatform(endValues), endVisibility);
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((android.transition.Visibility) this.mTransition).onDisappear(sceneRoot, convertToPlatform(startValues), startVisibility, convertToPlatform(endValues), endVisibility);
    }

    /* loaded from: classes.dex */
    private static class VisibilityWrapper extends android.transition.Visibility {
        private final VisibilityInterface mVisibility;

        VisibilityWrapper(VisibilityInterface visibility) {
            this.mVisibility = visibility;
        }

        @Override // android.transition.Visibility, android.transition.Transition
        public void captureStartValues(android.transition.TransitionValues transitionValues) {
            TransitionKitKat.wrapCaptureStartValues(this.mVisibility, transitionValues);
        }

        @Override // android.transition.Visibility, android.transition.Transition
        public void captureEndValues(android.transition.TransitionValues transitionValues) {
            TransitionKitKat.wrapCaptureEndValues(this.mVisibility, transitionValues);
        }

        @Override // android.transition.Visibility, android.transition.Transition
        public Animator createAnimator(ViewGroup sceneRoot, android.transition.TransitionValues startValues, android.transition.TransitionValues endValues) {
            return this.mVisibility.createAnimator(sceneRoot, TransitionKitKat.convertToSupport(startValues), TransitionKitKat.convertToSupport(endValues));
        }

        @Override // android.transition.Visibility
        public boolean isVisible(android.transition.TransitionValues values) {
            if (values == null) {
                return false;
            }
            TransitionValues externalValues = new TransitionValues();
            TransitionKitKat.copyValues(values, externalValues);
            return this.mVisibility.isVisible(externalValues);
        }

        @Override // android.transition.Visibility
        public Animator onAppear(ViewGroup sceneRoot, android.transition.TransitionValues startValues, int startVisibility, android.transition.TransitionValues endValues, int endVisibility) {
            return this.mVisibility.onAppear(sceneRoot, TransitionKitKat.convertToSupport(startValues), startVisibility, TransitionKitKat.convertToSupport(endValues), endVisibility);
        }

        @Override // android.transition.Visibility
        public Animator onDisappear(ViewGroup sceneRoot, android.transition.TransitionValues startValues, int startVisibility, android.transition.TransitionValues endValues, int endVisibility) {
            return this.mVisibility.onDisappear(sceneRoot, TransitionKitKat.convertToSupport(startValues), startVisibility, TransitionKitKat.convertToSupport(endValues), endVisibility);
        }
    }
}
