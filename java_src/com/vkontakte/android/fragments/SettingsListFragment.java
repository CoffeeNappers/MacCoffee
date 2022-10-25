package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.AttachIntent;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.MainActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.PhotosDeleteAvatar;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.WebViewFragment;
import com.vkontakte.android.fragments.money.MoneyTransfersHistoryFragment;
import com.vkontakte.android.fragments.money.SubscriptionFragment;
import com.vkontakte.android.fragments.userlist.BlacklistFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.MaterialListButtonBlueHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceIconItemHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.upload.ProfilePhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import io.reactivex.annotations.SchedulerSupport;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class SettingsListFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements View.OnClickListener, VoidF1<Item>, RecyclerSectionAdapter.DataDelegate {
    private static final int AVA_RESULT = 3901;
    private final SettingsAdapter adapter;
    private View headerView;
    private BroadcastReceiver receiver;

    public SettingsListFragment() {
        super(10);
        this.adapter = new SettingsAdapter(this);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.SettingsListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (LongPollService.ACTION_STATE_CHANGED.equals(intent.getAction())) {
                    SettingsListFragment.this.updateOnlineState();
                }
                if (Posts.ACTION_USER_PHOTO_CHANGED.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    if (id == VKAccountManager.getCurrent().getUid()) {
                        SettingsListFragment.this.setUserPhoto(intent.getStringExtra("photo"));
                    }
                }
            }
        };
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.menu_settings);
        IntentFilter filter = new IntentFilter(LongPollService.ACTION_STATE_CHANGED);
        filter.addAction(Posts.ACTION_USER_PHOTO_CHANGED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        super.onDetach();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.photo /* 2131755496 */:
                String photoSrc = VKAccountManager.getCurrent().getPhoto();
                showUpdatePhotoDlg(photoSrc != null && !photoSrc.endsWith(".gif"));
                return;
            case R.id.edit_profile /* 2131756334 */:
                Navigate.to(ProfileEditFragment.class, new Bundle(), getActivity());
                return;
            default:
                return;
        }
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerSectionAdapter.DataDelegate
    public List<RecyclerSectionAdapter.Data> getData() {
        return this.data;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        onDataLoaded(this.adapter.createData(), false);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.headerView = View.inflate(getActivity(), R.layout.settings_list_header, null);
        ((TextView) this.headerView.findViewById(R.id.name)).setText(VKAccountManager.getCurrent().getName());
        ImageView photo = (ImageView) this.headerView.findViewById(R.id.photo);
        setUserPhoto(VKAccountManager.getCurrent().getPhoto());
        this.headerView.findViewById(R.id.edit_profile).setOnClickListener(this);
        photo.setOnClickListener(this);
        updateOnlineState();
        return super.onCreateContentView(inflater, container, savedInstanceState);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.headerView = null;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == AVA_RESULT && resCode == -1) {
            float cropLeft = data.getFloatExtra("cropLeft", 0.0f);
            float cropTop = data.getFloatExtra("cropTop", 0.0f);
            float cropRight = data.getFloatExtra("cropRight", 0.0f);
            float cropBottom = data.getFloatExtra("cropBottom", 0.0f);
            Upload.start(getActivity(), new ProfilePhotoUploadTask(getActivity(), data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME), VKAccountManager.getCurrent().getUid(), true, cropLeft, cropTop, cropRight, cropBottom));
        }
        if (reqCode == AVA_RESULT && resCode == 1) {
            int idx = data.getIntExtra("option", 0);
            if (idx == 0) {
                new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.delete_photo_confirm).setPositiveButton(R.string.yes, SettingsListFragment$$Lambda$1.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onActivityResult$0(DialogInterface dialog, int which) {
        deletePhoto();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setUserPhoto(String photoSrc) {
        VKImageView photo = (VKImageView) this.headerView.findViewById(R.id.photo);
        photo.load(photoSrc);
    }

    public void showUpdatePhotoDlg(boolean havePhotos) {
        Intent intent = new Intent(getActivity(), ImagePickerActivity.class).putExtra("allow_album", false).putExtra(ArgKeys.LIMIT, 1);
        ArrayList<String> acts = new ArrayList<>();
        if (havePhotos) {
            acts.add(getString(R.string.delete));
            intent.putExtra(SchedulerSupport.CUSTOM, acts);
        }
        intent.putExtra("no_thumbs", true).putExtra(AttachIntent.INTENT_THUMB, true);
        startActivityForResult(intent, AVA_RESULT);
    }

    private void deletePhoto() {
        new PhotosDeleteAvatar(VKAccountManager.getCurrent().getUid()).setCallback(new SimpleCallback<String>(getActivity()) { // from class: com.vkontakte.android.fragments.SettingsListFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(String newPhoto) {
                Activity act = SettingsListFragment.this.getActivity();
                if (act != null) {
                    act.sendBroadcast(new Intent(Posts.ACTION_USER_PHOTO_CHANGED).putExtra("photo", newPhoto).putExtra("id", VKAccountManager.getCurrent().getUid()), "com.vkontakte.android.permission.ACCESS_DATA");
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void confirmLogout() {
        new VKAlertDialog.Builder(getActivity()).setMessage(R.string.log_out_warning).setTitle(R.string.log_out).setPositiveButton(R.string.yes, SettingsListFragment$$Lambda$2.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$confirmLogout$1(DialogInterface dialog, int which) {
        ProgressDialog dlg = new ProgressDialog(getActivity());
        dlg.setMessage(getResources().getString(R.string.loading));
        dlg.show();
        if (Build.VERSION.SDK_INT < 21) {
            dlg.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        }
        dlg.setCancelable(false);
        new AnonymousClass3(dlg).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.SettingsListFragment$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 extends Thread {
        final /* synthetic */ ProgressDialog val$dlg;

        AnonymousClass3(ProgressDialog progressDialog) {
            this.val$dlg = progressDialog;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            VKAuth.logout();
            ViewUtils.runOnUiThread(SettingsListFragment$3$$Lambda$1.lambdaFactory$(this, this.val$dlg));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$run$0(ProgressDialog dlg) {
            ViewUtils.dismissDialogSafety(dlg);
            if (SettingsListFragment.this.getActivity() instanceof MainActivity) {
                ((MainActivity) SettingsListFragment.this.getActivity()).restartAfterLogout();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateOnlineState() {
        if (this.headerView != null) {
            ((TextView) this.headerView.findViewById(R.id.status)).setText(LongPollService.getState() == 3 ? R.string.online : R.string.offline);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (!this.data.isEmpty() && ((RecyclerSectionAdapter.Data) this.data.get(0)).type == 3) {
            if (this.isTablet) {
                this.data.set(0, RecyclerSectionAdapter.Data.top(3, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            } else {
                this.data.set(0, RecyclerSectionAdapter.Data.middle(3, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            }
        }
        updateDecorator();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class SettingsAdapter extends RecyclerSectionAdapter {
        private static final int TYPE_BOTTOM = 3;
        private static final int TYPE_HEADER = 5;
        private static final int TYPE_ICON_PREF = 2;
        private static final int TYPE_LOGOUT = 4;
        private static final int TYPE_TITLE = 1;

        public SettingsAdapter(RecyclerSectionAdapter.DataDelegate dataDelegate) {
            super(dataDelegate);
        }

        ArrayList<RecyclerSectionAdapter.Data> createData() {
            ArrayList<RecyclerSectionAdapter.Data> data = new ArrayList<>();
            if (SettingsListFragment.this.isTablet) {
                data.add(RecyclerSectionAdapter.Data.top(3, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            } else {
                data.add(RecyclerSectionAdapter.Data.middle(3, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            }
            data.add(RecyclerSectionAdapter.Data.bottom(5, null));
            data.add(RecyclerSectionAdapter.Data.top(1, Integer.valueOf((int) R.string.menu_settings)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_notifications, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.sett_notifications), SettingsNotificationsFragment.class)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_general, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.sett_general), SettingsGeneralFragment.class)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_account, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.sett_account), SettingsAccountFragment.class)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_privacy, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.privacy_settings), PrivacySettingsListFragment.class)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_blacklist, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.blacklist), BlacklistFragment.class)));
            if (VKAccountManager.getCurrent().isMusicRestricted()) {
                data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_menu_music, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.subscription_music), new SubscriptionFragment.Builder(1))));
            }
            if (VKAccountManager.getCurrent().moneyTransfersAvailable) {
                data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_money, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.money_transfer_money_transfers), MoneyTransfersHistoryFragment.class)));
            }
            if (VKAccountManager.getCurrent().debugAvailable) {
                data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_debug_24dp, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.sett_debug), SettingsDebugFragment.class)));
            }
            data.add(RecyclerSectionAdapter.Data.bottom(3, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
            data.add(RecyclerSectionAdapter.Data.top(1, Integer.valueOf((int) R.string.help)));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_help, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.help), SettingsListFragment$SettingsAdapter$$Lambda$1.lambdaFactory$(this))));
            data.add(RecyclerSectionAdapter.Data.middle(2, new Item((int) R.drawable.ic_settings_about, (int) R.color.menu_gray_icon_color, Integer.valueOf((int) R.string.menu_about), SettingsListFragment$SettingsAdapter$$Lambda$2.lambdaFactory$(this))));
            data.add(RecyclerSectionAdapter.Data.bottom(3, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
            data.add(RecyclerSectionAdapter.Data.topBottom(4, Integer.valueOf((int) R.string.log_out)));
            return data;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$createData$0() {
            new WebViewFragment.Builder(VKAccountManager.getCurrent().getSupportUrl()).openInternally().go(SettingsListFragment.this.getActivity());
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$createData$1() {
            MainActivity.showAbout(SettingsListFragment.this.getActivity());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 1:
                    return TitleHolder.blueTitle(parent);
                case 2:
                default:
                    return new PreferenceIconItemHolder(parent, SettingsListFragment.this);
                case 3:
                    return new BackgroundHolder(parent);
                case 4:
                    return new MaterialListButtonBlueHolder(parent) { // from class: com.vkontakte.android.fragments.SettingsListFragment.SettingsAdapter.2
                        @Override // com.vkontakte.android.ui.holder.commons.MaterialListButtonBlueHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
                        public void onClick() {
                            SettingsListFragment.this.confirmLogout();
                        }
                    };
                case 5:
                    return new RecyclerHolder(SettingsListFragment.this.headerView) { // from class: com.vkontakte.android.fragments.SettingsListFragment.SettingsAdapter.1
                        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
                        public void onBind(Object item) {
                        }
                    };
            }
        }
    }

    @Override // com.vkontakte.android.functions.VoidF1
    public void f(Item item) {
        if (item.navigator != null) {
            item.navigator.go(getActivity());
        } else if (item.fragment != null) {
            Navigate.to(item.fragment, new Bundle(), getActivity());
        } else {
            item.onClick.run();
        }
    }

    /* loaded from: classes2.dex */
    public static class Item extends PreferenceIconItemHolder.IconPrefInfo {
        public Class<? extends Fragment> fragment;
        public Navigator navigator;
        public Runnable onClick;

        public Item(@DrawableRes int iconRes, @ColorRes int colorRes, Object text, Class<? extends Fragment> fragment) {
            super(iconRes, colorRes, text);
            this.fragment = fragment;
        }

        public Item(@DrawableRes int iconRes, @ColorRes int colorRes, Object text, Navigator navigator) {
            super(iconRes, colorRes, text);
            this.navigator = navigator;
        }

        public Item(@DrawableRes int iconRes, @ColorRes int colorRes, Object text, Runnable onClick) {
            super(iconRes, colorRes, text);
            this.onClick = onClick;
        }
    }
}
