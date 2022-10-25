package android.support.transition;

import android.animation.TimeInterpolator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.transition.TransitionPort;
import android.util.AndroidRuntimeException;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
public class TransitionSetPort extends TransitionPort {
    public static final int ORDERING_SEQUENTIAL = 1;
    public static final int ORDERING_TOGETHER = 0;
    int mCurrentListeners;
    ArrayList<TransitionPort> mTransitions = new ArrayList<>();
    boolean mStarted = false;
    private boolean mPlayTogether = true;

    public int getOrdering() {
        return this.mPlayTogether ? 0 : 1;
    }

    public TransitionSetPort setOrdering(int ordering) {
        switch (ordering) {
            case 0:
                this.mPlayTogether = true;
                break;
            case 1:
                this.mPlayTogether = false;
                break;
            default:
                throw new AndroidRuntimeException("Invalid parameter for TransitionSet ordering: " + ordering);
        }
        return this;
    }

    public TransitionSetPort addTransition(TransitionPort transition) {
        if (transition != null) {
            this.mTransitions.add(transition);
            transition.mParent = this;
            if (this.mDuration >= 0) {
                transition.mo49setDuration(this.mDuration);
            }
        }
        return this;
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: setDuration  reason: collision with other method in class */
    public TransitionSetPort mo49setDuration(long duration) {
        super.mo49setDuration(duration);
        if (this.mDuration >= 0) {
            int numTransitions = this.mTransitions.size();
            for (int i = 0; i < numTransitions; i++) {
                this.mTransitions.get(i).mo49setDuration(duration);
            }
        }
        return this;
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: setStartDelay  reason: collision with other method in class */
    public TransitionSetPort mo52setStartDelay(long startDelay) {
        return (TransitionSetPort) super.mo52setStartDelay(startDelay);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: setInterpolator  reason: collision with other method in class */
    public TransitionSetPort mo50setInterpolator(TimeInterpolator interpolator) {
        return (TransitionSetPort) super.mo50setInterpolator(interpolator);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: addTarget  reason: collision with other method in class */
    public TransitionSetPort mo44addTarget(View target) {
        return (TransitionSetPort) super.mo44addTarget(target);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: addTarget  reason: collision with other method in class */
    public TransitionSetPort mo43addTarget(int targetId) {
        return (TransitionSetPort) super.mo43addTarget(targetId);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: addListener  reason: collision with other method in class */
    public TransitionSetPort mo42addListener(TransitionPort.TransitionListener listener) {
        return (TransitionSetPort) super.mo42addListener(listener);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: removeTarget  reason: collision with other method in class */
    public TransitionSetPort mo47removeTarget(int targetId) {
        return (TransitionSetPort) super.mo47removeTarget(targetId);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: removeTarget  reason: collision with other method in class */
    public TransitionSetPort mo48removeTarget(View target) {
        return (TransitionSetPort) super.mo48removeTarget(target);
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: removeListener  reason: collision with other method in class */
    public TransitionSetPort mo46removeListener(TransitionPort.TransitionListener listener) {
        return (TransitionSetPort) super.mo46removeListener(listener);
    }

    public TransitionSetPort removeTransition(TransitionPort transition) {
        this.mTransitions.remove(transition);
        transition.mParent = null;
        return this;
    }

    private void setupStartEndListeners() {
        TransitionSetListener listener = new TransitionSetListener(this);
        Iterator<TransitionPort> it = this.mTransitions.iterator();
        while (it.hasNext()) {
            TransitionPort childTransition = it.next();
            childTransition.mo42addListener(listener);
        }
        this.mCurrentListeners = this.mTransitions.size();
    }

    @Override // android.support.transition.TransitionPort
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected void createAnimators(ViewGroup sceneRoot, TransitionValuesMaps startValues, TransitionValuesMaps endValues) {
        Iterator<TransitionPort> it = this.mTransitions.iterator();
        while (it.hasNext()) {
            TransitionPort childTransition = it.next();
            childTransition.createAnimators(sceneRoot, startValues, endValues);
        }
    }

    @Override // android.support.transition.TransitionPort
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected void runAnimators() {
        if (this.mTransitions.isEmpty()) {
            start();
            end();
            return;
        }
        setupStartEndListeners();
        if (!this.mPlayTogether) {
            for (int i = 1; i < this.mTransitions.size(); i++) {
                TransitionPort previousTransition = this.mTransitions.get(i - 1);
                final TransitionPort nextTransition = this.mTransitions.get(i);
                previousTransition.mo42addListener(new TransitionPort.TransitionListenerAdapter() { // from class: android.support.transition.TransitionSetPort.1
                    @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
                    public void onTransitionEnd(TransitionPort transition) {
                        nextTransition.runAnimators();
                        transition.mo46removeListener(this);
                    }
                });
            }
            TransitionPort firstTransition = this.mTransitions.get(0);
            if (firstTransition != null) {
                firstTransition.runAnimators();
                return;
            }
            return;
        }
        Iterator<TransitionPort> it = this.mTransitions.iterator();
        while (it.hasNext()) {
            TransitionPort childTransition = it.next();
            childTransition.runAnimators();
        }
    }

    @Override // android.support.transition.TransitionPort
    public void captureStartValues(TransitionValues transitionValues) {
        int targetId = transitionValues.view.getId();
        if (isValidTarget(transitionValues.view, targetId)) {
            Iterator<TransitionPort> it = this.mTransitions.iterator();
            while (it.hasNext()) {
                TransitionPort childTransition = it.next();
                if (childTransition.isValidTarget(transitionValues.view, targetId)) {
                    childTransition.captureStartValues(transitionValues);
                }
            }
        }
    }

    @Override // android.support.transition.TransitionPort
    public void captureEndValues(TransitionValues transitionValues) {
        int targetId = transitionValues.view.getId();
        if (isValidTarget(transitionValues.view, targetId)) {
            Iterator<TransitionPort> it = this.mTransitions.iterator();
            while (it.hasNext()) {
                TransitionPort childTransition = it.next();
                if (childTransition.isValidTarget(transitionValues.view, targetId)) {
                    childTransition.captureEndValues(transitionValues);
                }
            }
        }
    }

    @Override // android.support.transition.TransitionPort
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void pause(View sceneRoot) {
        super.pause(sceneRoot);
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            this.mTransitions.get(i).pause(sceneRoot);
        }
    }

    @Override // android.support.transition.TransitionPort
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void resume(View sceneRoot) {
        super.resume(sceneRoot);
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            this.mTransitions.get(i).resume(sceneRoot);
        }
    }

    @Override // android.support.transition.TransitionPort
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected void cancel() {
        super.cancel();
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            this.mTransitions.get(i).cancel();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.transition.TransitionPort
    /* renamed from: setSceneRoot  reason: collision with other method in class */
    public TransitionSetPort mo51setSceneRoot(ViewGroup sceneRoot) {
        super.mo51setSceneRoot(sceneRoot);
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            this.mTransitions.get(i).mo51setSceneRoot(sceneRoot);
        }
        return this;
    }

    @Override // android.support.transition.TransitionPort
    void setCanRemoveViews(boolean canRemoveViews) {
        super.setCanRemoveViews(canRemoveViews);
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            this.mTransitions.get(i).setCanRemoveViews(canRemoveViews);
        }
    }

    @Override // android.support.transition.TransitionPort
    String toString(String indent) {
        String result = super.toString(indent);
        for (int i = 0; i < this.mTransitions.size(); i++) {
            result = result + "\n" + this.mTransitions.get(i).toString(indent + "  ");
        }
        return result;
    }

    @Override // android.support.transition.TransitionPort
    /* renamed from: clone  reason: collision with other method in class */
    public TransitionSetPort mo45clone() {
        TransitionSetPort clone = (TransitionSetPort) super.m35clone();
        clone.mTransitions = new ArrayList<>();
        int numTransitions = this.mTransitions.size();
        for (int i = 0; i < numTransitions; i++) {
            clone.addTransition(this.mTransitions.get(i).m35clone());
        }
        return clone;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class TransitionSetListener extends TransitionPort.TransitionListenerAdapter {
        TransitionSetPort mTransitionSet;

        TransitionSetListener(TransitionSetPort transitionSet) {
            this.mTransitionSet = transitionSet;
        }

        @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
        public void onTransitionStart(TransitionPort transition) {
            if (!this.mTransitionSet.mStarted) {
                this.mTransitionSet.start();
                this.mTransitionSet.mStarted = true;
            }
        }

        @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
        public void onTransitionEnd(TransitionPort transition) {
            TransitionSetPort transitionSetPort = this.mTransitionSet;
            transitionSetPort.mCurrentListeners--;
            if (this.mTransitionSet.mCurrentListeners == 0) {
                this.mTransitionSet.mStarted = false;
                this.mTransitionSet.end();
            }
            transition.mo46removeListener(this);
        }
    }
}
