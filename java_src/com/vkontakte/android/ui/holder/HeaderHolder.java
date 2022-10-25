package com.vkontakte.android.ui.holder;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.Font;
/* loaded from: classes3.dex */
public class HeaderHolder extends RecyclerHolder<CharSequence> {
    public HeaderHolder(ViewGroup parent) {
        super(new TextView(parent.getContext()));
        TextView tv = (TextView) this.itemView;
        tv.setTextColor(-7697782);
        tv.setTypeface(Font.Medium.typeface);
        int padding = getResources().getDimensionPixelSize(R.dimen.notifications_padding);
        tv.setPadding(padding, getResources().getDimensionPixelSize(R.dimen.notification_header_top_padding), padding, getResources().getDimensionPixelSize(R.dimen.notification_header_bottom_padding));
        tv.setText(R.string.viewed_replies);
        tv.setTextSize(1, 14.0f);
        tv.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(CharSequence item) {
        ((TextView) this.itemView).setText(item);
    }
}
