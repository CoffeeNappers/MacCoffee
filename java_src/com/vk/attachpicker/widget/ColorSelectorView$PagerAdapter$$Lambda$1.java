package com.vk.attachpicker.widget;

import android.view.View;
import com.vk.attachpicker.widget.ColorSelectorView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ColorSelectorView$PagerAdapter$$Lambda$1 implements View.OnClickListener {
    private final ColorSelectorView.PagerAdapter arg$1;
    private final int arg$2;
    private final ColorSelectorView.ColorView arg$3;

    private ColorSelectorView$PagerAdapter$$Lambda$1(ColorSelectorView.PagerAdapter pagerAdapter, int i, ColorSelectorView.ColorView colorView) {
        this.arg$1 = pagerAdapter;
        this.arg$2 = i;
        this.arg$3 = colorView;
    }

    public static View.OnClickListener lambdaFactory$(ColorSelectorView.PagerAdapter pagerAdapter, int i, ColorSelectorView.ColorView colorView) {
        return new ColorSelectorView$PagerAdapter$$Lambda$1(pagerAdapter, i, colorView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getView$0(this.arg$2, this.arg$3, view);
    }
}
