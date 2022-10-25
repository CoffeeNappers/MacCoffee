package android.support.transition;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.annotation.RequiresApi;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class SceneStaticsIcs extends SceneStaticsImpl {
    @Override // android.support.transition.SceneStaticsImpl
    public SceneImpl getSceneForLayout(ViewGroup sceneRoot, int layoutId, Context context) {
        SceneIcs scene = new SceneIcs();
        scene.mScene = ScenePort.getSceneForLayout(sceneRoot, layoutId, context);
        return scene;
    }
}
