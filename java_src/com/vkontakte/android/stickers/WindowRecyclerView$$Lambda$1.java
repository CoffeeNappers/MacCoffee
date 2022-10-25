package com.vkontakte.android.stickers;

import android.widget.PopupWindow;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WindowRecyclerView$$Lambda$1 implements Runnable {
    private final PopupWindow arg$1;

    private WindowRecyclerView$$Lambda$1(PopupWindow popupWindow) {
        this.arg$1 = popupWindow;
    }

    public static Runnable lambdaFactory$(PopupWindow popupWindow) {
        return new WindowRecyclerView$$Lambda$1(popupWindow);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.dismiss();
    }
}
