package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ReportContentActivity$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final ReportContentActivity arg$1;

    private ReportContentActivity$$Lambda$2(ReportContentActivity reportContentActivity) {
        this.arg$1 = reportContentActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(ReportContentActivity reportContentActivity) {
        return new ReportContentActivity$$Lambda$2(reportContentActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$1(dialogInterface);
    }
}
