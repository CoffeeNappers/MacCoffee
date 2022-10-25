package android.support.transition;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class ChangeBoundsIcs extends TransitionIcs implements ChangeBoundsInterface {
    public ChangeBoundsIcs(TransitionInterface transition) {
        init(transition, new ChangeBoundsPort());
    }

    @Override // android.support.transition.ChangeBoundsInterface
    public void setResizeClip(boolean resizeClip) {
        ((ChangeBoundsPort) this.mTransition).setResizeClip(resizeClip);
    }
}
