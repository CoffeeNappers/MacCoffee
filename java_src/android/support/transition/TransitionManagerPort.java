package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.transition.TransitionPort;
import android.support.v4.util.ArrayMap;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
public class TransitionManagerPort {
    private static final String[] EMPTY_STRINGS = new String[0];
    private static String LOG_TAG = "TransitionManager";
    private static TransitionPort sDefaultTransition = new AutoTransitionPort();
    private static ThreadLocal<WeakReference<ArrayMap<ViewGroup, ArrayList<TransitionPort>>>> sRunningTransitions = new ThreadLocal<>();
    static ArrayList<ViewGroup> sPendingTransitions = new ArrayList<>();
    ArrayMap<ScenePort, TransitionPort> mSceneTransitions = new ArrayMap<>();
    ArrayMap<ScenePort, ArrayMap<ScenePort, TransitionPort>> mScenePairTransitions = new ArrayMap<>();
    ArrayMap<ScenePort, ArrayMap<String, TransitionPort>> mSceneNameTransitions = new ArrayMap<>();
    ArrayMap<String, ArrayMap<ScenePort, TransitionPort>> mNameSceneTransitions = new ArrayMap<>();

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public static TransitionPort getDefaultTransition() {
        return sDefaultTransition;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setDefaultTransition(TransitionPort transition) {
        sDefaultTransition = transition;
    }

    private static void changeScene(ScenePort scene, TransitionPort transition) {
        ViewGroup sceneRoot = scene.getSceneRoot();
        TransitionPort transitionClone = null;
        if (transition != null) {
            transitionClone = transition.m35clone();
            transitionClone.mo51setSceneRoot(sceneRoot);
        }
        ScenePort oldScene = ScenePort.getCurrentScene(sceneRoot);
        if (oldScene != null && oldScene.isCreatedFromLayoutResource()) {
            transitionClone.setCanRemoveViews(true);
        }
        sceneChangeSetup(sceneRoot, transitionClone);
        scene.enter();
        sceneChangeRunTransition(sceneRoot, transitionClone);
    }

    static ArrayMap<ViewGroup, ArrayList<TransitionPort>> getRunningTransitions() {
        WeakReference<ArrayMap<ViewGroup, ArrayList<TransitionPort>>> runningTransitions = sRunningTransitions.get();
        if (runningTransitions == null || runningTransitions.get() == null) {
            ArrayMap<ViewGroup, ArrayList<TransitionPort>> transitions = new ArrayMap<>();
            runningTransitions = new WeakReference<>(transitions);
            sRunningTransitions.set(runningTransitions);
        }
        return runningTransitions.get();
    }

    private static void sceneChangeRunTransition(ViewGroup sceneRoot, TransitionPort transition) {
        if (transition != null && sceneRoot != null) {
            MultiListener listener = new MultiListener(transition, sceneRoot);
            sceneRoot.addOnAttachStateChangeListener(listener);
            sceneRoot.getViewTreeObserver().addOnPreDrawListener(listener);
        }
    }

    private static void sceneChangeSetup(ViewGroup sceneRoot, TransitionPort transition) {
        ArrayList<TransitionPort> runningTransitions = getRunningTransitions().get(sceneRoot);
        if (runningTransitions != null && runningTransitions.size() > 0) {
            Iterator<TransitionPort> it = runningTransitions.iterator();
            while (it.hasNext()) {
                TransitionPort runningTransition = it.next();
                runningTransition.pause(sceneRoot);
            }
        }
        if (transition != null) {
            transition.captureValues(sceneRoot, true);
        }
        ScenePort previousScene = ScenePort.getCurrentScene(sceneRoot);
        if (previousScene != null) {
            previousScene.exit();
        }
    }

    public static void go(ScenePort scene) {
        changeScene(scene, sDefaultTransition);
    }

    public static void go(ScenePort scene, TransitionPort transition) {
        changeScene(scene, transition);
    }

    public static void beginDelayedTransition(ViewGroup sceneRoot) {
        beginDelayedTransition(sceneRoot, null);
    }

    public static void beginDelayedTransition(ViewGroup sceneRoot, TransitionPort transition) {
        if (!sPendingTransitions.contains(sceneRoot) && ViewCompat.isLaidOut(sceneRoot)) {
            sPendingTransitions.add(sceneRoot);
            if (transition == null) {
                transition = sDefaultTransition;
            }
            TransitionPort transitionClone = transition.m35clone();
            sceneChangeSetup(sceneRoot, transitionClone);
            ScenePort.setCurrentScene(sceneRoot, null);
            sceneChangeRunTransition(sceneRoot, transitionClone);
        }
    }

    public void setTransition(ScenePort scene, TransitionPort transition) {
        this.mSceneTransitions.put(scene, transition);
    }

    public void setTransition(ScenePort fromScene, ScenePort toScene, TransitionPort transition) {
        ArrayMap<ScenePort, TransitionPort> sceneTransitionMap = this.mScenePairTransitions.get(toScene);
        if (sceneTransitionMap == null) {
            sceneTransitionMap = new ArrayMap<>();
            this.mScenePairTransitions.put(toScene, sceneTransitionMap);
        }
        sceneTransitionMap.put(fromScene, transition);
    }

    private TransitionPort getTransition(ScenePort scene) {
        ScenePort currScene;
        ArrayMap<ScenePort, TransitionPort> sceneTransitionMap;
        TransitionPort transition;
        ViewGroup sceneRoot = scene.getSceneRoot();
        if (sceneRoot == null || (currScene = ScenePort.getCurrentScene(sceneRoot)) == null || (sceneTransitionMap = this.mScenePairTransitions.get(scene)) == null || (transition = sceneTransitionMap.get(currScene)) == null) {
            TransitionPort transition2 = this.mSceneTransitions.get(scene);
            return transition2 != null ? transition2 : sDefaultTransition;
        }
        return transition;
    }

    public TransitionPort getNamedTransition(String fromName, ScenePort toScene) {
        ArrayMap<ScenePort, TransitionPort> m = this.mNameSceneTransitions.get(fromName);
        if (m != null) {
            return m.get(toScene);
        }
        return null;
    }

    public TransitionPort getNamedTransition(ScenePort fromScene, String toName) {
        ArrayMap<String, TransitionPort> m = this.mSceneNameTransitions.get(fromScene);
        if (m != null) {
            return m.get(toName);
        }
        return null;
    }

    public String[] getTargetSceneNames(ScenePort fromScene) {
        ArrayMap<String, TransitionPort> m = this.mSceneNameTransitions.get(fromScene);
        if (m == null) {
            return EMPTY_STRINGS;
        }
        int count = m.size();
        String[] result = new String[count];
        for (int i = 0; i < count; i++) {
            result[i] = m.keyAt(i);
        }
        return result;
    }

    public void setTransition(ScenePort fromScene, String toName, TransitionPort transition) {
        ArrayMap<String, TransitionPort> m = this.mSceneNameTransitions.get(fromScene);
        if (m == null) {
            m = new ArrayMap<>();
            this.mSceneNameTransitions.put(fromScene, m);
        }
        m.put(toName, transition);
    }

    public void setTransition(String fromName, ScenePort toScene, TransitionPort transition) {
        ArrayMap<ScenePort, TransitionPort> m = this.mNameSceneTransitions.get(fromName);
        if (m == null) {
            m = new ArrayMap<>();
            this.mNameSceneTransitions.put(fromName, m);
        }
        m.put(toScene, transition);
    }

    public void transitionTo(ScenePort scene) {
        changeScene(scene, getTransition(scene));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class MultiListener implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        ViewGroup mSceneRoot;
        TransitionPort mTransition;

        MultiListener(TransitionPort transition, ViewGroup sceneRoot) {
            this.mTransition = transition;
            this.mSceneRoot = sceneRoot;
        }

        private void removeListeners() {
            this.mSceneRoot.getViewTreeObserver().removeOnPreDrawListener(this);
            this.mSceneRoot.removeOnAttachStateChangeListener(this);
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View v) {
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View v) {
            removeListeners();
            TransitionManagerPort.sPendingTransitions.remove(this.mSceneRoot);
            ArrayList<TransitionPort> runningTransitions = TransitionManagerPort.getRunningTransitions().get(this.mSceneRoot);
            if (runningTransitions != null && runningTransitions.size() > 0) {
                Iterator<TransitionPort> it = runningTransitions.iterator();
                while (it.hasNext()) {
                    TransitionPort runningTransition = it.next();
                    runningTransition.resume(this.mSceneRoot);
                }
            }
            this.mTransition.clearValues(true);
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            removeListeners();
            TransitionManagerPort.sPendingTransitions.remove(this.mSceneRoot);
            final ArrayMap<ViewGroup, ArrayList<TransitionPort>> runningTransitions = TransitionManagerPort.getRunningTransitions();
            ArrayList<TransitionPort> currentTransitions = runningTransitions.get(this.mSceneRoot);
            ArrayList<TransitionPort> previousRunningTransitions = null;
            if (currentTransitions == null) {
                currentTransitions = new ArrayList<>();
                runningTransitions.put(this.mSceneRoot, currentTransitions);
            } else if (currentTransitions.size() > 0) {
                previousRunningTransitions = new ArrayList<>(currentTransitions);
            }
            currentTransitions.add(this.mTransition);
            this.mTransition.mo42addListener(new TransitionPort.TransitionListenerAdapter() { // from class: android.support.transition.TransitionManagerPort.MultiListener.1
                @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
                public void onTransitionEnd(TransitionPort transition) {
                    ArrayList<TransitionPort> currentTransitions2 = (ArrayList) runningTransitions.get(MultiListener.this.mSceneRoot);
                    currentTransitions2.remove(transition);
                }
            });
            this.mTransition.captureValues(this.mSceneRoot, false);
            if (previousRunningTransitions != null) {
                Iterator<TransitionPort> it = previousRunningTransitions.iterator();
                while (it.hasNext()) {
                    TransitionPort runningTransition = it.next();
                    runningTransition.resume(this.mSceneRoot);
                }
            }
            this.mTransition.playTransition(this.mSceneRoot);
            return true;
        }
    }
}
