package com.vkontakte.android;

import android.content.Context;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$8 implements Friends.GetUsersCallback {
    private final int arg$1;
    private final Context arg$2;
    private final boolean arg$3;

    private GCMBroadcastReceiver$$Lambda$8(int i, Context context, boolean z) {
        this.arg$1 = i;
        this.arg$2 = context;
        this.arg$3 = z;
    }

    public static Friends.GetUsersCallback lambdaFactory$(int i, Context context, boolean z) {
        return new GCMBroadcastReceiver$$Lambda$8(i, context, z);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$5(this.arg$1, this.arg$2, this.arg$3, arrayList);
    }
}
