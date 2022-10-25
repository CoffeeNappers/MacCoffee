package com.vkontakte.android.ui.posts;

import com.vk.attachpicker.SelectionContext;
import com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1 implements SelectionContext.SelectionCallback {
    private final NotificationPostDisplayItemGallery.ViewHolder arg$1;

    private NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1(NotificationPostDisplayItemGallery.ViewHolder viewHolder) {
        this.arg$1 = viewHolder;
    }

    public static SelectionContext.SelectionCallback lambdaFactory$(NotificationPostDisplayItemGallery.ViewHolder viewHolder) {
        return new NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1(viewHolder);
    }

    @Override // com.vk.attachpicker.SelectionContext.SelectionCallback
    @LambdaForm.Hidden
    public void onSelect(int i) {
        this.arg$1.lambda$setupRecyclerView$0(i);
    }
}
