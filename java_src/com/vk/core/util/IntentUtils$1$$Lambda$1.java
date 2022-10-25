package com.vk.core.util;

import android.content.DialogInterface;
import com.vk.core.util.IntentUtils;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class IntentUtils$1$$Lambda$1 implements DialogInterface.OnCancelListener {
    private final IntentUtils.AnonymousClass1 arg$1;

    private IntentUtils$1$$Lambda$1(IntentUtils.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(IntentUtils.AnonymousClass1 anonymousClass1) {
        return new IntentUtils$1$$Lambda$1(anonymousClass1);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onPreExecute$0(dialogInterface);
    }
}
