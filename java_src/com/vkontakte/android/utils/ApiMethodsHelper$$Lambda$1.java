package com.vkontakte.android.utils;

import android.content.Context;
import android.content.DialogInterface;
import com.vkontakte.android.functions.VoidF2;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ApiMethodsHelper$$Lambda$1 implements DialogInterface.OnClickListener {
    private final int arg$1;
    private final Context arg$2;
    private final VoidF2 arg$3;
    private final Object arg$4;

    private ApiMethodsHelper$$Lambda$1(int i, Context context, VoidF2 voidF2, Object obj) {
        this.arg$1 = i;
        this.arg$2 = context;
        this.arg$3 = voidF2;
        this.arg$4 = obj;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(int i, Context context, VoidF2 voidF2, Object obj) {
        return new ApiMethodsHelper$$Lambda$1(i, context, voidF2, obj);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        ApiMethodsHelper.lambda$clearHistory$0(this.arg$1, this.arg$2, this.arg$3, this.arg$4, dialogInterface, i);
    }
}
