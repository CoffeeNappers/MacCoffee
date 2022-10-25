package com.vkontakte.android.data;

import com.vkontakte.android.data.Groups;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Groups$$Lambda$1 implements Runnable {
    private final Groups.GetGroupsCallback arg$1;
    private final int arg$2;

    private Groups$$Lambda$1(Groups.GetGroupsCallback getGroupsCallback, int i) {
        this.arg$1 = getGroupsCallback;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(Groups.GetGroupsCallback getGroupsCallback, int i) {
        return new Groups$$Lambda$1(getGroupsCallback, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Groups.lambda$getGroups$0(this.arg$1, this.arg$2);
    }
}
