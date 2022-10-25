package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$1$$Lambda$2 implements Messages.GetChatUsersCallback {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final DialogEntry arg$2;

    private DialogsFragment$1$$Lambda$2(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = dialogEntry;
    }

    public static Messages.GetChatUsersCallback lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, DialogEntry dialogEntry) {
        return new DialogsFragment$1$$Lambda$2(anonymousClass1, dialogEntry);
    }

    @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, String str, String str2) {
        this.arg$1.lambda$onReceive$4(this.arg$2, arrayList, str, str2);
    }
}
