package com.vkontakte.android.stickers;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKStickerImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.Product;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.stickers.StickerStoreListHolder;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.stickers.WindowRecyclerView;
import com.vkontakte.android.ui.CircularProgressDrawable;
import me.grishka.appkit.views.UsableRecyclerView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class StickerPage extends StickersViewPage {
    private Adapter mAdapter;
    private WindowRecyclerView mContentView;
    private StickerStockItem mData;
    private RecyclerView.OnScrollListener mListener;
    private final PurchasesManager<StickerStockItem> mPurchaseManager;
    private StickersView.Listener mSelector;
    private WindowRecyclerView.Callback mViewToUrlProjection = new WindowRecyclerView.Callback() { // from class: com.vkontakte.android.stickers.StickerPage.1
        @Override // com.vkontakte.android.stickers.WindowRecyclerView.Callback
        public String getURL(View view) {
            Integer id = (Integer) view.getTag(R.id.id);
            if (id != null) {
                return StickerPage.this.mData.getServerStickerViewURL(id.intValue());
            }
            return null;
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerPage(StickerStockItem data, PurchasesManager<StickerStockItem> manager) {
        this.mData = data;
        this.mPurchaseManager = manager;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerPage attachToScroll(RecyclerView.OnScrollListener l) {
        this.mListener = l;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerPage listener(StickersView.Listener l) {
        this.mSelector = l;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public View getView(Context context) {
        boolean mLandscape = true;
        if (this.mContentView == null) {
            this.mContentView = (WindowRecyclerView) LayoutInflater.from(context).inflate(R.layout.sticker_page, (ViewGroup) null);
            this.mContentView.init(this.mViewToUrlProjection);
            this.mContentView.setHasFixedSize(true);
            this.mContentView.addOnScrollListener(this.mListener);
            this.mContentView.setVerticalScrollBarEnabled(true);
            if (context.getResources().getConfiguration().orientation != 2) {
                mLandscape = false;
            }
            final int spanCount = mLandscape ? StickersConfig.KEYBOARD_COLUMNS_COUNT_LANDSCAPE : 4;
            GridLayoutManager mLayoutManager = new GridLayoutManager(this.mContentView.getContext(), spanCount);
            mLayoutManager.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vkontakte.android.stickers.StickerPage.2
                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int position) {
                    if (!StickerPage.this.showHeader() || position != 0) {
                        return 1;
                    }
                    return spanCount;
                }
            });
            this.mContentView.setClipToPadding(false);
            this.mContentView.setLayoutManager(mLayoutManager);
            WindowRecyclerView windowRecyclerView = this.mContentView;
            Adapter adapter = new Adapter();
            this.mAdapter = adapter;
            windowRecyclerView.setAdapter(adapter);
        }
        return this.mContentView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public Drawable getTitleDrawable() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getIconURL() {
        return this.mData.getServerIconURL();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getServerBackgroundURL() {
        return this.mData.getServerBackgroundURL();
    }

    @Override // com.vkontakte.android.stickers.StickersViewPage
    void releaseView() {
        this.mContentView = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void onConfigurationChanged(Configuration newConfig) {
        this.mContentView = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void reload(StickerStockItem item) {
        this.mData = item;
        reload();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public int getId() {
        return this.mData.id;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void reload() {
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean showHeader() {
        return !this.mData.purchased;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class StickerHolder extends UsableRecyclerView.ViewHolder implements View.OnClickListener {
        private static final int ID = 0;
        private final StickerStockItem item;
        private int mId;
        private final StickersView.Listener mListener;

        public StickerHolder(Context context, StickersView.Listener l, StickerStockItem item) {
            super(new VKStickerImageView(context) { // from class: com.vkontakte.android.stickers.StickerPage.StickerHolder.1
                @Override // com.vk.imageloader.view.GenericVKImageView, android.widget.ImageView, android.view.View
                public boolean hasOverlappingRendering() {
                    return false;
                }
            });
            ((VKStickerImageView) this.itemView).setAspectRatio(1.0f);
            this.itemView.setPadding(StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING);
            this.itemView.setOnClickListener(this);
            this.mListener = l;
            this.item = item;
        }

        public void bind(int id) {
            this.mId = id;
            this.itemView.setTag(R.id.id, Integer.valueOf(id));
            this.itemView.setAlpha(this.item.isAllowedSticker(id) ? 1.0f : 0.3f);
            ((VKImageView) this.itemView).load(this.item.getServerStickerKeyboardURL(id));
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.item.purchased && this.item.isAllowedSticker(this.mId)) {
                Stickers.get().addRecent(this.mId, this.item.id);
                if (this.mListener != null) {
                    this.mListener.onStickerSelected(this.item.id, this.mId, this.item.getServerStickerKeyboardURL(this.mId), Product.REFERRER_KEYBOARD);
                    return;
                }
                return;
            }
            this.item.referrer = Product.REFERRER_KEYBOARD;
            StickersDetailsFragment.show(this.item, v.getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class HeaderHolder extends UsableRecyclerView.ViewHolder {
        private static final int ID = -1;
        private View.OnClickListener mActionCallback;
        private View mError;
        private StickerStockItem mItem;
        private View mOkButton;
        private ProgressBar mProgress;
        private RelativeLayout mRoot;
        private TextView mStickerButton;
        private TextView mSubtitle;
        private TextView mTitle;

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$1(View v) {
            StickerPage.this.mData.referrer = Product.REFERRER_KEYBOARD;
            StickerPage.this.mPurchaseManager.purchase(StickerPage.this.mData, StickerPage$HeaderHolder$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(StickerStockItem item) {
            StickerPage.this.reload(item);
        }

        public HeaderHolder(Context context) {
            super(LayoutInflater.from(context).inflate(R.layout.sticker_keyboard_header, (ViewGroup) null));
            this.mActionCallback = StickerPage$HeaderHolder$$Lambda$1.lambdaFactory$(this);
            this.mRoot = (RelativeLayout) this.itemView;
            this.mStickerButton = (TextView) this.mRoot.findViewById(R.id.sticker_button);
            this.mOkButton = this.mRoot.findViewById(R.id.sticker_ok);
            this.mProgress = (ProgressBar) this.mRoot.findViewById(R.id.sticker_progress);
            this.mError = this.mRoot.findViewById(R.id.sticker_error);
            this.mTitle = (TextView) this.mRoot.findViewById(R.id.title);
            this.mSubtitle = (TextView) this.mRoot.findViewById(R.id.subtitle);
            this.mStickerButton.setOnClickListener(this.mActionCallback);
            CircularProgressDrawable pd = new CircularProgressDrawable(false);
            pd.setColors(0, -11435592);
            pd.setThickness(2.0f);
            pd.setPad(false);
            pd.setDimBackground(false);
            this.mProgress.setProgressDrawable(pd);
        }

        public void bind(StickerStockItem item) {
            this.mTitle.setText(item.title);
            this.mSubtitle.setText(item.author);
            this.mItem = item;
            StickerStoreListHolder.bindButtons(item, this.mStickerButton, this.mOkButton, this.mProgress, this.mError);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Adapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        public Adapter() {
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case -1:
                    return new HeaderHolder(parent.getContext());
                default:
                    return new StickerHolder(parent.getContext(), StickerPage.this.mSelector, StickerPage.this.mData);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            switch (getItemViewType(position)) {
                case -1:
                    ((HeaderHolder) holder).bind(StickerPage.this.mData);
                    return;
                case 0:
                    ((StickerHolder) holder).bind((int) getItemId(position));
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return StickerPage.this.showHeader() ? StickerPage.this.mData.getAllStickerIds().length + 1 : StickerPage.this.mData.getAllStickerIds().length;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (!StickerPage.this.showHeader() || position != 0) ? 0 : -1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            switch (getItemViewType(position)) {
                case -1:
                    return -1L;
                default:
                    int[] allStickerIds = StickerPage.this.mData.getAllStickerIds();
                    if (StickerPage.this.showHeader()) {
                        position--;
                    }
                    return allStickerIds[position];
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return getItemViewType(position) == 0 ? 1 : 0;
        }
    }
}
