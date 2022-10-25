package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$1 implements View.OnClickListener {
    private final SearchResultContainer arg$1;

    private SearchResultContainer$$Lambda$1(SearchResultContainer searchResultContainer) {
        this.arg$1 = searchResultContainer;
    }

    public static View.OnClickListener lambdaFactory$(SearchResultContainer searchResultContainer) {
        return new SearchResultContainer$$Lambda$1(searchResultContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
