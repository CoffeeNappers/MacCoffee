package com.vkontakte.android.fragments.userlist;

import android.os.Bundle;
import android.os.Parcelable;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.navigation.Navigator;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class GamesFriendFragment extends AbsUserListFragment {
    private ArrayList<UserProfile> userProfiles;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder(ArrayList<UserProfile> userProfiles) {
            super(GamesFriendFragment.class);
            this.args.putParcelableArrayList("users", userProfiles);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.userProfiles = convert(getArguments().getParcelableArrayList("users"));
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setTitle(getActivity().getResources().getQuantityString(R.plurals.games_friends_played, this.userProfiles.size(), Integer.valueOf(this.userProfiles.size())));
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (this.userProfiles == null) {
            this.userProfiles = convert(getArguments().getParcelableArrayList("users"));
        }
        this.preloader.setMoreAvailable(false);
        onDataLoaded(this.userProfiles);
    }

    protected static ArrayList<UserProfile> convert(ArrayList<? extends Parcelable> parcelables) {
        if (parcelables == null) {
            return null;
        }
        ArrayList<UserProfile> userProfiles = new ArrayList<>(parcelables.size());
        Iterator<? extends Parcelable> it = parcelables.iterator();
        while (it.hasNext()) {
            Parcelable parcelable = it.next();
            userProfiles.add((UserProfile) parcelable);
        }
        return userProfiles;
    }
}
