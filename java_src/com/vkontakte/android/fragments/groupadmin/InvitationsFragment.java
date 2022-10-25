package com.vkontakte.android.fragments.groupadmin;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.groups.GroupsGetInvitedUsers;
import com.vkontakte.android.api.groups.GroupsRemoveUser;
import com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment;
import com.vkontakte.android.ui.holder.UserHolder;
/* loaded from: classes2.dex */
public class InvitationsFragment extends AbsAdminUserListFragment {
    @Override // android.app.DialogFragment, android.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        setTitle(R.string.groups_invitations);
    }

    @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment
    public void onItemButtonClick(View button, final UserProfile user) {
        new GroupsRemoveUser(getArguments().getInt("id"), user.uid).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.InvitationsFragment.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                InvitationsFragment.this.data.remove(user);
                InvitationsFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new GroupsGetInvitedUsers(getArguments().getInt("id"), offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(this, parent);
    }

    /* loaded from: classes2.dex */
    private static class Holder extends AbsAdminUserListFragment.Holder<UserProfile> {
        protected Holder(AbsAdminUserListFragment fragment, ViewGroup parent) {
            super(fragment, parent, R.layout.groupadmin_user_item_delete);
        }
    }
}
