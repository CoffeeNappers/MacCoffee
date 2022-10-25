package com.vkontakte.android.fragments.messages;

import android.content.Intent;
import com.vkontakte.android.Message;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$1$$Lambda$1 implements Messages.GetUnreadCountCallback {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final Message arg$2;
    private final Intent arg$3;

    private DialogsFragment$1$$Lambda$1(DialogsFragment.AnonymousClass1 anonymousClass1, Message message, Intent intent) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = message;
        this.arg$3 = intent;
    }

    public static Messages.GetUnreadCountCallback lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, Message message, Intent intent) {
        return new DialogsFragment$1$$Lambda$1(anonymousClass1, message, intent);
    }

    @Override // com.vkontakte.android.data.Messages.GetUnreadCountCallback
    @LambdaForm.Hidden
    public void onUnreadCountLoaded(int i, int i2) {
        this.arg$1.lambda$onReceive$3(this.arg$2, this.arg$3, i, i2);
    }
}
