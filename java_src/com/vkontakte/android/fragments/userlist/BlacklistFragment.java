package com.vkontakte.android.fragments.userlist;

import android.app.Activity;
import android.content.Context;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.account.AccountBanUser;
import com.vkontakte.android.api.account.AccountGetBanned;
import com.vkontakte.android.fragments.AbsUserListFragment;
/* loaded from: classes3.dex */
public class BlacklistFragment extends AbsUserListFragment {
    public BlacklistFragment() {
        setActionable(true);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.blacklist);
        setEmptyText(R.string.blacklist_empty);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new AccountGetBanned(offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onActionClick(final UserProfile profile) {
        new AccountBanUser(profile.uid, false).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.userlist.BlacklistFragment.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                int pos = BlacklistFragment.this.data.indexOf(profile);
                BlacklistFragment.this.data.remove(profile);
                BlacklistFragment.this.mo1066getAdapter().notifyItemRemoved(pos);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }
}
