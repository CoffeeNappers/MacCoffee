package com.vkontakte.android.functions;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Functions$$Lambda$1 implements Predicate {
    private final Predicate arg$1;
    private final Predicate arg$2;

    private Functions$$Lambda$1(Predicate predicate, Predicate predicate2) {
        this.arg$1 = predicate;
        this.arg$2 = predicate2;
    }

    public static Predicate lambdaFactory$(Predicate predicate, Predicate predicate2) {
        return new Functions$$Lambda$1(predicate, predicate2);
    }

    @Override // com.vkontakte.android.functions.Predicate
    @LambdaForm.Hidden
    public boolean f(Object obj) {
        return Functions.lambda$combineAnd$0(this.arg$1, this.arg$2, obj);
    }
}
