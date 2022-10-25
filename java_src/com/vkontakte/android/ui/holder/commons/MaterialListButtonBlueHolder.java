package com.vkontakte.android.ui.holder.commons;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MaterialListButtonBlueHolder extends RecyclerHolder<Object> implements UsableRecyclerView.Clickable {
    private final TextView textView;

    public MaterialListButtonBlueHolder(ViewGroup parent) {
        super((int) R.layout.material_list_button_blue, parent);
        this.textView = (TextView) $(16908308);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Object item) {
        ViewUtils.setText(this.textView, item);
    }

    public void onClick() {
    }
}
