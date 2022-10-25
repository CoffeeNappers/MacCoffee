package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class SceneKitKat extends SceneWrapper {
    private static Field sEnterAction;
    private static Method sSetCurrentScene;
    private View mLayout;

    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot) {
        this.mScene = new android.transition.Scene(sceneRoot);
    }

    @Override // android.support.transition.SceneImpl
    public void init(ViewGroup sceneRoot, View layout) {
        if (layout instanceof ViewGroup) {
            this.mScene = new android.transition.Scene(sceneRoot, (ViewGroup) layout);
            return;
        }
        this.mScene = new android.transition.Scene(sceneRoot);
        this.mLayout = layout;
    }

    @Override // android.support.transition.SceneImpl
    public void enter() {
        if (this.mLayout != null) {
            ViewGroup root = getSceneRoot();
            root.removeAllViews();
            root.addView(this.mLayout);
            invokeEnterAction();
            updateCurrentScene(root);
            return;
        }
        this.mScene.enter();
    }

    private void invokeEnterAction() {
        if (sEnterAction == null) {
            try {
                sEnterAction = android.transition.Scene.class.getDeclaredField("mEnterAction");
                sEnterAction.setAccessible(true);
            } catch (NoSuchFieldException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            Runnable enterAction = (Runnable) sEnterAction.get(this.mScene);
            if (enterAction != null) {
                enterAction.run();
            }
        } catch (IllegalAccessException e2) {
            throw new RuntimeException(e2);
        }
    }

    private void updateCurrentScene(View view) {
        if (sSetCurrentScene == null) {
            try {
                sSetCurrentScene = android.transition.Scene.class.getDeclaredMethod("setCurrentScene", View.class, android.transition.Scene.class);
                sSetCurrentScene.setAccessible(true);
            } catch (NoSuchMethodException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            sSetCurrentScene.invoke(null, view, this.mScene);
        } catch (IllegalAccessException | InvocationTargetException e2) {
            throw new RuntimeException(e2);
        }
    }
}
