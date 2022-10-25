package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class TransitionManagerKitKat extends TransitionManagerImpl {
    private final android.transition.TransitionManager mTransitionManager = new android.transition.TransitionManager();

    @Override // android.support.transition.TransitionManagerImpl
    public void setTransition(SceneImpl scene, TransitionImpl transition) {
        this.mTransitionManager.setTransition(((SceneWrapper) scene).mScene, transition == null ? null : ((TransitionKitKat) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerImpl
    public void setTransition(SceneImpl fromScene, SceneImpl toScene, TransitionImpl transition) {
        this.mTransitionManager.setTransition(((SceneWrapper) fromScene).mScene, ((SceneWrapper) toScene).mScene, transition == null ? null : ((TransitionKitKat) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerImpl
    public void transitionTo(SceneImpl scene) {
        this.mTransitionManager.transitionTo(((SceneWrapper) scene).mScene);
    }
}
