package com.vkontakte.android.ui.holder.commons;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class DescriptionHolder extends RecyclerHolder<CharSequence> {
    final TextView textView;

    public DescriptionHolder(ViewGroup parent) {
        super((int) R.layout.description_holder, parent);
        this.textView = (TextView) $(R.id.post_view);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(CharSequence charSequence) {
        this.textView.setText(charSequence);
    }
}
