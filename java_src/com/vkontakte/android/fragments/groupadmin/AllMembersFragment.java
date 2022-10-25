package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.Html;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupMenu;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.groups.GroupsEditManager;
import com.vkontakte.android.api.groups.GroupsGetAdminMembers;
import com.vkontakte.android.api.groups.GroupsRemoveUser;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.UserHolder;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class AllMembersFragment extends AbsAdminUserListFragment {
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (GroupsAdmin.ACTION_ADMIN_ADDED.equals(intent.getAction())) {
                int id = intent.getIntExtra("group_id", 0);
                if (id == AllMembersFragment.this.getArguments().getInt("id")) {
                    UserProfile newAdmin = (UserProfile) intent.getParcelableExtra("profile");
                    int uid = newAdmin.uid;
                    Iterator it = AllMembersFragment.this.data.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        UserProfile p = (UserProfile) it.next();
                        if (p.uid == uid) {
                            p.extra.putString("role", newAdmin.extra.getString("role"));
                            AllMembersFragment.this.updateList();
                            break;
                        }
                    }
                    Iterator it2 = AllMembersFragment.this.preloadedData.iterator();
                    while (it2.hasNext()) {
                        UserProfile p2 = (UserProfile) it2.next();
                        if (p2.uid == uid) {
                            p2.extra.putString("role", newAdmin.extra.getString("role"));
                            AllMembersFragment.this.updateList();
                            return;
                        }
                    }
                }
            } else if (GroupsAdmin.ACTION_ADMIN_REMOVED.equals(intent.getAction())) {
                int id2 = intent.getIntExtra("group_id", 0);
                if (id2 == AllMembersFragment.this.getArguments().getInt("id")) {
                    int uid2 = intent.getIntExtra("user_id", 0);
                    Iterator it3 = AllMembersFragment.this.data.iterator();
                    while (true) {
                        if (!it3.hasNext()) {
                            break;
                        }
                        UserProfile p3 = (UserProfile) it3.next();
                        if (p3.uid == uid2) {
                            p3.extra.remove("role");
                            break;
                        }
                    }
                    Iterator it4 = AllMembersFragment.this.preloadedData.iterator();
                    while (true) {
                        if (!it4.hasNext()) {
                            break;
                        }
                        UserProfile p4 = (UserProfile) it4.next();
                        if (p4.uid == uid2) {
                            p4.extra.remove("role");
                            break;
                        }
                    }
                    AllMembersFragment.this.updateList();
                }
            }
        }
    };
    private String searchQuery;
    private SearchViewWrapper searchView;

    @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment
    public void onItemButtonClick(View button, final UserProfile user) {
        PopupMenu menu = new PopupMenu(getActivity(), button);
        if (!user.extra.containsKey("role")) {
            menu.getMenu().add(0, 0, 0, getString(R.string.group_make_manager));
            menu.getMenu().add(0, 1, 0, getString(R.string.group_remove_user));
            menu.getMenu().add(0, 3, 0, getString(R.string.block_user));
        } else {
            menu.getMenu().add(0, 0, 0, getString(R.string.edit));
            menu.getMenu().add(0, 2, 0, getString(R.string.group_remove_manager));
        }
        menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.2
            @Override // android.widget.PopupMenu.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case 0:
                        AllMembersFragment.this.openMakeManager(user);
                        return true;
                    case 1:
                        AllMembersFragment.this.removeFromGroup(user);
                        return true;
                    case 2:
                        AllMembersFragment.this.removeManager(user);
                        return true;
                    case 3:
                        AllMembersFragment.this.banUser(user);
                        return true;
                    default:
                        return true;
                }
            }
        });
        menu.show();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        IntentFilter filter = new IntentFilter();
        filter.addAction(GroupsAdmin.ACTION_ADMIN_ADDED);
        filter.addAction(GroupsAdmin.ACTION_ADMIN_REMOVED);
        LocalBroadcastManager.getInstance(VKApplication.context).registerReceiver(this.receiver, filter);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        LocalBroadcastManager.getInstance(VKApplication.context).unregisterReceiver(this.receiver);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.group_users);
        setHasOptionsMenu(true);
        this.searchView = new SearchViewWrapper(act, new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.3
            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                AllMembersFragment.this.performSearch(query);
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
                AllMembersFragment.this.performSearch(query);
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
            }
        });
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.searchView != null) {
            this.searchView.onCreateOptionsMenu(menu);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void performSearch(String q) {
        String prevQuery = this.searchQuery;
        if (q != null && q.length() > 0) {
            this.searchQuery = q;
        } else {
            this.searchQuery = null;
        }
        if ((prevQuery == null && this.searchQuery != null) || ((prevQuery != null && this.searchQuery == null) || (prevQuery != null && !prevQuery.equals(this.searchQuery)))) {
            reload();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new GroupsGetAdminMembers(getArguments().getInt("id", 0), offset, count, null, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,education,city", this.searchQuery == null ? "time_desc" : null, this.searchQuery).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openMakeManager(UserProfile user) {
        Bundle args = new Bundle();
        args.putInt("id", getArguments().getInt("id"));
        args.putParcelable("profile", user);
        ManagerEditFragment.open(args, getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeManager(final UserProfile user) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(Html.fromHtml(getString(R.string.group_remove_manager_confirm, new Object[]{"<b>" + user.getNameInCase(3) + "</b>"}))).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                new GroupsEditManager(AllMembersFragment.this.getArguments().getInt("id"), user.uid, null, false, null).setCallback(new ResultlessCallback(AllMembersFragment.this.getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.4.1
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        user.extra.remove("role");
                        user.extra.remove("contact_title");
                        AllMembersFragment.this.updateList();
                    }
                }).wrapProgress(AllMembersFragment.this.getActivity()).exec((Context) AllMembersFragment.this.getActivity());
            }
        }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeFromGroup(final UserProfile user) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(Html.fromHtml(getString(R.string.group_remove_user_confirmation, new Object[]{"<b>" + user.getNameInCase(3) + "</b>"}))).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                new GroupsRemoveUser(AllMembersFragment.this.getArguments().getInt("id"), user.uid).setCallback(new ResultlessCallback(AllMembersFragment.this.getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.AllMembersFragment.5.1
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        AllMembersFragment.this.data.remove(user);
                        AllMembersFragment.this.updateList();
                    }
                }).wrapProgress(AllMembersFragment.this.getActivity()).exec((Context) AllMembersFragment.this.getActivity());
            }
        }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void banUser(UserProfile user) {
        Bundle args = new Bundle();
        args.putInt("id", getArguments().getInt("id"));
        args.putParcelable("profile", user);
        args.putBoolean("is_group_member", true);
        BannedUserSettingsFragment.open(args, getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(this, parent);
    }

    /* loaded from: classes2.dex */
    private static class Holder extends AbsAdminUserListFragment.Holder<UserProfile> {
        protected Holder(AbsAdminUserListFragment fragment, ViewGroup parent) {
            super(fragment, parent, R.layout.groupadmin_user_item_actions);
        }

        @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment.Holder, com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((Holder) user);
            this.mActionButton.setVisibility("creator".equals(user.extra.getString("role")) ? 8 : 0);
        }
    }
}
