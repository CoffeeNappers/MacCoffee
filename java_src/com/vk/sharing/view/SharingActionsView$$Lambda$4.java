package com.vk.sharing.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SharingActionsView$$Lambda$4 implements View.OnClickListener {
    private final SharingActionsView arg$1;

    private SharingActionsView$$Lambda$4(SharingActionsView sharingActionsView) {
        this.arg$1 = sharingActionsView;
    }

    public static View.OnClickListener lambdaFactory$(SharingActionsView sharingActionsView) {
        return new SharingActionsView$$Lambda$4(sharingActionsView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
