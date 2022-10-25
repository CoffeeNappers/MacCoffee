package android.support.transition;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class FadeKitKat extends TransitionKitKat implements VisibilityImpl {
    public FadeKitKat(TransitionInterface transition) {
        init(transition, new android.transition.Fade());
    }

    public FadeKitKat(TransitionInterface transition, int fadingMode) {
        init(transition, new android.transition.Fade(fadingMode));
    }

    @Override // android.support.transition.VisibilityImpl
    public boolean isVisible(TransitionValues values) {
        return ((android.transition.Fade) this.mTransition).isVisible(convertToPlatform(values));
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((android.transition.Fade) this.mTransition).onAppear(sceneRoot, convertToPlatform(startValues), startVisibility, convertToPlatform(endValues), endVisibility);
    }

    @Override // android.support.transition.VisibilityImpl
    public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return ((android.transition.Fade) this.mTransition).onDisappear(sceneRoot, convertToPlatform(startValues), startVisibility, convertToPlatform(endValues), endVisibility);
    }
}
