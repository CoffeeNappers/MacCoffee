package com.vk.sharing;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class DialogSearchPresenter extends BasePresenter {
    private static final int SEARCH_DELAY = 300;
    private final Runnable searchRunnable;

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        this.targetsLoader.searchDialogs(this.targets.getQuery());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DialogSearchPresenter(@NonNull BasePresenter.DelegateContext context) {
        super(context);
        this.searchRunnable = DialogSearchPresenter$$Lambda$1.lambdaFactory$(this);
        init();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DialogSearchPresenter(@NonNull CommonPresenter presenter) {
        super(presenter);
        this.searchRunnable = DialogSearchPresenter$$Lambda$2.lambdaFactory$(this);
        this.view.showKeyboard();
        KitKatTransitions.run(this.view);
        init();
    }

    private void init() {
        this.view.setEmptyText(getString(R.string.nothing_found, new Object[0]));
        this.view.setErrorMessage(getString(R.string.sharing_error_loading_dialogs, new Object[0]));
        this.view.hideHeaderSearchButton();
        this.view.showHeaderBackButton();
        this.view.showHeaderSearch();
        this.view.setSearchHint(getString(R.string.sharing_hint_search_by_dialogs, new Object[0]));
        this.view.showFooterCancel();
        if (this.targets.isDialogsLoaded()) {
            if (TextUtils.isEmpty(this.targets.getQuery())) {
                this.view.setTargets(this.targets.getDialogTargets());
            } else {
                this.view.showClearButton();
                this.view.setSearchQuery(this.targets.getQuery());
                this.view.setTargets(this.targets.getSearchResultTargets());
            }
            this.view.showList();
            return;
        }
        if (!this.targetsLoader.isLoadingDialogs()) {
            this.targetsLoader.loadDialogs(0);
        }
        this.view.showLoading();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.context.setNextPresenter(new CommonPresenter(this, (Target) null));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        this.context.setNextPresenter(new CommonPresenter(this, target));
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        if (!this.targetsLoader.isLoadingDialogs()) {
            this.targetsLoader.loadDialogs(this.targets.getDialogTargetsSize());
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onSearchInputChanged(@NonNull String query) {
        super.onSearchInputChanged(query);
        if (TextUtils.isEmpty(query)) {
            this.view.hideClearButton();
            this.view.setTargets(this.targets.getDialogTargets());
            this.view.showList();
            this.view.scrollListToStart();
            return;
        }
        this.view.showClearButton();
        this.view.removeCallbacks(this.searchRunnable);
        this.view.postDelayed(this.searchRunnable, 300L);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogLoadingCompleted(@NonNull ArrayList<Target> targets) {
        super.onDialogLoadingCompleted(targets);
        if (this.view.isSearchQueryEmpty()) {
            this.view.setTargets(this.targets.getDialogTargets());
            this.view.showList();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogSearchingCompleted(@NonNull ArrayList<Target> targets) {
        super.onDialogSearchingCompleted(targets);
        if (!this.view.isSearchQueryEmpty()) {
            this.view.setTargets(this.targets.getSearchResultTargets());
            this.view.showList();
            this.view.scrollListToStart();
        }
    }
}
