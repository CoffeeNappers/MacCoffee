package com.vkontakte.android.ui.holder.commons;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class ArrowItemHolder extends RecyclerHolder<Info> implements UsableRecyclerView.Clickable {
    final TextView text1;
    final TextView text2;

    /* loaded from: classes3.dex */
    public static class Info {
        public View.OnClickListener listener;
        public String text;
        public String title;

        public Info(View.OnClickListener listener, String title, String text) {
            this.listener = listener;
            this.title = title;
            this.text = text;
        }
    }

    public ArrowItemHolder(ViewGroup parent) {
        super((int) R.layout.arrow_item_holder, parent);
        this.text1 = (TextView) $(16908308);
        this.text2 = (TextView) $(16908309);
        $(16908294).setBackgroundDrawable(new RecoloredDrawable(getDrawable(R.drawable.ic_chevron_right_24dp), -5591373));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Info item) {
        this.text1.setText(item.title);
        this.text2.setText(item.text);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (getItem() != null && getItem().listener != null) {
            getItem().listener.onClick(this.itemView);
        }
    }
}
