package com.vkontakte.android.fragments.friends;

import android.app.Activity;
import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendRequestsFragment$$Lambda$3 implements DialogInterface.OnClickListener {
    private final FriendRequestsFragment arg$1;
    private final Activity arg$2;

    private FriendRequestsFragment$$Lambda$3(FriendRequestsFragment friendRequestsFragment, Activity activity) {
        this.arg$1 = friendRequestsFragment;
        this.arg$2 = activity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(FriendRequestsFragment friendRequestsFragment, Activity activity) {
        return new FriendRequestsFragment$$Lambda$3(friendRequestsFragment, activity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onOptionsItemSelected$0(this.arg$2, dialogInterface, i);
    }
}
