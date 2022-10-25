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
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.actions.SearchIntents;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vk.core.util.KeyboardUtils;
import com.vk.core.util.ResUtils;
import com.vk.core.util.Screen;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.model.SearchModel;
import com.vkontakte.android.EditEmptyChangeListener;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.utils.Utils;
import com.vkontakte.android.utils.VoiceUtils;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class SearchContainer extends CoordinatorLayout implements SearchModel.View {
    private static final int REQUEST_CODE_GET_PLAYLIST1 = 11;
    private static final int REQUEST_CODE_GET_PLAYLIST2 = 12;
    private static final int REQUEST_CODE_VOICE_RECOGNITION = 10;
    private static final int SEARCH_BAR_BOTTOM_PADDING = Screen.dp(8);
    final Activity activity;
    AppBarLayout appBarView;
    View focusEaterView;
    final LayoutInflater inflater;
    final LifecycleHandler lifecycleHandler;
    final SearchModel model;
    ViewPager pager;
    ImageView rightButton;
    ViewGroup searchBarView;
    SearchResultContainer searchByArtistContainer;
    SearchResultContainer searchByTitleContainer;
    EditText searchInputView;
    SearchSuggestionContainer searchSuggestionContainer;
    TabLayout tabs;
    final UserListener userListener;

    @SearchModel.View.Page
    public static int positionToPage(int position) {
        switch (position) {
            case 1:
                return 1;
            default:
                return 0;
        }
    }

    private static int pageToPosition(@SearchModel.View.Page int page) {
        switch (page) {
            case 1:
                return 1;
            default:
                return 0;
        }
    }

    /* loaded from: classes2.dex */
    public final class SearchResultsPagerAdapter extends PagerAdapter {
        private SearchResultsPagerAdapter() {
            SearchContainer.this = r1;
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
                SearchContainer.this.ensureSearchResultByTitleContainer();
                view = SearchContainer.this.searchByTitleContainer;
            } else {
                SearchContainer.this.ensureSearchResultByArtistContainer();
                view = SearchContainer.this.searchByArtistContainer;
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
    public final class UserListener extends LifecycleListener {
        private UserListener() {
            SearchContainer.this = r1;
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
            super.onActivityResult(instanceId, requestCode, resultCode, data);
            if (resultCode == -1) {
                switch (requestCode) {
                    case 10:
                        if (data != null) {
                            String query = data.getStringExtra(SearchIntents.EXTRA_QUERY);
                            SearchContainer.this.searchInputView.setText(query);
                            SearchContainer.this.searchInputView.setSelection(query.length());
                            return;
                        }
                        return;
                    case 11:
                        if (data != null) {
                            SearchContainer.this.searchByTitleContainer.onPlaylistResult((Playlist) data.getParcelableExtra("result"));
                            return;
                        }
                        return;
                    case 12:
                        if (data != null) {
                            SearchContainer.this.searchByArtistContainer.onPlaylistResult((Playlist) data.getParcelableExtra("result"));
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStopped(@NonNull Activity activity) {
            super.onActivityStopped(activity);
            SearchContainer.this.model.setQuery(SearchContainer.this.searchInputView.getText().toString().trim());
        }
    }

    public SearchContainer(Context context, final SearchModel model) {
        super(context);
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.inflater = LayoutInflater.from(context);
        this.userListener = new UserListener();
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
        this.inflater.inflate(R.layout.music_search, this);
        final boolean voiceSearchAvailable = VoiceUtils.voiceSearchAvailable();
        this.appBarView = (AppBarLayout) findViewById(R.id.appbar);
        this.searchBarView = (ViewGroup) findViewById(R.id.search_container);
        ViewCompat.setElevation(this.searchBarView, ResUtils.dim(R.dimen.music_search_bar_elevation));
        this.rightButton = (ImageView) this.searchBarView.findViewById(R.id.right_btn);
        this.rightButton.setVisibility(voiceSearchAvailable ? 0 : 8);
        this.rightButton.setOnClickListener(SearchContainer$$Lambda$1.lambdaFactory$(this, model));
        this.searchInputView = (EditText) this.searchBarView.findViewById(R.id.search_input);
        this.searchInputView.addTextChangedListener(new EditEmptyChangeListener() { // from class: com.vk.music.view.SearchContainer.1
            {
                SearchContainer.this = this;
            }

            @Override // com.vkontakte.android.EditEmptyChangeListener
            public void onEmptyChanged(boolean isEmpty) {
                if (!voiceSearchAvailable && isEmpty) {
                    SearchContainer.this.rightButton.setVisibility(8);
                } else {
                    SearchContainer.this.rightButton.setVisibility(0);
                }
                SearchContainer.this.rightButton.setImageResource(isEmpty ? R.drawable.ic_ab_voicesearch : R.drawable.picker_ic_close_24dp);
            }
        });
        this.searchInputView.setOnFocusChangeListener(SearchContainer$$Lambda$2.lambdaFactory$(this, model));
        this.searchInputView.setOnEditorActionListener(SearchContainer$$Lambda$3.lambdaFactory$(this));
        this.searchInputView.setText(model.getQuery());
        this.searchBarView.findViewById(R.id.back_btn).setOnClickListener(SearchContainer$$Lambda$4.lambdaFactory$(this));
        this.tabs = (TabLayout) findViewById(R.id.tabs);
        this.tabs.addTab(createTab(R.string.music_search_tab_text1));
        this.tabs.addTab(createTab(R.string.music_search_tab_text2));
        this.pager = (ViewPager) findViewById(R.id.pager);
        this.pager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(this.tabs));
        this.tabs.addOnTabSelectedListener(new TabLayout.ViewPagerOnTabSelectedListener(this.pager) { // from class: com.vk.music.view.SearchContainer.2
            {
                SearchContainer.this = this;
            }

            @Override // android.support.design.widget.TabLayout.ViewPagerOnTabSelectedListener, android.support.design.widget.TabLayout.OnTabSelectedListener
            public void onTabSelected(TabLayout.Tab tab) {
                super.onTabSelected(tab);
                model.setPage(SearchContainer.positionToPage(tab.getPosition()));
            }
        });
        this.focusEaterView = findViewById(R.id.focus_eater);
        ensureSearchResultByTitleContainer();
        ensureSearchResultByArtistContainer();
        if (model.getState() == 0) {
            switchToSearching();
        } else {
            switchToResults();
        }
    }

    public /* synthetic */ void lambda$new$0(SearchModel model, View v) {
        if (model.getState() == 0) {
            if (TextUtils.isGraphic(this.searchInputView.getText())) {
                this.searchInputView.setText((CharSequence) null);
                return;
            }
            Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH").putExtra("android.speech.extra.LANGUAGE_MODEL", "free_form").putExtra("android.speech.extra.MAX_RESULTS", 10);
            this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), intent, 10);
        } else if (model.getState() == 1) {
            this.searchInputView.setText((CharSequence) null);
            switchToSearching();
        }
    }

    public /* synthetic */ void lambda$new$1(SearchModel model, View v, boolean hasFocus) {
        if (hasFocus && model.getState() != 0) {
            switchToSearching();
        }
    }

    public /* synthetic */ boolean lambda$new$2(TextView v, int actionId, KeyEvent event) {
        if (actionId == 3) {
            switchToResults();
            return true;
        }
        return false;
    }

    public /* synthetic */ void lambda$new$3(View v) {
        this.activity.finish();
    }

    private void switchToSearching() {
        this.model.setState(0);
        if (this.searchSuggestionContainer == null) {
            this.searchSuggestionContainer = new SearchSuggestionContainer(this.activity, this.model.getSearchSuggestionModel());
            this.searchSuggestionContainer.setListener(SearchContainer$$Lambda$5.lambdaFactory$(this));
            CoordinatorLayout.LayoutParams layoutParams = mo25generateDefaultLayoutParams();
            layoutParams.setBehavior(new AppBarLayout.ScrollingViewBehavior());
            layoutParams.width = -1;
            layoutParams.height = -1;
            addView(this.searchSuggestionContainer, layoutParams);
        } else {
            this.searchSuggestionContainer.setVisibility(0);
        }
        this.searchSuggestionContainer.attach(this.searchInputView);
        AppBarLayout.LayoutParams params = (AppBarLayout.LayoutParams) this.searchBarView.getLayoutParams();
        params.setScrollFlags(params.getScrollFlags() & (-2));
        this.searchBarView.requestLayout();
        ViewUtils.setBottomPadding(this.searchBarView, SEARCH_BAR_BOTTOM_PADDING);
        this.tabs.setVisibility(8);
        this.pager.setVisibility(8);
        this.searchInputView.requestFocus();
        KeyboardUtils.showKeyboard(this.searchInputView);
    }

    public void switchToResults() {
        this.model.setState(1);
        if (this.searchSuggestionContainer != null) {
            this.searchSuggestionContainer.setVisibility(8);
            this.searchSuggestionContainer.detach();
        }
        AppBarLayout.LayoutParams params = (AppBarLayout.LayoutParams) this.searchBarView.getLayoutParams();
        params.setScrollFlags(params.getScrollFlags() | 1);
        this.searchBarView.requestLayout();
        this.model.setQuery(this.searchInputView.getText().toString());
        this.tabs.setVisibility(0);
        this.pager.setVisibility(0);
        if (this.pager.mo1110getAdapter() == null) {
            this.pager.setAdapter(new SearchResultsPagerAdapter());
        }
        int position = pageToPosition(this.model.getPage());
        TabLayout.Tab tab = this.tabs.getTabAt(position);
        if (tab != null) {
            tab.select();
        }
        this.pager.setCurrentItem(position);
        ViewUtils.setBottomPadding(this.searchBarView, 0);
        this.focusEaterView.requestFocus();
        KeyboardUtils.hideKeyboard(this.activity);
    }

    @NonNull
    private TabLayout.Tab createTab(@StringRes int textRes) {
        TextView v = new RobotoMediumTextView(getContext());
        v.setTextColor(ResUtils.colorList(R.color.music_tab_text));
        v.setIncludeFontPadding(false);
        v.setGravity(17);
        v.setTextSize(1, 14.0f);
        v.setText(textRes);
        v.setAllCaps(true);
        return this.tabs.newTab().setCustomView(v);
    }

    public void ensureSearchResultByTitleContainer() {
        if (this.searchByTitleContainer == null && this.model.getSearchResultByTitleModel() != null) {
            this.searchByTitleContainer = new SearchResultContainer(getContext(), this.model.getSearchResultByTitleModel());
            this.searchByTitleContainer.setHost(SearchContainer$$Lambda$6.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$ensureSearchResultByTitleContainer$4() {
        this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(this.activity), 11);
    }

    public void ensureSearchResultByArtistContainer() {
        if (this.searchByArtistContainer == null && this.model.getSearchResultByArtistModel() != null) {
            this.searchByArtistContainer = new SearchResultContainer(getContext(), this.model.getSearchResultByArtistModel());
            this.searchByArtistContainer.setHost(SearchContainer$$Lambda$7.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$ensureSearchResultByArtistContainer$5() {
        this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(this.activity), 12);
    }
}
