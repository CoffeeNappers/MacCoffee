package com.vkontakte.android;

import android.support.v7.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ViewUtils$$Lambda$2 implements Runnable {
    private final PopupMenu arg$1;

    private ViewUtils$$Lambda$2(PopupMenu popupMenu) {
        this.arg$1 = popupMenu;
    }

    public static Runnable lambdaFactory$(PopupMenu popupMenu) {
        return new ViewUtils$$Lambda$2(popupMenu);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ViewUtils.lambda$dismissDialogSafety$1(this.arg$1);
    }
}
