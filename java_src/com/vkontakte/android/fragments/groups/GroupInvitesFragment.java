package com.vkontakte.android.fragments.groups;

import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.ViewGroup;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.GroupInvitation;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.groups.GroupsGetInvites;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF2Int;
import com.vkontakte.android.ui.holder.GroupInvitationHolder;
/* loaded from: classes2.dex */
public class GroupInvitesFragment extends GridFragment<GroupInvitation> {
    private VoidF2Int<GroupInvitation, Boolean> mAcceptListener;
    private VoidF1<Group> mGroupListener;
    private BroadcastReceiver mReceiver;

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(GroupInvitation invite, Boolean result, int position) {
        Group group = invite.group;
        if (group.type == 1) {
            if (result.booleanValue()) {
                new AlertDialog.Builder(getActivity()).setItems(new CharSequence[]{getString(R.string.group_inv_event_accept), getString(R.string.group_inv_event_unsure), getString(R.string.group_inv_decline)}, GroupInvitesFragment$$Lambda$3.lambdaFactory$(this, invite, position)).show();
                return;
            } else {
                accept(invite, Groups.JoinType.DECLINE, position);
                return;
            }
        }
        accept(invite, result.booleanValue() ? Groups.JoinType.ACCEPT : Groups.JoinType.DECLINE, position);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(GroupInvitation invite, int position, DialogInterface dialogInterface, int selectedPosition) {
        accept(invite, selectedPosition == 0 ? Groups.JoinType.ACCEPT : selectedPosition == 1 ? Groups.JoinType.UNSURE : Groups.JoinType.DECLINE, position);
    }

    public GroupInvitesFragment() {
        super(20);
        this.mGroupListener = GroupInvitesFragment$$Lambda$1.lambdaFactory$(this);
        this.mAcceptListener = GroupInvitesFragment$$Lambda$2.lambdaFactory$(this);
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groups.GroupInvitesFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                boolean z = false;
                if (Groups.ACTION_GROUP_STATUS_CHANGED.equals(intent.getAction())) {
                    int id = -intent.getIntExtra("id", 0);
                    int status = intent.getIntExtra("status", 0);
                    if (GroupInvitesFragment.this.data != null) {
                        for (int i = 0; i < GroupInvitesFragment.this.data.size(); i++) {
                            GroupInvitation invitation = (GroupInvitation) GroupInvitesFragment.this.data.get(i);
                            if (invitation.group.id == id) {
                                if (status != 0) {
                                    z = true;
                                }
                                invitation.sent = Boolean.valueOf(z);
                                GridFragment<GroupInvitation>.GridAdapter<?> adapter = GroupInvitesFragment.this.mo1066getAdapter();
                                if (adapter != null) {
                                    adapter.notifyDataSetChanged();
                                    return;
                                }
                                return;
                            }
                        }
                    }
                }
            }
        };
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getActivity().registerReceiver(this.mReceiver, new IntentFilter(Groups.ACTION_GROUP_STATUS_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new GroupsGetInvites(offset, count).setCallback(new SimpleListCallback<GroupInvitation>(this) { // from class: com.vkontakte.android.fragments.groups.GroupInvitesFragment.2
            @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
            public void success(VKList<GroupInvitation> list) {
                super.success((VKList) list);
                LongPollService.setNumGroupInvitations(list.total());
                VKApplication.context.sendBroadcast(new Intent(Groups.ACTION_GROUP_INVITES_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<GroupInvitation>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    void accept(final GroupInvitation invite, final Groups.JoinType type, final int position) {
        Groups.joinGroup(invite.group, type).wrapProgress(getActivity()).setCallback(new SimpleCallback<Boolean>(this) { // from class: com.vkontakte.android.fragments.groups.GroupInvitesFragment.3
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                Groups.decreaseInvites();
                if (result.booleanValue()) {
                    invite.sent = Boolean.valueOf(type != Groups.JoinType.DECLINE);
                }
                GroupInvitesFragment.this.mo1066getAdapter().notifyItemChanged(position);
            }
        }).exec((Context) getActivity());
    }

    public void openGroupDetails(Group group) {
        new ProfileFragment.Builder(-group.id).go(getActivity());
    }

    /* loaded from: classes2.dex */
    private class Adapter extends GridFragment<GroupInvitation>.GridAdapter<GroupInvitationHolder> {
        private Adapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public GroupInvitationHolder mo1206onCreateViewHolder(ViewGroup parent, int type) {
            return new GroupInvitationHolder(parent).attach(GroupInvitesFragment.this.mGroupListener, GroupInvitesFragment.this.mAcceptListener);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((GroupInvitation) GroupInvitesFragment.this.data.get(position)).group.photo;
        }
    }
}
