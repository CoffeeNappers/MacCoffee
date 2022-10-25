package com.vkontakte.android.fragments.feedback;

import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.functions.VoidF1Int;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NotificationsFragment$$Lambda$2 implements VoidF1Int {
    private final NotificationsFragment arg$1;

    private NotificationsFragment$$Lambda$2(NotificationsFragment notificationsFragment) {
        this.arg$1 = notificationsFragment;
    }

    public static VoidF1Int lambdaFactory$(NotificationsFragment notificationsFragment) {
        return new NotificationsFragment$$Lambda$2(notificationsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1Int
    @LambdaForm.Hidden
    public void f(Object obj, int i) {
        this.arg$1.lambda$new$1((Notification) obj, i);
    }
}
