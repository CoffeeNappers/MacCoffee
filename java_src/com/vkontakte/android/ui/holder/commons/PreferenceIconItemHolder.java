package com.vkontakte.android.ui.holder.commons;

import android.graphics.drawable.Drawable;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceIconItemHolder.IconPrefInfo;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PreferenceIconItemHolder<T extends IconPrefInfo> extends RecyclerHolder<T> implements UsableRecyclerView.Clickable {
    @Nullable
    private final VoidF1<T> clickFunk;
    protected final View icon;
    protected final TextView text;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((PreferenceIconItemHolder<T>) ((IconPrefInfo) obj));
    }

    /* loaded from: classes3.dex */
    public static class IconPrefInfo {
        final int colorRes;
        @DrawableRes
        final int iconRes;
        public final Object text;

        public IconPrefInfo(@DrawableRes int iconRes, Object text) {
            this.iconRes = iconRes;
            this.colorRes = 17170445;
            this.text = text;
        }

        public IconPrefInfo(@DrawableRes int iconRes, @ColorRes int color, Object text) {
            this.iconRes = iconRes;
            this.colorRes = color;
            this.text = text;
        }
    }

    public PreferenceIconItemHolder(ViewGroup parent, @Nullable VoidF1<T> clickFunk) {
        super((int) R.layout.icon_pref, parent);
        this.icon = $(16908294);
        this.text = (TextView) $(16908308);
        onViewInit();
        this.clickFunk = clickFunk;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onViewInit() {
    }

    public void onBind(T item) {
        if (item.colorRes != 17170445) {
            Drawable drawable = ViewUtils.getDrawable(this.icon.getContext(), item.iconRes);
            int color = this.icon.getContext().getResources().getColor(item.colorRes);
            this.icon.setBackgroundDrawable(new RecoloredDrawable(drawable, color));
        } else {
            this.icon.setBackgroundResource(item.iconRes);
        }
        ViewUtils.setText(this.text, item.text);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.clickFunk != null) {
            this.clickFunk.f(getItem());
        }
    }
}
