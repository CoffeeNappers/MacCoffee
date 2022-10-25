package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.money.GetMoneyTransferList;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.ui.holder.MoneyTransferHolder;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MoneyTransfersFragment extends VKRecyclerFragment<MoneyTransfer> implements SupportExternalToolbarContainer {
    public static final String ALLOW_REFRESH_ARGUMENT = "allow_refresh";
    public static final int FILTER_ALL = 0;
    public static final String FILTER_ARGUMENT = "filter";
    public static final int FILTER_INCOMING = 2;
    public static final int FILTER_OUTGOING = 1;
    public static final String PEER_ARGUMENT = "peer_id";
    public static final int PICK_USER_RESULT = 1;
    public static final String SHOW_HEADER_ARGUMENT = "show_header";
    private Adapter mAdapter;
    private boolean mAllowRefresh;
    private int mFilter;
    private LinearLayout mHeader;
    private int mPeerId;
    BroadcastReceiver mReceiver;
    private boolean mShowHeader;

    public MoneyTransfersFragment() {
        super(20);
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.money.MoneyTransfersFragment.1
            {
                MoneyTransfersFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context arg, Intent intent) {
                if (MoneyTransfersFragment.this.data != null) {
                    String action = intent.getAction();
                    char c = 65535;
                    switch (action.hashCode()) {
                        case -1502815662:
                            if (action.equals(MoneyTransferActions.ACTION_MONEY_TRANSFER_ACCEPTED)) {
                                c = 1;
                                break;
                            }
                            break;
                        case -1335025725:
                            if (action.equals(MoneyTransferActions.ACTION_MONEY_TRANSFER_SENT)) {
                                c = 0;
                                break;
                            }
                            break;
                        case -1043250202:
                            if (action.equals(MoneyTransferActions.ACTION_MONEY_TRANSFER_CANCELLED)) {
                                c = 2;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                            MoneyTransfersFragment.this.refresh();
                            return;
                        case 1:
                            MoneyTransfersFragment.this.setItemStatus(intent.getIntExtra(MoneyTransferActions.RESULT_EXTRA_TRANSFER_ID_ARG, 0), 1);
                            return;
                        case 2:
                            MoneyTransfersFragment.this.setItemStatus(intent.getIntExtra(MoneyTransferActions.RESULT_EXTRA_TRANSFER_ID_ARG, 0), 2);
                            return;
                        default:
                            return;
                    }
                }
            }
        };
    }

    public void setItemStatus(int transferId, int status) {
        Adapter adapter = (Adapter) mo1066getAdapter();
        MoneyTransfer item = null;
        Iterator it = this.data.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            MoneyTransfer mt = (MoneyTransfer) it.next();
            if (mt.id == transferId) {
                item = mt;
                break;
            }
        }
        if (item != null) {
            item.status = status;
            adapter.notifyItemChanged(adapter.getPositionByMoneyTransferId(item.id));
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        boolean z = false;
        super.onAttach(activity);
        setTitle(getResources().getString(R.string.money_transfer_money));
        this.mPeerId = getArguments().getInt("peer_id", 0);
        this.mFilter = getArguments().getInt(FILTER_ARGUMENT, 0);
        if (getArguments().getBoolean(SHOW_HEADER_ARGUMENT, true) && VKAccountManager.getCurrent().moneyTransfersCanSend) {
            z = true;
        }
        this.mShowHeader = z;
        this.mAllowRefresh = getArguments().getBoolean(ALLOW_REFRESH_ARGUMENT, true);
        loadData();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        IntentFilter filter = new IntentFilter();
        filter.addAction(MoneyTransferActions.ACTION_MONEY_TRANSFER_ACCEPTED);
        filter.addAction(MoneyTransferActions.ACTION_MONEY_TRANSFER_SENT);
        filter.addAction(MoneyTransferActions.ACTION_MONEY_TRANSFER_CANCELLED);
        getActivity().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        view.setBackgroundColor(-1);
        setRefreshEnabled(this.mAllowRefresh);
        return view;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Toolbar toolbar = getToolbar();
        if (toolbar != null) {
            getToolbar().setVisibility(8);
        }
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View.OnClickListener onClickListener;
        this.mHeader = (LinearLayout) inflater.inflate(R.layout.money_transfer_header, (ViewGroup) null);
        View newPaymentButton = this.mHeader.findViewById(R.id.fl_send_money);
        newPaymentButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.money.MoneyTransfersFragment.2
            {
                MoneyTransfersFragment.this = this;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (MoneyTransfersFragment.this.mPeerId != 0) {
                    CreateTransferFragment.start(MoneyTransfersFragment.this.getActivity(), MoneyTransfersFragment.this.mPeerId, null, "", "");
                } else {
                    MoneyTransfersFragment.this.startUserPicker();
                }
            }
        });
        View readMoreView = this.mHeader.findViewById(R.id.tv_read_more);
        onClickListener = MoneyTransfersFragment$$Lambda$1.instance;
        readMoreView.setOnClickListener(onClickListener);
        View contentView = super.onCreateContentView(inflater, container, savedInstanceState);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        this.list.addItemDecoration(dividers);
        dividers.setProvider(new DividerItemDecoration.Provider() { // from class: com.vkontakte.android.fragments.money.MoneyTransfersFragment.3
            {
                MoneyTransfersFragment.this = this;
            }

            @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
            public boolean needDrawDividerAfter(int position) {
                return position != 0 || !MoneyTransfersFragment.this.mShowHeader;
            }
        });
        return contentView;
    }

    void startUserPicker() {
        new FriendsFragment.Builder().setSelect().forResult(this, 1);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1 && requestCode == 1) {
            UserProfile user = (UserProfile) data.getParcelableExtra(ProfileGiftsFragment.Extra.User);
            sendToPeer(user.uid);
        }
    }

    private void sendToPeer(int idTo) {
        CreateTransferFragment.start(getActivity(), idTo, null, "", "");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        return false;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return false;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new GetMoneyTransferList(this.mFilter, this.mPeerId, offset, count).setCallback(new SimpleListCallback<MoneyTransfer>(this) { // from class: com.vkontakte.android.fragments.money.MoneyTransfersFragment.4
            {
                MoneyTransfersFragment.this = this;
            }

            @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
            public void success(VKList<MoneyTransfer> result) {
                super.success((VKList) result);
            }
        }).exec(getContext());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new Adapter(this.mShowHeader);
        }
        return this.mAdapter;
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    /* loaded from: classes3.dex */
    public class Adapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private final int TYPE_HEADER = 0;
        private final int TYPE_MONEY_TRANSFER = 1;
        private boolean mShowHeader;

        private MoneyTransfer getByPos(int position) {
            ArrayList arrayList = MoneyTransfersFragment.this.data;
            if (this.mShowHeader) {
                position--;
            }
            return (MoneyTransfer) arrayList.get(position);
        }

        public int getPositionByMoneyTransferId(int id) {
            int ind = -1;
            int i = 0;
            while (true) {
                if (i >= MoneyTransfersFragment.this.data.size()) {
                    break;
                } else if (((MoneyTransfer) MoneyTransfersFragment.this.data.get(i)).id != id) {
                    i++;
                } else {
                    ind = i;
                    break;
                }
            }
            return (ind != -1 && this.mShowHeader) ? ind + 1 : ind;
        }

        public Adapter(boolean showHeader) {
            MoneyTransfersFragment.this = this$0;
            this.mShowHeader = showHeader;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new HeaderHolder();
                case 1:
                    return new MoneyTransferHolder(parent);
                default:
                    return null;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            Log.v("MoneyTransfersAdapter", "onBindViewHolder + position = " + position);
            if (holder instanceof MoneyTransferHolder) {
                ((MoneyTransferHolder) holder).bind(getByPos(position));
            } else if (holder instanceof HeaderHolder) {
                ((HeaderHolder) holder).setEmpty(MoneyTransfersFragment.this.data.isEmpty());
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (!this.mShowHeader || position != 0) ? 1 : 0;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (this.mShowHeader ? 1 : 0) + MoneyTransfersFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return (!this.mShowHeader || position != 0) ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return getByPos(position).getPeerUser().photo;
        }
    }

    /* loaded from: classes3.dex */
    public class HeaderHolder extends UsableRecyclerView.ViewHolder {
        private TextView mTextViewEmpty;
        private TextView mTextViewReadMore;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public HeaderHolder() {
            super(r3.mHeader);
            MoneyTransfersFragment.this = r3;
            this.mTextViewEmpty = (TextView) this.itemView.findViewById(R.id.tv_empty);
            this.mTextViewReadMore = (TextView) this.itemView.findViewById(R.id.tv_read_more);
        }

        public void setEmpty(boolean isEmpty) {
            int i = 0;
            this.mTextViewEmpty.setVisibility(isEmpty ? 0 : 8);
            TextView textView = this.mTextViewReadMore;
            if (!isEmpty) {
                i = 8;
            }
            textView.setVisibility(i);
        }
    }
}
