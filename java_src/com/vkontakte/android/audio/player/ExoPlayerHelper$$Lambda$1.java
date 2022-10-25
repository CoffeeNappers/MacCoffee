package com.vkontakte.android.audio.player;

import com.vk.core.network.Network;
import java.lang.invoke.LambdaForm;
import okhttp3.Call;
import okhttp3.Request;
/* loaded from: classes.dex */
final /* synthetic */ class ExoPlayerHelper$$Lambda$1 implements Call.Factory {
    private static final ExoPlayerHelper$$Lambda$1 instance = new ExoPlayerHelper$$Lambda$1();

    private ExoPlayerHelper$$Lambda$1() {
    }

    public static Call.Factory lambdaFactory$() {
        return instance;
    }

    @Override // okhttp3.Call.Factory
    @LambdaForm.Hidden
    public Call newCall(Request request) {
        Call newCall;
        newCall = Network.getDefaultClient().newCall(request);
        return newCall;
    }
}
