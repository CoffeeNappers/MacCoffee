package com.vkontakte.android.ui.widget;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WidgetMatchesItemView$$Lambda$1 implements View.OnClickListener {
    private final WidgetMatchesItemView arg$1;
    private final String arg$2;

    private WidgetMatchesItemView$$Lambda$1(WidgetMatchesItemView widgetMatchesItemView, String str) {
        this.arg$1 = widgetMatchesItemView;
        this.arg$2 = str;
    }

    public static View.OnClickListener lambdaFactory$(WidgetMatchesItemView widgetMatchesItemView, String str) {
        return new WidgetMatchesItemView$$Lambda$1(widgetMatchesItemView, str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$bind$0(this.arg$2, view);
    }
}
