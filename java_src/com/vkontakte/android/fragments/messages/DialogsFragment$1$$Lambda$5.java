package com.vkontakte.android.fragments.messages;

import android.content.Intent;
import com.vkontakte.android.Message;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$1$$Lambda$5 implements Runnable {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final Message arg$2;
    private final Intent arg$3;
    private final int arg$4;

    private DialogsFragment$1$$Lambda$5(DialogsFragment.AnonymousClass1 anonymousClass1, Message message, Intent intent, int i) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = message;
        this.arg$3 = intent;
        this.arg$4 = i;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, Message message, Intent intent, int i) {
        return new DialogsFragment$1$$Lambda$5(anonymousClass1, message, intent, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2, this.arg$3, this.arg$4);
    }
}
