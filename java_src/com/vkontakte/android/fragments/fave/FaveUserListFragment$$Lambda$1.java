package com.vkontakte.android.fragments.fave;

import android.content.DialogInterface;
import com.vkontakte.android.UserProfile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FaveUserListFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final FaveUserListFragment arg$1;
    private final UserProfile arg$2;

    private FaveUserListFragment$$Lambda$1(FaveUserListFragment faveUserListFragment, UserProfile userProfile) {
        this.arg$1 = faveUserListFragment;
        this.arg$2 = userProfile;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(FaveUserListFragment faveUserListFragment, UserProfile userProfile) {
        return new FaveUserListFragment$$Lambda$1(faveUserListFragment, userProfile);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
