package com.vk.attachpicker.stickers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.util.PickerStickers;
import com.vk.attachpicker.widget.EditorBottomPanel;
import com.vk.attachpicker.widget.EmojiAutofitRecyclerView;
import com.vk.attachpicker.widget.ViewPagerAdapter;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKStickerImageView;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.Product;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.stickers.StickerManagerFragment;
import com.vkontakte.android.fragments.stickers.StickerStoreFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class EditorStickerView extends FrameLayout {
    private final int additionTopPading;
    private EditorBottomPanel bottomPanel;
    private RecyclerView emojiRecyclerView;
    private boolean init;
    private boolean isFirstDataUpdate;
    private final BroadcastReceiver mReceiver;
    private final ArrayList<Mask> masksItems;
    private ViewPager pager;
    private final ArrayList<Stickers.RecentSticker> recentStickersItems;
    private Listener selector;
    private int settingsTabIndex;
    private final int sidePadding;
    private final ArrayList<StickerStockItem> stickersItems;
    private StickersTabStrip tabbar;
    private FrameLayout tabsContainer;
    private FrameLayout tabsOuterContainer;
    private int topPadding;
    private static final TimeoutLock timeoutLock = new TimeoutLock(500);
    private static final String[] emojis = {"1f600.png", "1f62c.png", "1f601.png", "1f602.png", "1f603.png", "1f604.png", "1f605.png", "1f606.png", "1f607.png", "1f609.png", "1f60a.png", "1f642.png", "1f643.png", "263a.png", "1f60b.png", "1f60c.png", "1f60d.png", "1f618.png", "1f617.png", "1f619.png", "1f61a.png", "1f61c.png", "1f61d.png", "1f61b.png", "1f911.png", "1f913.png", "1f60e.png", "1f917.png", "1f60f.png", "1f636.png", "1f610.png", "1f611.png", "1f612.png", "1f644.png", "1f914.png", "1f633.png", "1f61e.png", "1f61f.png", "1f620.png", "1f621.png", "1f614.png", "1f615.png", "1f641.png", "2639.png", "1f623.png", "1f616.png", "1f62b.png", "1f629.png", "1f624.png", "1f62e.png", "1f631.png", "1f628.png", "1f630.png", "1f62f.png", "1f626.png", "1f627.png", "1f622.png", "1f625.png", "1f62a.png", "1f613.png", "1f62d.png", "1f635.png", "1f632.png", "1f910.png", "1f637.png", "1f912.png", "1f915.png", "1f634.png", "1f4a4.png", "1f4a9.png", "1f608.png", "1f47f.png", "1f479.png", "1f47a.png", "1f480.png", "1f47b.png", "1f47d.png", "1f916.png", "1f63a.png", "1f638.png", "1f639.png", "1f63b.png", "1f63c.png", "1f63d.png", "1f640.png", "1f63f.png", "1f63e.png", "1f64c.png", "1f44f.png", "1f44b.png", "1f44d.png", "1f44e.png", "1f44a.png", "270a.png", "270c.png", "1f44c.png", "270b.png", "1f450.png", "1f4aa.png", "1f64f.png", "261d.png", "1f446.png", "1f447.png", "1f448.png", "1f449.png", "1f595.png", "1f590.png", "1f918.png", "1f596.png", "1f48b.png", "1f436.png", "1f431.png", "1f42d.png", "1f439.png", "1f430.png", "1f43b.png", "1f43c.png", "1f428.png", "1f42f.png", "1f981.png", "1f42e.png", "1f437.png", "1f43d.png", "1f438.png", "1f419.png", "1f435.png", "1f648.png", "1f649.png", "1f64a.png", "1f412.png", "1f414.png", "1f427.png", "1f426.png", "1f424.png", "1f423.png", "1f425.png", "1f43a.png", "1f417.png", "1f434.png", "1f984.png", "1f31a.png", "1f31d.png", "1f31e.png", "2728.png", "26a1.png", "1f525.png", "1f4a5.png", "2764.png", "1f49b.png", "1f49a.png", "1f499.png", "1f49c.png", "1f494.png", "2763.png", "1f495.png", "1f49e.png", "1f493.png", "1f497.png", "1f496.png", "1f498.png", "1f49d.png", "1f49f.png"};

    /* loaded from: classes2.dex */
    public interface Listener {
        void close();

        void onEmojiSelected(String str);

        void onMaskSelected(String str, int i);

        void onStickerSelected(int i, int i2, String str, String str2);
    }

    public EditorStickerView(Context context, Listener listener) {
        super(context);
        this.mReceiver = new BroadcastReceiver() { // from class: com.vk.attachpicker.stickers.EditorStickerView.1
            {
                EditorStickerView.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                EditorStickerView.this.updateData();
            }
        };
        this.isFirstDataUpdate = true;
        this.additionTopPading = Screen.dp(40);
        this.sidePadding = Screen.dp(8);
        this.recentStickersItems = new ArrayList<>();
        this.stickersItems = new ArrayList<>();
        this.masksItems = new ArrayList<>();
        LayoutInflater.from(context).inflate(R.layout.picker_layout_emoji_panel, this);
        this.selector = listener;
        setBackgroundColor(-419430401);
        this.emojiRecyclerView = new EmojiAutofitRecyclerView(context);
        this.emojiRecyclerView.setClipToPadding(false);
        this.emojiRecyclerView.setLayoutManager(new GridLayoutManager(context, 5));
        this.emojiRecyclerView.setAdapter(new EmojiAdapter());
        this.emojiRecyclerView.setPadding(Screen.dp(8), this.additionTopPading, Screen.dp(8), 0);
        this.tabsOuterContainer = (FrameLayout) findViewById(R.id.fl_tabs_outer_container);
        this.tabsContainer = (FrameLayout) findViewById(R.id.fl_tabs_container);
        this.tabbar = new StickersTabStrip(context);
        this.tabbar.setPadding(0, 0, 0, 0);
        this.tabbar.setDelegate(EditorStickerView$$Lambda$1.lambdaFactory$(this));
        FrameLayout.LayoutParams tabBarLp = new FrameLayout.LayoutParams(-1, Screen.dp(48));
        this.tabsContainer.addView(this.tabbar, tabBarLp);
        this.pager = (ViewPager) findViewById(R.id.vp_pager);
        this.pager.setAdapter(new PagerAdapter());
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vk.attachpicker.stickers.EditorStickerView.2
            {
                EditorStickerView.this = this;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                EditorStickerView.this.checkSelection();
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
            }
        });
        this.bottomPanel = (EditorBottomPanel) findViewById(R.id.ebp_sticker);
        this.bottomPanel.setRightButtonResId(R.drawable.ic_stickers_shop_24dp);
        this.bottomPanel.setRightButtonTint(ContextCompat.getColor(getContext(), R.color.picker_dark_icon));
        this.bottomPanel.setDividerVisible(false);
        this.bottomPanel.setOnCancelClickListener(EditorStickerView$$Lambda$2.lambdaFactory$(listener));
        this.bottomPanel.setOnApplyClickListener(EditorStickerView$$Lambda$3.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$new$0(int page) {
        if (page == this.settingsTabIndex) {
            StickerManagerFragment.start(Utils.castToActivity(getContext()));
        } else {
            this.pager.setCurrentItem(page, true);
        }
    }

    public /* synthetic */ void lambda$new$2(View view) {
        StickerStoreFragment.start(Utils.castToActivity(getContext()));
    }

    public void setTopPadding(int topPadding) {
        this.topPadding = topPadding;
        this.tabsOuterContainer.setPadding(0, topPadding, 0, 0);
        this.emojiRecyclerView.setPadding(this.sidePadding, this.additionTopPading + topPadding, this.sidePadding, 0);
        for (int i = 0; i < this.pager.getChildCount(); i++) {
            View v = this.pager.getChildAt(i);
            if (v instanceof RecyclerView) {
                v.setPadding(this.sidePadding, this.additionTopPading + topPadding, this.sidePadding, 0);
            }
        }
    }

    public void checkSelection() {
        this.tabbar.selectTab(this.pager.getCurrentItem());
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Stickers.ACTION_STICKERS_UPDATED);
        filter.addAction(Stickers.ACTION_STICKERS_RELOADED);
        filter.addAction(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS);
        filter.addAction(Stickers.ACTION_STICKERS_RECENT);
        filter.addAction(Stickers.ACTION_STICKERS_NUM_NEW_ITEMS);
        getContext().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        if (!this.init) {
            updateData();
            this.init = true;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        getContext().unregisterReceiver(this.mReceiver);
    }

    public void updateData() {
        String baseUrl;
        int newSettingsTabIndex = 1;
        this.stickersItems.clear();
        this.tabbar.removeTabs();
        this.tabbar.addIconTab(R.drawable.picker_ic_smiles_24dp);
        PickerStickers.PickerStickersResult masks = PickerStickers.getCached();
        if (masks != null && !TextUtils.isEmpty(masks.baseUrl) && masks.stickerIds != null && masks.stickerIds.length > 0) {
            this.masksItems.clear();
            if (masks.baseUrl.endsWith(CameraUtilsEffects.FILE_DELIM)) {
                baseUrl = masks.baseUrl;
            } else {
                baseUrl = masks.baseUrl + CameraUtilsEffects.FILE_DELIM;
            }
            for (int i = 0; i < masks.stickerIds.length; i++) {
                this.masksItems.add(new Mask(baseUrl + masks.stickerIds[i] + '/' + StickerStockItem.adjustSize(Screen.realWidth() / 3, 64, 128, 256, 352, 512) + ".png", masks.stickerIds[i]));
            }
            if (this.masksItems.size() > 0) {
                newSettingsTabIndex = 1 + 1;
                this.tabbar.addIconTab(R.drawable.picker_ic_masks_24dp);
            }
        }
        List<Stickers.RecentSticker> recentStickers = Stickers.get().getRecent();
        if (recentStickers != null) {
            this.recentStickersItems.clear();
            this.recentStickersItems.addAll(recentStickers);
            if (recentStickers.size() > 0) {
                this.tabbar.addIconTab(R.drawable.ic_stickers_recents_24dp);
                newSettingsTabIndex++;
            }
        }
        List<StickerStockItem> activatedStickers = Stickers.get().getActivatedStickers();
        if (activatedStickers != null) {
            this.stickersItems.clear();
            this.stickersItems.addAll(activatedStickers);
            for (StickerStockItem sticker : activatedStickers) {
                this.tabbar.addStickerTab(sticker);
                newSettingsTabIndex++;
            }
        }
        this.settingsTabIndex = newSettingsTabIndex;
        this.tabbar.addIconTab(R.drawable.picker_ic_settings_24dp);
        this.pager.mo1110getAdapter().notifyDataSetChanged();
        checkSelection();
        if (this.isFirstDataUpdate && this.masksItems.size() > 0) {
            this.pager.setCurrentItem(1, false);
        }
        this.isFirstDataUpdate = false;
    }

    /* loaded from: classes2.dex */
    public static class StickerHolder extends RecyclerView.ViewHolder {
        private StickerStockItem item;
        private int mId;

        public StickerHolder(Context context, Listener listener) {
            super(new VKStickerImageView(context) { // from class: com.vk.attachpicker.stickers.EditorStickerView.StickerHolder.1
                @Override // com.vk.imageloader.view.GenericVKImageView, android.widget.ImageView, android.view.View
                public boolean hasOverlappingRendering() {
                    return false;
                }
            });
            ((VKImageView) this.itemView).setAspectRatio(1.0f);
            int p = Screen.dp(8);
            this.itemView.setPadding(p, p, p, p);
            this.itemView.setOnClickListener(EditorStickerView$StickerHolder$$Lambda$1.lambdaFactory$(this, listener));
        }

        public /* synthetic */ void lambda$new$1(Listener listener, View v) {
            if (!EditorStickerView.timeoutLock.isLocked()) {
                EditorStickerView.timeoutLock.lock();
                if (this.item.purchased && this.item.isAllowedSticker(this.mId) && listener != null) {
                    listener.onStickerSelected(this.item.id, this.mId, getEditorURL(this.item, this.mId), Product.REFERRER_KEYBOARD);
                    Picker.runDelayed(EditorStickerView$StickerHolder$$Lambda$2.lambdaFactory$(this), 500L);
                }
            }
        }

        public /* synthetic */ void lambda$null$0() {
            Stickers.get().addRecent(this.mId, this.item.id);
        }

        public void bind(StickerStockItem ssi, int id) {
            this.item = ssi;
            this.mId = id;
            this.itemView.setAlpha(this.item.isAllowedSticker(id) ? 1.0f : 0.3f);
            ((VKImageView) this.itemView).load(getEditorURL(ssi, id), ImageSize.SMALL);
        }

        public String getEditorURL(StickerStockItem ssi, int id) {
            return ssi.stickers_base_url + id + '/' + StickerStockItem.adjustSize(Screen.realWidth() / 3, 64, 128, 256, 352, 512) + ".png";
        }
    }

    /* loaded from: classes2.dex */
    public static class MaskHolder extends RecyclerView.ViewHolder {
        private int id;
        private String url;

        public MaskHolder(Context context, Listener listener) {
            super(new VKStickerImageView(context));
            ((VKImageView) this.itemView).setAspectRatio(1.0f);
            int p = Screen.dp(8);
            this.itemView.setPadding(p, p, p, p);
            this.itemView.setOnClickListener(EditorStickerView$MaskHolder$$Lambda$1.lambdaFactory$(this, listener));
        }

        public /* synthetic */ void lambda$new$0(Listener listener, View v) {
            if (!EditorStickerView.timeoutLock.isLocked()) {
                EditorStickerView.timeoutLock.lock();
                if (listener != null) {
                    listener.onMaskSelected(this.url, this.id);
                }
            }
        }

        public void bind(String url, int id) {
            this.url = url;
            this.id = id;
            ((VKImageView) this.itemView).load(url, ImageSize.SMALL);
        }
    }

    /* loaded from: classes2.dex */
    private class Adapter extends RecyclerView.Adapter<StickerHolder> {
        private final StickerStockItem stickerStockItem;

        public Adapter(StickerStockItem stickerStockItem) {
            EditorStickerView.this = r2;
            this.stickerStockItem = stickerStockItem;
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public StickerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new StickerHolder(parent.getContext(), EditorStickerView.this.selector);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(StickerHolder holder, int position) {
            holder.bind(this.stickerStockItem, this.stickerStockItem.getAllStickerIds()[position]);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.stickerStockItem.getAllStickerIds().length;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return this.stickerStockItem.getAllStickerIds()[position];
        }
    }

    /* loaded from: classes2.dex */
    private class RecentAdapter extends RecyclerView.Adapter<StickerHolder> {
        private final ArrayList<Stickers.RecentSticker> recentStickers;

        public RecentAdapter(ArrayList<Stickers.RecentSticker> recentStickers) {
            EditorStickerView.this = r2;
            this.recentStickers = recentStickers;
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public StickerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new StickerHolder(parent.getContext(), EditorStickerView.this.selector);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(StickerHolder holder, int position) {
            Stickers.RecentSticker rs = this.recentStickers.get(position);
            holder.bind(rs.mStockItem, rs.mId);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.recentStickers.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return this.recentStickers.get(position).mId;
        }
    }

    /* loaded from: classes2.dex */
    private class MaskAdapter extends RecyclerView.Adapter<MaskHolder> {
        private final ArrayList<Mask> masks;

        public MaskAdapter(ArrayList<Mask> recentStickers) {
            EditorStickerView.this = r1;
            this.masks = recentStickers;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public MaskHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new MaskHolder(parent.getContext(), EditorStickerView.this.selector);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(MaskHolder holder, int position) {
            holder.bind(this.masks.get(position).url, this.masks.get(position).id);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.masks.size();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class EmojiAdapter extends RecyclerView.Adapter<EmojiHolder> {
        private EmojiAdapter() {
            EditorStickerView.this = r1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public EmojiHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new EmojiHolder(parent.getContext());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(EmojiHolder holder, int position) {
            holder.update("asset:///emoji/" + EditorStickerView.emojis[position]);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return EditorStickerView.emojis.length;
        }
    }

    /* loaded from: classes2.dex */
    public class EmojiHolder extends RecyclerView.ViewHolder {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public EmojiHolder(Context context) {
            super(new VKStickerImageView(context));
            EditorStickerView.this = r4;
            int p = Screen.dp(8);
            ((VKImageView) this.itemView).setAspectRatio(1.0f);
            this.itemView.setPadding(p, p, p, p);
            this.itemView.setOnClickListener(EditorStickerView$EmojiHolder$$Lambda$1.lambdaFactory$(this));
        }

        public /* synthetic */ void lambda$new$0(View v) {
            if (!EditorStickerView.timeoutLock.isLocked()) {
                EditorStickerView.timeoutLock.lock();
                EditorStickerView.this.selector.onEmojiSelected("asset:///emoji/" + EditorStickerView.emojis[getAdapterPosition()]);
            }
        }

        public void update(String path) {
            ((VKImageView) this.itemView).load(path, ImageSize.VERY_SMALL);
        }
    }

    public boolean isEmojiTab(int position) {
        return position == 0;
    }

    public boolean isRecentTab(int position) {
        return this.masksItems.size() == 0 ? position == 1 && this.recentStickersItems.size() > 0 : position == 2 && this.recentStickersItems.size() > 0;
    }

    public boolean isMasksTab(int position) {
        return position == 1 && this.masksItems.size() > 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class PagerAdapter extends ViewPagerAdapter {
        private PagerAdapter() {
            EditorStickerView.this = r1;
        }

        @Override // com.vk.attachpicker.widget.ViewPagerAdapter
        public View getView(int position, ViewPager pager) {
            int i = 1;
            if (EditorStickerView.this.isEmojiTab(position)) {
                return EditorStickerView.this.emojiRecyclerView;
            }
            StickersRecyclerView stickersRecyclerView = new StickersRecyclerView(pager.getContext());
            stickersRecyclerView.setHasFixedSize(true);
            stickersRecyclerView.setVerticalScrollBarEnabled(true);
            stickersRecyclerView.setClipToPadding(false);
            stickersRecyclerView.setPadding(EditorStickerView.this.sidePadding, EditorStickerView.this.topPadding + EditorStickerView.this.additionTopPading, EditorStickerView.this.sidePadding, 0);
            GridLayoutManager layoutManager = new GridLayoutManager(pager.getContext(), 3);
            stickersRecyclerView.setLayoutManager(layoutManager);
            if (!EditorStickerView.this.isRecentTab(position)) {
                if (!EditorStickerView.this.isMasksTab(position)) {
                    EditorStickerView editorStickerView = EditorStickerView.this;
                    ArrayList arrayList = EditorStickerView.this.stickersItems;
                    int i2 = (position - 1) - (EditorStickerView.this.recentStickersItems.size() > 0 ? 1 : 0);
                    if (EditorStickerView.this.masksItems.size() <= 0) {
                        i = 0;
                    }
                    stickersRecyclerView.setAdapter(new Adapter((StickerStockItem) arrayList.get(i2 - i)));
                    return stickersRecyclerView;
                }
                stickersRecyclerView.setAdapter(new MaskAdapter(EditorStickerView.this.masksItems));
                return stickersRecyclerView;
            }
            stickersRecyclerView.setAdapter(new RecentAdapter(EditorStickerView.this.recentStickersItems));
            return stickersRecyclerView;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            int i = 1;
            int i2 = (EditorStickerView.this.recentStickersItems.size() > 0 ? 1 : 0) + 1;
            if (EditorStickerView.this.masksItems.size() <= 0) {
                i = 0;
            }
            return i2 + i + EditorStickerView.this.stickersItems.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getItemPosition(Object object) {
            return -2;
        }
    }

    /* loaded from: classes2.dex */
    public static class Mask {
        public final int id;
        public final String url;

        public Mask(String url, int id) {
            this.url = url;
            this.id = id;
        }
    }
}
