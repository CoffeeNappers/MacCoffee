package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.vkontakte.android.NewsEntry;
/* loaded from: classes3.dex */
public class PaddingPostDisplayItem extends PostDisplayItem {
    private int padding;

    public PaddingPostDisplayItem(NewsEntry entry, int _padding) {
        super(entry);
        this.padding = _padding;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 17;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        view.setLayoutParams(new RecyclerView.LayoutParams(-1, this.padding));
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    public static View createView(Context context) {
        return new View(context);
    }
}
