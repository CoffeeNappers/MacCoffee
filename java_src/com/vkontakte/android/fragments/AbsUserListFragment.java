package com.vkontakte.android.fragments;

import android.app.Activity;
import android.os.Bundle;
import android.view.ViewGroup;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public abstract class AbsUserListFragment extends GridFragment<UserProfile> {
    private VoidF1<UserProfile> mActionListener;
    private boolean mActionable;
    private VoidF1<UserProfile> mOnClickListener;

    public AbsUserListFragment() {
        super(50);
        this.mActionListener = AbsUserListFragment$$Lambda$1.lambdaFactory$(this);
        this.mOnClickListener = AbsUserListFragment$$Lambda$2.lambdaFactory$(this);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        Bundle arguments = getArguments();
        if (arguments != null && arguments.containsKey("title")) {
            setTitle(arguments.getString("title"));
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        Bundle arguments = getArguments();
        if (arguments == null || !arguments.getBoolean("no_autoload")) {
            if (!this.loaded) {
                loadData();
            } else {
                dataLoaded();
            }
        }
    }

    public void onActionClick(UserProfile profile) {
    }

    public void onItemClick(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<UserProfile>.GridAdapter<?> createAdapter() {
        return new UserListAdapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int listWidth;
        int columnWidth;
        if (this.list != null && (listWidth = this.list.getWidth()) > 0) {
            int listWidth2 = listWidth - (this.list.getPaddingLeft() + this.list.getPaddingRight());
            if (this.scrW >= 600) {
                columnWidth = this.isTablet ? V.dp(160.0f) : V.dp(270.0f);
            } else {
                columnWidth = listWidth2;
            }
            return listWidth2 / columnWidth;
        }
        return 1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void setActionable(boolean actionable) {
        this.mActionable = actionable;
    }

    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return this.mActionable ? UserHolder.actionable(parent) : UserHolder.simple(parent);
    }

    /* loaded from: classes2.dex */
    protected class UserListAdapter extends GridFragment<UserProfile>.GridAdapter<RecyclerHolder<UserProfile>> {
        protected UserListAdapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<UserProfile> mo1206onCreateViewHolder(ViewGroup parent, int position) {
            return AbsUserListFragment.this.getHolder(parent).onAction(AbsUserListFragment.this.mActionListener).onClick(AbsUserListFragment.this.mOnClickListener);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return ((UserProfile) AbsUserListFragment.this.data.get(position)).uid;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return ((UserProfile) AbsUserListFragment.this.data.get(item)).photo;
        }
    }
}
