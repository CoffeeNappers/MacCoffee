package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.wall.LikesGetList;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
/* loaded from: classes3.dex */
public class LikesUserListFragment extends AbsUserListFragment {
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new LikesGetList(getArguments().getInt("ltype", 0), getArguments().getInt("lptype", 0), getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0), getArguments().getInt(FirebaseAnalytics.Param.ITEM_ID, 0), offset, count, getArguments().getBoolean("friends_only"), getArguments().getString(MoneyTransfersFragment.FILTER_ARGUMENT)).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }
}
