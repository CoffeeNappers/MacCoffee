package com.vkontakte.android.data;

import android.view.View;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Analytics$$Lambda$2 implements PostDisplayItem.OnBindView {
    private final NewsEntry arg$1;

    private Analytics$$Lambda$2(NewsEntry newsEntry) {
        this.arg$1 = newsEntry;
    }

    public static PostDisplayItem.OnBindView lambdaFactory$(NewsEntry newsEntry) {
        return new Analytics$$Lambda$2(newsEntry);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem.OnBindView
    @LambdaForm.Hidden
    public void onBindView(View view) {
        Analytics.sendPromoPostActionByType(this.arg$1, Statistic.TYPE_IMPRESSION);
    }
}
