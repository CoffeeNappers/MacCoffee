package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ReportContentActivity$$Lambda$3 implements DialogInterface.OnClickListener {
    private final ReportContentActivity arg$1;

    private ReportContentActivity$$Lambda$3(ReportContentActivity reportContentActivity) {
        this.arg$1 = reportContentActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ReportContentActivity reportContentActivity) {
        return new ReportContentActivity$$Lambda$3(reportContentActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$2(dialogInterface, i);
    }
}
