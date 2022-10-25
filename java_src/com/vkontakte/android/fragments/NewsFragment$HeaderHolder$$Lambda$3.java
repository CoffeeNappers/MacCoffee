package com.vkontakte.android.fragments;

import android.view.View;
import com.vkontakte.android.fragments.NewsFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewsFragment$HeaderHolder$$Lambda$3 implements View.OnClickListener {
    private final NewsFragment.HeaderHolder arg$1;

    private NewsFragment$HeaderHolder$$Lambda$3(NewsFragment.HeaderHolder headerHolder) {
        this.arg$1 = headerHolder;
    }

    public static View.OnClickListener lambdaFactory$(NewsFragment.HeaderHolder headerHolder) {
        return new NewsFragment$HeaderHolder$$Lambda$3(headerHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$2(view);
    }
}
