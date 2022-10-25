package com.vkontakte.android.cache;

import java.lang.invoke.LambdaForm;
import java.util.List;
/* loaded from: classes.dex */
final /* synthetic */ class NewsfeedCache$$Lambda$1 implements Runnable {
    private final List arg$1;

    private NewsfeedCache$$Lambda$1(List list) {
        this.arg$1 = list;
    }

    public static Runnable lambdaFactory$(List list) {
        return new NewsfeedCache$$Lambda$1(list);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        NewsfeedCache.lambda$replace$0(this.arg$1);
    }
}
