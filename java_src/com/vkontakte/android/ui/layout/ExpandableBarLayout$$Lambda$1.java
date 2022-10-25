package com.vkontakte.android.ui.layout;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ExpandableBarLayout$$Lambda$1 implements View.OnClickListener {
    private final ExpandableBarLayout arg$1;

    private ExpandableBarLayout$$Lambda$1(ExpandableBarLayout expandableBarLayout) {
        this.arg$1 = expandableBarLayout;
    }

    public static View.OnClickListener lambdaFactory$(ExpandableBarLayout expandableBarLayout) {
        return new ExpandableBarLayout$$Lambda$1(expandableBarLayout);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onFinishInflate$0(view);
    }
}
