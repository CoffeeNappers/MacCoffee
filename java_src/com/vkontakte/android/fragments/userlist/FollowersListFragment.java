package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.users.UsersGetFollowers;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes3.dex */
public class FollowersListFragment extends AbsUserListFragment {
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new UsersGetFollowers(getArguments().getInt(ArgKeys.UID, 0), offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }
}