package com.vk.sharing.view;

import com.vk.sharing.view.SharingActionsView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SharingView$$Lambda$5 implements SharingActionsView.Listener {
    private final SharingView arg$1;

    private SharingView$$Lambda$5(SharingView sharingView) {
        this.arg$1 = sharingView;
    }

    public static SharingActionsView.Listener lambdaFactory$(SharingView sharingView) {
        return new SharingView$$Lambda$5(sharingView);
    }

    @Override // com.vk.sharing.view.SharingActionsView.Listener
    @LambdaForm.Hidden
    public void onActionClick(int i) {
        this.arg$1.lambda$new$4(i);
    }
}
