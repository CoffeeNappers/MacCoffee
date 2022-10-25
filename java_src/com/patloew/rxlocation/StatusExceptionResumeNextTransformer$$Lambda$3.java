package com.patloew.rxlocation;

import io.reactivex.Single;
import io.reactivex.SingleSource;
import io.reactivex.SingleTransformer;
/* loaded from: classes2.dex */
final /* synthetic */ class StatusExceptionResumeNextTransformer$$Lambda$3 implements SingleTransformer {
    private static final StatusExceptionResumeNextTransformer$$Lambda$3 instance = new StatusExceptionResumeNextTransformer$$Lambda$3();

    private StatusExceptionResumeNextTransformer$$Lambda$3() {
    }

    public static SingleTransformer lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.SingleTransformer
    public SingleSource apply(Single single) {
        SingleSource singleSource;
        singleSource = StatusExceptionResumeNextTransformer$$Lambda$4.instance;
        return singleSource;
    }
}
