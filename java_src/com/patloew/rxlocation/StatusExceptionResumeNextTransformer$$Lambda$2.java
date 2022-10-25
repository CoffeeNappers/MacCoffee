package com.patloew.rxlocation;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
/* loaded from: classes2.dex */
final /* synthetic */ class StatusExceptionResumeNextTransformer$$Lambda$2 implements ObservableTransformer {
    private static final StatusExceptionResumeNextTransformer$$Lambda$2 instance = new StatusExceptionResumeNextTransformer$$Lambda$2();

    private StatusExceptionResumeNextTransformer$$Lambda$2() {
    }

    public static ObservableTransformer lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.ObservableTransformer
    public ObservableSource apply(Observable observable) {
        ObservableSource onErrorResumeNext;
        onErrorResumeNext = observable.onErrorResumeNext(StatusExceptionResumeNextTransformer$$Lambda$5.lambdaFactory$());
        return onErrorResumeNext;
    }
}
