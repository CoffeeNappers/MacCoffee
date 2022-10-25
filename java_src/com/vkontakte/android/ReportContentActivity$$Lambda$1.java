package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ReportContentActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final ReportContentActivity arg$1;

    private ReportContentActivity$$Lambda$1(ReportContentActivity reportContentActivity) {
        this.arg$1 = reportContentActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ReportContentActivity reportContentActivity) {
        return new ReportContentActivity$$Lambda$1(reportContentActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$0(dialogInterface, i);
    }
}
