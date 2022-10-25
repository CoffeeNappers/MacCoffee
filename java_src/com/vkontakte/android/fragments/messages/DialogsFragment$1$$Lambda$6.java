package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DialogsFragment$1$$Lambda$6 implements Messages.GetChatUsersCallback {
    private final DialogsFragment.AnonymousClass1 arg$1;
    private final int arg$2;
    private final DialogEntry arg$3;
    private final int arg$4;

    private DialogsFragment$1$$Lambda$6(DialogsFragment.AnonymousClass1 anonymousClass1, int i, DialogEntry dialogEntry, int i2) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = i;
        this.arg$3 = dialogEntry;
        this.arg$4 = i2;
    }

    public static Messages.GetChatUsersCallback lambdaFactory$(DialogsFragment.AnonymousClass1 anonymousClass1, int i, DialogEntry dialogEntry, int i2) {
        return new DialogsFragment$1$$Lambda$6(anonymousClass1, i, dialogEntry, i2);
    }

    @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, String str, String str2) {
        this.arg$1.lambda$null$2(this.arg$2, this.arg$3, this.arg$4, arrayList, str, str2);
    }
}
