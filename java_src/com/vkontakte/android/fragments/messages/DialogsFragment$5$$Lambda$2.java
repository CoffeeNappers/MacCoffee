package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$5$$Lambda$2 implements Runnable {
    private final DialogsFragment.AnonymousClass5 arg$1;
    private final boolean arg$2;
    private final ArrayList arg$3;
    private final int arg$4;

    private DialogsFragment$5$$Lambda$2(DialogsFragment.AnonymousClass5 anonymousClass5, boolean z, ArrayList arrayList, int i) {
        this.arg$1 = anonymousClass5;
        this.arg$2 = z;
        this.arg$3 = arrayList;
        this.arg$4 = i;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass5 anonymousClass5, boolean z, ArrayList arrayList, int i) {
        return new DialogsFragment$5$$Lambda$2(anonymousClass5, z, arrayList, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onDialogsLoaded$1(this.arg$2, this.arg$3, this.arg$4);
    }
}
