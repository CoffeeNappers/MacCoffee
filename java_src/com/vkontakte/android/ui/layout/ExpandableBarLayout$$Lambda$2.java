package com.vkontakte.android.ui.layout;

import android.animation.ValueAnimator;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ExpandableBarLayout$$Lambda$2 implements ValueAnimator.AnimatorUpdateListener {
    private final ExpandableBarLayout arg$1;

    private ExpandableBarLayout$$Lambda$2(ExpandableBarLayout expandableBarLayout) {
        this.arg$1 = expandableBarLayout;
    }

    public static ValueAnimator.AnimatorUpdateListener lambdaFactory$(ExpandableBarLayout expandableBarLayout) {
        return new ExpandableBarLayout$$Lambda$2(expandableBarLayout);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    @LambdaForm.Hidden
    public void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.arg$1.lambda$openPanel$1(valueAnimator);
    }
}
