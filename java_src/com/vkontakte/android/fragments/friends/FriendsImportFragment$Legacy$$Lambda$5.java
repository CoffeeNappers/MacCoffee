package com.vkontakte.android.fragments.friends;

import android.accounts.Account;
import android.content.DialogInterface;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$5 implements DialogInterface.OnClickListener {
    private final FriendsImportFragment.Legacy arg$1;
    private final Account[] arg$2;

    private FriendsImportFragment$Legacy$$Lambda$5(FriendsImportFragment.Legacy legacy, Account[] accountArr) {
        this.arg$1 = legacy;
        this.arg$2 = accountArr;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(FriendsImportFragment.Legacy legacy, Account[] accountArr) {
        return new FriendsImportFragment$Legacy$$Lambda$5(legacy, accountArr);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$startImportGmail$5(this.arg$2, dialogInterface, i);
    }
}
