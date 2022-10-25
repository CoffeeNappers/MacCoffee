package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.SendActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SendActivity$StreamIntentHandler$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final SendActivity.StreamIntentHandler arg$1;

    private SendActivity$StreamIntentHandler$$Lambda$2(SendActivity.StreamIntentHandler streamIntentHandler) {
        this.arg$1 = streamIntentHandler;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(SendActivity.StreamIntentHandler streamIntentHandler) {
        return new SendActivity$StreamIntentHandler$$Lambda$2(streamIntentHandler);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onHandle$1(dialogInterface);
    }
}
