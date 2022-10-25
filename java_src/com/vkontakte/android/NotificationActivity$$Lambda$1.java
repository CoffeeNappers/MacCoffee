package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.data.UserNotification;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationActivity$$Lambda$1 implements DialogInterface.OnCancelListener {
    private final NotificationActivity arg$1;
    private final UserNotification arg$2;

    private NotificationActivity$$Lambda$1(NotificationActivity notificationActivity, UserNotification userNotification) {
        this.arg$1 = notificationActivity;
        this.arg$2 = userNotification;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(NotificationActivity notificationActivity, UserNotification userNotification) {
        return new NotificationActivity$$Lambda$1(notificationActivity, userNotification);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$0(this.arg$2, dialogInterface);
    }
}
