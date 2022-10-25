package com.vkontakte.android.ui.holder.market;

import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class WriteButtonHolder extends RecyclerHolder<GoodFragment.MarketOnClickListener> {
    View button;

    public WriteButtonHolder(ViewGroup parent) {
        super((int) R.layout.good_write_button_holder, parent);
        this.button = $(16908313);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GoodFragment.MarketOnClickListener item) {
        this.button.setOnClickListener(item);
        if (item.getGood() != null) {
            ViewUtils.setEnabled(this.button, item.getGood().availability == 0);
        }
    }
}
