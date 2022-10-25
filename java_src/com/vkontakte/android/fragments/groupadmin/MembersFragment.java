package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import me.grishka.appkit.fragments.TabbedFragment;
/* loaded from: classes2.dex */
public class MembersFragment extends TabbedFragment {
    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        Bundle args = new Bundle();
        args.putInt("id", getArguments().getInt("id"));
        Bundle argsNoLoad = new Bundle(args);
        argsNoLoad.putBoolean("no_autoload", true);
        AllMembersFragment allMembers = new AllMembersFragment();
        allMembers.setArguments(args);
        ArrayList<Fragment> fragments = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();
        fragments.add(allMembers);
        titles.add(getString(R.string.group_all_members));
        if (getArguments().getInt(ServerKeys.TYPE) != 2) {
            InvitationsFragment invites = new InvitationsFragment();
            invites.setArguments(argsNoLoad);
            fragments.add(invites);
            titles.add(getString(R.string.groups_invitations));
        }
        if (getArguments().getInt("access") == 1) {
            RequestsFragment reqs = new RequestsFragment();
            reqs.setArguments(argsNoLoad);
            fragments.add(reqs);
            titles.add(getString(R.string.friend_requests));
        }
        ManagersFragment managers = new ManagersFragment();
        managers.setArguments(argsNoLoad);
        fragments.add(managers);
        titles.add(getString(R.string.group_managers));
        setTabs(fragments, titles);
        if (!getArguments().getBoolean("_split")) {
            setTitle(R.string.group_members);
        }
    }
}
