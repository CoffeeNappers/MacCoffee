package com.patloew.rxlocation;

import io.reactivex.functions.Function;
/* loaded from: classes2.dex */
public final /* synthetic */ class StatusExceptionResumeNextTransformer$$Lambda$6 implements Function {
    private static final StatusExceptionResumeNextTransformer$$Lambda$6 instance = new StatusExceptionResumeNextTransformer$$Lambda$6();

    private StatusExceptionResumeNextTransformer$$Lambda$6() {
    }

    public static Function lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.functions.Function
    /* renamed from: apply */
    public Object mo1190apply(Object obj) {
        return StatusExceptionResumeNextTransformer.lambda$null$0((Throwable) obj);
    }
}
