package com.vkontakte.android.fragments.groupadmin;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.groups.GroupsGetManagers;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment;
import com.vkontakte.android.ui.holder.UserHolder;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class ManagersFragment extends AbsAdminUserListFragment {
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groupadmin.ManagersFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (ManagersFragment.this.loaded) {
                if (GroupsAdmin.ACTION_ADMIN_ADDED.equals(intent.getAction())) {
                    int id = intent.getIntExtra("group_id", 0);
                    if (id == ManagersFragment.this.getArguments().getInt("id")) {
                        UserProfile newAdmin = (UserProfile) intent.getParcelableExtra("profile");
                        ManagersFragment.this.data.add(0, newAdmin);
                        ManagersFragment.this.updateList();
                    }
                } else if (GroupsAdmin.ACTION_ADMIN_CHANGED.equals(intent.getAction())) {
                    int id2 = intent.getIntExtra("group_id", 0);
                    if (id2 == ManagersFragment.this.getArguments().getInt("id")) {
                        UserProfile user = (UserProfile) intent.getParcelableExtra("profile");
                        int i = 0;
                        Iterator it = ManagersFragment.this.data.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            } else if (((UserProfile) it.next()).uid == user.uid) {
                                ManagersFragment.this.data.set(i, user);
                                break;
                            } else {
                                i++;
                            }
                        }
                        ManagersFragment.this.updateList();
                    }
                } else if (GroupsAdmin.ACTION_ADMIN_REMOVED.equals(intent.getAction())) {
                    int id3 = intent.getIntExtra("group_id", 0);
                    if (id3 == ManagersFragment.this.getArguments().getInt("id")) {
                        int uid = intent.getIntExtra("user_id", 0);
                        Iterator it2 = ManagersFragment.this.data.iterator();
                        while (it2.hasNext()) {
                            UserProfile p = (UserProfile) it2.next();
                            if (p.uid == uid) {
                                ManagersFragment.this.data.remove(p);
                                return;
                            }
                        }
                    }
                }
            }
        }
    };

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        IntentFilter filter = new IntentFilter();
        filter.addAction(GroupsAdmin.ACTION_ADMIN_ADDED);
        filter.addAction(GroupsAdmin.ACTION_ADMIN_CHANGED);
        filter.addAction(GroupsAdmin.ACTION_ADMIN_REMOVED);
        LocalBroadcastManager.getInstance(VKApplication.context).registerReceiver(this.receiver, filter);
        setTitle(R.string.group_managers);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        LocalBroadcastManager.getInstance(VKApplication.context).unregisterReceiver(this.receiver);
    }

    @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment
    public void onItemButtonClick(View button, UserProfile user) {
        Bundle args = new Bundle();
        args.putInt("id", getArguments().getInt("id"));
        args.putParcelable("profile", user);
        ManagerEditFragment.open(args, getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new GroupsGetManagers(getArguments().getInt("id"), offset, count).setCallback(new SimpleListCallback<UserProfile>(this) { // from class: com.vkontakte.android.fragments.groupadmin.ManagersFragment.2
            @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> users) {
                Iterator it = users.iterator();
                while (it.hasNext()) {
                    UserProfile u = (UserProfile) it.next();
                    String string = u.extra.getString("role");
                    char c = 65535;
                    switch (string.hashCode()) {
                        case -2004703995:
                            if (string.equals("moderator")) {
                                c = 2;
                                break;
                            }
                            break;
                        case -1307827859:
                            if (string.equals("editor")) {
                                c = 3;
                                break;
                            }
                            break;
                        case -652229939:
                            if (string.equals("administrator")) {
                                c = 1;
                                break;
                            }
                            break;
                        case 1028554796:
                            if (string.equals("creator")) {
                                c = 0;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                            u.university = ManagersFragment.this.getString(R.string.group_level_creator);
                            break;
                        case 1:
                            u.university = ManagersFragment.this.getString(R.string.group_level_admin);
                            break;
                        case 2:
                            u.university = ManagersFragment.this.getString(R.string.group_level_moderator);
                            break;
                        case 3:
                            u.university = ManagersFragment.this.getString(R.string.group_level_editor);
                            break;
                        default:
                            u.university = u.extra.getString("role");
                            break;
                    }
                }
                super.success((VKList) users);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(this, parent);
    }

    /* loaded from: classes2.dex */
    private static class Holder extends AbsAdminUserListFragment.Holder<UserProfile> {
        protected Holder(AbsAdminUserListFragment fragment, ViewGroup parent) {
            super(fragment, parent, R.layout.groupadmin_user_item_edit);
        }
    }
}
