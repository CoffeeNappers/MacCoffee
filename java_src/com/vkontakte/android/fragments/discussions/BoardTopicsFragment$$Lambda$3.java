package com.vkontakte.android.fragments.discussions;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicsFragment$$Lambda$3 implements Runnable {
    private final BoardTopicsFragment arg$1;

    private BoardTopicsFragment$$Lambda$3(BoardTopicsFragment boardTopicsFragment) {
        this.arg$1 = boardTopicsFragment;
    }

    public static Runnable lambdaFactory$(BoardTopicsFragment boardTopicsFragment) {
        return new BoardTopicsFragment$$Lambda$3(boardTopicsFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateList$2();
    }
}
