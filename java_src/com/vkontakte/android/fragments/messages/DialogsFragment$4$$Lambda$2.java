package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$4$$Lambda$2 implements Runnable {
    private final DialogsFragment.AnonymousClass4 arg$1;
    private final int arg$2;
    private final String arg$3;

    private DialogsFragment$4$$Lambda$2(DialogsFragment.AnonymousClass4 anonymousClass4, int i, String str) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = i;
        this.arg$3 = str;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass4 anonymousClass4, int i, String str) {
        return new DialogsFragment$4$$Lambda$2(anonymousClass4, i, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$1(this.arg$2, this.arg$3);
    }
}
