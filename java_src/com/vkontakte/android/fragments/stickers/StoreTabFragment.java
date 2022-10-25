package com.vkontakte.android.fragments.stickers;

import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.api.store.StoreGetCatalog;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.FitGridItemDecoration;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class StoreTabFragment extends Fragment implements ActivityResulter {
    private StoreGetCatalog.Section mData;
    private int mHeaderScrollOffset;
    private int mInitialPadding;
    private PurchasesManager<StickerStockItem> mManager;
    private View.OnClickListener mActionListener = new AnonymousClass1();
    private BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.stickers.StoreTabFragment.2
        {
            StoreTabFragment.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent intent) {
            int index;
            String action = intent.getAction();
            char c = 65535;
            switch (action.hashCode()) {
                case 1592808474:
                    if (action.equals(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS)) {
                        c = 1;
                        break;
                    }
                    break;
                case 1791721521:
                    if (action.equals(Stickers.ACTION_STICKERS_UPDATED)) {
                        c = 0;
                        break;
                    }
                    break;
                case 2139085602:
                    if (action.equals(Stickers.ACTION_STICKERS_RELOADED)) {
                        c = 2;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    StickerStockItem updatedItem = (StickerStockItem) intent.getParcelableExtra(Stickers.EXTRA_ITEM);
                    if (StoreTabFragment.this.mData != null && StoreTabFragment.this.mData.stickers != null && (index = StoreTabFragment.this.mData.stickers.indexOf(updatedItem)) >= 0) {
                        StoreTabFragment.this.mData.stickers.set(index, updatedItem);
                        if (StoreTabFragment.this.getView() != null) {
                            RecyclerView list = (RecyclerView) StoreTabFragment.this.getView();
                            if (list.mo1204getAdapter() != null) {
                                list.mo1204getAdapter().notifyDataSetChanged();
                                return;
                            }
                            return;
                        }
                        return;
                    }
                    return;
                case 1:
                    int id = intent.getIntExtra("id", 0);
                    for (int i = 0; i < StoreTabFragment.this.mData.stickers.size(); i++) {
                        if (id == StoreTabFragment.this.mData.stickers.get(i).id) {
                            if (StoreTabFragment.this.getView() != null) {
                                RecyclerView list2 = (RecyclerView) StoreTabFragment.this.getView();
                                if (list2.mo1204getAdapter() != null) {
                                    list2.mo1204getAdapter().notifyItemChanged(i);
                                    return;
                                }
                                return;
                            } else {
                                return;
                            }
                        }
                    }
                    return;
                case 2:
                    StickerStoreFragment parent = (StickerStoreFragment) StoreTabFragment.this.getTargetFragment();
                    if (parent.loaded) {
                        parent.loadData();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.stickers.StoreTabFragment$1 */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 implements View.OnClickListener {
        AnonymousClass1() {
            StoreTabFragment.this = this$0;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            v.setEnabled(false);
            v.postDelayed(StoreTabFragment$1$$Lambda$1.lambdaFactory$(v), 300L);
            StickerStockItem item = (StickerStockItem) v.getTag();
            if (!item.purchased) {
                item.referrer = "store";
                StoreTabFragment.this.mManager.purchase(item, null);
            }
        }
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mInitialPadding = V.dp(12.0f) + getResources().getDimensionPixelSize(R.dimen.stickers_banner_size) + getResources().getDimensionPixelSize(R.dimen.stickers_tabs_size);
        this.mManager = new PurchasesManager<>(this);
        ((ResulterProvider) getActivity()).registerActivityResult(this);
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        boolean isTablet = Screen.isTablet(inflater.getContext());
        RecyclerView list = new UsableRecyclerView(getActivity());
        list.setLayoutManager(isTablet ? new GridLayoutManager(getActivity(), 2) : new LinearLayoutManager(getActivity()));
        list.setClipToPadding(false);
        list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.stickers.StoreTabFragment.3
            {
                StoreTabFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                View child = recyclerView.getChildAt(0);
                if (child != null) {
                    StoreTabFragment.this.mHeaderScrollOffset = child.getTop() - StoreTabFragment.this.mInitialPadding;
                    ((StickerStoreFragment) StoreTabFragment.this.getTargetFragment()).moveHeader(StoreTabFragment.this, StoreTabFragment.this.mHeaderScrollOffset);
                }
            }
        });
        Adapter adapter = new Adapter(this, null);
        if (isTablet) {
            list.addItemDecoration(new FitGridItemDecoration().set(2, V.dp(12.0f)));
            CardItemDecoration decorator = new CardItemDecoration(adapter, false);
            int paddingX = isTablet ? V.dp(24.0f) : 0;
            list.setPadding(paddingX, this.mInitialPadding, paddingX, 0);
            decorator.setCardsSpacing(V.dp(13.0f));
            decorator.clipToPadding(false);
            decorator.setBackgroundColor(0);
            list.addItemDecoration(decorator);
        } else {
            list.addItemDecoration(new BottomDividerDecoration(null, Math.max(1, V.dp(0.5f)), 637534208, 0).setPadding(V.dp(92.0f), 0));
            list.setPadding(0, this.mInitialPadding, 0, 0);
        }
        list.setAdapter(adapter);
        return list;
    }

    @Override // android.app.Fragment
    public void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Stickers.ACTION_STICKERS_UPDATED);
        filter.addAction(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS);
        filter.addAction(Stickers.ACTION_STICKERS_RELOADED);
        getActivity().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // android.app.Fragment, com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (this.mManager != null) {
            this.mManager.onActivityResult(reqCode, resCode, data);
        }
    }

    @Override // android.app.Fragment
    public void onStop() {
        super.onStop();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // android.app.Fragment
    public void onDetach() {
        ((ResulterProvider) getActivity()).unregisterActivityResult(this);
        super.onDetach();
    }

    @Override // android.app.Fragment
    public void onSaveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            super.onSaveInstanceState(savedInstanceState);
        }
    }

    public StoreTabFragment setData(StoreGetCatalog.Section section) {
        this.mData = section;
        return this;
    }

    public int getHeaderScrollOffset() {
        return this.mHeaderScrollOffset;
    }

    /* loaded from: classes3.dex */
    private class Adapter extends UsableRecyclerView.Adapter<RecyclerHolder<StickerStockItem>> implements CardItemDecoration.Provider, BottomDividerDecoration.Provider {
        private Adapter() {
            StoreTabFragment.this = r1;
        }

        /* synthetic */ Adapter(StoreTabFragment x0, AnonymousClass1 x1) {
            this();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder<StickerStockItem> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new StickerStoreListHolder(parent, StoreTabFragment.this.mActionListener);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<StickerStockItem> holder, int position) {
            holder.bind(StoreTabFragment.this.mData.stickers.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (StoreTabFragment.this.mData == null) {
                return 0;
            }
            return StoreTabFragment.this.mData.stickers.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return StoreTabFragment.this.mData.stickers.get(position).getThumbUrl();
        }

        @Override // com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            return 31;
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return true;
        }
    }
}
