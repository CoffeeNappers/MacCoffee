package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class TransitionSetKitKat extends TransitionKitKat implements TransitionSetImpl {
    private android.transition.TransitionSet mTransitionSet = new android.transition.TransitionSet();

    public TransitionSetKitKat(TransitionInterface transition) {
        init(transition, this.mTransitionSet);
    }

    @Override // android.support.transition.TransitionSetImpl
    public int getOrdering() {
        return this.mTransitionSet.getOrdering();
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: setOrdering  reason: collision with other method in class */
    public TransitionSetKitKat mo41setOrdering(int ordering) {
        this.mTransitionSet.setOrdering(ordering);
        return this;
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: addTransition  reason: collision with other method in class */
    public TransitionSetKitKat mo39addTransition(TransitionImpl transition) {
        this.mTransitionSet.addTransition(((TransitionKitKat) transition).mTransition);
        return this;
    }

    @Override // android.support.transition.TransitionSetImpl
    /* renamed from: removeTransition  reason: collision with other method in class */
    public TransitionSetKitKat mo40removeTransition(TransitionImpl transition) {
        this.mTransitionSet.removeTransition(((TransitionKitKat) transition).mTransition);
        return this;
    }
}
