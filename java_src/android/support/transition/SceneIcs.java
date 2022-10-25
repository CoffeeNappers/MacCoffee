package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class SceneIcs extends SceneImpl {
    ScenePort mScene;

    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot) {
        this.mScene = new ScenePort(sceneRoot);
    }

    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot, View layout) {
        this.mScene = new ScenePort(sceneRoot, layout);
    }

    @Override // android.support.transition.SceneImpl
    public void enter() {
        this.mScene.enter();
    }

    @Override // android.support.transition.SceneImpl
    public void exit() {
        this.mScene.exit();
    }

    @Override // android.support.transition.SceneImpl
    public ViewGroup getSceneRoot() {
        return this.mScene.getSceneRoot();
    }

    @Override // android.support.transition.SceneImpl
    public void setEnterAction(Runnable action) {
        this.mScene.setEnterAction(action);
    }

    @Override // android.support.transition.SceneImpl
    public void setExitAction(Runnable action) {
        this.mScene.setExitAction(action);
    }
}
