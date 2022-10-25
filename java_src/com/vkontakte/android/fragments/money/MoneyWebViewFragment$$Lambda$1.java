package com.vkontakte.android.fragments.money;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MoneyWebViewFragment$$Lambda$1 implements View.OnClickListener {
    private final MoneyWebViewFragment arg$1;

    private MoneyWebViewFragment$$Lambda$1(MoneyWebViewFragment moneyWebViewFragment) {
        this.arg$1 = moneyWebViewFragment;
    }

    public static View.OnClickListener lambdaFactory$(MoneyWebViewFragment moneyWebViewFragment) {
        return new MoneyWebViewFragment$$Lambda$1(moneyWebViewFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$0(view);
    }
}
