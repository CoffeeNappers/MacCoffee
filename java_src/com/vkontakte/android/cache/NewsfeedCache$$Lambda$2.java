package com.vkontakte.android.cache;

import java.lang.invoke.LambdaForm;
import java.util.List;
/* loaded from: classes.dex */
final /* synthetic */ class NewsfeedCache$$Lambda$2 implements Runnable {
    private final List arg$1;

    private NewsfeedCache$$Lambda$2(List list) {
        this.arg$1 = list;
    }

    public static Runnable lambdaFactory$(List list) {
        return new NewsfeedCache$$Lambda$2(list);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        NewsfeedCache.lambda$setLists$1(this.arg$1);
    }
}
