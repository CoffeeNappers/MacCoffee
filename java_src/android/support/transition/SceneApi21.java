package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.dex */
class SceneApi21 extends SceneWrapper {
    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot) {
        this.mScene = new android.transition.Scene(sceneRoot);
    }

    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot, View layout) {
        this.mScene = new android.transition.Scene(sceneRoot, layout);
    }

    @Override // android.support.transition.SceneImpl
    public void enter() {
        this.mScene.enter();
    }
}
