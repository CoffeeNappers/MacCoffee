package com.vkontakte.android.fragments.fave;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.view.ViewGroup;
import android.widget.Toast;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.fave.FaveGetLinks;
import com.vkontakte.android.api.fave.FaveRemoveLink;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.ui.holder.UserHolder;
/* loaded from: classes2.dex */
public class FaveLinkListFragment extends AbsUserListFragment {
    @Override // com.vkontakte.android.fragments.AbsUserListFragment, com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new FaveGetLinks(offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onItemClick(UserProfile profile) {
        Intent intent = new Intent(getActivity(), LinkRedirActivity.class);
        intent.setData(Uri.parse(profile.lastName));
        startActivity(intent);
    }

    private void showFavoritesRemoveDialog(UserProfile user) {
        new AlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.favorite_remove_confirm).setPositiveButton(R.string.ok, FaveLinkListFragment$$Lambda$1.lambdaFactory$(this, user)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showFavoritesRemoveDialog$0(UserProfile user, DialogInterface dialog, int which) {
        deleteBookmark(user);
    }

    void deleteBookmark(final UserProfile user) {
        new FaveRemoveLink(user.extra.getString("id")).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.fave.FaveLinkListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                int idx = FaveLinkListFragment.this.data.indexOf(user);
                FaveLinkListFragment.this.data.remove(user);
                if (FaveLinkListFragment.this.getActivity() != null) {
                    FaveLinkListFragment.this.mo1066getAdapter().notifyItemRemoved(idx);
                    Toast.makeText(FaveLinkListFragment.this.getActivity(), (int) R.string.favorites_remove_success, 0).show();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(parent);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onActionClick(UserProfile profile) {
        showFavoritesRemoveDialog(profile);
    }

    /* loaded from: classes2.dex */
    private class Holder extends UserHolder<UserProfile> {
        protected Holder(ViewGroup parent) {
            super(parent, R.layout.user_item_detailed, true, false, true);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((Holder) user);
            this.mSubtitle.setText(user.firstName);
        }
    }
}
