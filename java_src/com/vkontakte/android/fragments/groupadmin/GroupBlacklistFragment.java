package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.groups.GroupsGetBanned;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment;
import com.vkontakte.android.ui.holder.UserHolder;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class GroupBlacklistFragment extends AbsAdminUserListFragment {
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groupadmin.GroupBlacklistFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            int i = R.string.added_by_f;
            if (GroupsAdmin.ACTION_BAN_ADDED.equals(intent.getAction())) {
                int id = intent.getIntExtra("group_id", 0);
                if (id == GroupBlacklistFragment.this.getArguments().getInt("id")) {
                    UserProfile u = (UserProfile) intent.getParcelableExtra("profile");
                    UserProfile admin = (UserProfile) u.extra.getParcelable("ban_admin");
                    StringBuilder sb = new StringBuilder();
                    GroupBlacklistFragment groupBlacklistFragment = GroupBlacklistFragment.this;
                    if (!admin.f) {
                        i = R.string.added_by_m;
                    }
                    u.university = sb.append(groupBlacklistFragment.getString(i, new Object[]{admin.fullName})).append("\n").append(TimeUtils.langDate(u.extra.getInt("ban_date"))).toString();
                    GroupBlacklistFragment.this.data.add(0, u);
                    GroupBlacklistFragment.this.updateList();
                }
            } else if (GroupsAdmin.ACTION_BAN_CHANGED.equals(intent.getAction())) {
                int id2 = intent.getIntExtra("group_id", 0);
                if (id2 == GroupBlacklistFragment.this.getArguments().getInt("id")) {
                    UserProfile u2 = (UserProfile) intent.getParcelableExtra("profile");
                    UserProfile admin2 = (UserProfile) u2.extra.getParcelable("ban_admin");
                    StringBuilder sb2 = new StringBuilder();
                    GroupBlacklistFragment groupBlacklistFragment2 = GroupBlacklistFragment.this;
                    if (!admin2.f) {
                        i = R.string.added_by_m;
                    }
                    u2.university = sb2.append(groupBlacklistFragment2.getString(i, new Object[]{admin2.fullName})).append("\n").append(TimeUtils.langDate(u2.extra.getInt("ban_date"))).toString();
                    int i2 = 0;
                    while (true) {
                        if (i2 >= GroupBlacklistFragment.this.data.size()) {
                            break;
                        } else if (((UserProfile) GroupBlacklistFragment.this.data.get(i2)).uid == u2.uid) {
                            GroupBlacklistFragment.this.data.set(i2, u2);
                            break;
                        } else {
                            i2++;
                        }
                    }
                    GroupBlacklistFragment.this.updateList();
                }
            } else if (GroupsAdmin.ACTION_BAN_REMOVED.equals(intent.getAction())) {
                int id3 = intent.getIntExtra("group_id", 0);
                if (id3 == GroupBlacklistFragment.this.getArguments().getInt("id")) {
                    int uid = intent.getIntExtra("user_id", 0);
                    Iterator it = GroupBlacklistFragment.this.data.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        UserProfile p = (UserProfile) it.next();
                        if (p.uid == uid) {
                            GroupBlacklistFragment.this.data.remove(p);
                            break;
                        }
                    }
                    GroupBlacklistFragment.this.updateList();
                }
            }
        }
    };

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        IntentFilter filter = new IntentFilter();
        filter.addAction(GroupsAdmin.ACTION_BAN_ADDED);
        filter.addAction(GroupsAdmin.ACTION_BAN_CHANGED);
        filter.addAction(GroupsAdmin.ACTION_BAN_REMOVED);
        LocalBroadcastManager.getInstance(VKApplication.context).registerReceiver(this.receiver, filter);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        LocalBroadcastManager.getInstance(VKApplication.context).unregisterReceiver(this.receiver);
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setEmptyText(R.string.group_blacklist_empty);
        setTitle(R.string.group_blacklist);
    }

    @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment
    public void onItemButtonClick(View button, UserProfile user) {
        Bundle args = new Bundle();
        args.putInt("id", getArguments().getInt("id"));
        args.putParcelable("profile", user);
        BannedUserSettingsFragment.open(args, getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new GroupsGetBanned(getArguments().getInt("id"), offset, count).setCallback(new SimpleListCallback<UserProfile>(this) { // from class: com.vkontakte.android.fragments.groupadmin.GroupBlacklistFragment.2
            @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> users) {
                Iterator it = users.iterator();
                while (it.hasNext()) {
                    UserProfile u = (UserProfile) it.next();
                    UserProfile admin = (UserProfile) u.extra.getParcelable("ban_admin");
                    SpannableStringBuilder subtitle = new SpannableStringBuilder(GroupBlacklistFragment.this.getString(admin.f ? R.string.added_by_f : R.string.added_by_m, new Object[]{admin.fullName}));
                    subtitle.setSpan(new ForegroundColorSpan(-12094296), subtitle.length() - admin.fullName.length(), subtitle.length(), 0);
                    subtitle.append('\n');
                    subtitle.append((CharSequence) TimeUtils.langDate(u.extra.getInt("ban_date")));
                    u.setTag(subtitle);
                }
                super.success((VKList) users);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(this, parent);
    }

    /* loaded from: classes2.dex */
    private static class Holder extends AbsAdminUserListFragment.Holder<UserProfile> {
        protected Holder(AbsAdminUserListFragment fragment, ViewGroup parent) {
            super(fragment, parent, R.layout.groupadmin_user_item_blacklist);
        }

        @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment.Holder, com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((Holder) user);
            this.mSubtitle.setText((CharSequence) user.getTag());
        }
    }
}
