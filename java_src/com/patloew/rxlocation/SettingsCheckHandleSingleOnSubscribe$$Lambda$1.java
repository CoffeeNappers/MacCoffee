package com.patloew.rxlocation;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.location.LocationSettingsResult;
import io.reactivex.SingleEmitter;
/* loaded from: classes2.dex */
final /* synthetic */ class SettingsCheckHandleSingleOnSubscribe$$Lambda$1 implements ResultCallback {
    private final SettingsCheckHandleSingleOnSubscribe arg$1;
    private final SingleEmitter arg$2;

    private SettingsCheckHandleSingleOnSubscribe$$Lambda$1(SettingsCheckHandleSingleOnSubscribe settingsCheckHandleSingleOnSubscribe, SingleEmitter singleEmitter) {
        this.arg$1 = settingsCheckHandleSingleOnSubscribe;
        this.arg$2 = singleEmitter;
    }

    public static ResultCallback lambdaFactory$(SettingsCheckHandleSingleOnSubscribe settingsCheckHandleSingleOnSubscribe, SingleEmitter singleEmitter) {
        return new SettingsCheckHandleSingleOnSubscribe$$Lambda$1(settingsCheckHandleSingleOnSubscribe, singleEmitter);
    }

    @Override // com.google.android.gms.common.api.ResultCallback
    public void onResult(Result result) {
        SettingsCheckHandleSingleOnSubscribe.lambda$onGoogleApiClientReady$0(this.arg$1, this.arg$2, (LocationSettingsResult) result);
    }
}
