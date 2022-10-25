package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
abstract class SceneWrapper extends SceneImpl {
    android.transition.Scene mScene;

    @Override // android.support.transition.SceneImpl
    public ViewGroup getSceneRoot() {
        return this.mScene.getSceneRoot();
    }

    @Override // android.support.transition.SceneImpl
    public void exit() {
        this.mScene.exit();
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
