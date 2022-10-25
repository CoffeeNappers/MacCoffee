package com.vkontakte.android.fragments.discussions;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$11 implements PopupMenu.OnMenuItemClickListener {
    private final BoardTopicViewFragment arg$1;

    private BoardTopicViewFragment$$Lambda$11(BoardTopicViewFragment boardTopicViewFragment) {
        this.arg$1 = boardTopicViewFragment;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment) {
        return new BoardTopicViewFragment$$Lambda$11(boardTopicViewFragment);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$null$3(menuItem);
    }
}
