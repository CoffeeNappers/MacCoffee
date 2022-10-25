package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChronicleAttachment$$Lambda$1 implements View.OnClickListener {
    private final ChronicleAttachment arg$1;

    private ChronicleAttachment$$Lambda$1(ChronicleAttachment chronicleAttachment) {
        this.arg$1 = chronicleAttachment;
    }

    public static View.OnClickListener lambdaFactory$(ChronicleAttachment chronicleAttachment) {
        return new ChronicleAttachment$$Lambda$1(chronicleAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getFullView$0(view);
    }
}
