package com.vkontakte.android.ui.adapters;

import android.support.v7.widget.RecyclerView;
import com.vkontakte.android.ui.CardItemDecorator;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class CardMergeAdapter extends MergeRecyclerAdapter implements CardItemDecorator.Provider {
    public CardMergeAdapter(UsableRecyclerView.Adapter... adapters) {
        for (UsableRecyclerView.Adapter adapter : adapters) {
            addAdapter(adapter);
        }
    }

    @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
    public int getBlockType(int position) {
        RecyclerView.Adapter adapter = getAdapterForPosition(position);
        if (adapter instanceof CardItemDecorator.Provider) {
            return ((CardItemDecorator.Provider) adapter).getBlockType(getAdapterPosition(position));
        }
        return 0;
    }
}
