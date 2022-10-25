package com.vk.attachpicker.widget;

import android.widget.PopupWindow;
import com.vk.attachpicker.widget.WidthSelectorView;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class WidthSelectorView$$Lambda$1 implements WidthSelectorView.OnWidthSelectedListener {
    private final WidthSelectorView.OnWidthSelectedListener arg$1;
    private final PopupWindow arg$2;

    private WidthSelectorView$$Lambda$1(WidthSelectorView.OnWidthSelectedListener onWidthSelectedListener, PopupWindow popupWindow) {
        this.arg$1 = onWidthSelectedListener;
        this.arg$2 = popupWindow;
    }

    public static WidthSelectorView.OnWidthSelectedListener lambdaFactory$(WidthSelectorView.OnWidthSelectedListener onWidthSelectedListener, PopupWindow popupWindow) {
        return new WidthSelectorView$$Lambda$1(onWidthSelectedListener, popupWindow);
    }

    @Override // com.vk.attachpicker.widget.WidthSelectorView.OnWidthSelectedListener
    @LambdaForm.Hidden
    public void onWidthSelected(int i) {
        WidthSelectorView.lambda$show$0(this.arg$1, this.arg$2, i);
    }
}
