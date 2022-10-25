package com.vkontakte.android.utils;

import android.content.Context;
import android.content.DialogInterface;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ApiMethodsHelper$$Lambda$2 implements DialogInterface.OnClickListener {
    private final int arg$1;
    private final int arg$2;
    private final Context arg$3;
    private final VoidF1 arg$4;

    private ApiMethodsHelper$$Lambda$2(int i, int i2, Context context, VoidF1 voidF1) {
        this.arg$1 = i;
        this.arg$2 = i2;
        this.arg$3 = context;
        this.arg$4 = voidF1;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(int i, int i2, Context context, VoidF1 voidF1) {
        return new ApiMethodsHelper$$Lambda$2(i, i2, context, voidF1);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        ApiMethodsHelper.lambda$removeUserFromChat$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4, dialogInterface, i);
    }
}
