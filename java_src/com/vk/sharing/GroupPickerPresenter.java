package com.vk.sharing;

import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.picker.GroupPickerInfo;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.auth.VKAccountManager;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class GroupPickerPresenter extends BasePresenter {
    private GroupPickerInfo groupPickerInfo;

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onActionClick(int i) {
        super.onActionClick(i);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onBackClick() {
        super.onBackClick();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onClearClick() {
        super.onClearClick();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    @CallSuper
    public /* bridge */ /* synthetic */ void onDialogLoadingCompleted(@NonNull ArrayList arrayList) {
        super.onDialogLoadingCompleted(arrayList);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    @CallSuper
    public /* bridge */ /* synthetic */ void onDialogSearchingCompleted(@NonNull ArrayList arrayList) {
        super.onDialogSearchingCompleted(arrayList);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public /* bridge */ /* synthetic */ void onDialogSearchingFailed() {
        super.onDialogSearchingFailed();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public /* bridge */ /* synthetic */ void onGroupSearchingCompleted(@NonNull ArrayList arrayList) {
        super.onGroupSearchingCompleted(arrayList);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onListScrolledToTheEnd() {
        super.onListScrolledToTheEnd();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onOutsideClick() {
        super.onOutsideClick();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onSearchClick() {
        super.onSearchClick();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    @CallSuper
    public /* bridge */ /* synthetic */ void onSearchInputChanged(@NonNull String str) {
        super.onSearchInputChanged(str);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onSendClick() {
        super.onSendClick();
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public /* bridge */ /* synthetic */ void onViewShown() {
        super.onViewShown();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupPickerPresenter(@NonNull BasePresenter.DelegateContext context) {
        super(context);
        this.groupPickerInfo = context.getGroupPickerInfo();
        this.view.show();
        init();
    }

    private void init() {
        this.view.setTitle(getString(R.string.community_comments_author_of_comment, new Object[0]));
        this.view.hideHeaderSearchButton();
        this.view.setEmptyText(getString(R.string.sharing_empty_groups, new Object[0]));
        this.view.setErrorMessage(getString(R.string.sharing_error_loading_groups, new Object[0]));
        this.view.showFooterCancel();
        if (this.targets.isGroupsLoaded()) {
            this.view.setTargets(this.targets.getGroupTargets());
            this.view.showList();
            return;
        }
        this.view.showLoading();
        if (!this.targetsLoader.isLoadingGroups()) {
            loadGroups();
        }
    }

    private void loadGroups() {
        this.targetsLoader.loadGroupsForImpersonation(this.groupPickerInfo.adminedGroupId);
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        super.onGroupLoadingCompleted(prepateTargets(targets));
        this.view.setTargets(this.targets.getGroupTargets());
        this.view.showList();
    }

    private ArrayList<Target> prepateTargets(ArrayList<Target> targets) {
        ArrayList<Target> orderedTargets = new ArrayList<>();
        Target itIsYouTarget = createItIsYouTarget();
        orderedTargets.add(itIsYouTarget);
        if (this.groupPickerInfo.preselectedGroupId != this.groupPickerInfo.adminedGroupId && this.groupPickerInfo.preselectedGroupId > 0) {
            Target preselectedTarget = getTargetById(targets, this.groupPickerInfo.preselectedGroupId);
            targets.remove(preselectedTarget);
            orderedTargets.add(preselectedTarget);
        }
        Target adminedTarget = getTargetById(targets, this.groupPickerInfo.adminedGroupId);
        if (adminedTarget != null) {
            targets.remove(adminedTarget);
            orderedTargets.add(adminedTarget);
        }
        if (!this.groupPickerInfo.restrictToAdminedGroup) {
            Iterator<Target> it = targets.iterator();
            while (it.hasNext()) {
                Target target = it.next();
                if (!target.getIsPrivate()) {
                    orderedTargets.add(target);
                }
            }
        }
        Target toBeSelected = getTargetById(orderedTargets, this.groupPickerInfo.preselectedGroupId);
        if (toBeSelected != null) {
            toBeSelected.selected = true;
        } else {
            itIsYouTarget.selected = true;
        }
        return orderedTargets;
    }

    private Target getTargetById(ArrayList<Target> targets, int id) {
        for (int i = 0; i < targets.size(); i++) {
            if (targets.get(i).id == id) {
                return targets.get(i);
            }
        }
        return null;
    }

    private Target createItIsYouTarget() {
        UserProfile currentUser = new UserProfile(VKAccountManager.getCurrent());
        Target target = new Target(currentUser);
        target.name = getString(R.string.community_comments_you, new Object[0]);
        return target;
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        if (!this.targetsLoader.isLoadingGroups()) {
            loadGroups();
            this.view.showLoading();
        }
    }

    @Override // com.vk.sharing.BasePresenter, com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        this.context.handlePickedTarget(target);
        this.view.hide();
    }
}
