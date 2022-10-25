package com.vkontakte.android.stickers;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.imageloader.view.VKStickerImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.Product;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.stickers.WindowRecyclerView;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class StickerRecentsPage extends StickersViewPage {
    private Adapter mAdapter;
    View mContentView;
    List<Stickers.RecentSticker> mData;
    private TextView mEmptyView;
    private RecyclerView.OnScrollListener mListener;
    private WindowRecyclerView.Callback mProjection = new WindowRecyclerView.Callback() { // from class: com.vkontakte.android.stickers.StickerRecentsPage.1
        @Override // com.vkontakte.android.stickers.WindowRecyclerView.Callback
        public String getURL(View view) {
            Stickers.RecentSticker sticker = (Stickers.RecentSticker) view.getTag(R.id.id);
            if (sticker != null) {
                return sticker.mStockItem.getServerStickerViewURL(sticker.mId);
            }
            return null;
        }
    };
    private StickersView.Listener mSelector;
    final Stickers mStickers;
    final Drawable mTitleDrawable;

    public StickerRecentsPage(Context context) {
        this.mTitleDrawable = new RecoloredDrawable(context.getResources().getDrawable(R.drawable.ic_stickers_recents_24dp), -7498855);
        this.mTitleDrawable.setAlpha(191);
        this.mStickers = Stickers.get(context);
        this.mData = this.mStickers.getRecent();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerRecentsPage attachToScroll(RecyclerView.OnScrollListener l) {
        this.mListener = l;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerRecentsPage listener(StickersView.Listener l) {
        this.mSelector = l;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public View getView(Context context) {
        int i = 0;
        if (this.mContentView == null) {
            WindowRecyclerView mList = (WindowRecyclerView) LayoutInflater.from(context).inflate(R.layout.sticker_page, (ViewGroup) null);
            mList.init(this.mProjection);
            mList.setHasFixedSize(true);
            mList.addOnScrollListener(this.mListener);
            mList.setVerticalScrollBarEnabled(true);
            boolean landscape = context.getResources().getConfiguration().orientation == 2;
            int spanCount = landscape ? StickersConfig.KEYBOARD_COLUMNS_COUNT_LANDSCAPE : 4;
            GridLayoutManager mLayoutManager = new GridLayoutManager(context, spanCount);
            mList.setLayoutManager(mLayoutManager);
            Adapter adapter = new Adapter();
            this.mAdapter = adapter;
            mList.setAdapter(adapter);
            mList.setClipToPadding(false);
            FrameLayout layout = new FrameLayout(context);
            this.mEmptyView = new TextView(context);
            this.mEmptyView.setText(R.string.emoji_no_recent);
            this.mEmptyView.setTextSize(1, 16.0f);
            this.mEmptyView.setTextColor(-7829368);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2);
            params.gravity = 17;
            layout.addView(mList, new FrameLayout.LayoutParams(-1, -1));
            layout.addView(this.mEmptyView, params);
            this.mContentView = layout;
        }
        this.mAdapter.notifyDataSetChanged();
        TextView textView = this.mEmptyView;
        if (!this.mData.isEmpty()) {
            i = 8;
        }
        textView.setVisibility(i);
        return this.mContentView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public Drawable getTitleDrawable() {
        return this.mTitleDrawable;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getIconURL() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getServerBackgroundURL() {
        return null;
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
        this.mData = this.mStickers.getRecent();
        reload();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public int getId() {
        return -2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void reload() {
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
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
            return new StickerHolder(parent.getContext(), StickerRecentsPage.this.mSelector);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            ((StickerHolder) holder).bind(StickerRecentsPage.this.mData.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return StickerRecentsPage.this.mData.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return StickerRecentsPage.this.mData.get(position).mId;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class StickerHolder extends UsableRecyclerView.ViewHolder implements View.OnClickListener {
        private Stickers.RecentSticker mLastSticker;
        private final StickersView.Listener mListener;

        public StickerHolder(Context context, StickersView.Listener l) {
            super(new VKStickerImageView(context));
            ((VKStickerImageView) this.itemView).setAspectRatio(1.0f);
            this.itemView.setPadding(StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING, StickersConfig.KEYBOARD_PADDING);
            this.itemView.setOnClickListener(this);
            this.mListener = l;
        }

        public void bind(Stickers.RecentSticker item) {
            this.mLastSticker = item;
            this.itemView.setTag(R.id.id, this.mLastSticker);
            ((VKStickerImageView) this.itemView).load(item.mStockItem.getServerStickerKeyboardURL(item.mId));
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.mLastSticker.mStockItem.purchased) {
                if (this.mListener != null) {
                    this.mListener.onStickerSelected(this.mLastSticker.mStockItem.id, this.mLastSticker.mId, this.mLastSticker.mStockItem.getServerStickerKeyboardURL(this.mLastSticker.mId), Product.REFERRER_KEYBOARD);
                    return;
                }
                return;
            }
            this.mLastSticker.mStockItem.referrer = Product.REFERRER_KEYBOARD;
            StickersDetailsFragment.show(this.mLastSticker.mStockItem, v.getContext());
        }
    }
}
