package com.vkontakte.android.fragments.feedback;

import android.support.annotation.Nullable;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.functions.VoidF1Int;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class GroupedHolder extends RecyclerHolder<Notification> implements UsableRecyclerView.Clickable {
    private VoidF1Int<Notification> mNewsAction;

    public GroupedHolder(ViewGroup parent) {
        super(new TextView(parent.getContext()));
        TextView tv = (TextView) this.itemView;
        int padding = getResources().getDimensionPixelSize(R.dimen.notifications_padding);
        tv.setPadding(V.dp(15.5f) + padding, Global.scale(13.5f), padding, Global.scale(15.0f));
        tv.setTypeface(Font.Medium.typeface);
        tv.setTextColor(-12094296);
        tv.setTextSize(1, 14.0f);
        tv.setCompoundDrawablesWithIntrinsicBounds(R.drawable.show_all_dots, 0, 0, 0);
        tv.setCompoundDrawablePadding(V.dp(30.0f));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Notification e) {
        int size = e.group.size();
        ((TextView) this.itemView).setText(getResources().getQuantityString(R.plurals.show_more_notifications, size, Integer.valueOf(size)));
    }

    public GroupedHolder attach(@Nullable VoidF1Int<Notification> newsAction) {
        this.mNewsAction = newsAction;
        return this;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.mNewsAction != null) {
            this.mNewsAction.f(getItem(), getAdapterPosition());
        }
    }
}
