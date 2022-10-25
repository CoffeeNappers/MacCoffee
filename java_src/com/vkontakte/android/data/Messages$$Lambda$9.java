package com.vkontakte.android.data;

import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$9 implements Friends.GetUsersCallback {
    private static final Messages$$Lambda$9 instance = new Messages$$Lambda$9();

    private Messages$$Lambda$9() {
    }

    public static Friends.GetUsersCallback lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        Messages.lambda$applyActions$9(arrayList);
    }
}
