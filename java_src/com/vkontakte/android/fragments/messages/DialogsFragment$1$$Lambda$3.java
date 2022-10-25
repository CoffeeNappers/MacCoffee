package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$1$$Lambda$3 implements Friends.GetUsersCallback {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final DialogEntry arg$2;

    private DialogsFragment$1$$Lambda$3(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = dialogEntry;
    }

    public static Friends.GetUsersCallback lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        return new DialogsFragment$1$$Lambda$3(anonymousClass1, dialogEntry);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$onReceive$6(this.arg$2, arrayList);
    }
}
