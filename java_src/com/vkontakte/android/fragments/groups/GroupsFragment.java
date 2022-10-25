package com.vkontakte.android.fragments.groups;

import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.CreateGroupDialog;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsGet;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.VkTabbedLoaderFragment;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class GroupsFragment extends VkTabbedLoaderFragment {
    private MenuItem addItem;
    private VKAPIRequest currentReq;
    private EventsFragment eventsView;
    private boolean global_search;
    private AllGroupsFragment groupsView;
    private boolean mTabsCreated;
    private GroupInvitesFragment requestsView;
    private SearchViewWrapper searchView;
    private boolean select;
    private boolean showAdmined;
    private int uid = VKAccountManager.getCurrent().getUid();
    private ArrayList<Group> allGroups = new ArrayList<>();
    private ArrayList<Group> groups = new ArrayList<>();
    private ArrayList<Group> events = new ArrayList<>();
    private ArrayList<CharSequence> titles = new ArrayList<>();
    private ArrayList<Fragment> fragments = new ArrayList<>();
    private int mInvitesCount = LongPollService.getNumGroupInvitations();
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groups.GroupsFragment.1
        {
            GroupsFragment.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (GroupsFragment.this.isAdded()) {
                String action = intent.getAction();
                char c = 65535;
                switch (action.hashCode()) {
                    case -1861053632:
                        if (action.equals(Groups.ACTION_GROUP_INVITES_CHANGED)) {
                            c = 1;
                            break;
                        }
                        break;
                    case 816139794:
                        if (action.equals(Groups.ACTION_GROUP_LIST_CHANGED)) {
                            c = 0;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        GroupsFragment.this.doLoadData();
                        return;
                    case 1:
                        if (GroupsFragment.this.mInvitesCount != LongPollService.getNumGroupInvitations()) {
                            GroupsFragment.this.mInvitesCount = LongPollService.getNumGroupInvitations();
                            if (GroupsFragment.this.getPagerCurrentItem() == 2 && GroupsFragment.this.mInvitesCount == 0) {
                                GroupsFragment.this.setPagerCurrentItem(0, true);
                            }
                            GroupsFragment.this.updateTabs();
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    };
    private boolean searching = false;
    private boolean mHasInvitesTab = false;

    public GroupsFragment() {
        setTabsAutoLoad(false);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.select = getArguments().getBoolean(ArgKeys.SELECT);
        this.uid = getArguments().getInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        this.showAdmined = getArguments().getBoolean("admin_only");
        this.global_search = getArguments().getBoolean(ArgKeys.GLOBAL_SEARCH, true);
        ActivityUtils.setBeamLink(getActivity(), "groups?id=" + this.uid);
        if ((this.uid != 0 && !VKAccountManager.isCurrentUser(this.uid)) || getArguments().getBoolean("admin_only")) {
            if (getArguments().containsKey("title")) {
                setTitle(getArguments().getCharSequence("title"));
            } else {
                setTitle(R.string.groups);
            }
        }
        if (this.uid == 0 || VKAccountManager.isCurrentUser(this.uid)) {
            IntentFilter filter = new IntentFilter();
            filter.addAction(Groups.ACTION_GROUP_LIST_CHANGED);
            filter.addAction(Groups.ACTION_GROUP_INVITES_CHANGED);
            VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        }
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.groupsView = AllGroupsFragment.newInstance(this.uid);
        this.eventsView = EventsFragment.newInstance(this.uid);
        this.groupsView.setGlobalSearch(this.global_search);
        if (VKAccountManager.isCurrentUser(this.uid)) {
            this.requestsView = new GroupInvitesFragment();
        }
        if ((this.uid == 0 || VKAccountManager.isCurrentUser(this.uid)) && !getArguments().getBoolean("admin_only")) {
            List<String> titles = new ArrayList<>();
            titles.add(getString(R.string.groups));
            titles.add(getString(R.string.groups_mgmt));
            setSpinnerItems(titles);
        } else {
            onSpinnerItemSelected(0);
        }
        updateTabs();
        if (getArguments().containsKey("tab")) {
            setPagerCurrentItem(getArguments().getInt("tab"));
        }
        this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.groups.GroupsFragment.2
            {
                GroupsFragment.this = this;
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
                if (ns != GroupsFragment.this.searching) {
                    GroupsFragment.this.searching = ns;
                    if (GroupsFragment.this.searching) {
                        GroupsFragment.this.setPagerCurrentItem(0, false);
                    }
                    GroupsFragment.this.setTabsVisible(!GroupsFragment.this.searching);
                    GroupsFragment groupsFragment = GroupsFragment.this;
                    if (GroupsFragment.this.searching) {
                        z = false;
                    }
                    groupsFragment.setSwipeEnabled(z);
                }
                GroupsFragment.this.groupsView.updateFilter(query);
            }
        });
        setHasOptionsMenu(true);
        if (this.select) {
            VoidF1<Group> listener = GroupsFragment$$Lambda$1.lambdaFactory$(this);
            this.groupsView.setSelectionListener(listener);
            this.eventsView.setSelectionListener(listener);
        }
    }

    public /* synthetic */ void lambda$onViewCreated$0(Group group) {
        Intent result = new Intent();
        result.putExtra("gid", group.id);
        result.putExtra("name", group.name);
        result.putExtra("photo", group.photo);
        getActivity().setResult(-1, result);
        getActivity().finish();
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean onSpinnerItemSelected(int position) {
        this.showAdmined = position == 1;
        doLoadData();
        return true;
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (menu != null) {
            if (this.searchView != null && this.loaded) {
                this.searchView.onCreateOptionsMenu(menu);
            }
            if (!this.select && VKAccountManager.isCurrentUser(this.uid)) {
                MenuItem add = menu.add(0, R.id.add, 0, R.string.action_create_group);
                add.setShowAsAction(2);
                this.addItem = add;
                add.setIcon(R.drawable.ic_add_24dp);
            }
            super.onCreateOptionsMenu(menu, inflater);
        }
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.add) {
            showCreateGroupDialog();
        }
        return super.onOptionsItemSelected(item);
    }

    private void showCreateGroupDialog() {
        CreateGroupDialog dialog = new CreateGroupDialog();
        dialog.show(getFragmentManager(), (String) null);
    }

    public void updateTabs() {
        if (getActivity() != null) {
            if (!this.mTabsCreated) {
                this.mTabsCreated = true;
                this.titles.clear();
                this.fragments.clear();
                this.titles.add(getResources().getQuantityString(R.plurals.groups, this.groups.size(), Integer.valueOf(this.groups.size())));
                this.fragments.add(this.groupsView);
                this.titles.add(getResources().getQuantityString(R.plurals.events, this.events.size(), Integer.valueOf(this.events.size())));
                this.fragments.add(this.eventsView);
                if (this.mInvitesCount > 0 && VKAccountManager.isCurrentUser(this.uid) && this.requestsView != null) {
                    this.titles.add(getResources().getQuantityString(R.plurals.group_invites, this.mInvitesCount, Integer.valueOf(this.mInvitesCount)));
                    this.fragments.add(this.requestsView);
                    this.mHasInvitesTab = true;
                }
                setTabs(this.fragments, this.titles);
                return;
            }
            setTabTitle(0, getResources().getQuantityString(R.plurals.groups, this.groups.size(), Integer.valueOf(this.groups.size())));
            setTabTitle(1, getResources().getQuantityString(R.plurals.events, this.events.size(), Integer.valueOf(this.events.size())));
            if (this.mInvitesCount >= 0 && VKAccountManager.isCurrentUser(this.uid) && this.requestsView != null && this.mHasInvitesTab) {
                setTabTitle(2, getResources().getQuantityString(R.plurals.group_invites, this.mInvitesCount, Integer.valueOf(this.mInvitesCount)));
            }
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        if (VKAccountManager.isCurrentUser(this.uid)) {
            long when = (!getArguments().getBoolean("_from_menu") || this.allGroups.size() != 0) ? 0L : 180L;
            new AnonymousClass3(when).start();
            return;
        }
        this.contentView.setVisibility(4);
        this.progress.setVisibility(0);
        this.currentReq = new GroupsGet(this.uid).setCallback(new Callback<ArrayList<Group>>() { // from class: com.vkontakte.android.fragments.groups.GroupsFragment.4
            {
                GroupsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<Group> list) {
                GroupsFragment.this.allGroups.clear();
                GroupsFragment.this.allGroups.addAll(list);
                GroupsFragment.this.groups.clear();
                GroupsFragment.this.events.clear();
                Iterator<Group> it = list.iterator();
                while (it.hasNext()) {
                    Group g = it.next();
                    if (g.type == 1) {
                        GroupsFragment.this.events.add(g);
                    } else {
                        GroupsFragment.this.groups.add(g);
                    }
                }
                GroupsFragment.this.groupsView.setData(GroupsFragment.this.groups);
                GroupsFragment.this.eventsView.setData(GroupsFragment.this.events, GroupsFragment.this.isTablet);
                GroupsFragment.this.updateTabs();
                ViewUtils.setVisibilityAnimated(GroupsFragment.this.contentView, 0);
                ViewUtils.setVisibilityAnimated(GroupsFragment.this.progress, 8);
                GroupsFragment.this.currentReq = null;
                GroupsFragment.this.dataLoaded();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                GroupsFragment.this.onError(error);
                ViewUtils.setVisibilityAnimated(GroupsFragment.this.errorView, 0);
                ViewUtils.setVisibilityAnimated(GroupsFragment.this.progress, 8);
                GroupsFragment.this.currentReq = null;
            }
        }).exec((View) this.contentView);
    }

    /* renamed from: com.vkontakte.android.fragments.groups.GroupsFragment$3 */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 extends Thread {
        final /* synthetic */ long val$when;

        AnonymousClass3(long j) {
            GroupsFragment.this = this$0;
            this.val$when = j;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            Comparator comparator;
            GroupsFragment.this.allGroups.clear();
            if (GroupsFragment.this.showAdmined) {
                Groups.getAdminedGroups(GroupsFragment.this.allGroups);
            } else {
                Groups.getGroups(GroupsFragment.this.allGroups);
            }
            GroupsFragment.this.groups.clear();
            GroupsFragment.this.events.clear();
            for (int i = 0; i < GroupsFragment.this.allGroups.size(); i++) {
                Group g = (Group) GroupsFragment.this.allGroups.get(i);
                if (g.type == 1) {
                    GroupsFragment.this.events.add(g);
                } else {
                    GroupsFragment.this.groups.add(g);
                }
            }
            ArrayList arrayList = GroupsFragment.this.events;
            comparator = GroupsFragment$3$$Lambda$1.instance;
            Collections.sort(arrayList, comparator);
            Functions.postDelayed(GroupsFragment$3$$Lambda$2.lambdaFactory$(this), this.val$when);
        }

        public static /* synthetic */ int lambda$run$0(Group lhs, Group rhs) {
            if (lhs.startTime < rhs.startTime) {
                return -1;
            }
            return lhs.startTime == rhs.startTime ? 0 : 1;
        }

        public static /* synthetic */ int lambda$null$1(Group lhs, Group rhs) {
            if (lhs.startTime < rhs.startTime) {
                return -1;
            }
            return lhs.startTime == rhs.startTime ? 0 : 1;
        }

        public /* synthetic */ void lambda$run$2() {
            Comparator comparator;
            ArrayList arrayList = GroupsFragment.this.events;
            comparator = GroupsFragment$3$$Lambda$3.instance;
            Collections.sort(arrayList, comparator);
            GroupsFragment.this.eventsView.setData(GroupsFragment.this.events, GroupsFragment.this.isTablet);
            GroupsFragment.this.groupsView.setData(GroupsFragment.this.groups);
            GroupsFragment.this.updateTabs();
            GroupsFragment.this.dataLoaded();
            GroupsFragment.this.invalidateOptionsMenu();
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        if (this.currentReq != null) {
            this.currentReq.cancel();
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }
}
