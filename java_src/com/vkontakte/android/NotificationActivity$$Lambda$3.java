package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.data.UserNotification;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationActivity$$Lambda$3 implements DialogInterface.OnClickListener {
    private final NotificationActivity arg$1;
    private final UserNotification arg$2;

    private NotificationActivity$$Lambda$3(NotificationActivity notificationActivity, UserNotification userNotification) {
        this.arg$1 = notificationActivity;
        this.arg$2 = userNotification;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NotificationActivity notificationActivity, UserNotification userNotification) {
        return new NotificationActivity$$Lambda$3(notificationActivity, userNotification);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$2(this.arg$2, dialogInterface, i);
    }
}
