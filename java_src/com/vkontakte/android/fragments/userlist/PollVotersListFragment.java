package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.polls.PollsGetVoters;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.fragments.AbsUserListFragment;
/* loaded from: classes3.dex */
public class PollVotersListFragment extends AbsUserListFragment {
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new PollsGetVoters(getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0), getArguments().getInt("poll_id", 0), getArguments().getInt("answer_id", 0), offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }
}
