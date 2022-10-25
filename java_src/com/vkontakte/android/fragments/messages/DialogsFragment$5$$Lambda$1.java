package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$5$$Lambda$1 implements Runnable {
    private final DialogsFragment.AnonymousClass5 arg$1;
    private final int arg$2;
    private final String arg$3;

    private DialogsFragment$5$$Lambda$1(DialogsFragment.AnonymousClass5 anonymousClass5, int i, String str) {
        this.arg$1 = anonymousClass5;
        this.arg$2 = i;
        this.arg$3 = str;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass5 anonymousClass5, int i, String str) {
        return new DialogsFragment$5$$Lambda$1(anonymousClass5, i, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$0(this.arg$2, this.arg$3);
    }
}
