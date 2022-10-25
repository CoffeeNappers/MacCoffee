package com.vkontakte.android.fragments.fave;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.fave.FaveGetUsers;
import com.vkontakte.android.api.fave.FaveRemoveUser;
import com.vkontakte.android.fragments.AbsUserListFragment;
/* loaded from: classes2.dex */
public class FaveUserListFragment extends AbsUserListFragment {
    public FaveUserListFragment() {
        setActionable(true);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onActionClick(UserProfile profile) {
        new AlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.favorite_remove_confirm).setPositiveButton(R.string.ok, FaveUserListFragment$$Lambda$1.lambdaFactory$(this, profile)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onActionClick$0(UserProfile profile, DialogInterface dialog, int which) {
        deleteBookmark(profile);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new FaveGetUsers(offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    private void deleteBookmark(final UserProfile user) {
        new FaveRemoveUser(user.uid).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.fave.FaveUserListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                int idx = FaveUserListFragment.this.data.indexOf(user);
                FaveUserListFragment.this.data.remove(user);
                if (FaveUserListFragment.this.getActivity() != null) {
                    FaveUserListFragment.this.mo1066getAdapter().notifyItemRemoved(idx);
                    Toast.makeText(FaveUserListFragment.this.getActivity(), (int) R.string.favorites_remove_success, 0).show();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }
}
