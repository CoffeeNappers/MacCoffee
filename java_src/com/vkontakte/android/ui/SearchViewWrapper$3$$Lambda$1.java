package com.vkontakte.android.ui;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$3$$Lambda$1 implements Runnable {
    private final SearchViewWrapper.AnonymousClass3 arg$1;

    private SearchViewWrapper$3$$Lambda$1(SearchViewWrapper.AnonymousClass3 anonymousClass3) {
        this.arg$1 = anonymousClass3;
    }

    public static Runnable lambdaFactory$(SearchViewWrapper.AnonymousClass3 anonymousClass3) {
        return new SearchViewWrapper$3$$Lambda$1(anonymousClass3);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$afterTextChanged$0();
    }
}
