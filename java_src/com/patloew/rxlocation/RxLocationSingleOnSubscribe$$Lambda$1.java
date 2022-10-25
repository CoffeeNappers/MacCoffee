package com.patloew.rxlocation;

import com.google.android.gms.common.api.GoogleApiClient;
import io.reactivex.functions.Cancellable;
/* loaded from: classes2.dex */
final /* synthetic */ class RxLocationSingleOnSubscribe$$Lambda$1 implements Cancellable {
    private final RxLocationSingleOnSubscribe arg$1;
    private final GoogleApiClient arg$2;

    private RxLocationSingleOnSubscribe$$Lambda$1(RxLocationSingleOnSubscribe rxLocationSingleOnSubscribe, GoogleApiClient googleApiClient) {
        this.arg$1 = rxLocationSingleOnSubscribe;
        this.arg$2 = googleApiClient;
    }

    public static Cancellable lambdaFactory$(RxLocationSingleOnSubscribe rxLocationSingleOnSubscribe, GoogleApiClient googleApiClient) {
        return new RxLocationSingleOnSubscribe$$Lambda$1(rxLocationSingleOnSubscribe, googleApiClient);
    }

    @Override // io.reactivex.functions.Cancellable
    public void cancel() {
        RxLocationSingleOnSubscribe.lambda$subscribe$0(this.arg$1, this.arg$2);
    }
}
