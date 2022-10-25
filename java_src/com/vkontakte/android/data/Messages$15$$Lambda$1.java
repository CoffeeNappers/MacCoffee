package com.vkontakte.android.data;

import com.vkontakte.android.api.messages.MessagesSearch;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$15$$Lambda$1 implements Friends.GetUsersCallback {
    private final MessagesSearch.Result arg$1;
    private final Messages.SearchCallback arg$2;

    private Messages$15$$Lambda$1(MessagesSearch.Result result, Messages.SearchCallback searchCallback) {
        this.arg$1 = result;
        this.arg$2 = searchCallback;
    }

    public static Friends.GetUsersCallback lambdaFactory$(MessagesSearch.Result result, Messages.SearchCallback searchCallback) {
        return new Messages$15$$Lambda$1(result, searchCallback);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        Messages.AnonymousClass15.lambda$success$0(this.arg$1, this.arg$2, arrayList);
    }
}
