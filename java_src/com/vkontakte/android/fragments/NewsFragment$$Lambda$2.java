package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$$Lambda$2 implements View.OnClickListener {
    private final NewsFragment arg$1;

    private NewsFragment$$Lambda$2(NewsFragment newsFragment) {
        this.arg$1 = newsFragment;
    }

    public static View.OnClickListener lambdaFactory$(NewsFragment newsFragment) {
        return new NewsFragment$$Lambda$2(newsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
