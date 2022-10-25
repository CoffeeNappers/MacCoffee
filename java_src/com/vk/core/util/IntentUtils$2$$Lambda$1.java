package com.vk.core.util;

import android.content.DialogInterface;
import com.vk.core.util.IntentUtils;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class IntentUtils$2$$Lambda$1 implements DialogInterface.OnCancelListener {
    private final IntentUtils.AnonymousClass2 arg$1;

    private IntentUtils$2$$Lambda$1(IntentUtils.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(IntentUtils.AnonymousClass2 anonymousClass2) {
        return new IntentUtils$2$$Lambda$1(anonymousClass2);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onPreExecute$0(dialogInterface);
    }
}
