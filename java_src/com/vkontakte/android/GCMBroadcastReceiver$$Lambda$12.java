package com.vkontakte.android;

import android.content.Context;
import android.os.Bundle;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$12 implements Friends.GetUsersCallback {
    private final Context arg$1;
    private final Bundle arg$2;
    private final boolean arg$3;

    private GCMBroadcastReceiver$$Lambda$12(Context context, Bundle bundle, boolean z) {
        this.arg$1 = context;
        this.arg$2 = bundle;
        this.arg$3 = z;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Context context, Bundle bundle, boolean z) {
        return new GCMBroadcastReceiver$$Lambda$12(context, bundle, z);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$9(this.arg$1, this.arg$2, this.arg$3, arrayList);
    }
}
