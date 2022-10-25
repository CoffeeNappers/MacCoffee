package com.vkontakte.android.ui.widget;

import com.vkontakte.android.ui.PhotoStripView;
import com.vkontakte.android.ui.widget.MenuListView;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$BirthdayViewHolder$$Lambda$1 implements PhotoStripView.OnPhotoClickListener {
    private final MenuListView.BirthdayViewHolder arg$1;

    private MenuListView$BirthdayViewHolder$$Lambda$1(MenuListView.BirthdayViewHolder birthdayViewHolder) {
        this.arg$1 = birthdayViewHolder;
    }

    public static PhotoStripView.OnPhotoClickListener lambdaFactory$(MenuListView.BirthdayViewHolder birthdayViewHolder) {
        return new MenuListView$BirthdayViewHolder$$Lambda$1(birthdayViewHolder);
    }

    @Override // com.vkontakte.android.ui.PhotoStripView.OnPhotoClickListener
    @LambdaForm.Hidden
    public void onPhotoClick(PhotoStripView photoStripView, int i) {
        this.arg$1.lambda$new$0(photoStripView, i);
    }
}
