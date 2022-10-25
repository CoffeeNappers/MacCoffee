package com.vkontakte.android.ui;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$5$$Lambda$1 implements Runnable {
    private final SearchViewWrapper.AnonymousClass5 arg$1;

    private SearchViewWrapper$5$$Lambda$1(SearchViewWrapper.AnonymousClass5 anonymousClass5) {
        this.arg$1 = anonymousClass5;
    }

    public static Runnable lambdaFactory$(SearchViewWrapper.AnonymousClass5 anonymousClass5) {
        return new SearchViewWrapper$5$$Lambda$1(anonymousClass5);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onMenuItemActionExpand$0();
    }
}
