package com.vkontakte.android.fragments.userlist;

import android.app.Activity;
import android.content.Context;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.wall.WallGetSubscriptions;
import com.vkontakte.android.api.wall.WallSubscribe;
import com.vkontakte.android.fragments.AbsUserListFragment;
/* loaded from: classes3.dex */
public class PostSubscriptionsUserListFragment extends AbsUserListFragment {
    public PostSubscriptionsUserListFragment() {
        setActionable(true);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.sett_post_source_list);
        setEmptyText(R.string.sett_post_source_list_explain);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new WallGetSubscriptions(offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onActionClick(final UserProfile profile) {
        new WallSubscribe(profile.uid, false).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.userlist.PostSubscriptionsUserListFragment.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PostSubscriptionsUserListFragment.this.data.remove(profile);
                PostSubscriptionsUserListFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }
}
