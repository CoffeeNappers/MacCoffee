package com.vkontakte.android.fragments.friends;

import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.view.PagerAdapter;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsGet;
import com.vkontakte.android.api.friends.FriendsGetRequests;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.VkTabbedLoaderFragment;
import com.vkontakte.android.fragments.gifts.BirthdaysFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.FragmentStatePagerAdapter;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.widget.ScrollAwareFABBehavior;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class FriendsFragment extends VkTabbedLoaderFragment {
    private static final int FRIENDS_FOLDER_ALL = 0;
    private static final int FRIENDS_FOLDER_BIRTHDAY = 1;
    private static final int FRIENDS_FOLDER_REQUEST = 2;
    private static final int MODE_BIRTHDAY = 1;
    private static final int MODE_FRIENDS = 0;
    private static final int MODE_REQUESTS = 2;
    private static final int MODE_UNDEFINED = -1;
    private MenuItem addItem;
    private FriendsListFragment allFriendsView;
    private BirthdaysFragment birthdaysFragment;
    private int currentPosition;
    private boolean disable_spinner;
    private FloatingActionButton fActionButton;
    private boolean global_search;
    private int inRequestsCount;
    private FriendRequestsFragment inRequestsView;
    private boolean mAdmin;
    private boolean mRequestsAdded;
    private int[] mSelectedUsers;
    private boolean multiselect;
    private FriendsListFragment mutualView;
    private FriendsListFragment onlineFriendsView;
    private int outRequestsCount;
    private FriendRequestsFragment outRequestsView;
    private boolean searchEnabled;
    private SearchViewWrapper searchView;
    private boolean searching;
    private boolean select;
    private FriendRequestsFragment suggestsView;
    private boolean updatedByBroadcast;
    private ArrayList<UserProfile> mutual = new ArrayList<>();
    private ArrayList<UserProfile> allFriends = new ArrayList<>();
    private ArrayList<UserProfile> onlineFriends = new ArrayList<>();
    private ArrayList<Friends.Folder> folders = new ArrayList<>();
    private ArrayList<CharSequence> titles = new ArrayList<>();
    private ArrayList<Fragment> fragments = new ArrayList<>();
    private List<RequestUserProfile> requestUsers = new ArrayList();
    private List<RequestUserProfile> suggestUsers = new ArrayList();
    private int uid = VKAccountManager.getCurrent().getUid();
    private int suggestsCount = LongPollService.getNumFriendSuggestions();
    private int currentMode = -1;
    private boolean loadRequestsFromCache = true;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.friends.FriendsFragment.1
        {
            FriendsFragment.this = this;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            char c;
            if (FriendsFragment.this.isAdded()) {
                String action = intent.getAction();
                switch (action.hashCode()) {
                    case -1725246571:
                        if (action.equals(Friends.ACTION_FRIEND_LIST_CHANGED)) {
                            c = 0;
                            break;
                        }
                        c = 65535;
                        break;
                    case -127012065:
                        if (action.equals(FriendsListFragment.ACTION_REQUESTS_UPDATED)) {
                            c = 3;
                            break;
                        }
                        c = 65535;
                        break;
                    case 611799995:
                        if (action.equals(Friends.ACTION_FRIEND_REQUESTS_CHANGED)) {
                            c = 2;
                            break;
                        }
                        c = 65535;
                        break;
                    case 1166576719:
                        if (action.equals(Friends.ACTION_FRIEND_COUNTER_CHANGED)) {
                            c = 1;
                            break;
                        }
                        c = 65535;
                        break;
                    default:
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                        if ((FriendsFragment.this.uid == 0 || VKAccountManager.isCurrentUser(FriendsFragment.this.uid)) && !FriendsFragment.this.disable_spinner) {
                            FriendsFragment.this.loadRequestsFromCache = false;
                            FriendsFragment.this.updatedByBroadcast = true;
                            FriendsFragment.this.allFriends.clear();
                            Friends.getFriends(FriendsFragment.this.allFriends);
                            FriendsFragment.this.loadRequestUsers(new ArrayList(FriendsFragment.this.allFriends), false);
                            FriendsFragment.this.updateSpinner();
                            return;
                        }
                        FriendsFragment.this.onSpinnerItemSelected(FriendsFragment.this.currentPosition);
                        return;
                    case 1:
                        int value = intent.getIntExtra("value", 0);
                        Friends.Request type = (Friends.Request) intent.getSerializableExtra(ServerKeys.TYPE);
                        if (FriendsFragment.this.currentMode == 2) {
                            switch (AnonymousClass5.$SwitchMap$com$vkontakte$android$data$Friends$Request[type.ordinal()]) {
                                case 1:
                                    if (FriendsFragment.this.inRequestsCount != value) {
                                        FriendsFragment.this.inRequestsCount = value;
                                        FriendsFragment.this.updateTabs(2);
                                        return;
                                    }
                                    return;
                                case 2:
                                    if (FriendsFragment.this.outRequestsCount != value) {
                                        FriendsFragment.this.outRequestsCount = value;
                                        FriendsFragment.this.updateTabs(2);
                                        return;
                                    }
                                    return;
                                case 3:
                                    if (FriendsFragment.this.suggestsCount != value) {
                                        FriendsFragment.this.suggestsCount = value;
                                        FriendsFragment.this.updateTabs(2);
                                        return;
                                    }
                                    return;
                                default:
                                    return;
                            }
                        }
                        return;
                    case 2:
                        if (FriendsFragment.this.allFriendsView.isAdded() && !FriendsFragment.this.multiselect && !FriendsFragment.this.select) {
                            FriendsFragment.this.requestUsers.clear();
                            FriendsFragment.this.suggestUsers.clear();
                            Friends.reload(true);
                            return;
                        }
                        return;
                    case 3:
                        if (!FriendsFragment.this.multiselect && !FriendsFragment.this.select) {
                            FriendsFragment.this.requestUsers.clear();
                            FriendsFragment.this.suggestUsers.clear();
                            FriendsFragment.this.requestUsers.addAll(intent.getParcelableArrayListExtra("in"));
                            FriendsFragment.this.suggestUsers.addAll(intent.getParcelableArrayListExtra("suggest"));
                            int newIn = intent.getIntExtra("count_in", -1);
                            int newSuggest = intent.getIntExtra("count_suggest", -1);
                            if (newIn != -1) {
                                FriendsFragment.this.inRequestsCount = newIn;
                            }
                            if (newSuggest != -1) {
                                FriendsFragment.this.suggestsCount = newSuggest;
                                return;
                            }
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    };

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(FriendsFragment.class);
        }

        public Builder(Class<? extends Fragment> clazz) {
            super(clazz);
        }

        public Builder setUid(int uid) {
            this.args.putInt(ArgKeys.UID, uid);
            return this;
        }

        public Builder setMutual(boolean mutual) {
            this.args.putBoolean("mutual", mutual);
            return this;
        }

        public Builder setSelect() {
            this.args.putBoolean(ArgKeys.SELECT, true);
            return this;
        }

        public Builder setDisableSpinner() {
            this.args.putBoolean(ArgKeys.DISABLE_SPINNER, true);
            return this;
        }

        public Builder setTitle(String title) {
            this.args.putString("title", title);
            return this;
        }

        public Builder setMultiSelect() {
            this.args.putBoolean(ArgKeys.MULTISELECT, true);
            return this;
        }

        public Builder setGlobalSearch(boolean globalSearch) {
            this.args.putBoolean(ArgKeys.GLOBAL_SEARCH, globalSearch);
            return this;
        }

        public Builder setPresetUsers(int[] users) {
            this.args.putIntArray(ArgKeys.SELECTED_USERS, users);
            return this;
        }

        public Builder setSearchEnabled(boolean value) {
            this.args.putBoolean("search_enabled", value);
            return this;
        }
    }

    /* renamed from: com.vkontakte.android.fragments.friends.FriendsFragment$5 */
    /* loaded from: classes2.dex */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$com$vkontakte$android$data$Friends$Request = new int[Friends.Request.values().length];

        static {
            try {
                $SwitchMap$com$vkontakte$android$data$Friends$Request[Friends.Request.IN.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$vkontakte$android$data$Friends$Request[Friends.Request.OUT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$vkontakte$android$data$Friends$Request[Friends.Request.SUGGEST.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public FriendsFragment() {
        setTabsAutoLoad(false);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        boolean z = true;
        super.onCreate(savedInstanceState);
        this.select = getArguments().getBoolean(ArgKeys.SELECT);
        this.multiselect = getArguments().getBoolean(ArgKeys.MULTISELECT);
        this.global_search = getArguments().getBoolean(ArgKeys.GLOBAL_SEARCH, true);
        this.searchEnabled = getArguments().getBoolean("search_enabled", true);
        this.disable_spinner = getArguments().getBoolean(ArgKeys.DISABLE_SPINNER);
        this.uid = getArguments().getInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        if (this.uid != 0 && !VKAccountManager.isCurrentUser(this.uid)) {
            z = false;
        }
        this.mAdmin = z;
        this.mSelectedUsers = getArguments().getIntArray(ArgKeys.SELECTED_USERS);
        ActivityUtils.setBeamLink(getActivity(), "friends?id=" + this.uid);
        if (getArguments().containsKey("title")) {
            setTitle(getArguments().getCharSequence("title"));
        } else {
            setTitle(R.string.friends);
        }
        if (this.uid == 0 || VKAccountManager.isCurrentUser(this.uid)) {
            IntentFilter filter = new IntentFilter();
            filter.addAction(Friends.ACTION_FRIEND_LIST_CHANGED);
            filter.addAction(Friends.ACTION_FRIEND_COUNTER_CHANGED);
            filter.addAction(Friends.ACTION_FRIEND_REQUESTS_CHANGED);
            filter.addAction(FriendsListFragment.ACTION_REQUESTS_UPDATED);
            VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        }
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment
    public void onPageSelected(int pos) {
        KeyboardUtils.hideKeyboard(getContext());
        invalidateOptionsMenu();
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.mAdmin && !this.select && !this.multiselect) {
            this.fActionButton = (FloatingActionButton) this.contentView.findViewById(R.id.fab);
            this.fActionButton.setOnClickListener(FriendsFragment$$Lambda$1.lambdaFactory$(this));
            this.fActionButton.setImageResource(R.drawable.ic_add_24dp);
            showFloatingActionButton(false);
        }
        Bundle bundle = new Bundle();
        bundle.putInt(ArgKeys.UID, this.uid);
        bundle.putBoolean("listen_updates", !this.select && !this.multiselect);
        this.allFriendsView = new FriendsListFragment();
        this.allFriendsView.setArguments(bundle);
        this.allFriendsView.setGlobalSearch(this.global_search);
        if (this.mSelectedUsers != null) {
            Bundle args = new Bundle();
            args.putIntArray(ArgKeys.SELECTED_USERS, this.mSelectedUsers);
            this.allFriendsView.setArguments(args);
        }
        if (!this.multiselect) {
            this.onlineFriendsView = new FriendsListFragment();
            this.onlineFriendsView.setGlobalSearch(this.global_search);
        }
        if (!this.select && !this.mAdmin) {
            this.mutualView = new FriendsListFragment();
        }
        if (VKAccountManager.isCurrentUser(this.uid) && !this.select && !this.multiselect) {
            this.birthdaysFragment = new BirthdaysFragment();
            this.inRequestsView = new FriendRequestsFragment();
            this.outRequestsView = new FriendRequestsFragment();
            this.suggestsView = new FriendRequestsFragment();
            Bundle bundle2 = new Bundle();
            bundle2.putBoolean("out", true);
            this.outRequestsView.setArguments(bundle2);
            Bundle bundle3 = new Bundle();
            bundle3.putBoolean("suggests", true);
            this.suggestsView.setArguments(bundle3);
        }
        if ((this.uid == 0 || VKAccountManager.isCurrentUser(this.uid)) && !this.disable_spinner) {
            updateSpinner();
        } else {
            loadData();
        }
        updateTabs(0);
        if (getArguments().containsKey("tab")) {
            setPagerCurrentItem(getArguments().getInt("tab"));
        }
        this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.friends.FriendsFragment.2
            {
                FriendsFragment.this = this;
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
                boolean z = true;
                boolean ns = query != null && query.length() > 0;
                if (ns != FriendsFragment.this.searching) {
                    FriendsFragment.this.searching = ns;
                    FriendsFragment.this.setSwipeEnabled(!FriendsFragment.this.searching);
                    FriendsFragment friendsFragment = FriendsFragment.this;
                    if (FriendsFragment.this.searching) {
                        z = false;
                    }
                    friendsFragment.setTabsVisible(z);
                }
                FriendsListFragment fragment = FriendsFragment.this.getCurrentFragment();
                if (fragment != null) {
                    fragment.updateFilter(query);
                }
            }
        });
        if (this.fActionButton != null) {
            this.searchView.setStateListener(FriendsFragment$$Lambda$2.lambdaFactory$(this));
        }
        setHasOptionsMenu(true);
        if (this.select) {
            VoidF1<UserProfile> listener = FriendsFragment$$Lambda$3.lambdaFactory$(this);
            this.allFriendsView.setSelectionListener(listener);
            if (this.onlineFriendsView != null) {
                this.onlineFriendsView.setSelectionListener(listener);
            }
        }
        if (this.multiselect) {
            this.allFriendsView.setMultiselectListener(FriendsFragment$$Lambda$4.lambdaFactory$(this));
            this.allFriendsView.setSearchView(this.searchView);
        }
    }

    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        Navigate.to(FriendsImportFragment.class, new Bundle(), getActivity());
    }

    public /* synthetic */ void lambda$onViewCreated$1(boolean expanded) {
        if (expanded) {
            hideFloatingActionButton(false);
        } else {
            showFloatingActionButton(true);
        }
    }

    public /* synthetic */ void lambda$onViewCreated$2(UserProfile user) {
        Intent result = new Intent();
        result.putExtra(ArgKeys.UID, user.uid);
        result.putExtra("name", user.fullName);
        result.putExtra("photo", user.photo);
        result.putExtra(ProfileGiftsFragment.Extra.User, user);
        getActivity().setResult(-1, result);
        getActivity().finish();
    }

    public /* synthetic */ void lambda$onViewCreated$3(ArrayList users) {
        Intent result = new Intent();
        result.putParcelableArrayListExtra("result", users);
        getActivity().setResult(-1, result);
        getActivity().finish();
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean onSpinnerItemSelected(int position) {
        if (this.currentPosition != position) {
            scrollTop(this.allFriendsView);
            scrollTop(this.onlineFriendsView);
            scrollTop(this.mutualView);
        }
        this.currentPosition = position;
        switch (position) {
            case 0:
                if (this.updatedByBroadcast) {
                    this.updatedByBroadcast = false;
                    break;
                } else {
                    doLoadData();
                    break;
                }
            case 1:
                if (VKAccountManager.isCurrentUser(this.uid) && this.birthdaysFragment != null) {
                    updateTabs(0, 0, 0, 1);
                    break;
                }
                break;
            case 2:
                if (VKAccountManager.isCurrentUser(this.uid) && this.inRequestsView != null && this.outRequestsView != null) {
                    updateTabs(this.inRequestsCount, this.outRequestsCount, this.suggestsCount, 2);
                    break;
                }
                break;
            default:
                selectSpinnerGroup(position);
                break;
        }
        return true;
    }

    public void selectSpinnerGroup(int position) {
        this.updatedByBroadcast = false;
        int currentId = (this.folders.size() <= position || position < 0) ? 0 : this.folders.get(position).id;
        List<UserProfile> users = new ArrayList<>();
        List<UserProfile> online = new ArrayList<>();
        int listBit = 1 << currentId;
        for (int i = 0; i < this.allFriends.size(); i++) {
            UserProfile p = this.allFriends.get(i);
            if ((p.country & listBit) > 0) {
                users.add(p);
                if (p.online != 0) {
                    online.add(p);
                }
            }
        }
        this.allFriendsView.setData(users, true, false);
        if (this.onlineFriendsView != null) {
            this.onlineFriendsView.setData(online, false, false);
        }
        updateTabs(users.size(), online.size(), 0, 0);
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (menu != null) {
            if (this.searchView != null && this.searchEnabled && this.loaded && getCurrentFragment() != null) {
                this.searchView.onCreateOptionsMenu(menu);
                if (this.multiselect) {
                    menu.add(0, 16908300, 1, R.string.done);
                    Drawable drawable = getResources().getDrawable(R.drawable.ic_check_24dp);
                    MenuItem primaryItem = menu.findItem(16908300);
                    primaryItem.setShowAsAction(2);
                    primaryItem.setIcon(drawable.mutate());
                    primaryItem.getIcon().setAlpha(100);
                    primaryItem.setEnabled(false);
                    if (this.allFriendsView != null) {
                        this.allFriendsView.setPrimaryMenuItem(primaryItem);
                    }
                }
            }
            super.onCreateOptionsMenu(menu, inflater);
        }
    }

    private void initTabs(int fTab, int sTab, int tTab, int mode, boolean selectFirstPage) {
        this.titles.clear();
        this.fragments.clear();
        switch (mode) {
            case 0:
                this.titles.add(getTabTitle(fTab, R.string.friends, R.plurals.friends_tab_all));
                this.fragments.add(this.allFriendsView);
                if (this.onlineFriendsView != null) {
                    this.titles.add(getTabTitle(sTab, R.string.friends_online, R.plurals.friends_tab_online));
                    this.fragments.add(this.onlineFriendsView);
                }
                if (this.mutualView != null && !VKAccountManager.isCurrentUser(this.uid)) {
                    this.titles.add(getResources().getQuantityString(R.plurals.friends_mutual, tTab, Integer.valueOf(tTab)));
                    this.fragments.add(this.mutualView);
                    break;
                }
                break;
            case 1:
                this.fragments.add(this.birthdaysFragment);
                this.titles.add(getResources().getString(R.string.birthdays_title));
                break;
            case 2:
                this.fragments.add(this.inRequestsView);
                this.fragments.add(this.outRequestsView);
                this.titles.add(getTabTitle(fTab, R.string.friends_tab_requests_in, R.plurals.friends_tab_requests_in));
                this.titles.add(getTabTitle(sTab, R.string.friends_tab_requests_out, R.plurals.friends_tab_requests_out));
                this.inRequestsView.setCounter(fTab);
                this.outRequestsView.setCounter(sTab);
                if (this.suggestsCount > 0) {
                    this.fragments.add(this.suggestsView);
                    this.titles.add(getTabTitle(tTab, R.string.friends_tab_suggestions, R.plurals.friends_tab_suggestions));
                    this.suggestsView.setCounter(tTab);
                    break;
                }
                break;
        }
        setTabs(this.fragments, this.titles);
        if (selectFirstPage) {
            setPagerCurrentItem(0);
        }
    }

    public void updateTabs(int mode) {
        switch (mode) {
            case 0:
                updateTabs(this.allFriends.size(), this.onlineFriends.size(), 0, mode);
                return;
            case 1:
            default:
                return;
            case 2:
                updateTabs(this.inRequestsCount, this.outRequestsCount, this.suggestsCount, mode);
                return;
        }
    }

    private void updateTabs(int fTab, int sTab, int tTab, int mode) {
        if (this.currentMode == mode) {
            switch (mode) {
                case 0:
                    setTabTitle(0, getTabTitle(fTab, R.string.friends, R.plurals.friends_tab_all));
                    this.allFriendsView.setTotalRequests(this.inRequestsCount + this.suggestsCount);
                    if (this.onlineFriendsView != null) {
                        setTabTitle(1, getTabTitle(sTab, R.string.friends_online, R.plurals.friends_tab_online));
                    }
                    if (this.mutualView != null && !VKAccountManager.isCurrentUser(this.uid)) {
                        int mutual = this.mutual.size();
                        setTabTitle(2, getResources().getQuantityString(R.plurals.friends_mutual, mutual, Integer.valueOf(mutual)));
                        return;
                    }
                    return;
                case 1:
                default:
                    return;
                case 2:
                    if ((tTab == 0 && this.suggestsView != null) || (tTab > 0 && this.suggestsView == null)) {
                        initTabs(this.inRequestsCount, this.outRequestsCount, this.suggestsCount, mode, false);
                        return;
                    }
                    setTabTitle(0, getTabTitle(fTab, R.string.friends_tab_requests_in, R.plurals.friends_tab_requests_in));
                    setTabTitle(1, getTabTitle(sTab, R.string.friends_tab_requests_out, R.plurals.friends_tab_requests_out));
                    this.inRequestsView.setCounter(fTab);
                    this.outRequestsView.setCounter(sTab);
                    if (this.suggestsView != null) {
                        setTabTitle(2, getTabTitle(tTab, R.string.friends_tab_suggestions, R.plurals.friends_tab_suggestions));
                        this.suggestsView.setCounter(tTab);
                        return;
                    }
                    return;
            }
        }
        initTabs(fTab, sTab, tTab, mode, true);
        this.currentMode = mode;
    }

    private String getTabTitle(int value, int titleZeroResId, int titleResId) {
        return value == 0 ? getString(titleZeroResId) : getResources().getQuantityString(titleResId, value, Integer.valueOf(value));
    }

    public void setData(List<UserProfile> friends) {
        setData(friends, Collections.emptyList(), Collections.emptyList());
    }

    public void setData(List<UserProfile> friends, List<RequestUserProfile> requests, List<RequestUserProfile> suggests) {
        this.allFriends.clear();
        this.onlineFriends.clear();
        this.allFriends.addAll(friends);
        Iterator<UserProfile> it = this.allFriends.iterator();
        while (it.hasNext()) {
            UserProfile profile = it.next();
            if (profile.online != 0) {
                this.onlineFriends.add(profile);
            }
        }
        this.allFriendsView.setTotalRequests(this.inRequestsCount + this.suggestsCount);
        this.allFriendsView.setData(this.allFriends, requests, suggests, true, this.mAdmin);
        if (this.onlineFriendsView != null) {
            this.onlineFriendsView.setData(this.onlineFriends, false, false);
        }
        updateTabs(0);
        dataLoaded();
        invalidateOptionsMenu();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        if (VKAccountManager.isCurrentUser(this.uid)) {
            long when = 0;
            if (getArguments().getBoolean("_from_menu") && this.allFriends.size() == 0) {
                when = 180;
            }
            Functions.postDelayed(FriendsFragment$$Lambda$5.lambdaFactory$(this), when);
            return;
        }
        this.currentRequest = new FriendsGet(this.uid, true).setCallback(new Callback<FriendsGet.Result>() { // from class: com.vkontakte.android.fragments.friends.FriendsFragment.3
            {
                FriendsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(FriendsGet.Result result) {
                FriendsFragment.this.setData(result.friends);
                FriendsFragment.this.mutual.clear();
                Friends.intersect(FriendsFragment.this.allFriends, FriendsFragment.this.mutual);
                if (FriendsFragment.this.mutualView != null) {
                    FriendsFragment.this.mutualView.setData(FriendsFragment.this.mutual, false, false);
                }
                FriendsFragment.this.updateTabs(0);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                FriendsFragment.this.onError(error);
                ViewUtils.setVisibilityAnimated(FriendsFragment.this.errorView, 0);
                ViewUtils.setVisibilityAnimated(FriendsFragment.this.progress, 8);
                FriendsFragment.this.currentRequest = null;
            }
        }).exec((View) this.contentView);
    }

    public void updateData() {
        this.allFriends.clear();
        Friends.getFriends(this.allFriends);
        List<UserProfile> friends = new ArrayList<>(this.allFriends);
        if (!this.multiselect && !this.select) {
            if (!this.loadRequestsFromCache) {
                setData(friends, this.requestUsers, this.suggestUsers);
            }
            loadRequestUsers(friends, false);
            return;
        }
        setData(friends);
    }

    public void loadRequestUsers(final List<UserProfile> friends, final boolean suggests) {
        this.currentRequest = new FriendsGetRequests(0, 10, suggests, false, this.loadRequestsFromCache).setCallback(new Callback<FriendsGetRequests.Result>() { // from class: com.vkontakte.android.fragments.friends.FriendsFragment.4
            {
                FriendsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(FriendsGetRequests.Result result) {
                if (suggests) {
                    FriendsFragment.this.suggestUsers.clear();
                    FriendsFragment.this.suggestUsers.addAll(result.list);
                    FriendsFragment.this.suggestsCount = result.total;
                    if (FriendsFragment.this.suggestsCount + FriendsFragment.this.inRequestsCount == LongPollService.getNumFriendRequests() || !FriendsFragment.this.loadRequestsFromCache) {
                        if (FriendsFragment.this.currentPosition <= 2) {
                            FriendsFragment.this.setData(friends, FriendsFragment.this.requestUsers, FriendsFragment.this.suggestUsers);
                            return;
                        } else {
                            FriendsFragment.this.selectSpinnerGroup(FriendsFragment.this.currentPosition);
                            return;
                        }
                    }
                    FriendsFragment.this.loadRequestsFromCache = false;
                    FriendsFragment.this.loadRequestUsers(friends, false);
                    return;
                }
                FriendsFragment.this.requestUsers.clear();
                FriendsFragment.this.requestUsers.addAll(result.list);
                FriendsFragment.this.inRequestsCount = result.total;
                FriendsFragment.this.loadRequestUsers(friends, true);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                FriendsFragment.this.currentRequest = null;
            }
        }).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment
    public PagerAdapter createPagerAdapter() {
        return new TabAdapter();
    }

    public void updateSpinner() {
        int lastFoldersCount = this.folders.size();
        this.folders.clear();
        this.titles.clear();
        this.folders.addAll(createSystemFolders(getContext()));
        Friends.getLists(this.folders);
        for (int i = 0; i < this.folders.size(); i++) {
            this.titles.add(this.folders.get(i).name);
        }
        setSpinnerItems(this.titles);
        setSelectedNavigationItem(this.folders.size() == lastFoldersCount ? this.currentPosition : 0);
    }

    private void scrollTop(FriendsListFragment fragment) {
        if (fragment != null) {
            fragment.scrollToTop();
        }
    }

    public FriendsListFragment getCurrentFragment() {
        Fragment fragment = getTabAt(getPagerCurrentItem());
        if (fragment instanceof FriendsListFragment) {
            return (FriendsListFragment) fragment;
        }
        return null;
    }

    private void showFloatingActionButton(boolean animated) {
        CoordinatorLayout.LayoutParams params = (CoordinatorLayout.LayoutParams) this.fActionButton.getLayoutParams();
        params.setBehavior(new ScrollAwareFABBehavior());
        this.fActionButton.requestLayout();
        if (animated) {
            this.fActionButton.show();
        } else {
            this.fActionButton.setVisibility(0);
        }
    }

    private void hideFloatingActionButton(boolean animated) {
        CoordinatorLayout.LayoutParams params = (CoordinatorLayout.LayoutParams) this.fActionButton.getLayoutParams();
        params.setBehavior(null);
        this.fActionButton.requestLayout();
        if (animated) {
            this.fActionButton.hide();
        } else {
            this.fActionButton.setVisibility(8);
        }
    }

    private static List<Friends.Folder> createSystemFolders(Context context) {
        Friends.Folder all = new Friends.Folder();
        all.id = 0;
        all.name = context.getString(R.string.friends);
        Friends.Folder birthday = new Friends.Folder();
        birthday.id = 1;
        birthday.name = context.getString(R.string.birthdays_title);
        Friends.Folder requests = new Friends.Folder();
        requests.id = 2;
        requests.name = context.getString(R.string.friend_requests);
        List<Friends.Folder> result = new ArrayList<>(3);
        result.add(all);
        result.add(birthday);
        result.add(requests);
        return result;
    }

    /* loaded from: classes2.dex */
    private class TabAdapter extends FragmentStatePagerAdapter {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public TabAdapter() {
            super(r2.getInnerFragmentManager());
            FriendsFragment.this = r2;
        }

        @Override // com.vkontakte.android.ui.FragmentStatePagerAdapter
        public Fragment getItem(int i) {
            removeSavedState(i);
            return (Fragment) FriendsFragment.this.fragments.get(i);
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return FriendsFragment.this.fragments.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getItemPosition(Object object) {
            int pos = FriendsFragment.this.fragments.indexOf(object);
            if (pos == -1) {
                return -2;
            }
            return pos;
        }

        @Override // android.support.v4.view.PagerAdapter
        public CharSequence getPageTitle(int position) {
            return (CharSequence) FriendsFragment.this.titles.get(position);
        }
    }
}
