package com.vkontakte.android.fragments;

import android.content.Context;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.common.GetUsersGroupRequest;
import com.vkontakte.android.api.newsfeed.NewsfeedDeleteBan;
/* loaded from: classes2.dex */
public class NewsfeedFilterListFragment extends FilterListFragment {
    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected GetUsersGroupRequest getUsersGroupRequest() {
        return GetUsersGroupRequest.getNewsfeedBanned();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.FilterListFragment
    public void onActionClick(final UserProfile userProfile) {
        new NewsfeedDeleteBan(userProfile.uid).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.NewsfeedFilterListFragment.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                NewsfeedFilterListFragment.this.onActionSuccess(userProfile);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected int getUserActionSuccessText() {
        return R.string.news_unbanned_user;
    }

    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected int getGroupActionSuccessText() {
        return R.string.news_unbanned_group;
    }
}
