package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.TabLayout;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vk.core.util.ResUtils;
import com.vk.core.util.Screen;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.fragment.SearchFragment;
import com.vk.music.model.TabbedMusicModel;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.navigation.NavigationDelegateProvider;
import com.vkontakte.android.utils.Utils;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class TabbedMusicContainer extends CoordinatorLayout implements TabbedMusicModel.View {
    private static final int REQUEST_CODE_GET_PLAYLIST_MUSIC = 10;
    private static final int REQUEST_CODE_GET_PLAYLIST_RECOMMENDATION = 66610;
    final Activity activity;
    AppBarLayout appBarView;
    final LayoutInflater inflater;
    ImageView leftButton;
    final LifecycleHandler lifecycleHandler;
    final TabbedMusicModel model;
    MusicContainer musicContainer;
    ViewPager pager;
    RecommendedContainer recommendedContainer;
    TextView searchButton;
    TabLayout tabs;
    final UserListener userListener;

    /* JADX INFO: Access modifiers changed from: private */
    public static int positionToPage(int position) {
        switch (position) {
            case 1:
                return 1;
            default:
                return 0;
        }
    }

    private static int pageToPosition(int page) {
        switch (page) {
            case 1:
                return 1;
            default:
                return 0;
        }
    }

    /* loaded from: classes2.dex */
    final class MusicPagerAdapter extends PagerAdapter {
        MusicPagerAdapter() {
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return 2;
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view;
            if (position == 0) {
                view = TabbedMusicContainer.this.musicContainer;
            } else {
                view = TabbedMusicContainer.this.recommendedContainer;
            }
            container.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }
    }

    /* loaded from: classes2.dex */
    final class UserListener extends LifecycleListener {
        UserListener() {
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
            super.onActivityResult(instanceId, requestCode, resultCode, data);
            if (resultCode == -1) {
                if (requestCode == 10 && data != null) {
                    TabbedMusicContainer.this.musicContainer.onPlaylistResult((Playlist) data.getParcelableExtra("result"));
                }
                if (requestCode == TabbedMusicContainer.REQUEST_CODE_GET_PLAYLIST_RECOMMENDATION && data != null) {
                    TabbedMusicContainer.this.recommendedContainer.onPlaylistResult((Playlist) data.getParcelableExtra("result"));
                }
            }
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStarted(@NonNull Activity activity) {
            super.onActivityStarted(activity);
        }
    }

    public TabbedMusicContainer(Context context, final TabbedMusicModel model) {
        super(context);
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.inflater = LayoutInflater.from(this.activity);
        this.userListener = new UserListener();
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
        this.inflater.inflate(R.layout.music_user_music1, this);
        this.appBarView = (AppBarLayout) findViewById(R.id.appbar);
        View searchBarView = findViewById(R.id.search_container);
        ViewCompat.setElevation(searchBarView, ResUtils.dim(R.dimen.music_search_bar_elevation));
        this.searchButton = (TextView) searchBarView.findViewById(R.id.search_input);
        this.searchButton.setOnClickListener(TabbedMusicContainer$$Lambda$1.lambdaFactory$(this));
        this.leftButton = (ImageView) searchBarView.findViewById(R.id.search_left_btn);
        if (Screen.isTablet(getContext())) {
            this.leftButton.setVisibility(8);
        } else if (this.activity.isTaskRoot()) {
            this.leftButton.setImageResource(R.drawable.ic_ab_menu);
            this.leftButton.setOnClickListener(TabbedMusicContainer$$Lambda$2.lambdaFactory$(this));
        } else {
            this.leftButton.setImageResource(R.drawable.ic_ab_back);
            this.leftButton.setOnClickListener(TabbedMusicContainer$$Lambda$3.lambdaFactory$(this));
        }
        this.tabs = (TabLayout) findViewById(R.id.tabs);
        this.tabs.addTab(createTab(R.string.music_main_tab_text1));
        this.tabs.addTab(createTab(R.string.music_main_tab_text2));
        this.pager = (ViewPager) findViewById(R.id.pager);
        this.pager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(this.tabs));
        this.tabs.addOnTabSelectedListener(new TabLayout.ViewPagerOnTabSelectedListener(this.pager) { // from class: com.vk.music.view.TabbedMusicContainer.1
            @Override // android.support.design.widget.TabLayout.ViewPagerOnTabSelectedListener, android.support.design.widget.TabLayout.OnTabSelectedListener
            public void onTabSelected(TabLayout.Tab tab) {
                super.onTabSelected(tab);
                model.setPage(TabbedMusicContainer.positionToPage(tab.getPosition()));
            }
        });
        View emptyView = this.inflater.inflate(R.layout.music_empty_placeholder, (ViewGroup) null);
        TextView tvEmpty = (TextView) emptyView.findViewById(R.id.btn_empty);
        tvEmpty.setOnClickListener(TabbedMusicContainer$$Lambda$4.lambdaFactory$(this));
        this.musicContainer = new MusicContainer(context, model.getMusicModel(), emptyView);
        this.musicContainer.setHost(TabbedMusicContainer$$Lambda$5.lambdaFactory$(this));
        this.recommendedContainer = new RecommendedContainer(context, model.getRecommendedModel());
        this.recommendedContainer.setHost(TabbedMusicContainer$$Lambda$6.lambdaFactory$(this));
        this.pager.setAdapter(new MusicPagerAdapter());
        int position = pageToPosition(model.getPage());
        TabLayout.Tab tab = this.tabs.getTabAt(position);
        if (tab != null) {
            tab.select();
        }
        this.pager.setCurrentItem(position);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View v) {
        new SearchFragment.Builder().go(this.activity);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(View v) {
        if (this.activity instanceof NavigationDelegateProvider) {
            ((NavigationDelegateProvider) this.activity).getNavigationDelegate().onNavigateUp();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(View v) {
        this.activity.finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(View o) {
        showRecommendationsPage();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$4() {
        this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(this.activity), 10);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5() {
        this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(this.activity), REQUEST_CODE_GET_PLAYLIST_RECOMMENDATION);
    }

    private void showRecommendationsPage() {
        this.pager.setCurrentItem(pageToPosition(1));
    }

    private TabLayout.Tab createTab(@StringRes int textRes) {
        TextView v = new RobotoMediumTextView(getContext());
        v.setTextColor(ResUtils.colorList(R.color.music_tab_text));
        v.setIncludeFontPadding(false);
        v.setGravity(17);
        v.setAllCaps(false);
        switch (getResources().getDisplayMetrics().densityDpi) {
            case 120:
            case 160:
            case PsExtractor.VIDEO_STREAM_MASK /* 240 */:
                v.setTextSize(1, 18.0f);
                break;
            default:
                v.setTextSize(1, 20.0f);
                break;
        }
        v.setText(textRes);
        return this.tabs.newTab().setCustomView(v);
    }
}
