package com.patloew.rxlocation;

import io.reactivex.functions.Function;
/* loaded from: classes2.dex */
public final /* synthetic */ class StatusExceptionResumeNextTransformer$$Lambda$5 implements Function {
    private static final StatusExceptionResumeNextTransformer$$Lambda$5 instance = new StatusExceptionResumeNextTransformer$$Lambda$5();

    private StatusExceptionResumeNextTransformer$$Lambda$5() {
    }

    public static Function lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.functions.Function
    /* renamed from: apply */
    public Object mo1190apply(Object obj) {
        return StatusExceptionResumeNextTransformer.lambda$null$2((Throwable) obj);
    }
}
