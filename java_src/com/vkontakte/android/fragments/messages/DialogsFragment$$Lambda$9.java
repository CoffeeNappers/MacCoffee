package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$$Lambda$9 implements Runnable {
    private final DialogEntry arg$1;

    private DialogsFragment$$Lambda$9(DialogEntry dialogEntry) {
        this.arg$1 = dialogEntry;
    }

    public static Runnable lambdaFactory$(DialogEntry dialogEntry) {
        return new DialogsFragment$$Lambda$9(dialogEntry);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        DialogsFragment.lambda$createShortcut$9(this.arg$1);
    }
}
