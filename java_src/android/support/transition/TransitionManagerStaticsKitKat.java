package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class TransitionManagerStaticsKitKat extends TransitionManagerStaticsImpl {
    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void go(SceneImpl scene) {
        android.transition.TransitionManager.go(((SceneWrapper) scene).mScene);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void go(SceneImpl scene, TransitionImpl transition) {
        android.transition.TransitionManager.go(((SceneWrapper) scene).mScene, transition == null ? null : ((TransitionKitKat) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void beginDelayedTransition(ViewGroup sceneRoot) {
        android.transition.TransitionManager.beginDelayedTransition(sceneRoot);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void beginDelayedTransition(ViewGroup sceneRoot, TransitionImpl transition) {
        android.transition.TransitionManager.beginDelayedTransition(sceneRoot, transition == null ? null : ((TransitionKitKat) transition).mTransition);
    }
}
