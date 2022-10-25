package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.ui.CardItemDecorator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public abstract class CardRecyclerFragment<T> extends VKRecyclerFragment<T> {
    public static final int TABLET_MIN_WIDTH = 924;
    public static final int TABLET_PADDING = 924;
    private CardItemDecorator decorator;

    public CardRecyclerFragment(int perPage) {
        super(perPage);
    }

    public CardRecyclerFragment(int layout, int perPage) {
        super(layout, perPage);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        updateConfiguration();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setScrollBarStyle(33554432);
        updateDecorator();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateDecorator() {
        this.list.removeItemDecoration(this.decorator);
        UsableRecyclerView usableRecyclerView = this.list;
        CardItemDecorator onCreateCardDecorator = onCreateCardDecorator();
        this.decorator = onCreateCardDecorator;
        usableRecyclerView.addItemDecoration(onCreateCardDecorator);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.decorator = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isTabletDecorator() {
        return this.scrW >= 924;
    }

    protected CardItemDecorator onCreateCardDecorator() {
        boolean isTabletDecorator = isTabletDecorator();
        CardItemDecorator decorator = new CardItemDecorator(this.list, !isTabletDecorator);
        decorator.setPadding(V.dp(2.0f), V.dp(3.0f), V.dp(8.0f), 0);
        int pad = isTabletDecorator ? V.dp(Math.max(16, (this.scrW - 924) / 2)) : 0;
        this.list.setPadding(pad, 0, pad, 0);
        return decorator;
    }
}
