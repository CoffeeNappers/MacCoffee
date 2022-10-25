package com.vk.music.view;

import android.view.View;
import com.vk.music.model.SearchModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchContainer$$Lambda$1 implements View.OnClickListener {
    private final SearchContainer arg$1;
    private final SearchModel arg$2;

    private SearchContainer$$Lambda$1(SearchContainer searchContainer, SearchModel searchModel) {
        this.arg$1 = searchContainer;
        this.arg$2 = searchModel;
    }

    public static View.OnClickListener lambdaFactory$(SearchContainer searchContainer, SearchModel searchModel) {
        return new SearchContainer$$Lambda$1(searchContainer, searchModel);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(this.arg$2, view);
    }
}
