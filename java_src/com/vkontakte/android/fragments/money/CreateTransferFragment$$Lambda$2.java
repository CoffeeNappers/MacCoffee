package com.vkontakte.android.fragments.money;

import com.vkontakte.android.UserProfile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateTransferFragment$$Lambda$2 implements Runnable {
    private final CreateTransferFragment arg$1;
    private final UserProfile arg$2;

    private CreateTransferFragment$$Lambda$2(CreateTransferFragment createTransferFragment, UserProfile userProfile) {
        this.arg$1 = createTransferFragment;
        this.arg$2 = userProfile;
    }

    public static Runnable lambdaFactory$(CreateTransferFragment createTransferFragment, UserProfile userProfile) {
        return new CreateTransferFragment$$Lambda$2(createTransferFragment, userProfile);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$handleUserOrGroupToLoaded$1(this.arg$2);
    }
}
