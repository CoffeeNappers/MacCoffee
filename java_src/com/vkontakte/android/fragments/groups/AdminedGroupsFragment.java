package com.vkontakte.android.fragments.groups;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.holder.GroupHolder;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AdminedGroupsFragment extends GridFragment<Group> {
    int mRequiredLevel;
    boolean mSelectMode;
    private BroadcastReceiver receiver;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int requiredLevel) {
            super(AdminedGroupsFragment.class);
            this.args.putInt("required_level", requiredLevel);
        }

        public Builder() {
            this(1);
        }

        public Builder select(boolean value) {
            this.args.putBoolean(ArgKeys.SELECT, value);
            return this;
        }
    }

    public AdminedGroupsFragment() {
        super(Integer.MAX_VALUE);
        this.mRequiredLevel = 1;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groups.AdminedGroupsFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (AdminedGroupsFragment.this.isAdded() && intent.getAction().equals(Groups.ACTION_GROUP_LIST_CHANGED)) {
                    AdminedGroupsFragment.this.doLoadData();
                }
            }
        };
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
        this.mSelectMode = getArguments().getBoolean(ArgKeys.SELECT);
        this.mRequiredLevel = getArguments().getInt("required_level", this.mRequiredLevel);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Groups.ACTION_GROUP_LIST_CHANGED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.groups);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        ArrayList<Group> data = new ArrayList<>();
        Groups.getAdminedGroups(data, this.mRequiredLevel);
        onDataLoaded(data, false);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        Groups.reload(true);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<Group>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Adapter extends GridFragment<Group>.GridAdapter<GroupHolder> {
        private VoidF1<Group> mClickListener;

        private Adapter() {
            super();
            this.mClickListener = AdminedGroupsFragment$Adapter$$Lambda$1.lambdaFactory$(this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$0(Group group) {
            if (AdminedGroupsFragment.this.mSelectMode) {
                Intent result = new Intent();
                result.putExtra("gid", -group.id);
                result.putExtra("name", group.name);
                result.putExtra("photo", group.photo);
                result.putExtra(ServerKeys.TYPE, group.type);
                AdminedGroupsFragment.this.getActivity().setResult(-1, result);
                AdminedGroupsFragment.this.getActivity().finish();
                return;
            }
            AdminedGroupsFragment.this.openGroupDetails(group);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((Group) AdminedGroupsFragment.this.data.get(position)).photo;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public GroupHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new GroupHolder(parent).onClick(this.mClickListener);
        }
    }

    void openGroupDetails(Group group) {
        new ProfileFragment.Builder(-group.id).go(getActivity());
    }
}
