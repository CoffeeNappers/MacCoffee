package com.vkontakte.android.fragments.discussions;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$4 implements View.OnLongClickListener {
    private final BoardTopicViewFragment arg$1;

    private BoardTopicViewFragment$$Lambda$4(BoardTopicViewFragment boardTopicViewFragment) {
        this.arg$1 = boardTopicViewFragment;
    }

    public static View.OnLongClickListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment) {
        return new BoardTopicViewFragment$$Lambda$4(boardTopicViewFragment);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$onCreateContentView$4(view);
    }
}
