package com.vk.sharing;

import android.support.annotation.NonNull;
import com.vk.sharing.BasePresenter;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
final class WallPostPresenter extends BasePresenter {
    /* JADX INFO: Access modifiers changed from: package-private */
    public WallPostPresenter(@NonNull BasePresenter.DelegateContext context) {
        super(context);
        init();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public WallPostPresenter(@NonNull CommonPresenter presenter) {
        super(presenter);
        KitKatTransitions.run(this.view);
        init();
    }

    private void init() {
        this.view.hideHeaderSearchButton();
        this.view.showHeaderBackButton();
        this.view.setTitle(getString(R.string.sharing_title2, new Object[0]));
        this.view.hideContent();
        this.view.showFooterSend();
        this.view.showFooterAttachments();
        this.view.enableSendFooter();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSendClick() {
        this.context.repost(this.view.getCommentText());
        this.view.hide();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.context.setNextPresenter(new CommonPresenter(this));
    }
}
