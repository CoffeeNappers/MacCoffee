package com.vk.sharing;

import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import com.vk.sharing.action.ActionsInfo;
import com.vk.sharing.picker.GroupPickerInfo;
import com.vk.sharing.target.Target;
import com.vk.sharing.target.Targets;
import com.vk.sharing.target.TargetsLoader;
import com.vk.sharing.view.SharingView;
import java.util.ArrayList;
import java.util.Collection;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class BasePresenter implements SharingView.Presenter, TargetsLoader.Callback {
    private static final int TARGETS_MAX = 20;
    @NonNull
    final DelegateContext context;
    @NonNull
    final Targets targets;
    @NonNull
    final TargetsLoader targetsLoader;
    @NonNull
    final SharingView view;

    /* loaded from: classes2.dex */
    interface DelegateContext {
        void copyLink();

        void destroy();

        @NonNull
        ActionsInfo getActionsInfo();

        GroupPickerInfo getGroupPickerInfo();

        @NonNull
        String getString(@StringRes int i, @Nullable Object... objArr);

        @NonNull
        Targets getTargets();

        @NonNull
        TargetsLoader getTargetsLoader();

        @NonNull
        SharingView getView();

        void handlePickedTarget(@NonNull Target target);

        void repost(@NonNull String str);

        void repost(@NonNull String str, @NonNull Collection<Target> collection);

        void sendMessage(@NonNull String str, @NonNull Collection<Target> collection);

        void setNextPresenter(@NonNull BasePresenter basePresenter);

        void share();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public BasePresenter(@NonNull DelegateContext context) {
        this.context = context;
        this.targets = context.getTargets();
        this.targetsLoader = context.getTargetsLoader();
        this.view = context.getView();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public BasePresenter(@NonNull BasePresenter presenter) {
        this(presenter.context);
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onViewShown() {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public final void onViewHidden() {
        this.context.destroy();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onOutsideClick() {
        this.view.hide();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onListScrolledToTheEnd() {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onActionClick(int action) {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    @CallSuper
    public void onSearchInputChanged(@NonNull String query) {
        this.targets.setQuery(query);
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onSearchClick() {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.view.hide();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onSendClick() {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onClearClick() {
        this.view.setSearchQuery(null);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    @CallSuper
    public void onDialogLoadingCompleted(@NonNull ArrayList<Target> targets) {
        this.targets.addTargetsToDialogs(targets);
        this.targets.setFull(this.targets.getDialogTargetsSize() == 20 || targets.size() < 10);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public final void onDialogLoadingFailed() {
        if (!this.targets.isDialogsLoaded()) {
            this.view.showError();
        }
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    @CallSuper
    public void onDialogSearchingCompleted(@NonNull ArrayList<Target> targets) {
        this.targets.setSearchResultTargets(targets);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogSearchingFailed() {
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    @CallSuper
    public void onGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        this.targets.addTargetsToGroups(targets);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public final void onGroupLoadingFailed() {
        if (!this.targets.isGroupsLoaded()) {
            this.view.showError();
        }
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupSearchingCompleted(@NonNull ArrayList<Target> targets) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public final String getString(@StringRes int id, @Nullable Object... formatArgs) {
        return this.context.getString(id, formatArgs);
    }
}
