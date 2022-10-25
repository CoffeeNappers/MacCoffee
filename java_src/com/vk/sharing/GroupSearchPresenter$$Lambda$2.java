package com.vk.sharing;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupSearchPresenter$$Lambda$2 implements Runnable {
    private final GroupSearchPresenter arg$1;

    private GroupSearchPresenter$$Lambda$2(GroupSearchPresenter groupSearchPresenter) {
        this.arg$1 = groupSearchPresenter;
    }

    public static Runnable lambdaFactory$(GroupSearchPresenter groupSearchPresenter) {
        return new GroupSearchPresenter$$Lambda$2(groupSearchPresenter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$0();
    }
}
