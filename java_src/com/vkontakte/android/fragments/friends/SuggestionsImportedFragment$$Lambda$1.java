package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class SuggestionsImportedFragment$$Lambda$1 implements Friends.GetImportedContactsCallback {
    private final SuggestionsImportedFragment arg$1;

    private SuggestionsImportedFragment$$Lambda$1(SuggestionsImportedFragment suggestionsImportedFragment) {
        this.arg$1 = suggestionsImportedFragment;
    }

    public static Friends.GetImportedContactsCallback lambdaFactory$(SuggestionsImportedFragment suggestionsImportedFragment) {
        return new SuggestionsImportedFragment$$Lambda$1(suggestionsImportedFragment);
    }

    @Override // com.vkontakte.android.data.Friends.GetImportedContactsCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, ArrayList arrayList2) {
        this.arg$1.lambda$doLoadData$1(arrayList, arrayList2);
    }
}
