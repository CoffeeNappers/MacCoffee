package com.vkontakte.android;

import android.content.Context;
import android.content.Intent;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$13 implements Friends.GetUsersCallback {
    private final Context arg$1;
    private final Intent arg$2;
    private final String arg$3;
    private final boolean arg$4;
    private final boolean arg$5;
    private final int arg$6;
    private final String arg$7;
    private final NotificationUtils.Type arg$8;
    private final boolean arg$9;

    private GCMBroadcastReceiver$$Lambda$13(Context context, Intent intent, String str, boolean z, boolean z2, int i, String str2, NotificationUtils.Type type, boolean z3) {
        this.arg$1 = context;
        this.arg$2 = intent;
        this.arg$3 = str;
        this.arg$4 = z;
        this.arg$5 = z2;
        this.arg$6 = i;
        this.arg$7 = str2;
        this.arg$8 = type;
        this.arg$9 = z3;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Context context, Intent intent, String str, boolean z, boolean z2, int i, String str2, NotificationUtils.Type type, boolean z3) {
        return new GCMBroadcastReceiver$$Lambda$13(context, intent, str, z, z2, i, str2, type, z3);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$null$10(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6, this.arg$7, this.arg$8, this.arg$9, arrayList);
    }
}
