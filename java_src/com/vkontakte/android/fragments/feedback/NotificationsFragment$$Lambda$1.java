package com.vkontakte.android.fragments.feedback;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NotificationsFragment$$Lambda$1 implements VoidF1 {
    private final NotificationsFragment arg$1;

    private NotificationsFragment$$Lambda$1(NotificationsFragment notificationsFragment) {
        this.arg$1 = notificationsFragment;
    }

    public static VoidF1 lambdaFactory$(NotificationsFragment notificationsFragment) {
        return new NotificationsFragment$$Lambda$1(notificationsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$0((UserProfile) obj);
    }
}
