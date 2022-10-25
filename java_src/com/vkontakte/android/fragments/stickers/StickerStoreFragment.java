package com.vkontakte.android.fragments.stickers;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.astuetz.viewpager.extensions.PagerSlidingTabStrip;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.store.StoreGetCatalog;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.infiniteviewpager.InfinitePagerAdapter;
import com.vkontakte.android.ui.widget.ViewPagerInfinite;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class StickerStoreFragment extends LoaderFragment {
    private List<Fragment> fragments;
    private ViewPagerInfinite mBanners;
    private ViewPager mContent;
    private StoreGetCatalog.Result mData;
    private PagerSlidingTabStrip mTabs;
    private View mTabsWrap;
    private android.support.v4.view.PagerAdapter mBannersAdapter = new InfinitePagerAdapter(new BannersAdapter());
    private int mNewPosition = -1;

    public static void start(@NonNull Activity activity) {
        new Navigator(StickerStoreFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(Screen.isTablet(activity) ? R.color.gifts_dialog_bg : 17170443).setMaxWidth(V.dp(652.0f))).go(activity);
    }

    public StickerStoreFragment() {
        setLayout(R.layout.window_content_layout);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.sticker_store_fragment, container, false);
        this.mBanners = (ViewPagerInfinite) view.findViewById(R.id.banners);
        this.mTabs = (PagerSlidingTabStrip) view.findViewById(R.id.tabs);
        this.mTabs.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vkontakte.android.fragments.stickers.StickerStoreFragment.1
            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                if (StickerStoreFragment.this.mData != null && StickerStoreFragment.this.mData.sections.size() > position + 1) {
                    int from = ((StoreTabFragment) StickerStoreFragment.this.fragments.get(position)).getHeaderScrollOffset();
                    int to = ((StoreTabFragment) StickerStoreFragment.this.fragments.get(position + 1)).getHeaderScrollOffset();
                    StickerStoreFragment.this.moveHeader(null, Math.round(from + ((to - from) * positionOffset)));
                }
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
            }
        });
        this.mTabsWrap = view.findViewById(R.id.tabs_wrap);
        this.mContent = (ViewPager) view.findViewById(R.id.pager);
        this.mContent.setOffscreenPageLimit(5);
        this.mTabs.setTypeface(Font.Medium.typeface, 0);
        this.mBanners.setOffscreenPageLimit(2);
        this.mBanners.setAdapter(this.mBannersAdapter);
        return view;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        Stickers.get().markNewItemsAsViewed();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        getToolbar().setTitle(R.string.buy_stickers);
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (this.mData == null) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.mBanners.onResume();
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.mBanners.onPause();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.store, menu);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.settings) {
            StickerManagerFragment.start(getActivity());
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        this.currentRequest = new StoreGetCatalog().setCallback(new SimpleCallback<StoreGetCatalog.Result>(this) { // from class: com.vkontakte.android.fragments.stickers.StickerStoreFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(StoreGetCatalog.Result result) {
                StickerStoreFragment.this.mData = result;
                if (Stickers.get().getNewItems() > 0) {
                    Stickers.get().setNewItems(0);
                }
                int i = 0;
                while (true) {
                    if (i >= StickerStoreFragment.this.mData.sections.size()) {
                        break;
                    } else if ("new".equals(StickerStoreFragment.this.mData.sections.get(i).name)) {
                        StickerStoreFragment.this.mNewPosition = i;
                        break;
                    } else {
                        i++;
                    }
                }
                StickerStoreFragment.this.dataLoaded();
            }
        }).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void dataLoaded() {
        super.dataLoaded();
        this.fragments = new ArrayList(this.mData.sections.size());
        for (int i = 0; i < this.mData.sections.size(); i++) {
            StoreTabFragment fragment = new StoreTabFragment().setData(this.mData.sections.get(i));
            fragment.setTargetFragment(this, 0);
            this.fragments.add(fragment);
        }
        this.mContent.setAdapter(new PagerAdapter(this.fragments));
        this.mTabs.setViewPager(this.mContent);
        this.mBannersAdapter.notifyDataSetChanged();
        if (this.mNewPosition > 0) {
            this.mContent.setCurrentItem(this.mNewPosition, false);
            this.mNewPosition = -1;
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            super.onSaveInstanceState(savedInstanceState);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void moveHeader(Fragment fragment, int dx) {
        if (fragment == null || fragment == this.fragments.get(this.mContent.getCurrentItem())) {
            this.mTabsWrap.setTranslationY(Math.max(dx, -this.mBanners.getHeight()));
            this.mBanners.setTranslationY(Math.max(dx, -this.mBanners.getHeight()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PagerAdapter extends FragmentPagerAdapter {
        private final List<Fragment> mFragments;

        public PagerAdapter(List<Fragment> fragments) {
            super(StickerStoreFragment.this.getFragmentManager());
            this.mFragments = fragments;
        }

        @Override // android.support.v4.view.PagerAdapter
        public CharSequence getPageTitle(int position) {
            return StickerStoreFragment.this.mData.sections.get(position).title;
        }

        @Override // android.support.v13.app.FragmentPagerAdapter
        public Fragment getItem(int position) {
            return this.mFragments.get(position);
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return this.mFragments.size();
        }
    }

    /* loaded from: classes3.dex */
    private class BannersAdapter extends android.support.v4.view.PagerAdapter implements View.OnClickListener {
        private BannersAdapter() {
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            if (StickerStoreFragment.this.mData == null || StickerStoreFragment.this.mData.banners == null) {
                return 0;
            }
            return StickerStoreFragment.this.mData.banners.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = LayoutInflater.from(container.getContext()).inflate(R.layout.apps_banners_item, container, false);
            VKImageView imageView = (VKImageView) view.findViewById(R.id.image);
            StoreGetCatalog.Banner item = StickerStoreFragment.this.mData.banners.get(position);
            imageView.load(item.getBannerImage());
            container.addView(view);
            view.setOnClickListener(this);
            view.setTag(item);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object view) {
            container.removeView((View) view);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            StoreGetCatalog.Banner banner = (StoreGetCatalog.Banner) view.getTag();
            switch (banner.type) {
                case Section:
                    for (int i = 0; i < StickerStoreFragment.this.mData.sections.size(); i++) {
                        if (banner.section.equals(StickerStoreFragment.this.mData.sections.get(i).name)) {
                            StickerStoreFragment.this.mContent.setCurrentItem(i, true);
                            return;
                        }
                    }
                    return;
                case StockItem:
                    banner.stock_item.referrer = "store";
                    StickersDetailsFragment.show(banner.stock_item, view.getContext());
                    return;
                default:
                    return;
            }
        }
    }
}
