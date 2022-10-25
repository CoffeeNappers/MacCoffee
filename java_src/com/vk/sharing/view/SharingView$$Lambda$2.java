package com.vk.sharing.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SharingView$$Lambda$2 implements View.OnClickListener {
    private final SharingView arg$1;

    private SharingView$$Lambda$2(SharingView sharingView) {
        this.arg$1 = sharingView;
    }

    public static View.OnClickListener lambdaFactory$(SharingView sharingView) {
        return new SharingView$$Lambda$2(sharingView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
