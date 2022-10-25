package com.patloew.rxlocation;

import io.reactivex.Flowable;
import io.reactivex.FlowableTransformer;
import org.reactivestreams.Publisher;
/* loaded from: classes2.dex */
final /* synthetic */ class StatusExceptionResumeNextTransformer$$Lambda$1 implements FlowableTransformer {
    private static final StatusExceptionResumeNextTransformer$$Lambda$1 instance = new StatusExceptionResumeNextTransformer$$Lambda$1();

    private StatusExceptionResumeNextTransformer$$Lambda$1() {
    }

    public static FlowableTransformer lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.FlowableTransformer
    public Publisher apply(Flowable flowable) {
        Publisher onErrorResumeNext;
        onErrorResumeNext = flowable.onErrorResumeNext(StatusExceptionResumeNextTransformer$$Lambda$6.lambdaFactory$());
        return onErrorResumeNext;
    }
}
