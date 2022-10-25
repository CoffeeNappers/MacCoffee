package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.SendActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SendActivity$TextIntentHandler$$Lambda$1 implements DialogInterface.OnClickListener {
    private final SendActivity.TextIntentHandler arg$1;

    private SendActivity$TextIntentHandler$$Lambda$1(SendActivity.TextIntentHandler textIntentHandler) {
        this.arg$1 = textIntentHandler;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SendActivity.TextIntentHandler textIntentHandler) {
        return new SendActivity$TextIntentHandler$$Lambda$1(textIntentHandler);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onHandle$0(dialogInterface, i);
    }
}
