package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ReportAppsActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final ReportAppsActivity arg$1;

    private ReportAppsActivity$$Lambda$1(ReportAppsActivity reportAppsActivity) {
        this.arg$1 = reportAppsActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ReportAppsActivity reportAppsActivity) {
        return new ReportAppsActivity$$Lambda$1(reportAppsActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$0(dialogInterface, i);
    }
}
