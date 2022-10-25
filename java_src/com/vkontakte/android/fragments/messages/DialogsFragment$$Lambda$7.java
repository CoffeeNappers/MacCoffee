package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$$Lambda$7 implements Runnable {
    private final DialogsFragment arg$1;
    private final boolean arg$2;

    private DialogsFragment$$Lambda$7(DialogsFragment dialogsFragment, boolean z) {
        this.arg$1 = dialogsFragment;
        this.arg$2 = z;
    }

    public static Runnable lambdaFactory$(DialogsFragment dialogsFragment, boolean z) {
        return new DialogsFragment$$Lambda$7(dialogsFragment, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateList$6(this.arg$2);
    }
}
