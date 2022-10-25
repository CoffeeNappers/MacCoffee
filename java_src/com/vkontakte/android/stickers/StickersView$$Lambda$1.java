package com.vkontakte.android.stickers;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickersView$$Lambda$1 implements View.OnClickListener {
    private final StickersView arg$1;

    private StickersView$$Lambda$1(StickersView stickersView) {
        this.arg$1 = stickersView;
    }

    public static View.OnClickListener lambdaFactory$(StickersView stickersView) {
        return new StickersView$$Lambda$1(stickersView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createSettingsTabView$0(view);
    }
}
