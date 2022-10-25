package com.vkontakte.android.data;

import com.vkontakte.android.data.Groups;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Groups$$Lambda$2 implements Runnable {
    private final Groups.SearchGroupsCallback arg$1;
    private final String arg$2;
    private final int arg$3;

    private Groups$$Lambda$2(Groups.SearchGroupsCallback searchGroupsCallback, String str, int i) {
        this.arg$1 = searchGroupsCallback;
        this.arg$2 = str;
        this.arg$3 = i;
    }

    public static Runnable lambdaFactory$(Groups.SearchGroupsCallback searchGroupsCallback, String str, int i) {
        return new Groups$$Lambda$2(searchGroupsCallback, str, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Groups.lambda$search$2(this.arg$1, this.arg$2, this.arg$3);
    }
}
