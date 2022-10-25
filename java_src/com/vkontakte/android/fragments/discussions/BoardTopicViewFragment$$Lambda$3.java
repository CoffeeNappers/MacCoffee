package com.vkontakte.android.fragments.discussions;

import android.view.KeyEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$3 implements View.OnKeyListener {
    private final BoardTopicViewFragment arg$1;

    private BoardTopicViewFragment$$Lambda$3(BoardTopicViewFragment boardTopicViewFragment) {
        this.arg$1 = boardTopicViewFragment;
    }

    public static View.OnKeyListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment) {
        return new BoardTopicViewFragment$$Lambda$3(boardTopicViewFragment);
    }

    @Override // android.view.View.OnKeyListener
    @LambdaForm.Hidden
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateContentView$2(view, i, keyEvent);
    }
}
