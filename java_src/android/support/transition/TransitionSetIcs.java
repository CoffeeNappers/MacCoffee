package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
public class TransitionSetIcs extends TransitionIcs implements TransitionSetImpl {
    private TransitionSetPort mTransitionSet = new TransitionSetPort();

    public TransitionSetIcs(TransitionInterface transition) {
        init(transition, this.mTransitionSet);
    }

    @Override // android.support.transition.TransitionSetImpl
    public int getOrdering() {
        return this.mTransitionSet.getOrdering();
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: setOrdering */
    public TransitionSetIcs mo41setOrdering(int ordering) {
        this.mTransitionSet.setOrdering(ordering);
        return this;
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: addTransition */
    public TransitionSetIcs mo39addTransition(TransitionImpl transition) {
        this.mTransitionSet.addTransition(((TransitionIcs) transition).mTransition);
        return this;
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: removeTransition */
    public TransitionSetIcs mo40removeTransition(TransitionImpl transition) {
        this.mTransitionSet.removeTransition(((TransitionIcs) transition).mTransition);
        return this;
    }
}
