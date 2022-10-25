package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.functions.VoidF2;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$$Lambda$8 implements VoidF2 {
    private final DialogsFragment arg$1;

    private DialogsFragment$$Lambda$8(DialogsFragment dialogsFragment) {
        this.arg$1 = dialogsFragment;
    }

    public static VoidF2 lambdaFactory$(DialogsFragment dialogsFragment) {
        return new DialogsFragment$$Lambda$8(dialogsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2) {
        this.arg$1.lambda$confirmAndClearHistory$7((Integer) obj, (DialogEntry) obj2);
    }
}
