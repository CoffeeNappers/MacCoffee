package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NetworkStateReceiver$$Lambda$1 implements Runnable {
    private final NetworkStateReceiver arg$1;

    private NetworkStateReceiver$$Lambda$1(NetworkStateReceiver networkStateReceiver) {
        this.arg$1 = networkStateReceiver;
    }

    public static Runnable lambdaFactory$(NetworkStateReceiver networkStateReceiver) {
        return new NetworkStateReceiver$$Lambda$1(networkStateReceiver);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onReceive$0();
    }
}
