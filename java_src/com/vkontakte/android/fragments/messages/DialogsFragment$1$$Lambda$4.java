package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$1$$Lambda$4 implements Runnable {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final DialogEntry arg$2;
    private final ArrayList arg$3;

    private DialogsFragment$1$$Lambda$4(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry, ArrayList arrayList) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = dialogEntry;
        this.arg$3 = arrayList;
    }

    public static Runnable lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry, ArrayList arrayList) {
        return new DialogsFragment$1$$Lambda$4(anonymousClass1, dialogEntry, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$5(this.arg$2, this.arg$3);
    }
}
