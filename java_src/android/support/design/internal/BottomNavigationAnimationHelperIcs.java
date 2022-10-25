package android.support.design.internal;

import android.support.transition.AutoTransition;
import android.support.transition.TransitionManager;
import android.support.transition.TransitionSet;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.view.ViewGroup;
/* loaded from: classes.dex */
class BottomNavigationAnimationHelperIcs extends BottomNavigationAnimationHelperBase {
    private static final long ACTIVE_ANIMATION_DURATION_MS = 115;
    private final TransitionSet mSet = new AutoTransition();

    /* JADX INFO: Access modifiers changed from: package-private */
    public BottomNavigationAnimationHelperIcs() {
        this.mSet.setOrdering(0);
        this.mSet.setDuration(ACTIVE_ANIMATION_DURATION_MS);
        this.mSet.setInterpolator(new FastOutSlowInInterpolator());
        TextScale textScale = new TextScale();
        this.mSet.addTransition(textScale);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.internal.BottomNavigationAnimationHelperBase
    public void beginDelayedTransition(ViewGroup view) {
        TransitionManager.beginDelayedTransition(view, this.mSet);
    }
}
