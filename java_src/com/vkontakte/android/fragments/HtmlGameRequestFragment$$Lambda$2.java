package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class HtmlGameRequestFragment$$Lambda$2 implements View.OnClickListener {
    private final HtmlGameRequestFragment arg$1;

    private HtmlGameRequestFragment$$Lambda$2(HtmlGameRequestFragment htmlGameRequestFragment) {
        this.arg$1 = htmlGameRequestFragment;
    }

    public static View.OnClickListener lambdaFactory$(HtmlGameRequestFragment htmlGameRequestFragment) {
        return new HtmlGameRequestFragment$$Lambda$2(htmlGameRequestFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
