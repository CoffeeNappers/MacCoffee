package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$11 implements View.OnClickListener {
    private final String arg$1;

    private GoodFragment$$Lambda$11(String str) {
        this.arg$1 = str;
    }

    public static View.OnClickListener lambdaFactory$(String str) {
        return new GoodFragment$$Lambda$11(str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        GoodFragment.lambda$createGoodDataList$11(this.arg$1, view);
    }
}
