package com.vkontakte.android.fragments.friends;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$1 implements DialogInterface.OnClickListener {
    private final FriendsImportFragment.Legacy arg$1;

    private FriendsImportFragment$Legacy$$Lambda$1(FriendsImportFragment.Legacy legacy) {
        this.arg$1 = legacy;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(FriendsImportFragment.Legacy legacy) {
        return new FriendsImportFragment$Legacy$$Lambda$1(legacy);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$startImportContacts$0(dialogInterface, i);
    }
}
