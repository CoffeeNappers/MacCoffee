package com.vk.attachpicker;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.CoordinatorLayout;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.adapter.TabsAdapter;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.fragment.GalleryFragment;
import com.vk.attachpicker.fragment.GraffitiFragment;
import com.vk.attachpicker.util.PickerStickers;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.AttachCounterView;
import com.vk.attachpicker.widget.ContentViewPager;
import com.vk.attachpicker.widget.TabView;
import com.vk.attachpicker.widget.TabsLayoutManager;
import com.vk.attachpicker.widget.ToolbarContainer;
import com.vk.attachpicker.widget.VkBottomSheetBehavior;
import com.vk.core.util.KeyboardUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.fragments.AudioListFragment;
import com.vkontakte.android.fragments.attachmentspicker.PickVKPhotoFragment;
import com.vkontakte.android.fragments.attachmentspicker.PickVKVideoFragment;
import com.vkontakte.android.fragments.documents.DocumentsChooserFragment;
import com.vkontakte.android.fragments.gifts.GiftSendFragment;
import com.vkontakte.android.fragments.gifts.GiftsCatalogFragment;
import com.vkontakte.android.fragments.location.CheckInFragment;
import com.vkontakte.android.fragments.money.MoneyTransferActions;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.functions.F0;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AttachActivity extends VKActivity implements ResulterProvider, SelectionContext.SelectionContextProvider, AttachResulter {
    private static final String MONEY_ATTACH_BADGE_SEEN_KEY = "MONEY_ATTACH_BADGE_SEEN";
    private static final String PREF_KEY = "Attach_Prefs";
    private AttachCounterView attachCounterView;
    private View bottomButton;
    private VkBottomSheetBehavior bottomSheetBehavior;
    private View cancelView;
    private View clickHandler;
    private boolean enableGiftAttachment;
    private boolean enableGraffitiAttachment;
    private boolean enableMapAttachment;
    private boolean enableMoneyAttachment;
    private ArrayList<UserProfile> giftUsers;
    private String graffitiAvatar;
    private String graffitiTitle;
    private CoordinatorLayout mainContent;
    private int moneyPeerId;
    private ContentViewPager pager;
    private FragmentAdapter pagerAdapter;
    private int requestCode;
    private int semiTransparentBgColor;
    private int tabPosition;
    private float tabPositionOffset;
    private RecyclerView tabs;
    private TabsAdapter tabsAdapter;
    private FrameLayout tabsContainer;
    private View tabsOverlay;
    private ToolbarContainer toolbarContainer;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final SelectionContext selectionContext = new SelectionContext();
    private final BroadcastReceiver giftsReceiver = new BroadcastReceiver() { // from class: com.vk.attachpicker.AttachActivity.1
        {
            AttachActivity.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            AttachActivity.this.finish();
        }
    };
    private final BroadcastReceiver moneyTransferReceiver = new BroadcastReceiver() { // from class: com.vk.attachpicker.AttachActivity.2
        {
            AttachActivity.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            AttachActivity.this.finish();
        }
    };
    private final NotificationListener<Void> onSelectionUpdate = new NotificationListener<Void>() { // from class: com.vk.attachpicker.AttachActivity.8
        {
            AttachActivity.this = this;
        }

        @Override // com.vk.attachpicker.events.NotificationListener
        public void onNotification(int eventType, int eventId, Void eventArgs) {
            if (AttachActivity.this.selectionContext.selectionCount() > 0) {
                AttachActivity.this.attachCounterView.setCount(AttachActivity.this.selectionContext.selectionCount());
            } else {
                AttachActivity.this.attachCounterView.setCount(1);
            }
            if (AttachActivity.this.selectionContext.selectionCount() <= 0 || AttachActivity.this.pager.getCurrentItem() != 0) {
                AttachActivity.this.showCancelButton();
            } else {
                AttachActivity.this.hideCancelButton();
            }
        }
    };

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        overridePendingTransition(0, 0);
        KeyboardUtils.setSoftInputModeNothing(this);
        Picker.init((Activity) this);
        Stickers.get();
        this.semiTransparentBgColor = ContextCompat.getColor(this, R.color.picker_semi_transparent_background);
        this.requestCode = getIntent().getIntExtra(AttachIntent.INTENT_REQUEST_CODE, 0);
        this.selectionContext.setLimit(getIntent().getIntExtra(AttachIntent.INTENT_SELECTION_LIMIT, 10));
        this.selectionContext.setRequestCode(this.requestCode);
        this.enableMapAttachment = getIntent().getBooleanExtra(AttachIntent.INTENT_ENABLE_MAP_ATT, false);
        this.enableGiftAttachment = getIntent().getBooleanExtra(AttachIntent.INTENT_ENABLE_GIFT_ATT, false);
        this.enableGraffitiAttachment = getIntent().getBooleanExtra(AttachIntent.INTENT_ENABLE_GRAFFITI_ATT, false);
        this.enableMoneyAttachment = getIntent().getBooleanExtra(AttachIntent.INTENT_ENABLE_MONEY_ATT, false);
        if (getIntent().hasExtra(AttachIntent.INTENT_GIFT_USERS)) {
            this.giftUsers = getIntent().getParcelableArrayListExtra(AttachIntent.INTENT_GIFT_USERS);
        }
        this.moneyPeerId = getIntent().getIntExtra(AttachIntent.INTENT_MONEY_PEER_ID, 0);
        this.graffitiAvatar = getIntent().getStringExtra(AttachIntent.INTENT_GRAFFITI_AVATAR);
        this.graffitiTitle = getIntent().getStringExtra(AttachIntent.INTENT_GRAFFITI_TITLE);
        registerReceiver(this.giftsReceiver, new IntentFilter(GiftSendFragment.ACTION_GIFT_SENT), "com.vkontakte.android.permission.ACCESS_DATA", null);
        registerReceiver(this.moneyTransferReceiver, new IntentFilter(MoneyTransferActions.ACTION_MONEY_TRANSFER_SENT), "com.vkontakte.android.permission.ACCESS_DATA", null);
        initViews();
        NotificationCenter.getInstance().addListener(1, this.onSelectionUpdate);
        this.handler.postDelayed(AttachActivity$$Lambda$1.lambdaFactory$(this), 64L);
        PickerStickers.loadFromServer();
    }

    public /* synthetic */ void lambda$onCreate$0() {
        this.tabsContainer.setVisibility(0);
        this.bottomSheetBehavior.setState(4);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        lambda$initViews$8();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        NotificationCenter.getInstance().removeListener(this.onSelectionUpdate);
        unregisterReceiver(this.giftsReceiver);
        unregisterReceiver(this.moneyTransferReceiver);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.pager.getCurrentItem() == 0 && this.selectionContext != null && this.selectionContext.selectionCount() > 0) {
            this.selectionContext.clear();
        } else {
            super.onBackPressed();
        }
    }

    @Override // android.app.Activity
    public void finish() {
        this.bottomSheetBehavior.setState(5);
    }

    public void superFinish() {
        super.finish();
    }

    private void initViews() {
        View.OnClickListener onClickListener;
        View.OnClickListener onClickListener2;
        setStatusBarColor(0);
        setContentView(R.layout.picker_activity_attach);
        this.tabs = (RecyclerView) findViewById(R.id.rv_tabs);
        this.tabsContainer = (FrameLayout) findViewById(R.id.fl_tabs_container);
        this.tabsOverlay = findViewById(R.id.tabs_overlay);
        this.toolbarContainer = (ToolbarContainer) findViewById(R.id.tc_toolbar_container);
        this.mainContent = (CoordinatorLayout) findViewById(R.id.main_content);
        this.clickHandler = findViewById(R.id.click_handler);
        this.pager = (ContentViewPager) findViewById(R.id.pager);
        this.bottomButton = findViewById(R.id.fl_bottom_button);
        this.attachCounterView = (AttachCounterView) findViewById(R.id.acv_bottom_panel_counter);
        this.cancelView = findViewById(R.id.tv_bottom_panel_cancel);
        ToolbarContainer toolbarContainer = this.toolbarContainer;
        onClickListener = AttachActivity$$Lambda$2.instance;
        toolbarContainer.setOnClickListener(onClickListener);
        this.attachCounterView.setOnClickListener(AttachActivity$$Lambda$3.lambdaFactory$(this));
        this.cancelView.setOnClickListener(AttachActivity$$Lambda$4.lambdaFactory$(this));
        FrameLayout frameLayout = this.tabsContainer;
        onClickListener2 = AttachActivity$$Lambda$5.instance;
        frameLayout.setOnClickListener(onClickListener2);
        this.tabs.setLayoutManager(new TabsLayoutManager(this, 0, false));
        this.tabsAdapter = new TabsAdapter(new TabsAdapter.CurrentSelectionProvider() { // from class: com.vk.attachpicker.AttachActivity.3
            {
                AttachActivity.this = this;
            }

            @Override // com.vk.attachpicker.adapter.TabsAdapter.CurrentSelectionProvider
            public int position() {
                return AttachActivity.this.tabPosition;
            }

            @Override // com.vk.attachpicker.adapter.TabsAdapter.CurrentSelectionProvider
            public float positionOffset() {
                return AttachActivity.this.tabPositionOffset;
            }
        });
        this.tabsAdapter.setItemClickListener(AttachActivity$$Lambda$6.lambdaFactory$(this));
        initTabs();
        this.tabs.setAdapter(this.tabsAdapter);
        this.tabs.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vk.attachpicker.AttachActivity.4
            {
                AttachActivity.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                AttachActivity.this.updateSelection();
            }
        });
        this.mainContent.setStatusBarBackgroundColor(0);
        this.clickHandler.setOnClickListener(AttachActivity$$Lambda$7.lambdaFactory$(this));
        this.pagerAdapter = new FragmentAdapter(getFragmentManager());
        this.pager.setAdapter(this.pagerAdapter);
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vk.attachpicker.AttachActivity.5
            {
                AttachActivity.this = this;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                AttachActivity.this.tabPosition = position;
                AttachActivity.this.tabPositionOffset = positionOffset;
                AttachActivity.this.updateSelection();
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                AttachActivity.this.tabs.smoothScrollToPosition(position);
                if (AttachActivity.this.selectionContext.selectionCount() <= 0 || AttachActivity.this.pager.getCurrentItem() != 0) {
                    AttachActivity.this.showCancelButton();
                } else {
                    AttachActivity.this.hideCancelButton();
                }
                AttachActivity.this.lambda$initViews$8();
                TabsAdapter.TabInfo tabInfo = AttachActivity.this.tabsAdapter.getItems().get(position);
                if (tabInfo.iconResId == R.drawable.ic_money_32dp) {
                    VKApplication.context.getSharedPreferences(AttachActivity.PREF_KEY, 0).edit().putBoolean(AttachActivity.MONEY_ATTACH_BADGE_SEEN_KEY, true).commit();
                    tabInfo.showBadge = false;
                }
                AttachActivity.this.updateSelection();
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
            }
        });
        this.bottomSheetBehavior = VkBottomSheetBehavior.from(this.pager);
        this.bottomSheetBehavior.setHideable(true);
        this.bottomSheetBehavior.setState(5);
        this.bottomSheetBehavior.setBottomSheetCallback(new VkBottomSheetBehavior.BottomSheetCallback() { // from class: com.vk.attachpicker.AttachActivity.6
            {
                AttachActivity.this = this;
            }

            @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
            public void onStateChanged(@NonNull View bottomSheet, int newState) {
                boolean z = true;
                if (newState != 1 && newState != 2) {
                    AttachActivity.this.mainContent.requestLayout();
                }
                if (newState == 5) {
                    AttachActivity.this.finishInternal();
                    return;
                }
                ContentViewPager contentViewPager = AttachActivity.this.pager;
                if (newState != 4 && newState != 2) {
                    z = false;
                }
                contentViewPager.setSwipeEnabled(z);
                AttachActivity.this.updateAllowHorizontalScroll();
            }

            @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
            public void onTargetStateChanged(@NonNull View bottomSheet, int targetState) {
            }

            @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
            public void onSlide(@NonNull View bottomSheet, float slideOffset) {
                AttachActivity.this.tabsContainer.setTranslationY(AttachActivity.this.pager.getTop() - AttachActivity.this.tabsContainer.getHeight());
                int ty = (AttachActivity.this.pager.getTop() - AttachActivity.this.mainContent.getHeight()) + AttachActivity.this.bottomButton.getHeight();
                if (ty >= 0) {
                    AttachActivity.this.bottomButton.setTranslationY(ty);
                } else {
                    AttachActivity.this.bottomButton.setTranslationY(0.0f);
                }
                if (slideOffset < 0.8f) {
                    AttachActivity.this.toolbarContainer.setAlpha(0.0f);
                    AttachActivity.this.tabsOverlay.setAlpha(0.0f);
                    AttachActivity.this.toolbarContainer.setVisibility(4);
                } else {
                    float realSlide = (slideOffset - 0.8f) / 0.19999999f;
                    AttachActivity.this.toolbarContainer.setAlpha(realSlide);
                    AttachActivity.this.tabsOverlay.setAlpha(realSlide);
                    AttachActivity.this.toolbarContainer.setVisibility(0);
                }
                if (slideOffset >= 0.0f) {
                    AttachActivity.this.mainContent.setBackgroundColor(AttachActivity.this.semiTransparentBgColor);
                    return;
                }
                float normalizedOffset = -Math.max(-1.0f, Math.min(0.0f, slideOffset));
                int color = Utils.interpolateColors(AttachActivity.this.semiTransparentBgColor, 0, normalizedOffset);
                AttachActivity.this.mainContent.setBackgroundColor(color);
                AttachActivity.this.setStatusBarColor(color);
            }
        });
        this.pager.getViewTreeObserver().addOnGlobalLayoutListener(AttachActivity$$Lambda$8.lambdaFactory$(this));
        handleOrientation(getResources().getConfiguration().orientation);
        Utils.runOnPreDraw(this.pager, AttachActivity$$Lambda$9.lambdaFactory$(this));
    }

    public static /* synthetic */ void lambda$initViews$1(View v) {
    }

    public /* synthetic */ void lambda$initViews$2(View v) {
        setResultAndFinish(this.selectionContext.getPackedSelection());
    }

    public /* synthetic */ void lambda$initViews$3(View v) {
        finish();
    }

    public static /* synthetic */ void lambda$initViews$4(View v) {
    }

    public /* synthetic */ void lambda$initViews$5(int position) {
        boolean z = true;
        if (this.bottomSheetBehavior != null && this.bottomSheetBehavior.getState() == 4) {
            ContentViewPager contentViewPager = this.pager;
            if (Math.abs(this.pager.getCurrentItem() - position) > 1) {
                z = false;
            }
            contentViewPager.setCurrentItem(position, z);
            updateSelection();
        }
    }

    public /* synthetic */ void lambda$initViews$6(View v) {
        finish();
    }

    public /* synthetic */ void lambda$initViews$7() {
        this.bottomSheetBehavior.dispatchOnSlide(this.pager.getTop());
    }

    public void updateSelection() {
        for (int i = 0; i < this.tabs.getChildCount(); i++) {
            View v = this.tabs.getChildAt(i);
            int adapterPosition = this.tabs.getChildAdapterPosition(v);
            ((TabView) v).setSelection(adapterPosition, this.tabPosition, this.tabPositionOffset);
        }
    }

    /* renamed from: onPageSelected */
    public void lambda$initViews$8() {
        updateAllowHorizontalScroll();
    }

    public void updateAllowHorizontalScroll() {
        boolean allowNestedHorizontalScroll = this.bottomSheetBehavior.getState() == 3 || this.tabsAdapter.getItems().get(this.pager.getCurrentItem()).allowHorizontalScroll;
        this.pager.setAllowNestedViewHorizontalScroll(allowNestedHorizontalScroll);
    }

    @Override // com.vk.attachpicker.SelectionContext.SelectionContextProvider
    public SelectionContext getSelectionContext() {
        return this.selectionContext;
    }

    private void initTabs() {
        F0 f0;
        F0 f02;
        F0 f03;
        F0 f04;
        F0 f05;
        F0 f06;
        ArrayList<TabsAdapter.TabInfo> tabInfos = new ArrayList<>();
        f0 = AttachActivity$$Lambda$10.instance;
        tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_gallery_32dp, R.string.picker_tab_photo_video, f0));
        f02 = AttachActivity$$Lambda$11.instance;
        tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_music_32dp, R.string.picker_tab_audio, f02));
        if (this.enableGraffitiAttachment) {
            tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_graffiti_32dp, R.string.picker_graffiti, AttachActivity$$Lambda$12.lambdaFactory$(this)));
        }
        if (this.enableMoneyAttachment) {
            TabsAdapter.TabInfo moneyTabInfo = new TabsAdapter.TabInfo(true, R.drawable.ic_money_32dp, R.string.money_transfer_money, AttachActivity$$Lambda$13.lambdaFactory$(this));
            moneyTabInfo.showBadge = 1 == 0;
            tabInfos.add(moneyTabInfo);
        }
        if (this.enableGiftAttachment && this.giftUsers != null) {
            tabInfos.add(new TabsAdapter.TabInfo(true, R.drawable.picker_ic_gift_32dp, R.string.picker_tab_gift, AttachActivity$$Lambda$14.lambdaFactory$(this)));
        }
        f03 = AttachActivity$$Lambda$15.instance;
        tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_document_32dp, R.string.picker_tab_document, f03));
        if (this.enableMapAttachment) {
            f06 = AttachActivity$$Lambda$16.instance;
            tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_place_32dp, R.string.picker_tab_location, f06));
        }
        f04 = AttachActivity$$Lambda$17.instance;
        tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_gallery_32dp, R.string.picker_tab_vk_photo, f04));
        f05 = AttachActivity$$Lambda$18.instance;
        tabInfos.add(new TabsAdapter.TabInfo(R.drawable.picker_ic_video_32dp, R.string.picker_tab_vk_video, f05));
        this.tabsAdapter.setItems(tabInfos);
    }

    public static /* synthetic */ Fragment lambda$initTabs$9() {
        GalleryFragment fragment = new GalleryFragment();
        Bundle b = new Bundle();
        b.putInt("media_type", 111);
        fragment.setArguments(b);
        return fragment;
    }

    public static /* synthetic */ Fragment lambda$initTabs$10() {
        AudioListFragment audioListFragment = new AudioListFragment();
        audioListFragment.setArguments(new Bundle());
        return audioListFragment;
    }

    public /* synthetic */ Fragment lambda$initTabs$11() {
        GraffitiFragment graffitiFragment = new GraffitiFragment();
        Bundle b = new Bundle();
        if (this.graffitiAvatar != null) {
            b.putString(AttachIntent.INTENT_GRAFFITI_AVATAR, this.graffitiAvatar);
        }
        if (this.graffitiTitle != null) {
            b.putString(AttachIntent.INTENT_GRAFFITI_TITLE, this.graffitiTitle);
        }
        graffitiFragment.setArguments(b);
        return graffitiFragment;
    }

    public /* synthetic */ Fragment lambda$initTabs$12() {
        MoneyTransfersFragment moneyTransfersFragment = new MoneyTransfersFragment();
        Bundle b = new Bundle();
        b.putInt("peer_id", this.moneyPeerId);
        b.putInt(MoneyTransfersFragment.FILTER_ARGUMENT, 1);
        b.putBoolean(MoneyTransfersFragment.ALLOW_REFRESH_ARGUMENT, false);
        moneyTransfersFragment.setArguments(b);
        return moneyTransfersFragment;
    }

    public /* synthetic */ Fragment lambda$initTabs$13() {
        GiftsCatalogFragment giftFragment = new GiftsCatalogFragment();
        Bundle b = new Bundle();
        b.putParcelableArrayList("users", this.giftUsers);
        giftFragment.setArguments(b);
        return giftFragment;
    }

    public static /* synthetic */ Fragment lambda$initTabs$14() {
        DocumentsChooserFragment documentsChooserFragment = new DocumentsChooserFragment();
        Bundle b = new Bundle();
        b.putBoolean(ArgKeys.SELECT, true);
        documentsChooserFragment.setArguments(b);
        return documentsChooserFragment;
    }

    public static /* synthetic */ Fragment lambda$initTabs$15() {
        CheckInFragment checkInFragment = new CheckInFragment();
        return checkInFragment;
    }

    public static /* synthetic */ Fragment lambda$initTabs$16() {
        PickVKPhotoFragment pickVKPhotoFragment = new PickVKPhotoFragment();
        return pickVKPhotoFragment;
    }

    public static /* synthetic */ Fragment lambda$initTabs$17() {
        PickVKVideoFragment videoFragment = new PickVKVideoFragment();
        return videoFragment;
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        handleOrientation(newConfig.orientation);
    }

    public void setStatusBarColor(int color) {
        if (Build.VERSION.SDK_INT >= 21) {
            getWindow().setStatusBarColor(color);
        }
    }

    public void finishInternal() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    private void handleOrientation(int orientation) {
        if (orientation == 1) {
            this.bottomSheetBehavior.setPeekHeight((int) ((Screen.height() * 1.8f) / 3.0f));
        } else {
            this.bottomSheetBehavior.setPeekHeight((int) ((Screen.height() * 3.0f) / 5.0f));
        }
    }

    public void showCancelButton() {
        this.cancelView.setVisibility(0);
        this.cancelView.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
    }

    public void hideCancelButton() {
        this.cancelView.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.AttachActivity.7
            {
                AttachActivity.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                AttachActivity.this.cancelView.setVisibility(8);
            }
        }).setDuration(200L).start();
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void registerActivityResult(ActivityResulter result) {
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void unregisterActivityResult(ActivityResulter result) {
    }

    @Override // com.vk.attachpicker.AttachResulter
    public void setResultAndFinish(Intent result) {
        if (result == null) {
            setResult(0);
            finish();
            return;
        }
        setResult(-1, result);
        finish();
    }

    /* loaded from: classes2.dex */
    public class FragmentAdapter extends FragmentPagerAdapter {
        private ViewGroup currentToolbar;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public FragmentAdapter(FragmentManager fm) {
            super(fm);
            AttachActivity.this = r1;
        }

        @Override // android.support.v13.app.FragmentPagerAdapter
        public Fragment getItem(int position) {
            try {
                Fragment fragment = AttachActivity.this.tabsAdapter.getItems().get(position).fragmentFactoryMethod.f();
                return fragment;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return AttachActivity.this.tabsAdapter.getItemCount();
        }

        @Override // android.support.v13.app.FragmentPagerAdapter, android.support.v4.view.PagerAdapter
        public void setPrimaryItem(ViewGroup container, int position, Object object) {
            ViewGroup toolbar;
            super.setPrimaryItem(container, position, object);
            Fragment fragment = (Fragment) object;
            if ((fragment instanceof SupportExternalToolbarContainer) && (toolbar = ((SupportExternalToolbarContainer) fragment).provideToolbar(AttachActivity.this)) != null && this.currentToolbar != toolbar) {
                if (toolbar.getParent() != null) {
                    ((ViewGroup) toolbar.getParent()).removeView(toolbar);
                }
                AttachActivity.this.toolbarContainer.removeAllViews();
                toolbar.setVisibility(0);
                AttachActivity.this.toolbarContainer.addView(toolbar);
                this.currentToolbar = toolbar;
            }
        }
    }
}
