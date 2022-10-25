package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.fragments.userlist.GroupMembersListFragment;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.fragments.TabbedFragment;
/* loaded from: classes2.dex */
public class GroupMembersFragment extends TabbedFragment {
    private GroupMembersListFragment friendsFragment;
    private GroupMembersListFragment membersFragment;
    private SearchViewWrapper searchView;
    private boolean searching;
    private GroupMembersListFragment unsureFragment;

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        List<Fragment> fragments = new ArrayList<>();
        List<String> titles = new ArrayList<>();
        setTitle(getArguments().containsKey("title") ? getArguments().getCharSequence("title").toString() : "");
        Bundle membersArgs = (Bundle) getArguments().clone();
        Bundle friendsArgs = (Bundle) getArguments().clone();
        Bundle repostsArgs = (Bundle) getArguments().clone();
        friendsArgs.putString(MoneyTransfersFragment.FILTER_ARGUMENT, "friends");
        friendsArgs.remove("title");
        friendsArgs.putBoolean("no_autoload", true);
        friendsArgs.putString("from_list", "friends");
        repostsArgs.putString(MoneyTransfersFragment.FILTER_ARGUMENT, "unsure");
        repostsArgs.remove("title");
        repostsArgs.putBoolean("no_autoload", true);
        repostsArgs.putString("from_list", "subscriptions");
        this.membersFragment = new GroupMembersListFragment();
        this.membersFragment.setArguments(membersArgs);
        this.membersFragment.loadData();
        fragments.add(this.membersFragment);
        titles.add(getString(getArguments().getInt(ServerKeys.TYPE) == 2 ? R.string.followers : R.string.members));
        this.friendsFragment = new GroupMembersListFragment();
        this.friendsFragment.setArguments(friendsArgs);
        fragments.add(this.friendsFragment);
        titles.add(getString(R.string.friends));
        if (getArguments().getInt(ServerKeys.TYPE) == 1) {
            this.unsureFragment = new GroupMembersListFragment();
            this.unsureFragment.setArguments(repostsArgs);
            fragments.add(this.unsureFragment);
            titles.add(getString(R.string.unsure_members));
        }
        setTabs(fragments, titles);
        this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.GroupMembersFragment.1
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
                if (ns != GroupMembersFragment.this.searching) {
                    GroupMembersFragment.this.searching = ns;
                    GroupMembersFragment.this.setSwipeEnabled(!GroupMembersFragment.this.searching);
                    GroupMembersFragment groupMembersFragment = GroupMembersFragment.this;
                    if (GroupMembersFragment.this.searching) {
                        z = false;
                    }
                    groupMembersFragment.setTabsVisible(z);
                }
                GroupMembersListFragment fragment = GroupMembersFragment.this.getCurrentFragment();
                if (fragment != null) {
                    fragment.updateFilter(query);
                }
            }
        });
    }

    @Override // me.grishka.appkit.fragments.TabbedFragment, android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        GroupMembersListFragment fragment = getCurrentFragment();
        if (menu != null && this.searchView != null && fragment != null) {
            this.searchView.onCreateOptionsMenu(menu);
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        if (getFragmentManager().getBackStackEntryCount() > 0) {
            getFragmentManager().popBackStack();
        } else if (getActivity() != null) {
            getActivity().onBackPressed();
        }
    }

    @Override // me.grishka.appkit.fragments.TabbedFragment
    public void onPageSelected(int pos) {
        KeyboardUtils.hideKeyboard(getContext());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public GroupMembersListFragment getCurrentFragment() {
        Fragment fragment = getTabAt(getPagerCurrentItem());
        if (fragment instanceof GroupMembersListFragment) {
            return (GroupMembersListFragment) fragment;
        }
        return null;
    }
}
