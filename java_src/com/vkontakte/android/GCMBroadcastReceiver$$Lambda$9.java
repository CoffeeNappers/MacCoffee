package com.vkontakte.android;

import android.content.Context;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$9 implements Friends.GetUsersCallback {
    private final int arg$1;
    private final Context arg$2;
    private final int arg$3;
    private final boolean arg$4;

    private GCMBroadcastReceiver$$Lambda$9(int i, Context context, int i2, boolean z) {
        this.arg$1 = i;
        this.arg$2 = context;
        this.arg$3 = i2;
        this.arg$4 = z;
    }

    public static Friends.GetUsersCallback lambdaFactory$(int i, Context context, int i2, boolean z) {
        return new GCMBroadcastReceiver$$Lambda$9(i, context, i2, z);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$6(this.arg$1, this.arg$2, this.arg$3, this.arg$4, arrayList);
    }
}
