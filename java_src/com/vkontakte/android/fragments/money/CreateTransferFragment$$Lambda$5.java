package com.vkontakte.android.fragments.money;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateTransferFragment$$Lambda$5 implements View.OnClickListener {
    private final CreateTransferFragment arg$1;
    private final View arg$2;

    private CreateTransferFragment$$Lambda$5(CreateTransferFragment createTransferFragment, View view) {
        this.arg$1 = createTransferFragment;
        this.arg$2 = view;
    }

    public static View.OnClickListener lambdaFactory$(CreateTransferFragment createTransferFragment, View view) {
        return new CreateTransferFragment$$Lambda$5(createTransferFragment, view);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$4(this.arg$2, view);
    }
}
