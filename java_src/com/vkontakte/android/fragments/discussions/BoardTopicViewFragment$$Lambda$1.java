package com.vkontakte.android.fragments.discussions;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$1 implements View.OnLayoutChangeListener {
    private final BoardTopicViewFragment arg$1;

    private BoardTopicViewFragment$$Lambda$1(BoardTopicViewFragment boardTopicViewFragment) {
        this.arg$1 = boardTopicViewFragment;
    }

    public static View.OnLayoutChangeListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment) {
        return new BoardTopicViewFragment$$Lambda$1(boardTopicViewFragment);
    }

    @Override // android.view.View.OnLayoutChangeListener
    @LambdaForm.Hidden
    public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        this.arg$1.lambda$onCreateContentView$0(view, i, i2, i3, i4, i5, i6, i7, i8);
    }
}
