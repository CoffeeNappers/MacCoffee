package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchContainer$$Lambda$4 implements View.OnClickListener {
    private final SearchContainer arg$1;

    private SearchContainer$$Lambda$4(SearchContainer searchContainer) {
        this.arg$1 = searchContainer;
    }

    public static View.OnClickListener lambdaFactory$(SearchContainer searchContainer) {
        return new SearchContainer$$Lambda$4(searchContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$3(view);
    }
}
