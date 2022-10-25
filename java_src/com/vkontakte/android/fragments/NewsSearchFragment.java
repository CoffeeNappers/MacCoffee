package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.newsfeed.NewsfeedGetTrends;
import com.vkontakte.android.api.newsfeed.NewsfeedSearch;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class NewsSearchFragment extends PostListFragment {
    private String from;
    private String query;
    private SearchViewWrapper searchView;
    private final View.OnClickListener onClickByTrend = new View.OnClickListener() { // from class: com.vkontakte.android.fragments.NewsSearchFragment.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (NewsSearchFragment.this.searchView != null) {
                NewsSearchFragment.this.searchView.setTextAndSubmit((String) v.getTag());
            }
        }
    };
    private VKAPIRequest<String[]> trendsRequest = null;
    private String[] trends = null;

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle s) {
        super.onCreate(s);
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setListLayoutId(R.layout.news_search_fragment);
        onDataLoaded(Collections.EMPTY_LIST);
        if ((getArguments() == null || !getArguments().containsKey("owner_name_gen")) && this.trends == null) {
            this.trendsRequest = new NewsfeedGetTrends().setCallback(new SimpleCallback<String[]>() { // from class: com.vkontakte.android.fragments.NewsSearchFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(String[] result) {
                    NewsSearchFragment.this.trends = result;
                    NewsSearchFragment.this.syncTrendsVisibility();
                    NewsSearchFragment.this.trendsRequest = null;
                }
            }).exec((Context) act);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncTrendsVisibility() {
        View view = getView();
        if (view != null) {
            if (this.trends == null || this.trends.length == 0) {
                ViewUtils.setVisibility(view.findViewById(R.id.trends), 8);
            } else {
                ViewGroup trendsBlock = (ViewGroup) view.findViewById(R.id.trends_block);
                if (trendsBlock != null) {
                    int i = 0;
                    while (i < trendsBlock.getChildCount() - 1) {
                        TextView trendView = (TextView) trendsBlock.getChildAt(i + 1);
                        if (trendView != null) {
                            trendView.setTag(i < this.trends.length ? this.trends[i] : null);
                            trendView.setOnClickListener(this.onClickByTrend);
                        }
                        ViewUtils.setText(trendView, i < this.trends.length ? this.trends[i] : null, true);
                        i++;
                    }
                }
            }
            if (this.trends != null && this.trends.length != 0 && this.items.size() == 0 && TextUtils.isEmpty(this.query)) {
                ViewUtils.setVisibility(view.findViewById(R.id.trends), 0);
            } else {
                ViewUtils.setVisibility(view.findViewById(R.id.trends), 8);
            }
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        super.onDetach();
        if (this.trendsRequest != null) {
            this.trendsRequest.cancel();
            this.trendsRequest = null;
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.NewsSearchFragment.3
            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                if (!TextUtils.equals(NewsSearchFragment.this.query, query)) {
                    NewsSearchFragment.this.query = query;
                    NewsSearchFragment.this.preloadedData.clear();
                    NewsSearchFragment.this.syncTrendsVisibility();
                    NewsSearchFragment.this.reload();
                }
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
                onQueryConfirmed(query);
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
            }
        }) { // from class: com.vkontakte.android.fragments.NewsSearchFragment.4
            @Override // com.vkontakte.android.ui.SearchViewWrapper
            public void setExpanded(boolean expanded) {
                super.setExpanded(expanded);
                if (!expanded && NewsSearchFragment.this.getActivity() != null) {
                    NewsSearchFragment.this.getActivity().finish();
                }
            }
        };
        if (getArguments() != null && getArguments().containsKey("owner_name_gen")) {
            this.searchView.setHint(getString(R.string.search_on_wall, new Object[]{getArguments().getString("owner_name_gen")}));
        } else {
            this.searchView.setHint(getString(R.string.search));
        }
        getToolbar().addView(this.searchView.getView());
        if (getArguments() != null && getArguments().containsKey("q")) {
            this.searchView.setTextAndSubmit(getArguments().getString("q"));
            this.searchView.clearFocus();
            hideKeyboard();
        }
        syncTrendsVisibility();
    }

    @Override // android.app.Fragment
    public void setArguments(Bundle args) {
        args.putBoolean("no_autoload", true);
        super.setArguments(args);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "news";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return FirebaseAnalytics.Event.SEARCH;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrollStarted() {
        super.onScrollStarted();
        this.searchView.clearFocus();
        hideKeyboard();
    }

    private void hideKeyboard() {
        this.searchView.getView().post(NewsSearchFragment$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$hideKeyboard$0() {
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        imm.hideSoftInputFromWindow(this.searchView.getView().getWindowToken(), 0);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        cancelLoading();
        if (this.query == null || this.query.length() == 0) {
            onDataLoaded(Collections.EMPTY_LIST, false);
            return;
        }
        final String query = this.query;
        if (getArguments() != null && getArguments().containsKey("domain")) {
            this.currentRequest = new NewsfeedSearch(query, getArguments().getString("domain"), offset, count).setCallback(new SimpleCallback<NewsfeedSearch.List<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.NewsSearchFragment.5
                @Override // com.vkontakte.android.api.Callback
                public void success(NewsfeedSearch.List<NewsEntry> news) {
                    if (TextUtils.equals(query, NewsSearchFragment.this.query)) {
                        NewsSearchFragment.this.from = news.from();
                        NewsSearchFragment.this.onDataLoaded(news, news.size() > 0);
                    }
                }
            }).exec((Context) getActivity());
        } else if (getArguments() != null && getArguments().containsKey("owner")) {
            this.currentRequest = new NewsfeedSearch(query, getArguments().getInt("owner"), offset, count).setCallback(new SimpleCallback<NewsfeedSearch.List<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.NewsSearchFragment.6
                @Override // com.vkontakte.android.api.Callback
                public void success(NewsfeedSearch.List<NewsEntry> news) {
                    if (TextUtils.equals(query, NewsSearchFragment.this.query)) {
                        NewsSearchFragment.this.from = news.from();
                        NewsSearchFragment.this.onDataLoaded(news, news.size() > 0);
                    }
                }
            }).exec((Context) getActivity());
        } else {
            this.currentRequest = new NewsfeedSearch(query, offset == 0 ? "" : this.from, count).setCallback(new SimpleCallback<NewsfeedSearch.List<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.NewsSearchFragment.7
                @Override // com.vkontakte.android.api.Callback
                public void success(NewsfeedSearch.List<NewsEntry> news) {
                    if (TextUtils.equals(query, NewsSearchFragment.this.query)) {
                        NewsSearchFragment.this.from = news.from();
                        NewsSearchFragment.this.onDataLoaded(news, NewsSearchFragment.this.from != null && NewsSearchFragment.this.from.length() > 0);
                    }
                }
            }).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<NewsEntry> d, boolean more) {
        super.onDataLoaded(d, more);
        syncTrendsVisibility();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle state) {
        View view = super.onCreateView(inflater, parent, state);
        FrameLayout.LayoutParams lparams = new FrameLayout.LayoutParams(-1, -2);
        lparams.gravity = 48;
        this.emptyView.setLayoutParams(lparams);
        this.emptyView.setPadding(0, Global.scale(100.0f), 0, 0);
        if (getArguments() == null || !getArguments().containsKey("q")) {
            this.contentWrap.setVisibility(0);
            this.progress.setVisibility(8);
        }
        return view;
    }

    protected String getEmptyText() {
        return getString(R.string.news_search_explain);
    }
}
