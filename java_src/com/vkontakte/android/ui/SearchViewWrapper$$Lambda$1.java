package com.vkontakte.android.ui;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$$Lambda$1 implements View.OnClickListener {
    private final SearchViewWrapper arg$1;

    private SearchViewWrapper$$Lambda$1(SearchViewWrapper searchViewWrapper) {
        this.arg$1 = searchViewWrapper;
    }

    public static View.OnClickListener lambdaFactory$(SearchViewWrapper searchViewWrapper) {
        return new SearchViewWrapper$$Lambda$1(searchViewWrapper);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
