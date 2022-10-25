package com.vkontakte.android;

import android.content.Context;
import android.content.Intent;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GCMBroadcastReceiver$$Lambda$1 implements Runnable {
    private final GCMBroadcastReceiver arg$1;
    private final Intent arg$2;
    private final Context arg$3;

    private GCMBroadcastReceiver$$Lambda$1(GCMBroadcastReceiver gCMBroadcastReceiver, Intent intent, Context context) {
        this.arg$1 = gCMBroadcastReceiver;
        this.arg$2 = intent;
        this.arg$3 = context;
    }

    public static Runnable lambdaFactory$(GCMBroadcastReceiver gCMBroadcastReceiver, Intent intent, Context context) {
        return new GCMBroadcastReceiver$$Lambda$1(gCMBroadcastReceiver, intent, context);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onReceive$11(this.arg$2, this.arg$3);
    }
}
