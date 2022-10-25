package com.vkontakte.android.ui;

import android.text.Editable;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$3$$Lambda$3 implements Runnable {
    private final SearchViewWrapper.AnonymousClass3 arg$1;
    private final Editable arg$2;

    private SearchViewWrapper$3$$Lambda$3(SearchViewWrapper.AnonymousClass3 anonymousClass3, Editable editable) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = editable;
    }

    public static Runnable lambdaFactory$(SearchViewWrapper.AnonymousClass3 anonymousClass3, Editable editable) {
        return new SearchViewWrapper$3$$Lambda$3(anonymousClass3, editable);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$afterTextChanged$2(this.arg$2);
    }
}
