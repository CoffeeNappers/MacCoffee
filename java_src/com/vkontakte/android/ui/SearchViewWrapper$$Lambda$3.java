package com.vkontakte.android.ui;

import android.view.KeyEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$$Lambda$3 implements View.OnKeyListener {
    private final SearchViewWrapper arg$1;

    private SearchViewWrapper$$Lambda$3(SearchViewWrapper searchViewWrapper) {
        this.arg$1 = searchViewWrapper;
    }

    public static View.OnKeyListener lambdaFactory$(SearchViewWrapper searchViewWrapper) {
        return new SearchViewWrapper$$Lambda$3(searchViewWrapper);
    }

    @Override // android.view.View.OnKeyListener
    @LambdaForm.Hidden
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$new$2(view, i, keyEvent);
    }
}
