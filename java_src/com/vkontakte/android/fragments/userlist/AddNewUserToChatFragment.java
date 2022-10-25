package com.vkontakte.android.fragments.userlist;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class AddNewUserToChatFragment extends FriendsFragment {

    /* loaded from: classes3.dex */
    public static class Builder extends FriendsFragment.Builder {
        public Builder(int[] userExistIds) {
            super(AddNewUserToChatFragment.class);
            this.args.putIntArray(ArgKeys.IDS, userExistIds);
        }
    }

    @Override // com.vkontakte.android.fragments.friends.FriendsFragment, me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        int[] ids = getArguments().getIntArray(ArgKeys.IDS);
        Functions.postDelayed(AddNewUserToChatFragment$$Lambda$1.lambdaFactory$(this, ids), 0L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doLoadData$0(int[] ids) {
        ArrayList<UserProfile> userProfiles = new VKList<>();
        Friends.getFriends(userProfiles);
        Iterator<UserProfile> iterator = userProfiles.iterator();
        while (ids != null && iterator.hasNext()) {
            UserProfile userProfile = iterator.next();
            int length = ids.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    int id = ids[i];
                    if (userProfile.uid != id) {
                        i++;
                    } else {
                        iterator.remove();
                        break;
                    }
                }
            }
        }
        setData(new ArrayList(userProfiles));
    }
}
