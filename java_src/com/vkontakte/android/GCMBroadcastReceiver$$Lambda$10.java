package com.vkontakte.android;

import android.content.Context;
import android.os.Bundle;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$10 implements Friends.GetUsersCallback {
    private final Bundle arg$1;
    private final Context arg$2;
    private final boolean arg$3;

    private GCMBroadcastReceiver$$Lambda$10(Bundle bundle, Context context, boolean z) {
        this.arg$1 = bundle;
        this.arg$2 = context;
        this.arg$3 = z;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Bundle bundle, Context context, boolean z) {
        return new GCMBroadcastReceiver$$Lambda$10(bundle, context, z);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$7(this.arg$1, this.arg$2, this.arg$3, arrayList);
    }
}
