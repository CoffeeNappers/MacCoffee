package com.vkontakte.android.ui.holder.commons;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class BottomButtonHolder extends RecyclerHolder<Data> {
    final TextView text;

    /* loaded from: classes3.dex */
    public static class Data {
        public final View.OnClickListener onClickListener;
        public final Object text;

        public Data(View.OnClickListener onClickListener, Object text) {
            this.onClickListener = onClickListener;
            this.text = text;
        }
    }

    public BottomButtonHolder(ViewGroup parent) {
        super((int) R.layout.bottom_button_holder, parent);
        this.text = (TextView) $(16908313);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Data item) {
        ViewUtils.setText(this.text, item.text);
        this.text.setOnClickListener(item.onClickListener);
    }
}
