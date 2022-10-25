package com.vk.music.view;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchContainer$$Lambda$3 implements TextView.OnEditorActionListener {
    private final SearchContainer arg$1;

    private SearchContainer$$Lambda$3(SearchContainer searchContainer) {
        this.arg$1 = searchContainer;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(SearchContainer searchContainer) {
        return new SearchContainer$$Lambda$3(searchContainer);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$new$2(textView, i, keyEvent);
    }
}
