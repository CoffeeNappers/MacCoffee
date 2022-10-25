package com.vkontakte.android.fragments.money;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateTransferFragment$$Lambda$4 implements View.OnClickListener {
    private final CreateTransferFragment arg$1;

    private CreateTransferFragment$$Lambda$4(CreateTransferFragment createTransferFragment) {
        this.arg$1 = createTransferFragment;
    }

    public static View.OnClickListener lambdaFactory$(CreateTransferFragment createTransferFragment) {
        return new CreateTransferFragment$$Lambda$4(createTransferFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$3(view);
    }
}
