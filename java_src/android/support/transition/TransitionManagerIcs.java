package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class TransitionManagerIcs extends TransitionManagerImpl {
    private final TransitionManagerPort mTransitionManager = new TransitionManagerPort();

    @Override // android.support.transition.TransitionManagerImpl
    public void setTransition(SceneImpl scene, TransitionImpl transition) {
        this.mTransitionManager.setTransition(((SceneIcs) scene).mScene, transition == null ? null : ((TransitionIcs) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerImpl
    public void setTransition(SceneImpl fromScene, SceneImpl toScene, TransitionImpl transition) {
        this.mTransitionManager.setTransition(((SceneIcs) fromScene).mScene, ((SceneIcs) toScene).mScene, transition == null ? null : ((TransitionIcs) transition).mTransition);
    }

    @Override // android.support.transition.TransitionManagerImpl
    public void transitionTo(SceneImpl scene) {
        this.mTransitionManager.transitionTo(((SceneIcs) scene).mScene);
    }
}
