package com.vkontakte.android.stickers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.astuetz.viewpager.extensions.PagerSlidingTabStrip;
import com.vk.emoji.EmojiKeyboardListener;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.stickers.StickerManagerFragment;
import com.vkontakte.android.fragments.stickers.StickerStoreFragment;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
import org.slf4j.Marker;
/* loaded from: classes3.dex */
public class StickersView extends RelativeLayout implements ActivityResulter {
    public static final int BACKSPACE_WIDTH = 56;
    public static final int TRANSLATE_DURATION_MILLIS = 200;
    private StickersPagerAdapter adapter;
    private TextView counterTextView;
    private StickersBackgroundView mBackground;
    private final View mBackspace;
    private final List<StickersViewPage> mData;
    private boolean mInit;
    private final Listener mListener;
    private final PurchasesManager<StickerStockItem> mManager;
    private int mPackToOpen;
    private final BroadcastReceiver mReceiver;
    private TabsShower mShower;
    private boolean mTabsVisible;
    private final ViewPager pager;
    private final PagerSlidingTabStrip tabbar;
    private final ViewGroup tabsWrap;
    private static final Stickers stickers = Stickers.get();
    public static final Interpolator mInterpolator = new AccelerateDecelerateInterpolator();
    static final int TABS_HEIGHT = Global.scale(45.0f);
    static final int TABS_WIDTH = Global.scale(56.0f);

    /* loaded from: classes3.dex */
    public interface Listener extends EmojiKeyboardListener {
        void onStickerSelected(int i, int i2, String str, String str2);
    }

    public StickersView(Context context, Listener listener) {
        super(context);
        this.mShower = new TabsShower();
        this.mData = new ArrayList();
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.stickers.StickersView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                String action = intent.getAction();
                char c = 65535;
                switch (action.hashCode()) {
                    case -1148613218:
                        if (action.equals(Stickers.ACTION_STICKERS_NUM_NEW_ITEMS)) {
                            c = 4;
                            break;
                        }
                        break;
                    case 4355914:
                        if (action.equals(Stickers.ACTION_STICKERS_RECENT)) {
                            c = 3;
                            break;
                        }
                        break;
                    case 1592808474:
                        if (action.equals(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS)) {
                            c = 1;
                            break;
                        }
                        break;
                    case 1791721521:
                        if (action.equals(Stickers.ACTION_STICKERS_UPDATED)) {
                            c = 2;
                            break;
                        }
                        break;
                    case 2139085602:
                        if (action.equals(Stickers.ACTION_STICKERS_RELOADED)) {
                            c = 0;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        StickersView.this.updateData();
                        return;
                    case 1:
                        int id = intent.getIntExtra("id", 0);
                        for (StickersViewPage page : StickersView.this.mData) {
                            if (page.getId() == id) {
                                page.reload();
                                return;
                            }
                        }
                        return;
                    case 2:
                        StickersView.this.updateData();
                        return;
                    case 3:
                        ((StickersViewPage) StickersView.this.mData.get(1)).reload();
                        return;
                    case 4:
                        StickersView.this.setNumberNew(StickersView.stickers.getNewItems());
                        return;
                    default:
                        return;
                }
            }

            private void reload(StickerStockItem item) {
                for (StickersViewPage page : StickersView.this.mData) {
                    if (page.getId() == item.id) {
                        page.reload(item);
                        return;
                    }
                }
            }
        };
        this.mTabsVisible = true;
        this.mInit = false;
        this.mPackToOpen = -1;
        this.mManager = new PurchasesManager<>(Utils.castToActivity(context));
        this.mListener = listener;
        this.mData.add(new StickerEmojiPage(getContext(), this.mListener).attachToScroll(this.mShower));
        this.mData.add(new StickerRecentsPage(getContext()).attachToScroll(this.mShower).listener(this.mListener));
        this.tabbar = createTabs();
        this.tabbar.addHeaderView(createStoreTabView());
        this.tabbar.addFooterView(createSettingsTabView());
        this.pager = createViewPager();
        this.tabbar.setViewPager(this.pager);
        this.tabbar.addOnPageChangeListener(this.mShower);
        this.tabbar.setId(R.id.tabbar);
        setBackgroundColor(-1315086);
        this.tabsWrap = createTabsWrap();
        this.mBackspace = createBackspaceButton();
        this.tabsWrap.addView(this.tabbar, new RelativeLayout.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams backspaceParams = new RelativeLayout.LayoutParams(Global.scale(56.0f), -1);
        backspaceParams.addRule(11);
        this.tabsWrap.addView(this.mBackspace, backspaceParams);
        addView(this.mBackground, new RelativeLayout.LayoutParams(-1, -1));
        addView(this.pager, new RelativeLayout.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams tabsParams = new RelativeLayout.LayoutParams(-1, TABS_HEIGHT + V.dp(3.0f));
        tabsParams.addRule(12);
        addView(this.tabsWrap, tabsParams);
    }

    public void openPack(int packId) {
        if (this.mInit) {
            openLoadedPack(packId);
        } else {
            this.mPackToOpen = packId;
        }
    }

    private void openLoadedPack(int packId) {
        for (int i = 0; i < this.mData.size(); i++) {
            if (packId == this.mData.get(i).getId()) {
                this.pager.setCurrentItem(i, true);
                return;
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!this.mInit) {
            updateData();
            this.mInit = true;
        }
        setNumberNew(stickers.getNewItems());
        ((ResulterProvider) getContext()).registerActivityResult(this);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Stickers.ACTION_STICKERS_UPDATED);
        filter.addAction(Stickers.ACTION_STICKERS_RELOADED);
        filter.addAction(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS);
        filter.addAction(Stickers.ACTION_STICKERS_RECENT);
        filter.addAction(Stickers.ACTION_STICKERS_NUM_NEW_ITEMS);
        getContext().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        stickers.markGlobalPromotionsAsViewed();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ((ResulterProvider) getContext()).unregisterActivityResult(this);
        getContext().unregisterReceiver(this.mReceiver);
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        for (StickersViewPage stickersViewPage : this.mData) {
            stickersViewPage.onConfigurationChanged(newConfig);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchConfigurationChanged(Configuration newConfig) {
        super.dispatchConfigurationChanged(newConfig);
        int position = this.pager.getCurrentItem();
        for (StickersViewPage stickersViewPage : this.mData) {
            stickersViewPage.onConfigurationChanged(newConfig);
        }
        this.pager.setAdapter(this.pager.mo1110getAdapter());
        this.pager.setCurrentItem(position);
    }

    @Override // com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.mManager != null) {
            this.mManager.onActivityResult(requestCode, resultCode, data);
        }
    }

    private ViewPager createViewPager() {
        ViewPager pager = new ViewPager(getContext());
        this.adapter = new StickersPagerAdapter();
        pager.setAdapter(this.adapter);
        this.mBackground = new StickersBackgroundView(getContext(), this.mData);
        pager.setPageTransformer(false, this.mBackground);
        pager.addOnPageChangeListener(this.mBackground);
        return pager;
    }

    private PagerSlidingTabStrip createTabs() {
        PagerSlidingTabStrip tabs = new PagerSlidingTabStrip(getContext());
        tabs.setFillViewport(true);
        tabs.setHorizontalScrollBarEnabled(false);
        tabs.setShouldExpand(false);
        tabs.setAutoExpand(false);
        tabs.setIndicatorColor(0);
        tabs.setUnderlineColor(0);
        tabs.setIndicatorHeight(0);
        tabs.setUnderlineHeight(0);
        tabs.setDividerColor(0);
        tabs.setTabBackground(R.drawable.sticker_tab);
        tabs.setDefaultTabLayoutParams(new LinearLayout.LayoutParams(TABS_WIDTH, TABS_HEIGHT, 0.0f));
        tabs.setTabPaddingLeftRight(Global.scale(16.0f));
        return tabs;
    }

    public RelativeLayout createTabsWrap() {
        RelativeLayout emojiTabsWrap = new RelativeLayout(getContext());
        emojiTabsWrap.setBackgroundResource(R.drawable.bg_stickers_tabs_panel);
        return emojiTabsWrap;
    }

    private View createStoreTabView() {
        FrameLayout result = new FrameLayout(getContext());
        ImageView imageView = new ImageView(getContext());
        imageView.setScaleType(ImageView.ScaleType.CENTER);
        Drawable icon = new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_stickers_shop_24dp), -7498855);
        icon.setAlpha(191);
        imageView.setImageDrawable(icon);
        result.addView(imageView, new FrameLayout.LayoutParams(-2, -2, 17));
        this.counterTextView = new TextView(getContext());
        this.counterTextView.setTextSize(0, V.dp(12.0f));
        this.counterTextView.setTypeface(Font.Medium.typeface);
        this.counterTextView.setGravity(17);
        this.counterTextView.setTextColor(-1);
        this.counterTextView.setBackgroundResource(R.drawable.sticker_store_icon_badge);
        this.counterTextView.setPadding(V.dp(7.5f), V.dp(-1.0f), V.dp(7.5f), 0);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, Global.scale(22.0f), 17);
        lp.leftMargin = V.dp(9.0f);
        lp.bottomMargin = V.dp(9.0f);
        result.addView(this.counterTextView, lp);
        result.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.stickers.StickersView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                StickerStoreFragment.start(Utils.castToActivity(StickersView.this.getContext()));
            }
        });
        return result;
    }

    private View createSettingsTabView() {
        ImageView result = new ImageView(getContext());
        result.setOnClickListener(StickersView$$Lambda$1.lambdaFactory$(this));
        result.setScaleType(ImageView.ScaleType.CENTER);
        result.setImageResource(R.drawable.ic_menu_settings);
        result.setColorFilter(-5591374);
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createSettingsTabView$0(View v) {
        StickerManagerFragment.start(Utils.castToActivity(getContext()));
    }

    public ImageView createBackspaceButton() {
        ImageView backspace = new ImageView(getContext());
        backspace.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_emoji_backspace_24dp), -1081240679));
        backspace.setBackgroundColor(-1775638);
        backspace.setScaleType(ImageView.ScaleType.CENTER);
        backspace.setOnTouchListener(new BackspaceTouchListener(this.mListener));
        return backspace;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setNumberNew(int numberNew) {
        if (this.counterTextView != null) {
            this.counterTextView.setText(numberNew < 10 ? numberNew + "" : Marker.ANY_NON_NULL_MARKER);
            this.counterTextView.setVisibility(numberNew > 0 ? 0 : 8);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateData() {
        int position = this.pager.getCurrentItem();
        int id = this.mData.get(position).getId();
        this.mData.get(1).reload(null);
        this.mData.subList(2, this.mData.size()).clear();
        List<StickerStockItem> activatedStickers = Stickers.get().getActivatedStickers();
        List<StickerStockItem> promotedStickers = Stickers.get().getPromotedStickers();
        for (StickerStockItem sticker : activatedStickers) {
            StickerPage page = new StickerPage(sticker, this.mManager).attachToScroll(this.mShower).listener(this.mListener);
            if (page.getId() == id) {
                position = this.mData.size();
            }
            this.mData.add(page);
        }
        for (StickerStockItem sticker2 : promotedStickers) {
            if (activatedStickers.indexOf(sticker2) < 0) {
                StickerPage page2 = new StickerPage(sticker2, this.mManager).attachToScroll(this.mShower).listener(this.mListener);
                if (page2.getId() == id) {
                    position = this.mData.size();
                }
                this.mData.add(page2);
            }
        }
        this.pager.setAdapter(this.adapter);
        this.tabbar.notifyDataSetChanged();
        this.pager.setCurrentItem(position);
        this.mBackground.setPages(this.mData, position);
        setNumberNew(stickers.getNewItems());
        if (this.mPackToOpen >= 0) {
            openLoadedPack(this.mPackToOpen);
            this.mPackToOpen = -1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class BackspaceTouchListener implements View.OnTouchListener {
        private final Listener listener;
        private final long PERIOD = 70;
        private final long BIG_PERIOD = 300;
        private final int DELETE_MSG = 0;
        private final Handler handler = new Handler(Looper.getMainLooper()) { // from class: com.vkontakte.android.stickers.StickersView.BackspaceTouchListener.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                BackspaceTouchListener.this.listener.onBackspace();
                BackspaceTouchListener.this.sendDeleteMessage();
            }
        };

        public BackspaceTouchListener(Listener listener) {
            this.listener = listener;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void sendDeleteMessage() {
            this.handler.sendMessageDelayed(Message.obtain(this.handler, 0), 70L);
        }

        private void sendDeleteMessageBigDelay() {
            this.handler.sendMessageDelayed(Message.obtain(this.handler, 0), 300L);
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            int action = event.getAction() & 255;
            if (action == 0 || action == 5) {
                sendDeleteMessageBigDelay();
            } else if (action == 1 || action == 3) {
                this.handler.removeMessages(0);
                this.listener.onBackspace();
            }
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class StickersPagerAdapter extends PagerAdapter implements PagerSlidingTabStrip.TabIconUrlProvider, PagerSlidingTabStrip.TabIconDrawableProvider {
        private StickersPagerAdapter() {
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return StickersView.this.mData.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View v, Object o) {
            return o instanceof StickersViewPage ? v == ((StickersViewPage) o).getView(v.getContext()) : v == o;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            ((StickersViewPage) StickersView.this.mData.get(position)).onBottomTabsVisibilityChanged(StickersView.this.mTabsVisible);
            View view = ((StickersViewPage) StickersView.this.mData.get(position)).getView(container.getContext());
            view.setTag(Integer.valueOf(position));
            container.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }

        @Override // com.astuetz.viewpager.extensions.PagerSlidingTabStrip.TabIconUrlProvider
        public String getPageIconUrl(int position) {
            return ((StickersViewPage) StickersView.this.mData.get(position)).getIconURL();
        }

        @Override // com.astuetz.viewpager.extensions.PagerSlidingTabStrip.TabIconDrawableProvider
        public Drawable getPageIconDrawable(int position) {
            return ((StickersViewPage) StickersView.this.mData.get(position)).getTitleDrawable();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public class TabsShower extends RecyclerView.OnScrollListener implements ViewPager.OnPageChangeListener {
        private ViewPropertyAnimator animator;
        private int mScrollThreshold = Global.scale(2.0f);

        TabsShower() {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int position) {
            StickersView.this.mBackspace.setVisibility(position == 0 ? 0 : 8);
            toggleTabs(true, true);
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int state) {
        }

        @Override // android.support.v7.widget.RecyclerView.OnScrollListener
        public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        }

        @Override // android.support.v7.widget.RecyclerView.OnScrollListener
        public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
            if (Math.abs(dy) > this.mScrollThreshold) {
                toggleTabs(dy < 0, false);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void toggleTabs(final boolean visible, boolean force) {
            if (StickersView.this.mTabsVisible != visible || force) {
                StickersView.this.mTabsVisible = visible;
                int height = StickersView.this.tabsWrap.getHeight();
                if (height == 0 && !force) {
                    ViewTreeObserver vto = StickersView.this.tabsWrap.getViewTreeObserver();
                    if (vto.isAlive()) {
                        vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.stickers.StickersView.TabsShower.1
                            @Override // android.view.ViewTreeObserver.OnPreDrawListener
                            public boolean onPreDraw() {
                                ViewTreeObserver currentVto = StickersView.this.tabsWrap.getViewTreeObserver();
                                if (currentVto.isAlive()) {
                                    currentVto.removeOnPreDrawListener(this);
                                }
                                TabsShower.this.toggleTabs(visible, true);
                                return true;
                            }
                        });
                        return;
                    }
                }
                int translationY = visible ? 0 : height;
                this.animator = StickersView.this.tabsWrap.animate().setInterpolator(StickersView.mInterpolator).setDuration(200L).translationY(translationY);
                for (StickersViewPage tab : StickersView.this.mData) {
                    tab.onBottomTabsVisibilityChanged(visible);
                }
            }
        }
    }
}
