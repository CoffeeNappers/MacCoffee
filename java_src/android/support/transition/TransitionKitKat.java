package android.support.transition;

import android.animation.Animator;
import android.animation.TimeInterpolator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.transition.Transition;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class TransitionKitKat extends TransitionImpl {
    private CompatListener mCompatListener;
    TransitionInterface mExternalTransition;
    android.transition.Transition mTransition;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void copyValues(android.transition.TransitionValues source, TransitionValues dest) {
        if (source != null) {
            dest.view = source.view;
            if (source.values.size() > 0) {
                dest.values.putAll(source.values);
            }
        }
    }

    static void copyValues(TransitionValues source, android.transition.TransitionValues dest) {
        if (source != null) {
            dest.view = source.view;
            if (source.values.size() > 0) {
                dest.values.putAll(source.values);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void wrapCaptureStartValues(TransitionInterface transition, android.transition.TransitionValues transitionValues) {
        TransitionValues externalValues = new TransitionValues();
        copyValues(transitionValues, externalValues);
        transition.captureStartValues(externalValues);
        copyValues(externalValues, transitionValues);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void wrapCaptureEndValues(TransitionInterface transition, android.transition.TransitionValues transitionValues) {
        TransitionValues externalValues = new TransitionValues();
        copyValues(transitionValues, externalValues);
        transition.captureEndValues(externalValues);
        copyValues(externalValues, transitionValues);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static TransitionValues convertToSupport(android.transition.TransitionValues values) {
        if (values == null) {
            return null;
        }
        TransitionValues supportValues = new TransitionValues();
        copyValues(values, supportValues);
        return supportValues;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static android.transition.TransitionValues convertToPlatform(TransitionValues values) {
        if (values == null) {
            return null;
        }
        android.transition.TransitionValues platformValues = new android.transition.TransitionValues();
        copyValues(values, platformValues);
        return platformValues;
    }

    @Override // android.support.transition.TransitionImpl
    public void init(TransitionInterface external, Object internal) {
        this.mExternalTransition = external;
        if (internal == null) {
            this.mTransition = new TransitionWrapper(external);
        } else {
            this.mTransition = (android.transition.Transition) internal;
        }
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl addListener(TransitionInterfaceListener listener) {
        if (this.mCompatListener == null) {
            this.mCompatListener = new CompatListener();
            this.mTransition.addListener(this.mCompatListener);
        }
        this.mCompatListener.addListener(listener);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl removeListener(TransitionInterfaceListener listener) {
        if (this.mCompatListener != null) {
            this.mCompatListener.removeListener(listener);
            if (this.mCompatListener.isEmpty()) {
                this.mTransition.removeListener(this.mCompatListener);
                this.mCompatListener = null;
            }
        }
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl addTarget(View target) {
        this.mTransition.addTarget(target);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl addTarget(int targetId) {
        this.mTransition.addTarget(targetId);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public void captureEndValues(TransitionValues transitionValues) {
        android.transition.TransitionValues internalValues = new android.transition.TransitionValues();
        copyValues(transitionValues, internalValues);
        this.mTransition.captureEndValues(internalValues);
        copyValues(internalValues, transitionValues);
    }

    @Override // android.support.transition.TransitionImpl
    public void captureStartValues(TransitionValues transitionValues) {
        android.transition.TransitionValues internalValues = new android.transition.TransitionValues();
        copyValues(transitionValues, internalValues);
        this.mTransition.captureStartValues(internalValues);
        copyValues(internalValues, transitionValues);
    }

    @Override // android.support.transition.TransitionImpl
    public Animator createAnimator(ViewGroup sceneRoot, TransitionValues startValues, TransitionValues endValues) {
        android.transition.TransitionValues internalStartValues;
        android.transition.TransitionValues internalEndValues;
        if (startValues != null) {
            internalStartValues = new android.transition.TransitionValues();
            copyValues(startValues, internalStartValues);
        } else {
            internalStartValues = null;
        }
        if (endValues != null) {
            internalEndValues = new android.transition.TransitionValues();
            copyValues(endValues, internalEndValues);
        } else {
            internalEndValues = null;
        }
        return this.mTransition.createAnimator(sceneRoot, internalStartValues, internalEndValues);
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeChildren(View target, boolean exclude) {
        this.mTransition.excludeChildren(target, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeChildren(int targetId, boolean exclude) {
        this.mTransition.excludeChildren(targetId, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeChildren(Class type, boolean exclude) {
        this.mTransition.excludeChildren(type, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeTarget(View target, boolean exclude) {
        this.mTransition.excludeTarget(target, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeTarget(int targetId, boolean exclude) {
        this.mTransition.excludeTarget(targetId, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl excludeTarget(Class type, boolean exclude) {
        this.mTransition.excludeTarget(type, exclude);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public long getDuration() {
        return this.mTransition.getDuration();
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl setDuration(long duration) {
        this.mTransition.setDuration(duration);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TimeInterpolator getInterpolator() {
        return this.mTransition.getInterpolator();
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl setInterpolator(TimeInterpolator interpolator) {
        this.mTransition.setInterpolator(interpolator);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public String getName() {
        return this.mTransition.getName();
    }

    @Override // android.support.transition.TransitionImpl
    public long getStartDelay() {
        return this.mTransition.getStartDelay();
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl setStartDelay(long startDelay) {
        this.mTransition.setStartDelay(startDelay);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public List<Integer> getTargetIds() {
        return this.mTransition.getTargetIds();
    }

    @Override // android.support.transition.TransitionImpl
    public List<View> getTargets() {
        return this.mTransition.getTargets();
    }

    @Override // android.support.transition.TransitionImpl
    public String[] getTransitionProperties() {
        return this.mTransition.getTransitionProperties();
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionValues getTransitionValues(View view, boolean start) {
        TransitionValues values = new TransitionValues();
        copyValues(this.mTransition.getTransitionValues(view, start), values);
        return values;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl removeTarget(View target) {
        this.mTransition.removeTarget(target);
        return this;
    }

    @Override // android.support.transition.TransitionImpl
    public TransitionImpl removeTarget(int targetId) {
        if (targetId > 0) {
            getTargetIds().remove(Integer.valueOf(targetId));
        }
        return this;
    }

    public String toString() {
        return this.mTransition.toString();
    }

    /* loaded from: classes.dex */
    private static class TransitionWrapper extends android.transition.Transition {
        private TransitionInterface mTransition;

        public TransitionWrapper(TransitionInterface transition) {
            this.mTransition = transition;
        }

        @Override // android.transition.Transition
        public void captureStartValues(android.transition.TransitionValues transitionValues) {
            TransitionKitKat.wrapCaptureStartValues(this.mTransition, transitionValues);
        }

        @Override // android.transition.Transition
        public void captureEndValues(android.transition.TransitionValues transitionValues) {
            TransitionKitKat.wrapCaptureEndValues(this.mTransition, transitionValues);
        }

        @Override // android.transition.Transition
        public Animator createAnimator(ViewGroup sceneRoot, android.transition.TransitionValues startValues, android.transition.TransitionValues endValues) {
            return this.mTransition.createAnimator(sceneRoot, TransitionKitKat.convertToSupport(startValues), TransitionKitKat.convertToSupport(endValues));
        }
    }

    /* loaded from: classes.dex */
    private class CompatListener implements Transition.TransitionListener {
        private final ArrayList<TransitionInterfaceListener> mListeners = new ArrayList<>();

        CompatListener() {
        }

        void addListener(TransitionInterfaceListener listener) {
            this.mListeners.add(listener);
        }

        void removeListener(TransitionInterfaceListener listener) {
            this.mListeners.remove(listener);
        }

        boolean isEmpty() {
            return this.mListeners.isEmpty();
        }

        @Override // android.transition.Transition.TransitionListener
        public void onTransitionStart(android.transition.Transition transition) {
            Iterator<TransitionInterfaceListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                TransitionInterfaceListener listener = it.next();
                listener.onTransitionStart(TransitionKitKat.this.mExternalTransition);
            }
        }

        @Override // android.transition.Transition.TransitionListener
        public void onTransitionEnd(android.transition.Transition transition) {
            Iterator<TransitionInterfaceListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                TransitionInterfaceListener listener = it.next();
                listener.onTransitionEnd(TransitionKitKat.this.mExternalTransition);
            }
        }

        @Override // android.transition.Transition.TransitionListener
        public void onTransitionCancel(android.transition.Transition transition) {
            Iterator<TransitionInterfaceListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                TransitionInterfaceListener listener = it.next();
                listener.onTransitionCancel(TransitionKitKat.this.mExternalTransition);
            }
        }

        @Override // android.transition.Transition.TransitionListener
        public void onTransitionPause(android.transition.Transition transition) {
            Iterator<TransitionInterfaceListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                TransitionInterfaceListener listener = it.next();
                listener.onTransitionPause(TransitionKitKat.this.mExternalTransition);
            }
        }

        @Override // android.transition.Transition.TransitionListener
        public void onTransitionResume(android.transition.Transition transition) {
            Iterator<TransitionInterfaceListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                TransitionInterfaceListener listener = it.next();
                listener.onTransitionResume(TransitionKitKat.this.mExternalTransition);
            }
        }
    }
}
