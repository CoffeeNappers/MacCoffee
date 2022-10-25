package com.vkontakte.android.fragments.fave;

import android.content.DialogInterface;
import com.vkontakte.android.UserProfile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FaveLinkListFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final FaveLinkListFragment arg$1;
    private final UserProfile arg$2;

    private FaveLinkListFragment$$Lambda$1(FaveLinkListFragment faveLinkListFragment, UserProfile userProfile) {
        this.arg$1 = faveLinkListFragment;
        this.arg$2 = userProfile;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(FaveLinkListFragment faveLinkListFragment, UserProfile userProfile) {
        return new FaveLinkListFragment$$Lambda$1(faveLinkListFragment, userProfile);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showFavoritesRemoveDialog$0(this.arg$2, dialogInterface, i);
    }
}
