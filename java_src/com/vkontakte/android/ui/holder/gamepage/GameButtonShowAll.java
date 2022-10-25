package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameButtonShowAll extends RecyclerHolder<Ref> implements UsableRecyclerView.Clickable {
    private View.OnClickListener onClickListener;
    private final TextView textView;

    /* loaded from: classes3.dex */
    public static class Ref {
        final View.OnClickListener onClickListener;
        public final int titleRes;

        public Ref(int titleRes, View.OnClickListener onClickListener) {
            this.titleRes = titleRes;
            this.onClickListener = onClickListener;
        }
    }

    public GameButtonShowAll(@NonNull Context context) {
        super((int) R.layout.apps_show_all_button, context);
        this.textView = (TextView) $(R.id.title);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Ref item) {
        this.onClickListener = item.onClickListener;
        this.textView.setText(item.titleRes);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.onClickListener != null) {
            this.onClickListener.onClick(this.itemView);
        }
    }
}
