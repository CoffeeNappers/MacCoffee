package com.vkontakte.android.stickers;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.vkontakte.android.data.orm.StickerStockItem;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class StickersViewPage {
    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract String getIconURL();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract int getId();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract String getServerBackgroundURL();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract Drawable getTitleDrawable();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract View getView(Context context);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void onConfigurationChanged(Configuration configuration);

    abstract void releaseView();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void reload();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void reload(StickerStockItem stickerStockItem);

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onBottomTabsVisibilityChanged(boolean visible) {
    }
}
