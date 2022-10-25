package com.vkontakte.android.auth;

import android.content.Context;
import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$3 implements DialogInterface.OnClickListener {
    private final Context arg$1;

    private VKAuth$$Lambda$3(Context context) {
        this.arg$1 = context;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(Context context) {
        return new VKAuth$$Lambda$3(context);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        VKAuth.lambda$ensureLoggedIn$4(this.arg$1, dialogInterface, i);
    }
}
