package com.vkontakte.android.ui.widget;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WidgetTableView$$Lambda$1 implements View.OnClickListener {
    private final String arg$1;

    private WidgetTableView$$Lambda$1(String str) {
        this.arg$1 = str;
    }

    public static View.OnClickListener lambdaFactory$(String str) {
        return new WidgetTableView$$Lambda$1(str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        WidgetTableView.lambda$bindTextView$0(this.arg$1, view);
    }
}
