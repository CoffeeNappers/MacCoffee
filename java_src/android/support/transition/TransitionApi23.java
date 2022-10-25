package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.dex */
class TransitionApi23 extends TransitionKitKat {
    @Override // android.support.transition.TransitionKitKat, android.support.transition.TransitionImpl
    public TransitionImpl removeTarget(int targetId) {
        this.mTransition.removeTarget(targetId);
        return this;
    }
}
