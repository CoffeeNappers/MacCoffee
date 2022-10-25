package com.patloew.rxlocation;

import com.google.android.gms.common.api.GoogleApiClient;
import io.reactivex.functions.Cancellable;
/* loaded from: classes2.dex */
final /* synthetic */ class RxLocationMaybeOnSubscribe$$Lambda$1 implements Cancellable {
    private final RxLocationMaybeOnSubscribe arg$1;
    private final GoogleApiClient arg$2;

    private RxLocationMaybeOnSubscribe$$Lambda$1(RxLocationMaybeOnSubscribe rxLocationMaybeOnSubscribe, GoogleApiClient googleApiClient) {
        this.arg$1 = rxLocationMaybeOnSubscribe;
        this.arg$2 = googleApiClient;
    }

    public static Cancellable lambdaFactory$(RxLocationMaybeOnSubscribe rxLocationMaybeOnSubscribe, GoogleApiClient googleApiClient) {
        return new RxLocationMaybeOnSubscribe$$Lambda$1(rxLocationMaybeOnSubscribe, googleApiClient);
    }

    @Override // io.reactivex.functions.Cancellable
    public void cancel() {
        RxLocationMaybeOnSubscribe.lambda$subscribe$0(this.arg$1, this.arg$2);
    }
}
