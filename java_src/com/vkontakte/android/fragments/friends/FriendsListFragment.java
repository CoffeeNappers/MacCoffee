package com.vkontakte.android.fragments.friends;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tonicartos.superslim.GridSLM;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsDelete;
import com.vkontakte.android.api.friends.FriendsGetRequests;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF1Bool;
import com.vkontakte.android.functions.VoidF2Int;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.FriendRequestHolder;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.FastScroller;
import com.vkontakte.android.ui.util.AlphabetSegmenter;
import com.vkontakte.android.ui.util.SearchSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class FriendsListFragment<T extends UserProfile> extends SegmenterFragment<UserProfile> {
    public static final String ACTION_REQUESTS_UPDATED = "com.vkontakte.android.REQUESTS_UPDATED";
    private static final int FAST_TRACK_MIN_COUNT = 20;
    private static final int MIN_INCOMING_COUNT_FOR_REQUEST = 5;
    protected static final int SORT_FIRST = 1;
    protected static final int SORT_HINTS = 0;
    protected static final int SORT_LAST = 2;
    private BottomDividerDecoration bottomDividerDecoration;
    private boolean clearOnDestroyAction;
    private FastScroller fastScroller;
    private VoidF2Int<RequestUserProfile, Boolean> mAcceptListener;
    private ActionMode mActionMode;
    private ActionMode.Callback mActionModeCallback;
    private boolean mBuildImportant;
    private boolean mBuildIndex;
    private VoidF1Bool<UserProfile> mCheckListener;
    private VoidF1<UserProfile> mClickListener;
    private boolean mFastScrollerVisibility;
    private boolean mGlobalSearchEnabled;
    private final AlphabetSegmenter mIndexer;
    private VoidF1<ArrayList<UserProfile>> mMultiselectListener;
    private VoidF1<UserProfile> mProfileListener;
    private final SearchSegmenter<UserProfile> mSearchIndexer;
    private boolean mSearchMode;
    private SearchViewWrapper mSearchView;
    private SparseArray<UserProfile> mSelectedUsers;
    private VoidF1<UserProfile> mSelectionListener;
    private MenuItem primaryMenuItem;
    private BroadcastReceiver receiver;
    private ArrayList<RequestUserProfile> requestUsers;
    private boolean searchExpanded;
    private int sortPref;
    private ArrayList<RequestUserProfile> suggestUsers;
    private int totalIn;
    private int totalRequests;
    private int totalSuggest;

    public /* synthetic */ void lambda$new$0(UserProfile profile) {
        if (this.mSelectionListener != null) {
            this.mSelectionListener.f(profile);
        } else {
            openUserDetails(profile);
        }
    }

    public /* synthetic */ void lambda$new$1(UserProfile profile, boolean checked) {
        if (this.mMultiselectListener != null) {
            if (this.mSelectedUsers == null) {
                this.mSelectedUsers = new SparseArray<>();
            }
            if (checked) {
                this.mSelectedUsers.put(profile.uid, profile);
            } else {
                this.mSelectedUsers.remove(profile.uid);
            }
            if (!this.searchExpanded) {
                updateActionMode();
            }
            updateSearchViewActionButton();
            mo1066getAdapter().notifyDataSetChanged();
        }
    }

    public FriendsListFragment() {
        super(Integer.MAX_VALUE);
        SearchSegmenter.Generator generator;
        this.mProfileListener = FriendsListFragment$$Lambda$1.lambdaFactory$(this);
        this.mAcceptListener = FriendsListFragment$$Lambda$2.lambdaFactory$(this);
        this.mIndexer = new AlphabetSegmenter();
        SearchIndexer.SimpleProvider<UserProfile> simpleProvider = new SearchIndexer.SimpleProvider<UserProfile>() { // from class: com.vkontakte.android.fragments.friends.FriendsListFragment.1
            {
                FriendsListFragment.this = this;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public char[] getIndexChar(UserProfile from) {
                char c = ' ';
                char[] cArr = new char[2];
                cArr[0] = TextUtils.isEmpty(from.firstName) ? ' ' : Character.toLowerCase(from.firstName.charAt(0));
                if (!TextUtils.isEmpty(from.lastName)) {
                    c = Character.toLowerCase(from.lastName.charAt(0));
                }
                cArr[1] = c;
                return cArr;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public boolean matches(String q, UserProfile item) {
                return item.fullName.toLowerCase().startsWith(q) || item.firstName.toLowerCase().startsWith(q) || item.lastName.toLowerCase().startsWith(q);
            }
        };
        generator = FriendsListFragment$$Lambda$3.instance;
        this.mSearchIndexer = new SearchSegmenter(simpleProvider, generator, 50).setGlobalTitle(VKApplication.context.getString(R.string.search_global));
        this.mFastScrollerVisibility = false;
        this.mGlobalSearchEnabled = true;
        this.clearOnDestroyAction = true;
        this.requestUsers = new ArrayList<>();
        this.suggestUsers = new ArrayList<>();
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.friends.FriendsListFragment.2
            {
                FriendsListFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (FriendsListFragment.this.isAdded() && TextUtils.equals(Friends.ACTION_FRIEND_REQUESTS_CHANGED, intent.getAction())) {
                    int value = intent.getIntExtra("value", 0);
                    boolean decrease = intent.getBooleanExtra("decrease", false);
                    FriendsListFragment.this.setTotalRequests(value);
                    if (!decrease) {
                        FriendsListFragment.this.loadRequestUsers(false);
                    }
                }
            }
        };
        this.mClickListener = FriendsListFragment$$Lambda$4.lambdaFactory$(this);
        this.mCheckListener = FriendsListFragment$$Lambda$5.lambdaFactory$(this);
        setListLayoutId(R.layout.friends_list);
        String pref = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("friendsOrderNew", "firstname");
        if ("hints".equals(pref)) {
            this.sortPref = 0;
        } else if ("firstname".equals(pref)) {
            this.sortPref = 1;
        } else if ("lastname".equals(pref)) {
            this.sortPref = 2;
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(true);
        int uid = getArguments().getInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        boolean updates = getArguments().getBoolean("listen_updates");
        if (updates) {
            if (uid == 0 || VKAccountManager.isCurrentUser(uid)) {
                IntentFilter filter = new IntentFilter(Friends.ACTION_FRIEND_REQUESTS_CHANGED);
                VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
            }
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    public CardItemDecoration onCreateCardDecorator() {
        int padding;
        boolean z = true;
        if (this.list == null) {
            return null;
        }
        if (canShowRequests()) {
            CardItemDecoration decorator = new CardItemDecoration(mo1066getAdapter(), !this.isTablet).setCardsSpacing(V.dp(16.0f));
            if (this.isTablet && this.scrW >= 600) {
                padding = V.dp(12.0f);
            } else {
                padding = 0;
            }
            int margin = this.scrW >= 924 ? V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2)) : 0;
            this.list.setPadding(margin + padding, V.dp(8.0f), margin + padding, padding);
            if (this.bottomDividerDecoration == null) {
                this.bottomDividerDecoration = new BottomDividerDecoration(mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 251658240, V.dp(8.0f));
                this.list.addItemDecoration(this.bottomDividerDecoration);
            }
            this.bottomDividerDecoration.setPadding(margin, margin);
            decorator.setPadding(padding, 0, padding, V.dp(8.0f));
            return decorator;
        }
        if (this.isTablet) {
            z = false;
        }
        CardItemDecoration decorator2 = new CardItemDecoration(null, z);
        int paddingTop = V.dp(8.0f);
        this.list.setPadding(this.margin + this.padding, paddingTop, this.margin + this.padding, this.padding);
        decorator2.setPadding(this.padding, paddingTop, this.padding, this.padding);
        return decorator2;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSearchMode ? this.mSearchIndexer : this.mIndexer;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fastScroller = (FastScroller) view.findViewById(R.id.fast_scroller);
        this.fastScroller.setup(this.list, (TextView) view.findViewById(R.id.section_title_popup));
        this.mSearchIndexer.attach(this.list);
        updateList();
        if (this.loaded) {
            dataLoaded();
        }
        setFastScrollerVisibility(this.mFastScrollerVisibility);
        if (!restoreSelection(savedInstanceState)) {
            restoreSelection(getArguments());
        }
        updateDecorator();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (this.mSelectedUsers != null) {
            int[] selectedUsers = new int[this.mSelectedUsers.size()];
            for (int i = 0; i < selectedUsers.length; i++) {
                selectedUsers[i] = this.mSelectedUsers.keyAt(i);
            }
            state.putIntArray(ArgKeys.SELECTED_USERS, selectedUsers);
        }
    }

    private boolean restoreSelection(@Nullable Bundle savedData) {
        int[] selectedUsers;
        if (savedData != null && (selectedUsers = savedData.getIntArray(ArgKeys.SELECTED_USERS)) != null) {
            if (this.mSelectedUsers == null) {
                this.mSelectedUsers = new SparseArray<>(selectedUsers.length);
            }
            for (int i : selectedUsers) {
                int j = 0;
                while (true) {
                    if (j < this.data.size()) {
                        UserProfile profile = (UserProfile) this.data.get(j);
                        if (profile.uid != i) {
                            j++;
                        } else {
                            profile.isSelected = true;
                            this.mSelectedUsers.put(profile.uid, profile);
                            break;
                        }
                    }
                }
            }
            if (this.mSelectedUsers.size() > 0) {
                updateList();
                this.mCheckListener.f(this.mSelectedUsers.valueAt(0), true);
                return true;
            }
        }
        return false;
    }

    public void updateActionMode() {
        if (this.mSelectedUsers.size() > 0) {
            if (this.mActionMode == null) {
                if (this.mActionModeCallback == null) {
                    this.mActionModeCallback = new ActionMode.Callback() { // from class: com.vkontakte.android.fragments.friends.FriendsListFragment.3
                        {
                            FriendsListFragment.this = this;
                        }

                        @Override // android.view.ActionMode.Callback
                        public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                            FriendsListFragment.this.mActionModeCallback = this;
                            FriendsListFragment.this.mActionMode = mode;
                            FriendsListFragment.this.mActionMode.setTitle(FriendsListFragment.this.getResources().getString(R.string.selected_n, Integer.valueOf(FriendsListFragment.this.mSelectedUsers.size())));
                            menu.add(0, R.id.search, 0, R.string.search);
                            menu.add(0, 16908300, 1, R.string.done);
                            menu.findItem(R.id.search).setIcon(R.drawable.ic_menu_search);
                            menu.findItem(16908300).setIcon(R.drawable.ic_check_24dp);
                            return true;
                        }

                        @Override // android.view.ActionMode.Callback
                        public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                            return false;
                        }

                        @Override // android.view.ActionMode.Callback
                        public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                            if (item.getItemId() == 16908300 && FriendsListFragment.this.mMultiselectListener != null) {
                                FriendsListFragment.this.mMultiselectListener.f(FriendsListFragment.this.releaseSelected());
                            } else if (item.getItemId() == R.id.search && FriendsListFragment.this.mSearchView != null) {
                                FriendsListFragment.this.clearOnDestroyAction = false;
                                FriendsListFragment.this.mSearchView.setExpanded(true);
                                FriendsListFragment.this.mActionMode.finish();
                            }
                            return true;
                        }

                        @Override // android.view.ActionMode.Callback
                        public void onDestroyActionMode(ActionMode mode) {
                            if (FriendsListFragment.this.clearOnDestroyAction) {
                                FriendsListFragment.this.releaseSelected();
                            } else {
                                FriendsListFragment.this.clearOnDestroyAction = true;
                            }
                            FriendsListFragment.this.mo1066getAdapter().notifyDataSetChanged();
                            mode.finish();
                            FriendsListFragment.this.mActionMode = null;
                        }
                    };
                }
                this.list.startActionMode(this.mActionModeCallback);
                return;
            }
            this.mActionMode.setTitle(getResources().getString(R.string.selected_n, Integer.valueOf(this.mSelectedUsers.size())));
        } else if (this.mActionMode != null) {
            this.mActionMode.finish();
            updatePrimaryMenuItem();
        }
    }

    private void setFastScrollerVisibility(boolean visible) {
        boolean z = true;
        this.mFastScrollerVisibility = visible;
        boolean enoughData = this.data != null && this.data.size() >= 20;
        if (this.fastScroller != null) {
            this.fastScroller.setVisibility((!enoughData || !visible) ? 8 : 0);
        }
        if (this.list != null) {
            UsableRecyclerView usableRecyclerView = this.list;
            if (!enoughData || visible) {
                z = false;
            }
            usableRecyclerView.setVerticalScrollBarEnabled(z);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.preloader.setMoreAvailable(false);
        Friends.reload(true);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<UserProfile>.GridAdapter<UserProfile, ?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount(int position) {
        int type = mo1066getAdapter().getItemViewType(position);
        if (!this.isTablet || !(type == 3 || type == 4)) {
            return getColumnsCount();
        }
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        return listWidth / V.dp(270.0f);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        int columnWidth;
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        if (this.scrW >= 600) {
            columnWidth = this.isTablet ? V.dp(160.0f) : V.dp(270.0f);
        } else {
            columnWidth = listWidth;
        }
        return listWidth / columnWidth;
    }

    public void setData(List<UserProfile> data, boolean buildIndex, boolean createImportantSection) {
        setData(data, Collections.emptyList(), Collections.emptyList(), buildIndex, createImportantSection);
    }

    public void setData(List<UserProfile> data, List<RequestUserProfile> requestUsers, List<RequestUserProfile> suggestUsers, boolean buildIndex, boolean createImportantSection) {
        boolean z = false;
        this.mSearchMode = false;
        this.mBuildImportant = createImportantSection;
        if (data.size() > 1 && buildIndex && this.sortPref != 0) {
            z = true;
        }
        this.mBuildIndex = z;
        Iterator<UserProfile> iterator = data.iterator();
        while (iterator.hasNext()) {
            UserProfile _profile = iterator.next();
            if (_profile == null) {
                iterator.remove();
            }
        }
        this.requestUsers.clear();
        this.suggestUsers.clear();
        this.requestUsers.addAll(requestUsers);
        this.suggestUsers.addAll(suggestUsers);
        this.data.clear();
        this.data.addAll(data);
        if (this.mSelectedUsers != null && this.mSelectedUsers.size() > 0) {
            for (UserProfile userProfile : data) {
                UserProfile selectedUser = this.mSelectedUsers.get(userProfile.uid);
                if (selectedUser != null) {
                    userProfile.isSelected = true;
                    this.mSelectedUsers.put(userProfile.uid, userProfile);
                }
            }
        }
        updateData();
    }

    public void updateData() {
        int i = 0;
        this.mIndexer.clear();
        if (!this.requestUsers.isEmpty()) {
            this.mIndexer.addSection(Collections.singletonList(this.requestUsers.get(0)), AlphabetSegmenter.IMPORTANT_SECTION_TITLE);
        } else if (!this.suggestUsers.isEmpty()) {
            this.mIndexer.addSection(Collections.singletonList(this.suggestUsers.get(0)), AlphabetSegmenter.IMPORTANT_SECTION_TITLE);
        }
        if (this.mBuildIndex || !canShowRequests()) {
            AlphabetSegmenter alphabetSegmenter = this.mIndexer;
            ArrayList arrayList = new ArrayList(this.data);
            Comparator lambdaFactory$ = FriendsListFragment$$Lambda$6.lambdaFactory$(this);
            AlphabetSegmenter.Converter lambdaFactory$2 = FriendsListFragment$$Lambda$7.lambdaFactory$(this);
            if (this.mBuildImportant) {
                i = Math.min(this.data.size(), 5);
            }
            alphabetSegmenter.bind(arrayList, lambdaFactory$, lambdaFactory$2, i, this.mBuildIndex);
        } else {
            this.mIndexer.addSection(new ArrayList(this.data), "");
        }
        this.mSearchIndexer.clear();
        this.mSearchIndexer.bind(this.data);
        setFastScrollerVisibility(this.mBuildIndex);
        this.loaded = true;
        if (this.list != null) {
            updateDecorator();
            updateList();
            dataLoaded();
            refreshDone();
        }
    }

    public /* synthetic */ int lambda$updateData$2(UserProfile lhs, UserProfile rhs) {
        return this.sortPref == 1 ? lhs.fullName.compareTo(rhs.fullName) : (lhs.lastName + ' ' + lhs.firstName).compareTo(rhs.lastName + ' ' + rhs.firstName);
    }

    public /* synthetic */ char lambda$updateData$3(UserProfile from) {
        char c = ' ';
        if (this.sortPref == 2) {
            if (!from.lastName.isEmpty()) {
                c = from.lastName.charAt(0);
            }
            return Character.toUpperCase(c);
        }
        if (!from.firstName.isEmpty()) {
            c = from.firstName.charAt(0);
        }
        return Character.toUpperCase(c);
    }

    public FriendsListFragment setSelectionListener(@Nullable VoidF1<UserProfile> l) {
        this.mSelectionListener = l;
        return this;
    }

    public void scrollToTop() {
        ViewUtils.postDelayed(FriendsListFragment$$Lambda$8.lambdaFactory$(this), 100L);
    }

    public /* synthetic */ void lambda$scrollToTop$4() {
        if (this.list != null) {
            this.list.scrollToPosition(0);
        }
    }

    public void updateFilter(String query) {
        if (!TextUtils.isEmpty(query)) {
            if (!this.mSearchMode) {
                this.mSearchMode = true;
                setRefreshEnabled(false);
                updateDecorator();
                updateList();
                updateSearchViewActionButton();
                setFastScrollerVisibility(false);
            }
            this.mSearchIndexer.search(query, this.mGlobalSearchEnabled);
        } else if (this.mSearchMode) {
            this.mSearchMode = false;
            setRefreshEnabled(true);
            updateDecorator();
            updateList();
            updateSearchViewActionButton();
            setFastScrollerVisibility(this.mBuildIndex);
        }
    }

    public void openUserDetails(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    public void setGlobalSearch(boolean enabled) {
        this.mGlobalSearchEnabled = enabled;
    }

    public void setMultiselectListener(VoidF1<ArrayList<UserProfile>> multiselectListener) {
        this.mMultiselectListener = multiselectListener;
    }

    public void setSearchView(@NonNull SearchViewWrapper searchView) {
        this.mSearchView = searchView;
        this.mSearchView.setShowVoiceOnEmpty(true);
        this.mSearchView.setOnActionVisible(true);
        this.mSearchView.setOnActionClickListener(FriendsListFragment$$Lambda$9.lambdaFactory$(this));
        this.mSearchView.setStateListener(FriendsListFragment$$Lambda$10.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$setSearchView$5(View view) {
        if (this.mMultiselectListener != null) {
            this.mMultiselectListener.f(releaseSelected());
        }
    }

    public /* synthetic */ void lambda$setSearchView$6(boolean expanded) {
        this.clearOnDestroyAction = !expanded;
        this.searchExpanded = expanded;
        updateSearchViewActionButton();
        if (this.mSelectedUsers != null) {
            updatePrimaryMenuItem();
            if (expanded) {
                mo1066getAdapter().notifyDataSetChanged();
            } else {
                this.list.postDelayed(FriendsListFragment$$Lambda$11.lambdaFactory$(this), 100L);
            }
        }
    }

    public void setPrimaryMenuItem(MenuItem primaryMenuItem) {
        this.primaryMenuItem = primaryMenuItem;
    }

    public void setTotalRequests(int count) {
        this.totalRequests = count;
        if (isAdded() && canShowRequests() && !this.mSearchMode) {
            mo1066getAdapter().notifyItemChanged(0);
        }
    }

    public ArrayList<UserProfile> releaseSelected() {
        ArrayList<UserProfile> result = new ArrayList<>(this.mSelectedUsers.size());
        for (int i = 0; i < this.mSelectedUsers.size(); i++) {
            UserProfile userProfile = this.mSelectedUsers.valueAt(i);
            userProfile.isSelected = false;
            result.add(userProfile);
        }
        this.mSelectedUsers.clear();
        return result;
    }

    private void updateSearchViewActionButton() {
        if (this.mSearchView != null) {
            this.mSearchView.setOnActionEnabled(this.mSelectedUsers != null && this.mSelectedUsers.size() > 0);
        }
    }

    private void updatePrimaryMenuItem() {
        if (this.primaryMenuItem != null) {
            boolean enabled = this.mSelectedUsers.size() > 0;
            this.primaryMenuItem.setEnabled(enabled);
            this.primaryMenuItem.getIcon().setAlpha(enabled ? 255 : 100);
        }
    }

    public boolean canShowRequests() {
        return !this.requestUsers.isEmpty() || !this.suggestUsers.isEmpty();
    }

    public void accept(final RequestUserProfile request, final boolean agree, int position) {
        final int curNumFriendRequests = LongPollService.getNumFriendRequests();
        final int curNumFriendSuggestions = LongPollService.getNumFriendSuggestions();
        (agree ? FriendsAdd.createFriendsAddAndSendAllStats(request.uid, null) : new FriendsDelete(request.uid)).wrapProgress(getContext()).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.friends.FriendsListFragment.4
            {
                FriendsListFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                if (result.intValue() != 0) {
                    request.sent = Boolean.valueOf(agree);
                }
                if (FriendsListFragment.this.canShowRequests()) {
                    if (FriendsListFragment.this.requestUsers.isEmpty()) {
                        if (!FriendsListFragment.this.suggestUsers.isEmpty()) {
                            LongPollService.updateCounters();
                            int newVal = curNumFriendSuggestions - 1;
                            Friends.notifyCounterChanged(newVal, Friends.Request.SUGGEST);
                            FriendsListFragment.this.suggestUsers.remove(0);
                            FriendsListFragment.this.setTotalRequests(FriendsListFragment.this.totalRequests - 1);
                            FriendsListFragment.this.sendBroadcastUpdated(-1, newVal);
                        }
                    } else {
                        Friends.decreaseRequests();
                        int newVal2 = (curNumFriendRequests - curNumFriendSuggestions) - 1;
                        Friends.notifyCounterChanged(newVal2, Friends.Request.IN);
                        FriendsListFragment.this.requestUsers.remove(0);
                        FriendsListFragment.this.setTotalRequests(FriendsListFragment.this.totalRequests - 1);
                        FriendsListFragment.this.sendBroadcastUpdated(newVal2, -1);
                    }
                    int reqSize = FriendsListFragment.this.requestUsers.size();
                    int sugSize = FriendsListFragment.this.suggestUsers.size();
                    if (reqSize + sugSize <= 5 && FriendsListFragment.this.totalRequests > reqSize + sugSize) {
                        FriendsListFragment.this.loadRequestUsers(false);
                    }
                }
                FriendsListFragment.this.updateData();
            }
        }).exec(getContext());
    }

    public void loadRequestUsers(final boolean suggests) {
        this.currentRequest = new FriendsGetRequests(0, 10, suggests, false).setCallback(new Callback<FriendsGetRequests.Result>() { // from class: com.vkontakte.android.fragments.friends.FriendsListFragment.5
            {
                FriendsListFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(FriendsGetRequests.Result result) {
                if (suggests) {
                    FriendsListFragment.this.suggestUsers.clear();
                    FriendsListFragment.this.suggestUsers.addAll(result.list);
                    FriendsListFragment.this.totalSuggest = result.total;
                    FriendsListFragment.this.updateData();
                    FriendsListFragment.this.sendBroadcastUpdated(FriendsListFragment.this.totalIn, FriendsListFragment.this.totalSuggest);
                    return;
                }
                FriendsListFragment.this.requestUsers.clear();
                FriendsListFragment.this.requestUsers.addAll(result.list);
                FriendsListFragment.this.totalIn = result.total;
                FriendsListFragment.this.loadRequestUsers(true);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                FriendsListFragment.this.currentRequest = null;
            }
        }).exec((Context) getActivity());
    }

    public void sendBroadcastUpdated(int newIn, int newSuggest) {
        Intent intent = new Intent(ACTION_REQUESTS_UPDATED);
        intent.putParcelableArrayListExtra("in", this.requestUsers);
        intent.putParcelableArrayListExtra("suggest", this.suggestUsers);
        intent.putExtra("count_in", newIn);
        intent.putExtra("count_suggest", newSuggest);
        getContext().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    /* loaded from: classes2.dex */
    private class Adapter extends SegmenterFragment<UserProfile>.GridAdapter<UserProfile, RecyclerHolder<UserProfile>> {
        private static final int TYPE_CUSTOM_HEADER = 4;
        private static final int TYPE_CUSTOM_ITEM = 3;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private Adapter() {
            super();
            FriendsListFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (!FriendsListFragment.this.canShowRequests() || position > 1 || FriendsListFragment.this.mSearchMode) {
                return super.getItemViewType(position);
            }
            int type = super.getItemViewType(position);
            if (type == 0 && position == 0) {
                return 4;
            }
            if (type != 1) {
                return type;
            }
            return 3;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            if (viewType == 3) {
                return new FriendRequestHolder(parent).attach(FriendsListFragment.this.mProfileListener, FriendsListFragment.this.mAcceptListener);
            }
            if (viewType == 4) {
                return new RequestHeaderHolder(parent);
            }
            return super.mo1206onCreateViewHolder(parent, viewType);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder */
        public RecyclerHolder<UserProfile> mo1074createViewHolder(ViewGroup parent) {
            return (FriendsListFragment.this.mMultiselectListener == null ? UserHolder.simple(parent) : UserHolder.checkable(parent)).onClick(FriendsListFragment.this.mClickListener).onCheck(FriendsListFragment.this.mCheckListener);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter, me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            if (getItemViewType(position) == 3) {
                UserProfile[] mutual = ((RequestUserProfile) getItem(position)).mutualFriends;
                return (mutual == null ? 0 : mutual.length) + 1;
            }
            return super.getImageCountForItem(position);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            if (getItemViewType(position) == 3) {
                RequestUserProfile profile = (RequestUserProfile) getItem(position);
                return image == 0 ? profile.photo : profile.mutualFriends[image - 1].photo;
            }
            return getItem(position).photo;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindViewHolder(RecyclerHolder<UserProfile> holder, GridSLM.LayoutParams params, int position) {
            super.bindViewHolder(holder, params, position);
            adjustMultiColumn(params);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindCustomViewHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
            int type = getItemViewType(position);
            if (type == 3) {
                if (holder instanceof FriendRequestHolder) {
                    ((FriendRequestHolder) holder).bind((RequestUserProfile) getItem(position));
                }
            } else if (type == 4) {
                if (holder instanceof RequestHeaderHolder) {
                    RequestHeaderHolder headerHolder = (RequestHeaderHolder) holder;
                    boolean suggestions = FriendsListFragment.this.requestUsers.isEmpty();
                    headerHolder.setShowSuggestions(suggestions);
                    headerHolder.bind(FriendsListFragment.this.getString(suggestions ? R.string.friend_suggestions : R.string.sett_friend_requests));
                    headerHolder.setRequestsCount(FriendsListFragment.this.totalRequests);
                }
                holder.itemView.setBackgroundColor(-1);
                params.isHeader = true;
                params.headerDisplay = 17;
                adjustCustomColumn(params);
            }
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindHeaderHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
            HeaderHolder headerHolder = (HeaderHolder) holder;
            if (!FriendsListFragment.this.mSearchMode && FriendsListFragment.this.mBuildImportant) {
                if (!FriendsListFragment.this.canShowRequests()) {
                    headerHolder.bind(position == 0 ? getFirstHeaderTitle() : getPopupText(position));
                } else {
                    int segmentIndex = this.mSegmenter.getSegmentForPosition(position);
                    headerHolder.bind(segmentIndex == 1 ? getFirstHeaderTitle() : getPopupText(position));
                }
            } else {
                headerHolder.bind(getPopupText(position));
            }
            holder.itemView.setBackgroundColor(-1);
            params.isHeader = true;
            params.headerDisplay = 17;
            adjustMultiColumn(params);
        }

        private String getFirstHeaderTitle() {
            return FriendsListFragment.this.mBuildIndex ? FriendsListFragment.this.getString(R.string.important_friends) : FriendsListFragment.this.getString(R.string.friends);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            int type = getItemViewType(position);
            if (position >= getItemCount() || position < 0) {
                return 1;
            }
            if (!FriendsListFragment.this.isTablet && position == 0) {
                return type == 4 ? 0 : 1;
            } else if (type != 3 || getItemViewType(position + 1) != 0) {
                return super.getBlockType(position);
            } else {
                return 4;
            }
        }

        protected void adjustCustomColumn(GridSLM.LayoutParams params) {
            if (FriendsListFragment.this.scrW >= 800) {
                params.setColumnWidth(V.dp(270.0f));
                params.setNumColumns(2);
                return;
            }
            params.setNumColumns(1);
        }
    }
}
