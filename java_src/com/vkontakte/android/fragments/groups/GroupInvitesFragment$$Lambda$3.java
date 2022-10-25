package com.vkontakte.android.fragments.groups;

import android.content.DialogInterface;
import com.vkontakte.android.api.GroupInvitation;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupInvitesFragment$$Lambda$3 implements DialogInterface.OnClickListener {
    private final GroupInvitesFragment arg$1;
    private final GroupInvitation arg$2;
    private final int arg$3;

    private GroupInvitesFragment$$Lambda$3(GroupInvitesFragment groupInvitesFragment, GroupInvitation groupInvitation, int i) {
        this.arg$1 = groupInvitesFragment;
        this.arg$2 = groupInvitation;
        this.arg$3 = i;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GroupInvitesFragment groupInvitesFragment, GroupInvitation groupInvitation, int i) {
        return new GroupInvitesFragment$$Lambda$3(groupInvitesFragment, groupInvitation, i);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$null$0(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
