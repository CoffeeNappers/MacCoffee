package com.vkontakte.android.data;

import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$5$$Lambda$1 implements Friends.GetUsersCallback {
    private final VKList arg$1;
    private final Messages.GetDialogsCallback arg$2;
    private final int arg$3;

    private Messages$5$$Lambda$1(VKList vKList, Messages.GetDialogsCallback getDialogsCallback, int i) {
        this.arg$1 = vKList;
        this.arg$2 = getDialogsCallback;
        this.arg$3 = i;
    }

    public static Friends.GetUsersCallback lambdaFactory$(VKList vKList, Messages.GetDialogsCallback getDialogsCallback, int i) {
        return new Messages$5$$Lambda$1(vKList, getDialogsCallback, i);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        Messages.AnonymousClass5.lambda$success$0(this.arg$1, this.arg$2, this.arg$3, arrayList);
    }
}
