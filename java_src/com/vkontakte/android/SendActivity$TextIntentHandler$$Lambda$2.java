package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.SendActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SendActivity$TextIntentHandler$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final SendActivity.TextIntentHandler arg$1;

    private SendActivity$TextIntentHandler$$Lambda$2(SendActivity.TextIntentHandler textIntentHandler) {
        this.arg$1 = textIntentHandler;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(SendActivity.TextIntentHandler textIntentHandler) {
        return new SendActivity$TextIntentHandler$$Lambda$2(textIntentHandler);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onHandle$1(dialogInterface);
    }
}
