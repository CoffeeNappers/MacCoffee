package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MarkedAsAdsPostDisplayItem extends PostDisplayItem {
    public MarkedAsAdsPostDisplayItem(NewsEntry e) {
        super(e);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 21;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
    }

    public static View createView(Context context) {
        return LayoutInflater.from(context).inflate(R.layout.marked_as_ads, (ViewGroup) null);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }
}
