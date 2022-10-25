package com.vkontakte.android.fragments.money;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MoneyTransferDetailsFragment$$Lambda$4 implements View.OnClickListener {
    private final MoneyTransferDetailsFragment arg$1;

    private MoneyTransferDetailsFragment$$Lambda$4(MoneyTransferDetailsFragment moneyTransferDetailsFragment) {
        this.arg$1 = moneyTransferDetailsFragment;
    }

    public static View.OnClickListener lambdaFactory$(MoneyTransferDetailsFragment moneyTransferDetailsFragment) {
        return new MoneyTransferDetailsFragment$$Lambda$4(moneyTransferDetailsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$3(view);
    }
}
