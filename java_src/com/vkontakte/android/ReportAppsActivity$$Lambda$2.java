package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ReportAppsActivity$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final ReportAppsActivity arg$1;

    private ReportAppsActivity$$Lambda$2(ReportAppsActivity reportAppsActivity) {
        this.arg$1 = reportAppsActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(ReportAppsActivity reportAppsActivity) {
        return new ReportAppsActivity$$Lambda$2(reportAppsActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$1(dialogInterface);
    }
}
