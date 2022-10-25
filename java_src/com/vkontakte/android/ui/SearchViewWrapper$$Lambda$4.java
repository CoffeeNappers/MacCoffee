package com.vkontakte.android.ui;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$$Lambda$4 implements Runnable {
    private final SearchViewWrapper arg$1;

    private SearchViewWrapper$$Lambda$4(SearchViewWrapper searchViewWrapper) {
        this.arg$1 = searchViewWrapper;
    }

    public static Runnable lambdaFactory$(SearchViewWrapper searchViewWrapper) {
        return new SearchViewWrapper$$Lambda$4(searchViewWrapper);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$submitQuery$3();
    }
}
