package com.vkontakte.android.fragments.friends;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class SuggestionsImportedFragment$$Lambda$2 implements Runnable {
    private final SuggestionsImportedFragment arg$1;
    private final ArrayList arg$2;
    private final ArrayList arg$3;

    private SuggestionsImportedFragment$$Lambda$2(SuggestionsImportedFragment suggestionsImportedFragment, ArrayList arrayList, ArrayList arrayList2) {
        this.arg$1 = suggestionsImportedFragment;
        this.arg$2 = arrayList;
        this.arg$3 = arrayList2;
    }

    public static Runnable lambdaFactory$(SuggestionsImportedFragment suggestionsImportedFragment, ArrayList arrayList, ArrayList arrayList2) {
        return new SuggestionsImportedFragment$$Lambda$2(suggestionsImportedFragment, arrayList, arrayList2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2, this.arg$3);
    }
}
