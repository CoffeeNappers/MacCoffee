package com.vk.music.view;

import android.view.View;
import com.vk.music.model.SearchModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchContainer$$Lambda$2 implements View.OnFocusChangeListener {
    private final SearchContainer arg$1;
    private final SearchModel arg$2;

    private SearchContainer$$Lambda$2(SearchContainer searchContainer, SearchModel searchModel) {
        this.arg$1 = searchContainer;
        this.arg$2 = searchModel;
    }

    public static View.OnFocusChangeListener lambdaFactory$(SearchContainer searchContainer, SearchModel searchModel) {
        return new SearchContainer$$Lambda$2(searchContainer, searchModel);
    }

    @Override // android.view.View.OnFocusChangeListener
    @LambdaForm.Hidden
    public void onFocusChange(View view, boolean z) {
        this.arg$1.lambda$new$1(this.arg$2, view, z);
    }
}
