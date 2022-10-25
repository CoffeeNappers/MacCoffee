package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import android.widget.Toast;
import com.tonicartos.superslim.GridSLM;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.common.GetUsersGroupRequest;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.util.SectionSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public abstract class FilterListFragment extends SegmenterFragment<UserProfile> {
    private ArrayList<UserProfile> groups;
    private VoidF1<UserProfile> mActionListener;
    private VoidF1<UserProfile> mOnClickListener;
    final SectionSegmenter mSegmenter;
    private WeakReference<Toast> toast;
    private ArrayList<UserProfile> users;

    @StringRes
    protected abstract int getGroupActionSuccessText();

    @StringRes
    protected abstract int getUserActionSuccessText();

    protected abstract GetUsersGroupRequest getUsersGroupRequest();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void onActionClick(UserProfile userProfile);

    public FilterListFragment() {
        super(1);
        this.mActionListener = FilterListFragment$$Lambda$1.lambdaFactory$(this);
        this.mOnClickListener = FilterListFragment$$Lambda$2.lambdaFactory$(this);
        this.users = new ArrayList<>();
        this.groups = new ArrayList<>();
        this.mSegmenter = new SectionSegmenter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSegmenter;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<UserProfile>.GridAdapter<UserProfile, ?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        int columnWidth = this.scrW >= 600 ? V.dp(160.0f) : listWidth;
        return listWidth / columnWidth;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.sett_news_banned);
        doLoadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        getUsersGroupRequest().setCallback(new SimpleCallback<GetUsersGroupRequest.Result>(this) { // from class: com.vkontakte.android.fragments.FilterListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(GetUsersGroupRequest.Result r) {
                FilterListFragment.this.users = r.users;
                FilterListFragment.this.groups = r.groups;
                FilterListFragment.this.rebuildSegmenter();
                FilterListFragment.this.updateList();
                FilterListFragment.this.dataLoaded();
                FilterListFragment.this.refreshDone();
            }
        }).exec((Context) getActivity());
    }

    void rebuildSegmenter() {
        this.mSegmenter.clear();
        if (this.users != null && this.users.size() > 0) {
            this.mSegmenter.addSection(this.users, getString(R.string.people));
        }
        if (this.groups != null && this.groups.size() > 0) {
            this.mSegmenter.addSection(this.groups, getString(R.string.groups));
        }
    }

    public void onItemClick(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onActionSuccess(UserProfile profile) {
        if (profile.uid > 0) {
            Iterator<UserProfile> it = this.users.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                UserProfile p = it.next();
                if (p.uid == profile.uid) {
                    this.users.remove(p);
                    break;
                }
            }
            showToast(getUserActionSuccessText());
        } else {
            Iterator<UserProfile> it2 = this.groups.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                UserProfile p2 = it2.next();
                if (p2.uid == profile.uid) {
                    this.groups.remove(p2);
                    break;
                }
            }
            showToast(getGroupActionSuccessText());
        }
        rebuildSegmenter();
        updateList();
    }

    private void showToast(int textRes) {
        if (textRes != 0) {
            Toast toast = this.toast == null ? null : this.toast.get();
            Activity activity = getActivity();
            if (toast == null && activity != null) {
                toast = Toast.makeText(activity, textRes, 1);
            } else if (toast != null) {
                toast.setText(textRes);
            }
            if (toast != null) {
                this.toast = new WeakReference<>(toast);
                toast.show();
            }
        }
    }

    /* loaded from: classes2.dex */
    class Adapter extends SegmenterFragment<UserProfile>.GridAdapter<UserProfile, UserHolder<UserProfile>> {
        Adapter() {
            super();
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder  reason: avoid collision after fix types in other method */
        public UserHolder<UserProfile> mo1074createViewHolder(ViewGroup parent) {
            return UserHolder.actionable(parent, R.layout.user_item_removable).onAction(FilterListFragment.this.mActionListener).onClick(FilterListFragment.this.mOnClickListener);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindViewHolder(UserHolder<UserProfile> holder, GridSLM.LayoutParams params, int position) {
            super.bindViewHolder((Adapter) holder, params, position);
            adjustMultiColumn(params);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindHeaderHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
            super.bindHeaderHolder(holder, params, position);
            adjustMultiColumn(params);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            return null;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public int getImagesCountForItem(int position) {
            return 0;
        }
    }
}
