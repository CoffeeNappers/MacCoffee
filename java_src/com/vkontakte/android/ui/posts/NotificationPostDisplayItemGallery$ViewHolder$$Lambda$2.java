package com.vkontakte.android.ui.posts;

import com.vk.attachpicker.mediastore.MediaStoreController;
import com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2 implements MediaStoreController.MediaStoreCallback {
    private final NotificationPostDisplayItemGallery.ViewHolder arg$1;

    private NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2(NotificationPostDisplayItemGallery.ViewHolder viewHolder) {
        this.arg$1 = viewHolder;
    }

    public static MediaStoreController.MediaStoreCallback lambdaFactory$(NotificationPostDisplayItemGallery.ViewHolder viewHolder) {
        return new NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2(viewHolder);
    }

    @Override // com.vk.attachpicker.mediastore.MediaStoreController.MediaStoreCallback
    @LambdaForm.Hidden
    public void onLoaded(ArrayList arrayList) {
        this.arg$1.lambda$loadMediaStore$1(arrayList);
    }
}
