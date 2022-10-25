package com.vkontakte.android.ui.widget;

import android.view.View;
import com.vkontakte.android.fragments.search.QuickSearchActivity;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$HeaderViewHolder$$Lambda$1 implements View.OnClickListener {
    private static final MenuListView$HeaderViewHolder$$Lambda$1 instance = new MenuListView$HeaderViewHolder$$Lambda$1();

    private MenuListView$HeaderViewHolder$$Lambda$1() {
    }

    public static View.OnClickListener lambdaFactory$() {
        return instance;
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        QuickSearchActivity.start(view);
    }
}
