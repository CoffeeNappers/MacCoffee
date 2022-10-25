package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.data.UserNotification;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationActivity$$Lambda$2 implements DialogInterface.OnClickListener {
    private final NotificationActivity arg$1;
    private final String arg$2;
    private final UserNotification arg$3;

    private NotificationActivity$$Lambda$2(NotificationActivity notificationActivity, String str, UserNotification userNotification) {
        this.arg$1 = notificationActivity;
        this.arg$2 = str;
        this.arg$3 = userNotification;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NotificationActivity notificationActivity, String str, UserNotification userNotification) {
        return new NotificationActivity$$Lambda$2(notificationActivity, str, userNotification);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$1(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
