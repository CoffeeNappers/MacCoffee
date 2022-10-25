package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$1$$Lambda$7 implements Runnable {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final DialogEntry arg$2;

    private DialogsFragment$1$$Lambda$7(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = dialogEntry;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        return new DialogsFragment$1$$Lambda$7(anonymousClass1, dialogEntry);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$1(this.arg$2);
    }
}
