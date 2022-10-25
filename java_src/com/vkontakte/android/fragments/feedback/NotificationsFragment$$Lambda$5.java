package com.vkontakte.android.fragments.feedback;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NotificationsFragment$$Lambda$5 implements DialogInterface.OnClickListener {
    private final NotificationsFragment arg$1;
    private final boolean[] arg$2;
    private final String[] arg$3;

    private NotificationsFragment$$Lambda$5(NotificationsFragment notificationsFragment, boolean[] zArr, String[] strArr) {
        this.arg$1 = notificationsFragment;
        this.arg$2 = zArr;
        this.arg$3 = strArr;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NotificationsFragment notificationsFragment, boolean[] zArr, String[] strArr) {
        return new NotificationsFragment$$Lambda$5(notificationsFragment, zArr, strArr);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showFilterDialog$4(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
