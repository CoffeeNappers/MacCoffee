package com.vkontakte.android.ui.widget;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class WidgetTitleView$$Lambda$2 implements View.OnClickListener {
    private final WidgetTitleView arg$1;
    private final String arg$2;

    private WidgetTitleView$$Lambda$2(WidgetTitleView widgetTitleView, String str) {
        this.arg$1 = widgetTitleView;
        this.arg$2 = str;
    }

    public static View.OnClickListener lambdaFactory$(WidgetTitleView widgetTitleView, String str) {
        return new WidgetTitleView$$Lambda$2(widgetTitleView, str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$bind$1(this.arg$2, view);
    }
}
