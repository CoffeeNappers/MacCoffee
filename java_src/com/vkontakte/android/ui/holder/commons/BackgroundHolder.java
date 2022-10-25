package com.vkontakte.android.ui.holder.commons;

import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.LinearLayout;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class BackgroundHolder extends RecyclerHolder<Integer> {
    public BackgroundHolder(@NonNull ViewGroup parent) {
        super(createView(parent));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Integer item) {
        this.itemView.setBackgroundResource(item.intValue());
    }

    public BackgroundHolder setRes(@DrawableRes int res) {
        this.itemView.setBackgroundResource(res);
        return this;
    }

    private static View createView(ViewGroup parent) {
        LinearLayout linearLayout = new LinearLayout(parent.getContext());
        linearLayout.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        linearLayout.setClickable(true);
        return linearLayout;
    }
}
