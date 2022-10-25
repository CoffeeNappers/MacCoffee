package com.vkontakte.android.sdk;

import android.os.Bundle;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class SDKFriendPickerActivity extends VKActivity {
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        if (getFragmentManager().findFragmentById(16908290) == null) {
            getFragmentManager().beginTransaction().add(16908290, PickerFragment.newInstance(getIntent().getBundleExtra("args"))).commit();
        }
    }

    /* loaded from: classes3.dex */
    public static class PickerFragment extends FriendsFragment {
        static PickerFragment newInstance(Bundle args) {
            PickerFragment result = new PickerFragment();
            result.setArguments(args);
            return result;
        }

        @Override // com.vkontakte.android.fragments.friends.FriendsFragment, me.grishka.appkit.fragments.LoaderFragment
        protected void doLoadData() {
            Friends.getUsers(getArguments().getIntegerArrayList("com.vkontakte.android.sdk.extra_ids"), new Friends.GetUsersCallback() { // from class: com.vkontakte.android.sdk.SDKFriendPickerActivity.PickerFragment.1
                @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                public void onUsersLoaded(final ArrayList<UserProfile> users) {
                    PickerFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.sdk.SDKFriendPickerActivity.PickerFragment.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            PickerFragment.this.setData(users);
                        }
                    });
                }
            });
        }
    }
}
