package com.vk.sharing;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
final class GroupPostPresenter extends BasePresenter {
    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupPostPresenter(@NonNull BasePresenter.DelegateContext context) {
        super(context);
        init();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupPostPresenter(@NonNull CommonPresenter presenter) {
        super(presenter);
        KitKatTransitions.run(this.view);
        init();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupPostPresenter(@NonNull GroupSearchPresenter presenter, @Nullable Target target) {
        super(presenter);
        KitKatTransitions.run(this.view);
        if (target != null) {
            this.targets.toggleGroupSelection(target);
        }
        this.targets.setSearchResultTargets(null);
        this.targets.setQuery("");
        this.view.showHeaderCommon();
        this.view.showHeaderSearchButton();
        this.view.setSearchQuery(null);
        init();
    }

    private void init() {
        this.view.showHeaderBackButton();
        this.view.setTitle(getString(R.string.sharing_title3, new Object[0]));
        this.view.setEmptyText(getString(R.string.sharing_empty_groups, new Object[0]));
        this.view.setErrorMessage(getString(R.string.sharing_error_loading_groups, new Object[0]));
        this.view.showFooterSend();
        this.view.setTargets(this.targets.getGroupTargets());
        if (this.targets.isGroupsLoaded()) {
            if (this.targets.getGroupTargets().isEmpty()) {
                this.view.hideHeaderSearchButton();
                this.view.disableSendFooter();
            } else {
                this.view.showHeaderSearchButton();
                this.view.enableSendFooter();
            }
            this.view.showList();
        } else {
            this.view.showLoading();
            this.view.disableSendFooter();
            if (!this.targetsLoader.isLoadingGroups()) {
                this.targetsLoader.loadGroups();
            }
        }
        updateSubtitle();
        updateCounter();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSendClick() {
        if (this.targets.getSelectedTargetsSize() != 0) {
            this.context.repost(this.view.getCommentText(), this.targets.getSelectedTargets());
            this.view.hide();
            return;
        }
        ToastUtils.showToast(getString(R.string.sharing_toast_choose_community, new Object[0]));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        if (!this.targetsLoader.isLoadingGroups()) {
            this.targetsLoader.loadGroups();
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.context.setNextPresenter(new CommonPresenter(this));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSearchClick() {
        this.context.setNextPresenter(new GroupSearchPresenter(this));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        int prevSelectedSize = this.targets.getSelectedTargetsSize();
        if (prevSelectedSize == 0 || (prevSelectedSize == 1 && this.targets.isTargetSelected(target))) {
            KitKatTransitions.run(this.view);
        }
        this.targets.toggleSelection(target);
        this.view.updateTargetAtPosition(position);
        updateSubtitle();
        updateCounter();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        super.onGroupLoadingCompleted(targets);
        this.view.setTargets(this.targets.getGroupTargets());
        if (this.targets.getGroupTargets().isEmpty()) {
            this.view.hideHeaderSearchButton();
            this.view.disableSendFooter();
        } else {
            this.view.showHeaderSearchButton();
            this.view.enableSendFooter();
        }
        this.view.showList();
    }

    private void updateSubtitle() {
        List<Target> selectedTargets = this.targets.getSelectedTargets();
        int selectedSize = selectedTargets.size();
        switch (selectedSize) {
            case 0:
                this.view.setSubtitle(null);
                return;
            case 1:
                this.view.setSubtitle(selectedTargets.get(0).name);
                return;
            case 2:
                this.view.setSubtitle(selectedTargets.get(0).name + ", " + selectedTargets.get(1).name);
                return;
            default:
                this.view.setSubtitle(getString(R.string.sharing_subtitle_more_than_2, selectedTargets.get(0).name + ", " + selectedTargets.get(1).name, Integer.valueOf(selectedSize - 2)));
                return;
        }
    }

    private void updateCounter() {
        int selectedSize = this.targets.getSelectedTargetsSize();
        if (selectedSize == 1) {
            this.view.setSendButtonCount(0);
        } else {
            this.view.setSendButtonCount(selectedSize);
        }
    }
}
