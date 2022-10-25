package com.vkontakte.android.ui;

import android.app.Activity;
import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchViewWrapper$$Lambda$2 implements TextView.OnEditorActionListener {
    private final SearchViewWrapper arg$1;
    private final Activity arg$2;

    private SearchViewWrapper$$Lambda$2(SearchViewWrapper searchViewWrapper, Activity activity) {
        this.arg$1 = searchViewWrapper;
        this.arg$2 = activity;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(SearchViewWrapper searchViewWrapper, Activity activity) {
        return new SearchViewWrapper$$Lambda$2(searchViewWrapper, activity);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(android.widget.TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$new$1(this.arg$2, textView, i, keyEvent);
    }
}
