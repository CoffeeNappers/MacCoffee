package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class TransitionManagerStaticsIcs extends TransitionManagerStaticsImpl {
    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void go(SceneImpl scene) {
        TransitionManagerPort.go(((SceneIcs) scene).mScene);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void go(SceneImpl scene, TransitionImpl transition) {
        TransitionManagerPort.go(((SceneIcs) scene).mScene, transition == null ? null : ((TransitionIcs) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void beginDelayedTransition(ViewGroup sceneRoot) {
        TransitionManagerPort.beginDelayedTransition(sceneRoot);
    }

    @Override // android.support.transition.TransitionManagerStaticsImpl
    public void beginDelayedTransition(ViewGroup sceneRoot, TransitionImpl transition) {
        TransitionManagerPort.beginDelayedTransition(sceneRoot, transition == null ? null : ((TransitionIcs) transition).mTransition);
    }
}
