package com.vkontakte.android.data;

import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$10 implements Friends.GetUsersCallback {
    private final ArrayList arg$1;
    private final int arg$2;
    private final int arg$3;
    private final Messages.GetDialogsCallback arg$4;

    private Messages$$Lambda$10(ArrayList arrayList, int i, int i2, Messages.GetDialogsCallback getDialogsCallback) {
        this.arg$1 = arrayList;
        this.arg$2 = i;
        this.arg$3 = i2;
        this.arg$4 = getDialogsCallback;
    }

    public static Friends.GetUsersCallback lambdaFactory$(ArrayList arrayList, int i, int i2, Messages.GetDialogsCallback getDialogsCallback) {
        return new Messages$$Lambda$10(arrayList, i, i2, getDialogsCallback);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        Messages.lambda$null$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4, arrayList);
    }
}
