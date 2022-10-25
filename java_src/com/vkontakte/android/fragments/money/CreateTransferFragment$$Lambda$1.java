package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class CreateTransferFragment$$Lambda$1 implements Friends.GetUsersCallback {
    private final CreateTransferFragment arg$1;

    private CreateTransferFragment$$Lambda$1(CreateTransferFragment createTransferFragment) {
        this.arg$1 = createTransferFragment;
    }

    public static Friends.GetUsersCallback lambdaFactory$(CreateTransferFragment createTransferFragment) {
        return new CreateTransferFragment$$Lambda$1(createTransferFragment);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$doLoadData$0(arrayList);
    }
}
