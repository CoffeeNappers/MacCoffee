package com.vk.sharing;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.BasePresenter;
import com.vk.sharing.action.ActionsInfo;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.sharing.attachment.AttachmentViewHolder;
import com.vk.sharing.attachment.Attachments;
import com.vk.sharing.picker.GroupPickerInfo;
import com.vk.sharing.target.Target;
import com.vk.sharing.target.Targets;
import com.vk.sharing.target.TargetsLoader;
import com.vk.sharing.view.SharingView;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.activities.LogoutReceiver;
import java.util.ArrayList;
import java.util.Collection;
/* loaded from: classes2.dex */
public final class SharingActivity extends VKActivity implements BasePresenter.DelegateContext, SharingView.Presenter, TargetsLoader.Callback {
    static final String EXTRA_ACTIONS_INFO = "actions_info";
    static final String EXTRA_ATTACHMENT_INFO = "attachment_info";
    public static final String EXTRA_FULLSCREEN = "fullscreen";
    public static final String EXTRA_MODE = "mode";
    static final String EXTRA_PICKER_INFO = "picker_info";
    public static final int MODE_DEFAULT = 0;
    public static final int MODE_GROUP_PICKER = 1;
    public static final String RESULT_EXTRA_TARGET = "result_target";
    private static final String STATE_DELEGATE = "STATE_DELEGATE";
    private static final String STATE_TARGETS = "STATE_TARGETS";
    private ActionsInfo actionsInfo;
    private AttachmentInfo attachmentInfo;
    private AttachmentViewHolder attachmentViewHolder;
    private BasePresenter delegate;
    private GroupPickerInfo groupPickerInfo;
    private LogoutReceiver logoutReceiver;
    private Targets targets;
    private TargetsLoader targetsLoader;
    private SharingView view;
    private boolean succeeded = false;
    private Intent resultIntent = null;

    /* loaded from: classes2.dex */
    private static final class NonConfigurationInstances {
        private AttachmentViewHolder attachmentViewHolder;
        private TargetsLoader targetsLoader;

        private NonConfigurationInstances() {
        }
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    @NonNull
    public Targets getTargets() {
        return this.targets;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    @NonNull
    public ActionsInfo getActionsInfo() {
        return this.actionsInfo;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    @NonNull
    public TargetsLoader getTargetsLoader() {
        return this.targetsLoader;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    @NonNull
    public SharingView getView() {
        return this.view;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void repost(@NonNull String message) {
        Intent intent = new Intent(this, SharingService.class);
        intent.putExtra("call", 2);
        intent.putExtra("attachment_info", this.attachmentInfo);
        intent.putExtra("text", message);
        startService(intent);
        this.succeeded = true;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void repost(@NonNull String message, @NonNull Collection<Target> targets) {
        Intent intent = new Intent(this, SharingService.class);
        intent.putExtra("call", 3);
        intent.putExtra("attachment_info", this.attachmentInfo);
        intent.putExtra(SharingService.EXTRA_TOTAL_TARGETS, targets.size());
        intent.putExtra("text", message);
        for (Target target : targets) {
            intent.putExtra(SharingService.EXTRA_TARGET, target);
            startService(intent);
        }
        this.succeeded = true;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void sendMessage(@NonNull String message, @NonNull Collection<Target> targets) {
        Intent intent = new Intent(this, SharingService.class);
        intent.putExtra("call", 1);
        intent.putExtra("attachment_info", this.attachmentInfo);
        intent.putExtra(SharingService.EXTRA_TOTAL_TARGETS, targets.size());
        intent.putExtra("text", message);
        for (Target target : targets) {
            intent.putExtra(SharingService.EXTRA_TARGET, target);
            startService(intent);
        }
        this.succeeded = true;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void handlePickedTarget(@NonNull Target target) {
        this.resultIntent = new Intent();
        this.resultIntent.putExtra(RESULT_EXTRA_TARGET, target);
        this.succeeded = true;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public GroupPickerInfo getGroupPickerInfo() {
        return this.groupPickerInfo;
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void share() {
        Sharing.share(this, Attachments.createLink(this.attachmentInfo));
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void copyLink() {
        ClipboardManager manager = (ClipboardManager) getSystemService("clipboard");
        manager.setPrimaryClip(ClipData.newPlainText("VK link", Attachments.createLink(this.attachmentInfo)));
        ToastUtils.showToast(getString(R.string.sharing_toast_link_copied));
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void destroy() {
        setResult(this.succeeded ? -1 : 0, this.resultIntent);
        finish();
    }

    @Override // com.vk.sharing.BasePresenter.DelegateContext
    public void setNextPresenter(@NonNull BasePresenter delegate) {
        this.delegate = delegate;
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onViewShown() {
        this.delegate.onViewShown();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onViewHidden() {
        this.delegate.onViewHidden();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onListScrolledToTheEnd() {
        this.delegate.onListScrolledToTheEnd();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onOutsideClick() {
        this.delegate.onOutsideClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onActionClick(int action) {
        this.delegate.onActionClick(action);
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onListItemClick(@NonNull Target target, int position) {
        this.delegate.onListItemClick(target, position);
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onSendClick() {
        this.delegate.onSendClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onRetryClick() {
        this.delegate.onRetryClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onClearClick() {
        this.delegate.onClearClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onSearchClick() {
        this.delegate.onSearchClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onBackClick() {
        this.delegate.onBackClick();
    }

    @Override // com.vk.sharing.view.SharingView.Presenter
    public void onSearchInputChanged(@NonNull String query) {
        this.delegate.onSearchInputChanged(query);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogLoadingCompleted(@NonNull ArrayList<Target> targets) {
        this.delegate.onDialogLoadingCompleted(targets);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogLoadingFailed() {
        this.delegate.onDialogLoadingFailed();
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogSearchingCompleted(@NonNull ArrayList<Target> targets) {
        this.delegate.onDialogSearchingCompleted(targets);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onDialogSearchingFailed() {
        this.delegate.onDialogSearchingFailed();
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        this.delegate.onGroupLoadingCompleted(targets);
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupLoadingFailed() {
        this.delegate.onGroupLoadingFailed();
    }

    @Override // com.vk.sharing.target.TargetsLoader.Callback
    public void onGroupSearchingCompleted(@NonNull ArrayList<Target> targets) {
        this.delegate.onGroupSearchingCompleted(targets);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        if (getIntent().getBooleanExtra("fullscreen", false)) {
            View decorView = getWindow().getDecorView();
            decorView.setSystemUiVisibility(4);
        }
        overridePendingTransition(0, 0);
        super.onCreate(savedInstanceState);
        this.view = new SharingView(this);
        setContentView(this.view, new ViewGroup.LayoutParams(-1, -1));
        this.attachmentInfo = (AttachmentInfo) getIntent().getParcelableExtra("attachment_info");
        ActionsInfo actionsInfo = (ActionsInfo) getIntent().getParcelableExtra(EXTRA_ACTIONS_INFO);
        NonConfigurationInstances nci = (NonConfigurationInstances) getLastCustomNonConfigurationInstance();
        if (nci != null) {
            this.targetsLoader = nci.targetsLoader;
            this.attachmentViewHolder = nci.attachmentViewHolder;
        } else {
            this.targetsLoader = new TargetsLoader();
            if (this.attachmentInfo != null) {
                this.attachmentViewHolder = Attachments.createViewHolder(this.attachmentInfo);
            }
        }
        if (this.attachmentViewHolder != null) {
            this.view.setAttachmentViewHolder(this.attachmentViewHolder);
        }
        if (actionsInfo != null) {
            this.view.setActionsInfo(actionsInfo);
        }
        this.actionsInfo = actionsInfo;
        if (savedInstanceState == null) {
            int mode = getIntent().getIntExtra("mode", 0);
            this.targets = new Targets();
            switch (mode) {
                case 1:
                    this.groupPickerInfo = (GroupPickerInfo) getIntent().getParcelableExtra(EXTRA_PICKER_INFO);
                    this.delegate = new GroupPickerPresenter(this);
                    break;
                default:
                    this.delegate = new CommonPresenter((BasePresenter.DelegateContext) this, true);
                    break;
            }
        } else {
            this.targets = (Targets) savedInstanceState.getParcelable(STATE_TARGETS);
            this.delegate = PresenterDelegateToIntAdapter.toDelegate(this, savedInstanceState.getInt(STATE_DELEGATE));
        }
        this.view.setPresenter(this);
        this.targetsLoader.setCallback(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStart() {
        super.onStart();
        this.logoutReceiver = LogoutReceiver.register(this);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        AppStateTracker.onActivityPaused();
        super.onPause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStop() {
        this.logoutReceiver.unregister();
        this.logoutReceiver = null;
        super.onStop();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.targetsLoader.setCallback(null);
        super.onDestroy();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        this.view.onBackPressed();
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override // android.support.v4.app.FragmentActivity
    public Object onRetainCustomNonConfigurationInstance() {
        NonConfigurationInstances nci = new NonConfigurationInstances();
        nci.targetsLoader = this.targetsLoader;
        nci.attachmentViewHolder = this.attachmentViewHolder;
        return nci;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(@NonNull Bundle outState) {
        outState.putParcelable(STATE_TARGETS, this.targets);
        outState.putInt(STATE_DELEGATE, PresenterDelegateToIntAdapter.fromDelegate(this.delegate));
        super.onSaveInstanceState(outState);
    }

    /* loaded from: classes2.dex */
    private static final class PresenterDelegateToIntAdapter {
        private static final int COMMON = 1;
        private static final int GROUP_PICK = 6;
        private static final int GROUP_POST = 4;
        private static final int GROUP_SEARCH = 5;
        private static final int TARGET_SEARCH = 2;
        private static final int WALL_POST = 3;

        static int fromDelegate(@NonNull BasePresenter delegate) {
            Class<?> cls = delegate.getClass();
            if (DialogSearchPresenter.class.equals(cls)) {
                return 2;
            }
            if (WallPostPresenter.class.equals(cls)) {
                return 3;
            }
            if (GroupPostPresenter.class.equals(cls)) {
                return 4;
            }
            if (GroupSearchPresenter.class.equals(cls)) {
                return 5;
            }
            if (GroupPickerPresenter.class.equals(cls)) {
                return 6;
            }
            return 1;
        }

        @NonNull
        static BasePresenter toDelegate(@NonNull SharingActivity activity, int delegateId) {
            switch (delegateId) {
                case 2:
                    return new DialogSearchPresenter(activity);
                case 3:
                    return new WallPostPresenter(activity);
                case 4:
                    return new GroupPostPresenter(activity);
                case 5:
                    return new GroupSearchPresenter(activity);
                case 6:
                    return new GroupPickerPresenter(activity);
                default:
                    return new CommonPresenter(activity);
            }
        }

        private PresenterDelegateToIntAdapter() {
        }
    }
}
