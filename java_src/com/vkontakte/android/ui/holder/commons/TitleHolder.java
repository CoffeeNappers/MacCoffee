package com.vkontakte.android.ui.holder.commons;

import android.support.annotation.ColorRes;
import android.support.annotation.NonNull;
import android.support.annotation.StringRes;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class TitleHolder extends RecyclerHolder<Object> {
    private final TextView textView;

    private TitleHolder(@NonNull ViewGroup parent) {
        super((int) R.layout.title_holder, parent);
        this.textView = (TextView) $(R.id.title_holder);
    }

    public static TitleHolder darkGrayTitle(@NonNull ViewGroup parent) {
        return new TitleHolder(parent).withTextColor(R.color.gray_title);
    }

    public static TitleHolder grayTitle(@NonNull ViewGroup parent) {
        return new TitleHolder(parent).withTextColor(R.color.gray);
    }

    public static TitleHolder blueTitle(@NonNull ViewGroup parent) {
        return new TitleHolder(parent).withTextColor(R.color.brand_primary);
    }

    public static TitleHolder blackTitle(@NonNull ViewGroup parent) {
        return new TitleHolder(parent).withTextColor(R.color.almost_black);
    }

    private TitleHolder withTextColor(@ColorRes int color) {
        this.textView.setTextColor(getResources().getColor(color));
        return this;
    }

    public TitleHolder withText(@StringRes int text) {
        this.textView.setText(text);
        return this;
    }

    public TitleHolder withText(String text) {
        this.textView.setText(text);
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Object item) {
        ViewUtils.setText(this.textView, item);
    }
}
