package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.SendActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SendActivity$StreamIntentHandler$$Lambda$1 implements DialogInterface.OnClickListener {
    private final SendActivity.StreamIntentHandler arg$1;

    private SendActivity$StreamIntentHandler$$Lambda$1(SendActivity.StreamIntentHandler streamIntentHandler) {
        this.arg$1 = streamIntentHandler;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SendActivity.StreamIntentHandler streamIntentHandler) {
        return new SendActivity$StreamIntentHandler$$Lambda$1(streamIntentHandler);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onHandle$0(dialogInterface, i);
    }
}
