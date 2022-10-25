package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.SearchResultContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchResultContainer$UserListener$$Lambda$2 implements DialogInterface.OnClickListener {
    private static final SearchResultContainer$UserListener$$Lambda$2 instance = new SearchResultContainer$UserListener$$Lambda$2();

    private SearchResultContainer$UserListener$$Lambda$2() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        SearchResultContainer.UserListener.lambda$onActionClick$1(dialogInterface, i);
    }
}
