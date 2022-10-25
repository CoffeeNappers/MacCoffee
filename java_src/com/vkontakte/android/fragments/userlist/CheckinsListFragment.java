package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.places.PlacesGetCheckinProfiles;
import com.vkontakte.android.fragments.AbsUserListFragment;
import me.grishka.appkit.api.PaginatedList;
/* loaded from: classes3.dex */
public class CheckinsListFragment extends AbsUserListFragment {
    private int offset;

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int _offset, int count) {
        this.currentRequest = new PlacesGetCheckinProfiles(getArguments().getInt("place_id"), _offset == 0 ? 0 : this.offset, count).setCallback(new SimpleCallback<PlacesGetCheckinProfiles.Result>(this) { // from class: com.vkontakte.android.fragments.userlist.CheckinsListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(PlacesGetCheckinProfiles.Result r) {
                CheckinsListFragment.this.offset = r.newOffset;
                CheckinsListFragment.this.onDataLoaded((PaginatedList) r.users);
            }
        }).exec((Context) getActivity());
    }
}
