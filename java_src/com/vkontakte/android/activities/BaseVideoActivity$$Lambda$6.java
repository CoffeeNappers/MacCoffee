package com.vkontakte.android.activities;

import android.support.v7.widget.PopupMenu;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$6 implements PopupMenu.OnDismissListener {
    private final BaseVideoActivity arg$1;
    private final View arg$2;

    private BaseVideoActivity$$Lambda$6(BaseVideoActivity baseVideoActivity, View view) {
        this.arg$1 = baseVideoActivity;
        this.arg$2 = view;
    }

    public static PopupMenu.OnDismissListener lambdaFactory$(BaseVideoActivity baseVideoActivity, View view) {
        return new BaseVideoActivity$$Lambda$6(baseVideoActivity, view);
    }

    @Override // android.support.v7.widget.PopupMenu.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(PopupMenu popupMenu) {
        this.arg$1.lambda$showAddMenu$5(this.arg$2, popupMenu);
    }
}
