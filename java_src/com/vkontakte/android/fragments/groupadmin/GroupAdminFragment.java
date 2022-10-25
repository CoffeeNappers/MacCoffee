package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GroupAdminFragment extends VKRecyclerFragment<Item> {
    private int access;
    private GroupAdminAdapter adapter;
    private int id;
    private BroadcastReceiver receiver;
    private int type;

    public GroupAdminFragment() {
        super(1);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.groupadmin.GroupAdminFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (GroupsAdmin.ACTION_TITLE_CHANGED.equals(intent.getAction())) {
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.edit_group);
        this.id = getArguments().getInt("id");
        this.type = getArguments().getInt(ServerKeys.TYPE);
        this.access = getArguments().getInt("access");
        setRefreshEnabled(false);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        ArrayList<Item> items = new ArrayList<>();
        int adminLevel = getArguments().getInt("level");
        if (adminLevel >= 3) {
            items.add(new Item(R.drawable.ic_manage_info, getString(R.string.group_info), UserNotification.LAYOUT_NEWSFEED_INFO));
            items.add(new Item(R.drawable.ic_manage_services, getString(R.string.group_services), "services"));
            items.add(new Item(R.drawable.ic_manage_admins, getString(R.string.group_managers), "admins"));
        }
        if (adminLevel >= 1) {
            items.add(new Item(R.drawable.ic_manage_blacklist, getString(R.string.group_blacklist), "blacklist"));
            if (this.type != 2) {
                items.add(new Item(R.drawable.ic_manage_invites, getString(R.string.groups_invitations), "invites"));
            }
            if (this.type == 0) {
                items.add(new Item(R.drawable.ic_manage_invites, getString(R.string.friend_requests), "requests"));
            }
            items.add(new Item(R.drawable.ic_manage_members, getString(R.string.group_users), "users"));
        }
        if (adminLevel >= 3) {
            items.add(new Item(R.drawable.ic_manage_links, getString(R.string.group_links), "links"));
        }
        onDataLoaded(items);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new GroupAdminAdapter();
        }
        return this.adapter;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LocalBroadcastManager.getInstance(VKApplication.context).registerReceiver(this.receiver, new IntentFilter(GroupsAdmin.ACTION_TITLE_CHANGED));
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        LocalBroadcastManager.getInstance(VKApplication.context).unregisterReceiver(this.receiver);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openSubFragment(Class<? extends Fragment> f) {
        Bundle args = new Bundle();
        args.putInt("id", this.id);
        args.putInt(ServerKeys.TYPE, this.type);
        args.putInt("access", this.access);
        if (this.isTablet) {
            args.putBoolean("_split", true);
            try {
                Fragment fragment = f.newInstance();
                fragment.setArguments(args);
                getInnerFragmentManager().beginTransaction().replace(R.id.inner_fragment_wrapper, fragment, "admin_inner").commit();
                return;
            } catch (Exception e) {
                Toast.makeText(getActivity(), "error creating instance for " + f, 0).show();
                return;
            }
        }
        Navigate.to(f, args, getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle state) {
        View view = super.onCreateView(inflater, parent, state);
        if (!this.isTablet) {
            CardItemDecorator decorator = new CardItemDecorator(this.list, true);
            decorator.setPadding(V.dp(2.0f), V.dp(3.0f), V.dp(-2.0f), 0);
            decorator.setFirstCardOffset(V.dp(-10.0f));
            this.list.addItemDecoration(decorator);
            this.list.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.groupadmin.GroupAdminFragment.2
                @Override // android.support.v7.widget.RecyclerView.ItemDecoration
                public void getItemOffsets(Rect outRect, View view2, RecyclerView parent2, RecyclerView.State state2) {
                    int index = parent2.getChildLayoutPosition(view2);
                    if (index == 0) {
                        outRect.top = V.dp(1.0f);
                    }
                    if (index == GroupAdminFragment.this.data.size() - 1) {
                        outRect.bottom = V.dp(8.0f);
                    }
                }
            });
            return view;
        }
        LinearLayout wrap = new LinearLayout(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.GroupAdminFragment.3
            @Override // android.view.ViewGroup
            protected int getChildDrawingOrder(int childCount, int i) {
                return childCount - (i + 1);
            }

            @Override // android.view.ViewGroup
            protected boolean isChildrenDrawingOrderEnabled() {
                return true;
            }
        };
        wrap.setOrientation(0);
        wrap.addView(view, new LinearLayout.LayoutParams(-1, -1, 5.0f));
        View divider = new View(getActivity());
        divider.setBackgroundColor(637534208);
        LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(V.dp(0.5f), -1);
        dlp.rightMargin = -dlp.width;
        wrap.addView(divider, dlp);
        FrameLayout fragmentWrap = new FrameLayout(getActivity());
        fragmentWrap.setId(R.id.inner_fragment_wrapper);
        wrap.addView(fragmentWrap, new LinearLayout.LayoutParams(-1, -1, 3.0f));
        return wrap;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.isTablet) {
            this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.groupadmin.GroupAdminFragment.4
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ((UsableRecyclerView.Clickable) GroupAdminFragment.this.list.mo1203findViewHolderForAdapterPosition(0)).onClick();
                    GroupAdminFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                    return true;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public class Item {
        String action;
        int icon;
        String title;

        public Item() {
        }

        public Item(int _icon, String _title, String _action) {
            this.icon = _icon;
            this.title = _title;
            this.action = _action;
        }
    }

    /* loaded from: classes2.dex */
    private class GroupAdminAdapter extends UsableRecyclerView.Adapter<GroupAdminViewHolder> implements CardItemDecorator.Provider {
        private GroupAdminAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public GroupAdminViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new GroupAdminViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(GroupAdminViewHolder holder, int position) {
            holder.bind(GroupAdminFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return GroupAdminFragment.this.data.size();
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            if (GroupAdminFragment.this.data.size() == 1) {
                return 6;
            }
            if (position == 0) {
                return 2;
            }
            return position == GroupAdminFragment.this.data.size() + (-1) ? 4 : 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class GroupAdminViewHolder extends RecyclerHolder<Item> implements UsableRecyclerView.Clickable {
        public GroupAdminViewHolder() {
            super((int) R.layout.group_admin_item, GroupAdminFragment.this.getActivity());
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Item item) {
            TextView v = (TextView) this.itemView;
            v.setText(item.title);
            v.setCompoundDrawablesWithIntrinsicBounds(item.icon, 0, 0, 0);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            String action = ((Item) this.item).action;
            if (UserNotification.LAYOUT_NEWSFEED_INFO.equals(action)) {
                GroupAdminFragment.this.openSubFragment(InfoFragment.class);
            } else if ("services".equals(action)) {
                GroupAdminFragment.this.openSubFragment(GroupAdminFragment.this.type == 2 ? PublicServicesFragment.class : ServicesFragment.class);
            } else if ("users".equals(action)) {
                GroupAdminFragment.this.openSubFragment(AllMembersFragment.class);
            } else if ("admins".equals(action)) {
                GroupAdminFragment.this.openSubFragment(ManagersFragment.class);
            } else if ("invites".equals(action)) {
                GroupAdminFragment.this.openSubFragment(InvitationsFragment.class);
            } else if ("requests".equals(action)) {
                GroupAdminFragment.this.openSubFragment(RequestsFragment.class);
            } else if ("blacklist".equals(action)) {
                GroupAdminFragment.this.openSubFragment(GroupBlacklistFragment.class);
            } else if ("links".equals(action)) {
                GroupAdminFragment.this.openSubFragment(LinksFragment.class);
            }
        }
    }
}
