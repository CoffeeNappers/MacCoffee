package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$4$$Lambda$1 implements Runnable {
    private final DialogsFragment.AnonymousClass4 arg$1;
    private final boolean arg$2;
    private final ArrayList arg$3;

    private DialogsFragment$4$$Lambda$1(DialogsFragment.AnonymousClass4 anonymousClass4, boolean z, ArrayList arrayList) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = z;
        this.arg$3 = arrayList;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass4 anonymousClass4, boolean z, ArrayList arrayList) {
        return new DialogsFragment$4$$Lambda$1(anonymousClass4, z, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onDialogsLoaded$0(this.arg$2, this.arg$3);
    }
}
