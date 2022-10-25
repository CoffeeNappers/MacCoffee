package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.adapters.CardMergeAdapter;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.SettingsSelectFriendHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceRadioButtonHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class PrivacyEditFragment extends CardRecyclerFragment<Void> implements BackListener, PreferenceRadioButtonHolder.OnRadioButtonClickListener<PrivacySetting.PrivacyRule> {
    private static final int ALLOW_SELECT_RESULT = 101;
    private static final int DENY_SELECT_RESULT = 102;
    private static final int[] LIST_IMAGES = {R.drawable.ic_friendlist_4, R.drawable.ic_friendlist_5, R.drawable.ic_friendlist_3, R.drawable.ic_friendlist_1, R.drawable.ic_friendlist_2, R.drawable.ic_friendlist_6, R.drawable.ic_friendlist_7, R.drawable.ic_friendlist_8};
    private CardMergeAdapter adapter;
    private UserListAdapter allowAdapter;
    private boolean changed;
    private int checkedOption;
    private UserListAdapter denyAdapter;
    private boolean hasSome;
    private OptionsAdapter optionsAdapter;
    private PrivacySetting setting;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        static final String KEY_SETTING = "setting";

        public Builder() {
            super(PrivacyEditFragment.class);
        }

        public Builder setSetting(PrivacySetting setting) {
            this.args.putParcelable(KEY_SETTING, new PrivacySetting(setting));
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            beforeSetAdapter();
            loadData();
        }
        return this.adapter;
    }

    public PrivacyEditFragment() {
        super(10);
        this.checkedOption = -1;
        this.hasSome = false;
        this.changed = false;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        onDataLoaded(Collections.emptyList(), false);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.setting = (PrivacySetting) getArguments().getParcelable("setting");
        setRefreshEnabled(false);
        this.loaded = true;
        showContent();
    }

    private static int[] usersToIds(ArrayList<UserProfile> profiles) {
        int[] ids = new int[profiles == null ? 0 : profiles.size()];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = profiles.get(i).uid;
        }
        return ids;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        if (!canGoBack()) {
            super.onToolbarNavigationClick();
            return;
        }
        setResult();
        super.onToolbarNavigationClick();
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0) {
            getFragmentManager().popBackStack();
            return true;
        }
        setResult();
        return false;
    }

    protected View[] createHeaderViews() {
        TextView t = new TextView(getActivity());
        int pad = t.getContext().getResources().getDimensionPixelSize(R.dimen.standard_list_item_padding);
        t.setPadding(pad, 0, pad, 0);
        t.setMinHeight(Global.scale(72.0f));
        t.setTextColor(-8881798);
        t.setGravity(16);
        t.setTextSize(1, 16.0f);
        t.setText(this.setting.title);
        return new View[]{t};
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void beforeSetAdapter() {
        if (this.adapter == null) {
            this.optionsAdapter = new OptionsAdapter();
            this.allowAdapter = new UserListAdapter(PrivacyEditFragment$$Lambda$1.lambdaFactory$(this), PrivacyEditFragment$$Lambda$2.lambdaFactory$(this), true);
            this.denyAdapter = new UserListAdapter(PrivacyEditFragment$$Lambda$3.lambdaFactory$(this), PrivacyEditFragment$$Lambda$4.lambdaFactory$(this), false);
            for (String v : this.setting.possibleRules) {
                if (v == null) {
                    v = "";
                }
                char c = 65535;
                switch (v.hashCode()) {
                    case -1942494185:
                        if (v.equals("friends_of_friends")) {
                            c = 2;
                            break;
                        }
                        break;
                    case -1313660149:
                        if (v.equals(NativeProtocol.AUDIENCE_ME)) {
                            c = 5;
                            break;
                        }
                        break;
                    case -1144722732:
                        if (v.equals("friends_of_friends_only")) {
                            c = 3;
                            break;
                        }
                        break;
                    case -1040220445:
                        if (v.equals("nobody")) {
                            c = 4;
                            break;
                        }
                        break;
                    case -600094315:
                        if (v.equals("friends")) {
                            c = 1;
                            break;
                        }
                        break;
                    case 96673:
                        if (v.equals("all")) {
                            c = 0;
                            break;
                        }
                        break;
                    case 3536116:
                        if (v.equals("some")) {
                            c = 6;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        if (this.setting.value.get(0).equals(PrivacySetting.ALL)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                        }
                        this.optionsAdapter.values.add(PrivacySetting.ALL);
                        break;
                    case 1:
                        if (this.setting.value.get(0).equals(PrivacySetting.FRIENDS)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                        }
                        this.optionsAdapter.values.add(PrivacySetting.FRIENDS);
                        break;
                    case 2:
                        if (this.setting.value.get(0).equals(PrivacySetting.FRIENDS_OF_FRIENDS)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                        }
                        this.optionsAdapter.values.add(PrivacySetting.FRIENDS_OF_FRIENDS);
                        break;
                    case 3:
                        if (this.setting.value.get(0).equals(PrivacySetting.FRIENDS_OF_FRIENDS_ONLY)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                        }
                        this.optionsAdapter.values.add(PrivacySetting.FRIENDS_OF_FRIENDS_ONLY);
                        break;
                    case 4:
                        if (this.setting.value.get(0).equals(PrivacySetting.NOBODY)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                            this.denyAdapter.visible = false;
                        }
                        this.optionsAdapter.values.add(PrivacySetting.NOBODY);
                        break;
                    case 5:
                        if (this.setting.value.get(0).equals(PrivacySetting.ONLY_ME)) {
                            this.checkedOption = this.optionsAdapter.values.size();
                            this.denyAdapter.visible = false;
                        }
                        this.optionsAdapter.values.add(PrivacySetting.ONLY_ME);
                        break;
                    case 6:
                        this.optionsAdapter.values.add(new PrivacySetting.Include());
                        this.hasSome = true;
                        break;
                }
            }
            if (this.checkedOption == -1) {
                this.checkedOption = this.optionsAdapter.values.size() - 1;
                this.allowAdapter.visible = true;
            } else {
                this.allowAdapter.visible = false;
            }
            View[] headerView = createHeaderViews();
            UsableRecyclerView.Adapter[] adapters = new UsableRecyclerView.Adapter[headerView.length + 4];
            int adapterIndex = 0 + 1;
            adapters[0] = new HeaderHackAdapter();
            int i = 0;
            while (true) {
                int adapterIndex2 = adapterIndex;
                if (i < headerView.length) {
                    adapterIndex = adapterIndex2 + 1;
                    adapters[adapterIndex2] = new HeaderAdapter(headerView[i]);
                    i++;
                } else {
                    int adapterIndex3 = adapterIndex2 + 1;
                    adapters[adapterIndex2] = this.optionsAdapter;
                    int adapterIndex4 = adapterIndex3 + 1;
                    adapters[adapterIndex3] = this.allowAdapter;
                    int i2 = adapterIndex4 + 1;
                    adapters[adapterIndex4] = this.denyAdapter;
                    this.adapter = new CardMergeAdapter(adapters);
                    if (!this.hasSome) {
                        this.denyAdapter.visible = false;
                    }
                    ArrayList<Friends.Folder> lists = new ArrayList<>();
                    Friends.getLists(lists);
                    for (PrivacySetting.PrivacyRule rule : this.setting.value) {
                        if (rule instanceof PrivacySetting.UserListPrivacyRule) {
                            PrivacySetting.UserListPrivacyRule lr = (PrivacySetting.UserListPrivacyRule) rule;
                            for (int i3 = 0; i3 < lr.userCount(); i3++) {
                                int uid = lr.userIdAt(i3);
                                UserProfile p = null;
                                if (uid < 2000000000) {
                                    p = Friends.get(uid);
                                } else {
                                    Iterator<Friends.Folder> it = lists.iterator();
                                    while (true) {
                                        if (it.hasNext()) {
                                            Friends.Folder f = it.next();
                                            if (f.id == uid - 2000000000) {
                                                p = new UserProfile();
                                                p.uid = uid;
                                                p.fullName = f.name;
                                            }
                                        }
                                    }
                                }
                                if (p == null) {
                                    p = new UserProfile();
                                }
                                if (rule instanceof PrivacySetting.Include) {
                                    this.allowAdapter.users.add(p);
                                } else {
                                    this.denyAdapter.users.add(p);
                                }
                            }
                        }
                    }
                    return;
                }
            }
        }
    }

    public /* synthetic */ void lambda$beforeSetAdapter$0() {
        new FriendsFragment.Builder().setPresetUsers(usersToIds(this.allowAdapter.users)).setTitle(getString(R.string.privacy_allowed_to)).setMultiSelect().setDisableSpinner().setGlobalSearch(false).forResult(this, 101);
    }

    public /* synthetic */ void lambda$beforeSetAdapter$1() {
        showListOfCategories(this.allowAdapter);
    }

    public /* synthetic */ void lambda$beforeSetAdapter$2() {
        new FriendsFragment.Builder().setPresetUsers(usersToIds(this.denyAdapter.users)).setTitle(getString(R.string.privacy_denied_to)).setMultiSelect().setDisableSpinner().setGlobalSearch(false).forResult(this, 102);
    }

    public /* synthetic */ void lambda$beforeSetAdapter$3() {
        showListOfCategories(this.denyAdapter);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        view.setBackgroundResource(R.color.cards_bg);
        return view;
    }

    @Override // com.vkontakte.android.ui.holder.commons.PreferenceRadioButtonHolder.OnRadioButtonClickListener
    public void onRadioButtonClick(PrivacySetting.PrivacyRule privacyRule) {
        this.checkedOption = this.optionsAdapter.values.indexOf(privacyRule);
        String opt = this.setting.possibleRules.get(this.checkedOption);
        this.allowAdapter.visible = opt.equals("some");
        if (this.allowAdapter.visible) {
        }
        updateList();
        this.changed = true;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            ArrayList<UserProfile> users = data.getParcelableArrayListExtra("result");
            if (requestCode != 101) {
                if (requestCode == 102) {
                    this.denyAdapter.users.clear();
                    Iterator<UserProfile> it = users.iterator();
                    while (it.hasNext()) {
                        UserProfile p = it.next();
                        this.denyAdapter.users.add(p);
                    }
                    Iterator<UserProfile> itrtr = this.allowAdapter.users.iterator();
                    while (itrtr.hasNext()) {
                        UserProfile p2 = itrtr.next();
                        if (this.denyAdapter.users.contains(p2)) {
                            itrtr.remove();
                        }
                    }
                    this.changed = true;
                }
            } else {
                this.allowAdapter.users.clear();
                Iterator<UserProfile> it2 = users.iterator();
                while (it2.hasNext()) {
                    UserProfile p3 = it2.next();
                    this.allowAdapter.users.add(p3);
                }
                Iterator<UserProfile> itrtr2 = this.denyAdapter.users.iterator();
                while (itrtr2.hasNext()) {
                    UserProfile p4 = itrtr2.next();
                    if (this.allowAdapter.users.contains(p4)) {
                        itrtr2.remove();
                    }
                }
                this.changed = true;
            }
            updateList();
        }
        if (requestCode == 101) {
            setToAllIfAllowedIsEmpty();
        }
    }

    public void setToAllIfAllowedIsEmpty() {
        if (this.allowAdapter.users.size() == 0) {
            this.changed = true;
            this.allowAdapter.visible = false;
            this.checkedOption = 0;
            updateList();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        String opt = this.setting.possibleRules.get(this.checkedOption);
        boolean hasLists = false;
        Iterator it = this.allowAdapter.users.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            UserProfile p = (UserProfile) it.next();
            if (p.uid > 2000000000) {
                hasLists = true;
                break;
            }
        }
        this.denyAdapter.visible = !opt.equals(NativeProtocol.AUDIENCE_ME) && !opt.equals("nobody") && (!opt.equals("some") || hasLists);
        super.updateList();
    }

    public PrivacySetting getResult() {
        if (this.changed) {
            this.setting.value.clear();
            String val = this.setting.possibleRules.get(this.checkedOption);
            char c = 65535;
            switch (val.hashCode()) {
                case -1942494185:
                    if (val.equals("friends_of_friends")) {
                        c = 2;
                        break;
                    }
                    break;
                case -1313660149:
                    if (val.equals(NativeProtocol.AUDIENCE_ME)) {
                        c = 5;
                        break;
                    }
                    break;
                case -1144722732:
                    if (val.equals("friends_of_friends_only")) {
                        c = 3;
                        break;
                    }
                    break;
                case -1040220445:
                    if (val.equals("nobody")) {
                        c = 4;
                        break;
                    }
                    break;
                case -600094315:
                    if (val.equals("friends")) {
                        c = 1;
                        break;
                    }
                    break;
                case 96673:
                    if (val.equals("all")) {
                        c = 0;
                        break;
                    }
                    break;
                case 3536116:
                    if (val.equals("some")) {
                        c = 6;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    this.setting.value.add(PrivacySetting.ALL);
                    break;
                case 1:
                    this.setting.value.add(PrivacySetting.FRIENDS);
                    break;
                case 2:
                    this.setting.value.add(PrivacySetting.FRIENDS_OF_FRIENDS);
                    break;
                case 3:
                    this.setting.value.add(PrivacySetting.FRIENDS_OF_FRIENDS_ONLY);
                    break;
                case 4:
                    this.setting.value.add(PrivacySetting.NOBODY);
                    break;
                case 5:
                    this.setting.value.add(PrivacySetting.ONLY_ME);
                    break;
                case 6:
                    PrivacySetting.Include incl = new PrivacySetting.Include();
                    Iterator it = this.allowAdapter.users.iterator();
                    while (it.hasNext()) {
                        UserProfile p = (UserProfile) it.next();
                        incl.add(p.uid);
                    }
                    if (incl.userCount() != 0) {
                        this.setting.value.add(incl);
                        break;
                    } else {
                        return null;
                    }
            }
            if (this.denyAdapter.users.size() > 0 && !"nobody".equals(val) && !NativeProtocol.AUDIENCE_ME.equals(val)) {
                PrivacySetting.Exclude excl = new PrivacySetting.Exclude();
                Iterator it2 = this.denyAdapter.users.iterator();
                while (it2.hasNext()) {
                    UserProfile p2 = (UserProfile) it2.next();
                    excl.add(p2.uid);
                }
                this.setting.value.add(excl);
            }
            if (this.setting.value.size() == 0) {
                return null;
            }
            return this.setting;
        }
        return this.setting;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        setResult();
        super.onDestroy();
    }

    protected void setResult() {
        getActivity().setResult(-1, new Intent().putExtra("setting", getResult()));
    }

    protected String getPrivacySettingsTitle() {
        return getString(R.string.privacy_allowed_to);
    }

    /* loaded from: classes2.dex */
    public class OptionsAdapter extends UsableRecyclerView.Adapter<RecyclerHolder> implements CardItemDecorator.Provider {
        private ArrayList<PrivacySetting.PrivacyRule> values;

        private OptionsAdapter() {
            PrivacyEditFragment.this = r2;
            this.values = new ArrayList<>();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 20:
                    return TitleHolder.blueTitle(parent).withText(PrivacyEditFragment.this.getPrivacySettingsTitle());
                case 21:
                    return new BackgroundHolder(parent).setRes(R.drawable.apps_top_padding_white_8);
                default:
                    return new PreferenceRadioButtonHolder(parent, PrivacyEditFragment.this);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            if (holder instanceof PreferenceRadioButtonHolder) {
                ((PreferenceRadioButtonHolder) holder).setChecked(position + (-1) == PrivacyEditFragment.this.checkedOption).bind(this.values.get(position - 1));
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.values.size() + 2;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == 0) {
                return 20;
            }
            if (position == getItemCount() - 1) {
                return 21;
            }
            return 22;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            if (position == 0) {
                return 2;
            }
            if (position == getItemCount() - 1) {
                return 4;
            }
            return 1;
        }
    }

    /* loaded from: classes2.dex */
    public class UserListAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> implements CardItemDecorator.Provider {
        final boolean isAllowed;
        SettingsSelectFriendHolder.Data selectFriendList;
        SettingsSelectFriendHolder.Data selectFriends;
        private ArrayList<UserProfile> users = new ArrayList<>();
        private boolean visible = true;
        VoidF1<UserProfile> f1 = PrivacyEditFragment$UserListAdapter$$Lambda$1.lambdaFactory$(this);

        public /* synthetic */ void lambda$new$0(UserProfile v) {
            this.users.remove(v);
            PrivacyEditFragment.this.setToAllIfAllowedIsEmpty();
            PrivacyEditFragment.this.updateList();
            PrivacyEditFragment.this.changed = true;
        }

        public UserListAdapter(VoidF0 selectFriendsFunc, VoidF0 selectFriendListFunc, boolean isAllowed) {
            PrivacyEditFragment.this = r3;
            this.selectFriends = new SettingsSelectFriendHolder.Data(Integer.valueOf((int) R.string.pick_friends), selectFriendsFunc);
            this.selectFriendList = new SettingsSelectFriendHolder.Data(Integer.valueOf((int) R.string.pick_lists), selectFriendListFunc);
            this.isAllowed = isAllowed;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == 0) {
                return 10;
            }
            if (position == getItemCount() - 1) {
                return 11;
            }
            if (position == getItemCount() - 2) {
                return 14;
            }
            if (position == getItemCount() - 3) {
                return 12;
            }
            return 13;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 10:
                    return TitleHolder.blueTitle(parent).withText(this.isAllowed ? R.string.privacy_allowed_to : R.string.privacy_denied_to);
                case 11:
                    return new BackgroundHolder(parent).setRes(R.drawable.apps_top_padding_white_8);
                case 12:
                case 14:
                    return new SettingsSelectFriendHolder(parent);
                case 13:
                default:
                    return UserHolder.actionable(parent, R.layout.user_item_removable_phone).onAction(this.f1);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 10:
                    ((TitleHolder) holder).bind(Integer.valueOf(this.isAllowed ? R.string.privacy_allowed_to : R.string.privacy_denied_to));
                    break;
                case 12:
                    ((SettingsSelectFriendHolder) holder).bind(this.selectFriends);
                    break;
                case 14:
                    ((SettingsSelectFriendHolder) holder).bind(this.selectFriendList);
                    break;
            }
            if (holder instanceof UserHolder) {
                ((UserHolder) holder).bind(this.users.get(position - 1));
                if (this.users.get(position - 1).uid >= 2000000000) {
                    ((UserHolder) holder).mImage.setImageResource(PrivacyEditFragment.LIST_IMAGES[(this.users.get(position - 1).uid - NewsEntry.OWNER_ID_NOTIFICATION) % PrivacyEditFragment.LIST_IMAGES.length]);
                }
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (this.visible) {
                return this.users.size() + 4;
            }
            return 0;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            if (position == 0) {
                return 2;
            }
            if (position != getItemCount() - 1) {
                return 1;
            }
            return 4;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            if (item == 0 || item >= getItemCount() - 3) {
                return 0;
            }
            return this.users.get(item + (-1)).uid > 2000000000 ? 0 : 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            if (item - 1 < 0 || item - 1 >= this.users.size()) {
                return null;
            }
            return this.users.get(item - 1).photo;
        }
    }

    /* loaded from: classes2.dex */
    public class HeaderHackAdapter extends UsableRecyclerView.Adapter implements CardItemDecorator.Provider {
        private HeaderHackAdapter() {
            PrivacyEditFragment.this = r1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new BackgroundHolder(parent).setRes(R.drawable.card_top_fix_item);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 40;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 1;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return PrivacyEditFragment.this.isTablet ? 2 : 1;
        }
    }

    /* loaded from: classes2.dex */
    public class HeaderAdapter extends UsableRecyclerView.Adapter implements CardItemDecorator.Provider {
        final View title;

        public HeaderAdapter(View title) {
            PrivacyEditFragment.this = r1;
            this.title = title;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new RecyclerHolder<Void>(this.title) { // from class: com.vkontakte.android.fragments.PrivacyEditFragment.HeaderAdapter.1
                {
                    HeaderAdapter.this = this;
                }

                @Override // com.vkontakte.android.ui.holder.RecyclerHolder
                public void onBind(Void item) {
                }
            };
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 30;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 1;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return 4;
        }
    }

    private void showListOfCategories(UserListAdapter userListAdapter) {
        Context context = getActivity();
        if (context != null) {
            ArrayList<UserProfile> fl = new ArrayList<>();
            ArrayList<String> items = new ArrayList<>();
            ArrayList<UserProfile> itemsProfiles = new ArrayList<>();
            ArrayList<Boolean> _states = new ArrayList<>();
            ArrayList<Friends.Folder> lists = new ArrayList<>();
            Friends.getLists(lists);
            Friends.getFriends(fl);
            Iterator<Friends.Folder> it = lists.iterator();
            while (it.hasNext()) {
                Friends.Folder l = it.next();
                UserProfile p = new UserProfile();
                p.uid = 2000000000 + l.id;
                p.fullName = l.name;
                fl.add(p);
                items.add(p.fullName);
                itemsProfiles.add(p);
                _states.add(Boolean.valueOf(userListAdapter.users.contains(p)));
            }
            boolean[] states = new boolean[_states.size()];
            boolean[] oldStates = new boolean[_states.size()];
            for (int i = 0; i < _states.size(); i++) {
                states[i] = _states.get(i).booleanValue();
                oldStates[i] = _states.get(i).booleanValue();
            }
            AlertDialog dlg = new VKAlertDialog.Builder(context).setTitle(R.string.pick_lists).setMultiChoiceItems((CharSequence[]) items.toArray(new String[items.size()]), states, PrivacyEditFragment$$Lambda$5.lambdaFactory$(states)).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            dlg.getButton(-1).setOnClickListener(PrivacyEditFragment$$Lambda$6.lambdaFactory$(this, states, oldStates, itemsProfiles, userListAdapter, dlg));
        }
    }

    public static /* synthetic */ void lambda$showListOfCategories$4(boolean[] states, DialogInterface dialogInterface, int i, boolean b) {
        states[i] = b;
    }

    public /* synthetic */ void lambda$showListOfCategories$5(boolean[] states, boolean[] oldStates, ArrayList itemsProfiles, UserListAdapter userListAdapter, AlertDialog dlg, View view) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (int i = 0; i < states.length; i++) {
            if (states[i] != oldStates[i]) {
                if (oldStates[i]) {
                    if (!arrayList2.contains(itemsProfiles.get(i))) {
                        arrayList2.add(itemsProfiles.get(i));
                    }
                } else if (!arrayList.contains(itemsProfiles.get(i))) {
                    arrayList.add(itemsProfiles.get(i));
                }
            }
        }
        if (arrayList.size() > 0 || arrayList2.size() > 0) {
            this.changed = true;
            userListAdapter.users.removeAll(arrayList2);
            userListAdapter.users.addAll(arrayList);
            userListAdapter.notifyDataSetChanged();
        }
        ViewUtils.dismissDialogSafety(dlg);
    }
}
