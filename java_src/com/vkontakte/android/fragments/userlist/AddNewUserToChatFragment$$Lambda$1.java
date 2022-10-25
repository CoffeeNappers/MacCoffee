package com.vkontakte.android.fragments.userlist;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AddNewUserToChatFragment$$Lambda$1 implements Runnable {
    private final AddNewUserToChatFragment arg$1;
    private final int[] arg$2;

    private AddNewUserToChatFragment$$Lambda$1(AddNewUserToChatFragment addNewUserToChatFragment, int[] iArr) {
        this.arg$1 = addNewUserToChatFragment;
        this.arg$2 = iArr;
    }

    public static Runnable lambdaFactory$(AddNewUserToChatFragment addNewUserToChatFragment, int[] iArr) {
        return new AddNewUserToChatFragment$$Lambda$1(addNewUserToChatFragment, iArr);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$doLoadData$0(this.arg$2);
    }
}
