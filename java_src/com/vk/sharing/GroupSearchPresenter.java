package com.vk.sharing;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class GroupSearchPresenter extends BasePresenter {
    private static final int SEARCH_DELAY = 300;
    private final Runnable searchRunnable;

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        this.targetsLoader.searchGroups(this.targets.getQuery());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupSearchPresenter(@NonNull BasePresenter.DelegateContext context) {
        super(context);
        this.searchRunnable = GroupSearchPresenter$$Lambda$1.lambdaFactory$(this);
        init();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupSearchPresenter(@NonNull GroupPostPresenter presenter) {
        super(presenter);
        this.searchRunnable = GroupSearchPresenter$$Lambda$2.lambdaFactory$(this);
        this.view.showKeyboard();
        KitKatTransitions.run(this.view);
        init();
    }

    private void init() {
        this.view.setEmptyText(getString(R.string.nothing_found, new Object[0]));
        this.view.setErrorMessage(getString(R.string.sharing_error_loading_groups, new Object[0]));
        this.view.hideHeaderSearchButton();
        this.view.showHeaderBackButton();
        this.view.showHeaderSearch();
        this.view.setSearchHint(getString(R.string.sharing_hint_search_by_groups, new Object[0]));
        this.view.showFooterCancel();
        if (this.targets.isGroupsLoaded()) {
            if (TextUtils.isEmpty(this.targets.getQuery())) {
                this.view.setTargets(this.targets.getGroupTargets());
            } else {
                this.view.showClearButton();
                this.view.setSearchQuery(this.targets.getQuery());
                this.view.setTargets(this.targets.getSearchResultTargets());
            }
            this.view.showList();
            return;
        }
        if (!this.targetsLoader.isLoadingGroups()) {
            this.targetsLoader.loadGroups();
        }
        this.view.showLoading();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.context.setNextPresenter(new GroupPostPresenter(this, null));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        this.context.setNextPresenter(new GroupPostPresenter(this, target));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        if (!this.targetsLoader.isLoadingGroups()) {
            this.targetsLoader.loadGroups();
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSearchInputChanged(@NonNull String query) {
        super.onSearchInputChanged(query);
        if (TextUtils.isEmpty(query)) {
            this.view.hideClearButton();
            this.view.setTargets(this.targets.getGroupTargets());
            this.view.showList();
            this.view.scrollListToStart();
            return;
        }
        this.view.showClearButton();
        this.view.removeCallbacks(this.searchRunnable);
        this.view.postDelayed(this.searchRunnable, 300L);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        super.onGroupLoadingCompleted(targets);
        if (this.view.isSearchQueryEmpty()) {
            this.view.setTargets(this.targets.getGroupTargets());
            this.view.showList();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupSearchingCompleted(@NonNull ArrayList<Target> targets) {
        super.onDialogSearchingCompleted(targets);
        if (!this.view.isSearchQueryEmpty()) {
            this.view.setTargets(this.targets.getSearchResultTargets());
            this.view.showList();
            this.view.scrollListToStart();
        }
    }
}
