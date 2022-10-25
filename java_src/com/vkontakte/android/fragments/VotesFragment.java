package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.GetGiftsStockBalance;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.ui.ActivityResulter;
import java.util.Iterator;
@Deprecated
/* loaded from: classes.dex */
public class VotesFragment extends BaseListFragment<GetGiftsStockBalance.VotesProduct> implements ActivityResulter {
    public static final String ACTION_BALANCE_CHANGED = "com.vkontakte.android.actions.BALANCE_CHANGED";
    private boolean mActive;
    private VotesAdapter mAdapter;
    private int mBalance;
    private PurchasesManager<GetGiftsStockBalance.VotesProduct> mManager;
    private String mPackage;
    private BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.VotesFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            VotesFragment.this.mBalance = intent.getIntExtra("balance", VotesFragment.this.mBalance);
            if (VotesFragment.this.mActive && VotesFragment.this.mAdapter != null) {
                VotesFragment.this.mAdapter.notifyDataSetChanged();
            }
            if (intent.getBooleanExtra("payment_required", false)) {
                VotesFragment.this.getActivity().setResult(-1);
                VotesFragment.this.getActivity().finish();
            }
        }
    };
    private int mRequiredBalance;

    /* loaded from: classes2.dex */
    public static final class Extra {
        public static final String RequiredBalance = "requiredBalance";
    }

    @Override // com.vkontakte.android.fragments.BaseListFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        this.mManager = new PurchasesManager<>(this);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mRequiredBalance = getArguments().getInt(Extra.RequiredBalance, -1);
        setRefreshEnabled(false);
        this.mPackage = getActivity().getPackageName();
        getActivity().registerReceiver(this.mReceiver, new IntentFilter(ACTION_BALANCE_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA", null);
        ((FragmentWrapperActivity) getActivity()).registerActivityResult(this);
    }

    @Override // com.vkontakte.android.fragments.VKFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.votes);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        this.mActive = true;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStop() {
        super.onStop();
        this.mActive = false;
    }

    @Override // com.vkontakte.android.fragments.BaseListFragment
    public void setListViewAppearance(ListView l) {
        super.setListViewAppearance(l);
        this.contentView.setBackgroundColor(getResources().getColor(R.color.cards_bg));
        l.setDivider(null);
        l.setDividerHeight(0);
        l.setHeaderDividersEnabled(false);
        l.setSelector(17170445);
        l.setDrawSelectorOnTop(false);
        l.setPadding(Global.scale(3.0f), l.getPaddingTop(), Global.scale(3.0f), l.getPaddingBottom());
    }

    @Override // com.vkontakte.android.fragments.BaseListFragment
    protected ListAdapter getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new VotesAdapter();
        }
        return this.mAdapter;
    }

    @Override // com.vkontakte.android.fragments.VKFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mReceiver);
        ((FragmentWrapperActivity) getActivity()).unregisterActivityResult(this);
    }

    @Override // com.vkontakte.android.fragments.LoaderFragment
    public void doLoadData() {
        this.currentRequest = new GetGiftsStockBalance().setCallback(new SimpleCallback<GetGiftsStockBalance.Result>(this) { // from class: com.vkontakte.android.fragments.VotesFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(GetGiftsStockBalance.Result result) {
                VotesFragment.this.mBalance = result.balance;
                VotesFragment.this.onDataLoaded(result.products);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (error.getCodeValue() == -2) {
                    VotesFragment.this.onGPSError();
                } else {
                    super.fail(error);
                }
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (this.data == null || this.data.isEmpty()) {
            loadData();
        }
    }

    @Override // android.app.Fragment, com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.mManager != null) {
            this.mManager.onActivityResult(requestCode, resultCode, data);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyBalanceHasChanged(int newBalance) {
        Intent intent = new Intent(ACTION_BALANCE_CHANGED);
        intent.putExtra("balance", newBalance);
        if (this.mRequiredBalance > 0 && newBalance >= this.mRequiredBalance) {
            intent.putExtra("payment_required", true);
        }
        getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onGPSError() {
        onError(new VKAPIRequest.VKErrorResponse(-2, ""));
        new AlertDialog.Builder(getActivity()).setTitle(R.string.error).setMessage(R.string.error_no_google_play).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.VotesFragment.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                VotesFragment.this.getActivity().finish();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.fragments.VotesFragment.3
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                VotesFragment.this.getActivity().finish();
            }
        }).show();
    }

    /* loaded from: classes2.dex */
    private class VotesAdapter extends BaseAdapter {
        private static final int TYPE_HEADER = 1;
        private static final int TYPE_ITEM = 0;
        private String mMaxPrice;

        private VotesAdapter() {
        }

        @Override // android.widget.BaseAdapter
        public void notifyDataSetChanged() {
            super.notifyDataSetChanged();
            this.mMaxPrice = "";
            Iterator it = VotesFragment.this.data.iterator();
            while (it.hasNext()) {
                GetGiftsStockBalance.VotesProduct product = (GetGiftsStockBalance.VotesProduct) it.next();
                if (!TextUtils.isEmpty(product.description) && product.description.length() > this.mMaxPrice.length()) {
                    this.mMaxPrice = product.description;
                }
            }
        }

        @Override // android.widget.Adapter
        public int getCount() {
            if (isEmpty()) {
                return 0;
            }
            return VotesFragment.this.data.size() + 1;
        }

        @Override // android.widget.Adapter
        @Nullable
        /* renamed from: getItem */
        public GetGiftsStockBalance.VotesProduct mo1028getItem(int position) {
            if (getItemViewType(position) == 0) {
                return (GetGiftsStockBalance.VotesProduct) VotesFragment.this.data.get(position - 1);
            }
            return null;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            GetGiftsStockBalance.VotesProduct product = mo1028getItem(position);
            if (product != null) {
                return product.id;
            }
            return 0L;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public boolean isEmpty() {
            return VotesFragment.this.data == null || VotesFragment.this.data.isEmpty();
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean areAllItemsEnabled() {
            return false;
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean isEnabled(int position) {
            return getItemViewType(position) != 1;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getItemViewType(int position) {
            return position > 0 ? 0 : 1;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getViewTypeCount() {
            return 2;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            int i;
            switch (getItemViewType(position)) {
                case 0:
                    View convertView2 = (convertView == null ? new ItemHolder().inflate(parent) : (ItemHolder) convertView.getTag()).setData(mo1028getItem(position), this.mMaxPrice);
                    if (VotesFragment.this.data.size() == 1) {
                        i = R.drawable.bg_post;
                    } else {
                        i = position == 1 ? R.drawable.bg_post_comments_top : position == getCount() + (-1) ? R.drawable.bg_post_comments_btm : R.drawable.bg_post_comments_mid;
                    }
                    convertView2.setBackgroundResource(i);
                    return convertView2;
                case 1:
                    return (convertView == null ? new HeaderHolder().inflate(parent) : (HeaderHolder) convertView.getTag()).setData(VotesFragment.this.mBalance, VotesFragment.this.mRequiredBalance);
                default:
                    return null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ItemHolder {
        private TextView mButton;
        private View.OnClickListener mClickHandler;
        private GetGiftsStockBalance.VotesProduct mData;
        private View mRoot;
        private TextView mTitle;

        private ItemHolder() {
            this.mClickHandler = new View.OnClickListener() { // from class: com.vkontakte.android.fragments.VotesFragment.ItemHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    VotesFragment.this.mManager.purchase(ItemHolder.this.mData, new PurchasesManager.OnSuccessListener<GetGiftsStockBalance.VotesProduct>() { // from class: com.vkontakte.android.fragments.VotesFragment.ItemHolder.1.1
                        @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
                        public void onSuccess(GetGiftsStockBalance.VotesProduct product) {
                            VotesFragment.this.notifyBalanceHasChanged(VotesFragment.this.mBalance + product.votes);
                        }
                    });
                }
            };
        }

        public ItemHolder inflate(ViewGroup parent) {
            this.mRoot = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_item_votes_purchase, parent, false);
            this.mTitle = (TextView) this.mRoot.findViewById(R.id.title);
            this.mButton = (TextView) this.mRoot.findViewById(R.id.action);
            this.mButton.setOnClickListener(this.mClickHandler);
            this.mRoot.setTag(this);
            return this;
        }

        public View setData(GetGiftsStockBalance.VotesProduct data, String maxTextLen) {
            this.mData = data;
            this.mTitle.setText(data.title);
            this.mButton.setText(data.description);
            this.mButton.setMinimumWidth((int) (this.mButton.getPaint().measureText(maxTextLen) + this.mButton.getPaddingLeft() + this.mButton.getPaddingRight()));
            return this.mRoot;
        }
    }

    /* loaded from: classes2.dex */
    private static class HeaderHolder {
        private TextView mBalance;
        private TextView mRequired;
        private TextView mRequiredLabel;
        private View mRoot;

        private HeaderHolder() {
        }

        public HeaderHolder inflate(ViewGroup parent) {
            this.mRoot = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_item_votes_balance, parent, false);
            this.mBalance = (TextView) this.mRoot.findViewById(R.id.balance);
            this.mRequired = (TextView) this.mRoot.findViewById(R.id.required);
            this.mRequiredLabel = (TextView) this.mRoot.findViewById(R.id.votes_required_label);
            this.mRoot.setTag(this);
            return this;
        }

        public View setData(int balance, int requiredBalance) {
            this.mBalance.setText(this.mBalance.getResources().getQuantityString(R.plurals.balance_votes, balance, Integer.valueOf(balance)));
            if (requiredBalance > 0) {
                this.mRequired.setText(this.mRequired.getResources().getQuantityString(R.plurals.balance_votes, requiredBalance, Integer.valueOf(requiredBalance)));
                this.mRequired.setVisibility(0);
                this.mRequiredLabel.setVisibility(0);
            } else {
                this.mRequired.setVisibility(8);
                this.mRequiredLabel.setVisibility(8);
            }
            return this.mRoot;
        }
    }
}
