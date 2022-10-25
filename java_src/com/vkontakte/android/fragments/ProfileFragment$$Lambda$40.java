package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import com.vkontakte.android.UserProfile;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ProfileFragment$$Lambda$40 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;
    private final boolean[] arg$2;
    private final ArrayList arg$3;
    private final UserProfile arg$4;

    private ProfileFragment$$Lambda$40(ProfileFragment profileFragment, boolean[] zArr, ArrayList arrayList, UserProfile userProfile) {
        this.arg$1 = profileFragment;
        this.arg$2 = zArr;
        this.arg$3 = arrayList;
        this.arg$4 = userProfile;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment, boolean[] zArr, ArrayList arrayList, UserProfile userProfile) {
        return new ProfileFragment$$Lambda$40(profileFragment, zArr, arrayList, userProfile);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$editFriendLists$39(this.arg$2, this.arg$3, this.arg$4, dialogInterface, i);
    }
}
