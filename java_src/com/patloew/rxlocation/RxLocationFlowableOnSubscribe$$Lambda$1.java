package com.patloew.rxlocation;

import com.google.android.gms.common.api.GoogleApiClient;
import io.reactivex.functions.Cancellable;
/* loaded from: classes2.dex */
final /* synthetic */ class RxLocationFlowableOnSubscribe$$Lambda$1 implements Cancellable {
    private final RxLocationFlowableOnSubscribe arg$1;
    private final GoogleApiClient arg$2;

    private RxLocationFlowableOnSubscribe$$Lambda$1(RxLocationFlowableOnSubscribe rxLocationFlowableOnSubscribe, GoogleApiClient googleApiClient) {
        this.arg$1 = rxLocationFlowableOnSubscribe;
        this.arg$2 = googleApiClient;
    }

    public static Cancellable lambdaFactory$(RxLocationFlowableOnSubscribe rxLocationFlowableOnSubscribe, GoogleApiClient googleApiClient) {
        return new RxLocationFlowableOnSubscribe$$Lambda$1(rxLocationFlowableOnSubscribe, googleApiClient);
    }

    @Override // io.reactivex.functions.Cancellable
    public void cancel() {
        RxLocationFlowableOnSubscribe.lambda$subscribe$0(this.arg$1, this.arg$2);
    }
}
