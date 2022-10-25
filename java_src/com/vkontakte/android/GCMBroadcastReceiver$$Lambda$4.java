package com.vkontakte.android;

import android.content.Context;
import android.content.Intent;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$4 implements Friends.GetUsersCallback {
    private final Context arg$1;
    private final Intent arg$2;
    private final boolean arg$3;

    private GCMBroadcastReceiver$$Lambda$4(Context context, Intent intent, boolean z) {
        this.arg$1 = context;
        this.arg$2 = intent;
        this.arg$3 = z;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Context context, Intent intent, boolean z) {
        return new GCMBroadcastReceiver$$Lambda$4(context, intent, z);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$1(this.arg$1, this.arg$2, this.arg$3, arrayList);
    }
}
