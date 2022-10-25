package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.fragments.userlist.LikesUserListFragment;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class LikesListFragment extends VKTabbedFragment {
    public static final int TAB_ALL = 0;
    public static final int TAB_FRIENDS = 1;
    public static final int TAB_SHARE = 2;

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.liked);
        String title = "";
        if (getArguments().containsKey("title")) {
            title = getArguments().getCharSequence("title").toString();
        }
        act.setTitle(title);
        Bundle likesArgs = (Bundle) getArguments().clone();
        Bundle friendsArgs = (Bundle) getArguments().clone();
        Bundle repostsArgs = (Bundle) getArguments().clone();
        friendsArgs.putBoolean("friends_only", true);
        friendsArgs.putBoolean("no_autoload", true);
        repostsArgs.putString(MoneyTransfersFragment.FILTER_ARGUMENT, "copies");
        repostsArgs.putBoolean("no_autoload", true);
        LikesUserListFragment likesView = new LikesUserListFragment();
        likesView.setArguments(likesArgs);
        LikesUserListFragment friendsView = new LikesUserListFragment();
        friendsView.setArguments(friendsArgs);
        LikesUserListFragment repostsView = new LikesUserListFragment();
        repostsView.setArguments(repostsArgs);
        ArrayList<Fragment> tabs = new ArrayList<>();
        tabs.add(likesView);
        if (VKAccountManager.getCurrent().isReal()) {
            tabs.add(friendsView);
        }
        tabs.add(repostsView);
        ArrayList<String> titles = new ArrayList<>();
        titles.add(getString(R.string.liked));
        if (VKAccountManager.getCurrent().isReal()) {
            titles.add(getString(R.string.friends));
        }
        titles.add(getString(R.string.reposters));
        setTabs(tabs, titles);
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setPagerCurrentItem(getArguments().getInt("tab"));
    }
}
