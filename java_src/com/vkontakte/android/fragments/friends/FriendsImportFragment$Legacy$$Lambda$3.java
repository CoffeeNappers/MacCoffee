package com.vkontakte.android.fragments.friends;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$3 implements DialogInterface.OnCancelListener {
    private final FriendsImportFragment.Legacy arg$1;

    private FriendsImportFragment$Legacy$$Lambda$3(FriendsImportFragment.Legacy legacy) {
        this.arg$1 = legacy;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(FriendsImportFragment.Legacy legacy) {
        return new FriendsImportFragment$Legacy$$Lambda$3(legacy);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$startImportContacts$2(dialogInterface);
    }
}
