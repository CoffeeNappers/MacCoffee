package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$$Lambda$4 implements View.OnClickListener {
    private final NewsFragment arg$1;

    private NewsFragment$$Lambda$4(NewsFragment newsFragment) {
        this.arg$1 = newsFragment;
    }

    public static View.OnClickListener lambdaFactory$(NewsFragment newsFragment) {
        return new NewsFragment$$Lambda$4(newsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateView$4(view);
    }
}
