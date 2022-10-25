package com.vkontakte.android.ui.widget;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SlidingUpPanelLayout$$Lambda$1 implements View.OnClickListener {
    private final SlidingUpPanelLayout arg$1;

    private SlidingUpPanelLayout$$Lambda$1(SlidingUpPanelLayout slidingUpPanelLayout) {
        this.arg$1 = slidingUpPanelLayout;
    }

    public static View.OnClickListener lambdaFactory$(SlidingUpPanelLayout slidingUpPanelLayout) {
        return new SlidingUpPanelLayout$$Lambda$1(slidingUpPanelLayout);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$setDragView$0(view);
    }
}
