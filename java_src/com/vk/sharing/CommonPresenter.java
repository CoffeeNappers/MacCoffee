package com.vk.sharing;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class CommonPresenter extends BasePresenter {
    private InternalDelegate internalDelegate;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CommonPresenter(@NonNull BasePresenter.DelegateContext context) {
        this(context, false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CommonPresenter(@NonNull BasePresenter.DelegateContext context, boolean initial) {
        super(context);
        if (initial) {
            this.view.show();
        }
        init();
        if (this.targets.isDialogsLoaded()) {
            this.view.setTargets(this.targets.getDialogTargets());
            this.view.showList();
        } else {
            if (!this.targetsLoader.isLoadingDialogs()) {
                this.targetsLoader.loadDialogs(0);
            }
            if (!initial) {
                this.view.showLoading();
            }
        }
        initInternalDelegate();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CommonPresenter(@NonNull DialogSearchPresenter presenter, @Nullable Target target) {
        super(presenter);
        KitKatTransitions.run(this.view);
        init();
        if (target != null) {
            if (!this.targets.containsTarget(target)) {
                this.targets.addTargetToDialogs(target);
            }
            this.targets.toggleSelection(target);
        }
        this.targets.setSearchResultTargets(null);
        this.targets.setQuery("");
        this.view.showHeaderCommon();
        this.view.hideHeaderBackButton();
        this.view.showHeaderSearchButton();
        this.view.setSearchQuery(null);
        this.view.setTargets(this.targets.getDialogTargets());
        this.view.showList();
        initInternalDelegate();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CommonPresenter(@NonNull WallPostPresenter delegate) {
        super(delegate);
        KitKatTransitions.run(this.view);
        init();
        this.view.showHeaderSearchButton();
        this.view.hideHeaderBackButton();
        this.view.showContent();
        this.view.hideFooterAttachments();
        this.view.setTargets(this.targets.getDialogTargets());
        this.view.showList();
        initInternalDelegate();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CommonPresenter(@NonNull GroupPostPresenter presenter) {
        super(presenter);
        KitKatTransitions.run(this.view);
        init();
        this.view.showHeaderSearchButton();
        this.view.hideHeaderBackButton();
        this.targets.clearSelection();
        if (this.targets.isDialogsLoaded()) {
            this.view.setTargets(this.targets.getDialogTargets());
            this.view.showList();
        } else {
            if (!this.targetsLoader.isLoadingDialogs()) {
                this.targetsLoader.loadDialogs(0);
            }
            this.view.showLoading();
        }
        initInternalDelegate();
    }

    private void init() {
        this.view.setTitle(getString(R.string.sharing_title1, new Object[0]));
        this.view.setEmptyText(getString(R.string.sharing_empty_dialogs, new Object[0]));
        this.view.setErrorMessage(getString(R.string.sharing_error_loading_dialogs, new Object[0]));
    }

    private void initInternalDelegate() {
        if (!this.context.getActionsInfo().canAtLeastOneAction()) {
            this.internalDelegate = new SendMessageInternalDelegate();
            return;
        }
        switch (this.targets.getSelectedTargetsSize()) {
            case 0:
                this.internalDelegate = new ActionsInternalDelegate();
                return;
            default:
                this.internalDelegate = new SendMessageInternalDelegate();
                return;
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onViewShown() {
        if (this.targetsLoader.isLoadingDialogs()) {
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListScrolledToTheEnd() {
        if (!this.targetsLoader.isLoadingDialogs() && !this.targets.isFull()) {
            this.targetsLoader.loadDialogs(this.targets.getDialogTargetsSize());
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        this.internalDelegate.onListItemClick(target, position);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSendClick() {
        if (this.targets.getSelectedTargetsSize() != 0) {
            this.context.sendMessage(this.view.getCommentText(), this.targets.getSelectedTargets());
            this.view.hide();
            return;
        }
        ToastUtils.showToast(getString(R.string.sharing_toast_choose_target, new Object[0]));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onActionClick(int action) {
        switch (action) {
            case 1:
                this.context.setNextPresenter(new WallPostPresenter(this));
                return;
            case 2:
                this.context.setNextPresenter(new GroupPostPresenter(this));
                return;
            case 3:
                this.context.copyLink();
                this.view.hide();
                return;
            case 4:
                this.context.share();
                this.view.hide();
                return;
            default:
                return;
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSearchClick() {
        this.context.setNextPresenter(new DialogSearchPresenter(this));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        if (!this.targetsLoader.isLoadingDialogs()) {
            this.targetsLoader.loadDialogs(this.targets.getDialogTargetsSize());
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogLoadingCompleted(@NonNull ArrayList<Target> targets) {
        super.onDialogLoadingCompleted(targets);
        this.view.setTargets(this.targets.getDialogTargets());
        this.view.showList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public abstract class InternalDelegate {
        abstract void onListItemClick(@NonNull Target target, int i);

        private InternalDelegate() {
        }

        final void toggleTarget(@NonNull Target target, int position) {
            CommonPresenter.this.targets.toggleSelection(target);
            CommonPresenter.this.view.updateTargetAtPosition(position);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class ActionsInternalDelegate extends InternalDelegate {
        ActionsInternalDelegate() {
            super();
            CommonPresenter.this.view.setSubtitle(null);
            CommonPresenter.this.view.showFooterActions();
        }

        ActionsInternalDelegate(@NonNull Target target, int position) {
            super();
            KitKatTransitions.run(CommonPresenter.this.view);
            toggleTarget(target, position);
            CommonPresenter.this.view.setSubtitle(null);
            CommonPresenter.this.view.showFooterActions();
        }

        @Override // com.vk.sharing.CommonPresenter.InternalDelegate
        void onListItemClick(@NonNull Target target, int position) {
            CommonPresenter.this.internalDelegate = new SendMessageInternalDelegate(target, position);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class SendMessageInternalDelegate extends InternalDelegate {
        SendMessageInternalDelegate() {
            super();
            CommonPresenter.this.view.showFooterSend();
            updateSubtitle();
            updateCounter();
        }

        SendMessageInternalDelegate(@NonNull Target target, int position) {
            super();
            KitKatTransitions.run(CommonPresenter.this.view);
            toggleTarget(target, position);
            updateSubtitle();
            CommonPresenter.this.view.showFooterSend();
            CommonPresenter.this.view.enableSendFooter();
        }

        @Override // com.vk.sharing.CommonPresenter.InternalDelegate
        public void onListItemClick(@NonNull Target target, int position) {
            if (CommonPresenter.this.targets.getSelectedTargetsSize() == 1 && CommonPresenter.this.targets.isTargetSelected(target) && CommonPresenter.this.context.getActionsInfo().canAtLeastOneAction()) {
                CommonPresenter.this.internalDelegate = new ActionsInternalDelegate(target, position);
                return;
            }
            toggleTarget(target, position);
            updateSubtitle();
            updateCounter();
        }

        private void updateSubtitle() {
            List<Target> selectedTargets = CommonPresenter.this.targets.getSelectedTargets();
            int selectedSize = selectedTargets.size();
            switch (selectedSize) {
                case 0:
                    CommonPresenter.this.view.setSubtitle(null);
                    return;
                case 1:
                    CommonPresenter.this.view.setSubtitle(selectedTargets.get(0).name);
                    return;
                case 2:
                    CommonPresenter.this.view.setSubtitle(selectedTargets.get(0).name + ", " + selectedTargets.get(1).name);
                    return;
                default:
                    CommonPresenter.this.view.setSubtitle(CommonPresenter.this.getString(R.string.sharing_subtitle_more_than_2, selectedTargets.get(0).name + ", " + selectedTargets.get(1).name, Integer.valueOf(selectedSize - 2)));
                    return;
            }
        }

        private void updateCounter() {
            int selectedSize = CommonPresenter.this.targets.getSelectedTargetsSize();
            if (selectedSize == 1) {
                CommonPresenter.this.view.setSendButtonCount(0);
            } else {
                CommonPresenter.this.view.setSendButtonCount(selectedSize);
            }
        }
    }
}
