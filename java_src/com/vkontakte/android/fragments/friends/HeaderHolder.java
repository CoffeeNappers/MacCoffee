package com.vkontakte.android.fragments.friends;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes2.dex */
public class HeaderHolder extends RecyclerHolder<CharSequence> {
    public HeaderHolder(ViewGroup parent) {
        super(new TextView(parent.getContext()));
        TextView tv = (TextView) this.itemView;
        tv.setTextColor(-9801867);
        tv.setTypeface(Font.Medium.typeface);
        int paddingX = getResources().getDimensionPixelSize(R.dimen.friends_header_padding);
        tv.setPadding(paddingX, getResources().getDimensionPixelSize(R.dimen.friends_header_top_padding), paddingX, getResources().getDimensionPixelSize(R.dimen.friends_header_bottom_padding));
        tv.setTextSize(1, 14.0f);
        tv.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(CharSequence item) {
        ((TextView) this.itemView).setText(item);
    }
}
