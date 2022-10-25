package com.vkontakte.android.fragments.discussions;

import android.app.ProgressDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$8 implements Runnable {
    private final BoardTopicViewFragment arg$1;
    private final ProgressDialog arg$2;

    private BoardTopicViewFragment$$Lambda$8(BoardTopicViewFragment boardTopicViewFragment, ProgressDialog progressDialog) {
        this.arg$1 = boardTopicViewFragment;
        this.arg$2 = progressDialog;
    }

    public static Runnable lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment, ProgressDialog progressDialog) {
        return new BoardTopicViewFragment$$Lambda$8(boardTopicViewFragment, progressDialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$waitAndSendComment$8(this.arg$2);
    }
}
