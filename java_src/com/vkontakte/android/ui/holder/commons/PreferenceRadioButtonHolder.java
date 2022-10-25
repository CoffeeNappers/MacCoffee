package com.vkontakte.android.ui.holder.commons;

import android.view.ViewGroup;
import android.widget.CheckedTextView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PreferenceRadioButtonHolder extends RecyclerHolder<PrivacySetting.PrivacyRule> implements UsableRecyclerView.Clickable {
    private CheckedTextView checkedTextView;
    private final OnRadioButtonClickListener<PrivacySetting.PrivacyRule> listener;

    /* loaded from: classes3.dex */
    public interface OnRadioButtonClickListener<T> {
        void onRadioButtonClick(T t);
    }

    public PreferenceRadioButtonHolder(ViewGroup parent, OnRadioButtonClickListener<PrivacySetting.PrivacyRule> listener) {
        super((int) R.layout.radio_button_list_item, parent);
        this.checkedTextView = (CheckedTextView) $(R.id.text);
        this.listener = listener;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(PrivacySetting.PrivacyRule item) {
        this.checkedTextView.setText(item.getEditTitle());
    }

    public PreferenceRadioButtonHolder setChecked(boolean checked) {
        this.checkedTextView.setChecked(checked);
        return this;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.listener != null) {
            this.listener.onRadioButtonClick(getItem());
        }
    }
}
