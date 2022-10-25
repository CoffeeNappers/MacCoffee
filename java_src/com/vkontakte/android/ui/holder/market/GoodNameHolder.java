package com.vkontakte.android.ui.holder.market;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class GoodNameHolder extends RecyclerHolder<Good> {
    final TextView text1;
    final TextView text2;

    public GoodNameHolder(ViewGroup parent) {
        super((int) R.layout.good_name, parent);
        this.text1 = (TextView) $(16908308);
        this.text2 = (TextView) $(16908309);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Good item) {
        this.text1.setText(item.title);
        this.text2.setText(item.price_text);
    }
}
