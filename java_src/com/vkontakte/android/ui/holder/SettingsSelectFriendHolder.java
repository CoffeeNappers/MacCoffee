package com.vkontakte.android.ui.holder;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.functions.VoidF0;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class SettingsSelectFriendHolder extends RecyclerHolder<Data> implements UsableRecyclerView.Clickable {
    final TextView textView;

    /* loaded from: classes3.dex */
    public static class Data {
        public final VoidF0 clickFunc;
        public final Object text;

        public Data(Object text, VoidF0 clickFunc) {
            this.text = text;
            this.clickFunc = clickFunc;
        }
    }

    public SettingsSelectFriendHolder(ViewGroup parent) {
        super((int) R.layout.settings_select_friends, parent);
        this.textView = (TextView) $(16908308);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Data item) {
        ViewUtils.setText(this.textView, item.text);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        getItem().clickFunc.f();
    }
}
