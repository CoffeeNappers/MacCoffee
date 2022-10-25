package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.apps.AppsGetFriendsList;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes3.dex */
public class SendRequestToGameFragment extends FriendsFragment {

    /* loaded from: classes3.dex */
    public static class Builder extends FriendsFragment.Builder {
        public Builder(int appId) {
            super(SendRequestToGameFragment.class);
            this.args.putInt(ArgKeys.APP_ID, appId);
        }
    }

    @Override // com.vkontakte.android.fragments.friends.FriendsFragment, me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        this.currentRequest = new AppsGetFriendsList(getArguments().getInt(ArgKeys.APP_ID, 0)).setCallback(new SimpleCallback<VKList<UserProfile>>(this) { // from class: com.vkontakte.android.fragments.userlist.SendRequestToGameFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> result) {
                SendRequestToGameFragment.this.setData(result);
            }
        }).exec((Context) getActivity());
    }
}
