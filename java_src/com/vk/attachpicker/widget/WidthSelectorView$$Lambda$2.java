package com.vk.attachpicker.widget;

import android.view.View;
import com.vk.attachpicker.widget.WidthSelectorView;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class WidthSelectorView$$Lambda$2 implements View.OnClickListener {
    private final WidthSelectorView arg$1;
    private final WidthSelectorView.ColorView arg$2;
    private final int arg$3;

    private WidthSelectorView$$Lambda$2(WidthSelectorView widthSelectorView, WidthSelectorView.ColorView colorView, int i) {
        this.arg$1 = widthSelectorView;
        this.arg$2 = colorView;
        this.arg$3 = i;
    }

    public static View.OnClickListener lambdaFactory$(WidthSelectorView widthSelectorView, WidthSelectorView.ColorView colorView, int i) {
        return new WidthSelectorView$$Lambda$2(widthSelectorView, colorView, i);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$addWidthView$1(this.arg$2, this.arg$3, view);
    }
}
