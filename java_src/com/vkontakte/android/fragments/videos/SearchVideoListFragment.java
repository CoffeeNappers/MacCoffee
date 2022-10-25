package com.vkontakte.android.fragments.videos;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoSearch;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.functions.VoidFBool;
import com.vkontakte.android.functions.VoidFloat;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.layout.ExpandableBarLayout;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class SearchVideoListFragment extends AbsVideoListFragment implements BackListener {
    boolean mChanged;
    ExpandableBarLayout mExpandView;
    boolean mHd;
    String mQuery;
    View mSearchIcon;
    int mVideoLength;
    SearchViewWrapper searchView;
    boolean mSafeSearch = true;
    int mSortMode = 2;
    final Callbacks mCallbacks = new Callbacks();

    public static SearchVideoListFragment newInstance(boolean select) {
        Bundle args = new Bundle();
        args.putBoolean(ArgKeys.SELECT, select);
        SearchVideoListFragment result = new SearchVideoListFragment();
        result.setArguments(args);
        return result;
    }

    public void setSearchView(SearchViewWrapper searchView) {
        this.searchView = searchView;
    }

    public SearchVideoListFragment() {
        setLayout(R.layout.video_search);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setEmptyText(R.string.news_search_explain);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    protected String getReferer() {
        return FirebaseAnalytics.Event.SEARCH;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void showContent() {
        super.showContent();
        setEmptyText(R.string.nothing_found);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return new VideoSearch(this.mQuery, offset, count, this.mHd, this.mVideoLength, this.mSafeSearch, this.mSortMode);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void reload() {
        if (this.mQuery != null && this.mQuery.length() != 0) {
            this.refreshing = true;
            this.loaded = false;
            loadData();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        onDataLoaded(new ArrayList(), false);
        this.mSearchIcon = view.findViewById(R.id.search_icon);
        this.mExpandView = (ExpandableBarLayout) view.findViewById(R.id.expandable);
        this.mExpandView.setProgressListener(this.mCallbacks);
        this.mExpandView.setOpenListener(this.mCallbacks);
        ArrayAdapter<CharSequence> durationAdapter = ArrayAdapter.createFromResource(getActivity(), R.array.video_search_length, 17367048);
        durationAdapter.setDropDownViewResource(17367049);
        Spinner durationSpinner = (Spinner) this.mExpandView.findViewById(R.id.duration_spinner);
        durationSpinner.setAdapter((SpinnerAdapter) durationAdapter);
        ArrayAdapter<CharSequence> sortAdapter = ArrayAdapter.createFromResource(getActivity(), R.array.video_search_sort_options, 17367048);
        sortAdapter.setDropDownViewResource(17367049);
        Spinner sortSpinner = (Spinner) this.mExpandView.findViewById(R.id.sort_spinner);
        sortSpinner.setAdapter((SpinnerAdapter) sortAdapter);
        ((CompoundButton) this.mExpandView.findViewById(R.id.hd_only)).setOnCheckedChangeListener(this.mCallbacks);
        ((CompoundButton) this.mExpandView.findViewById(R.id.safe_search)).setOnCheckedChangeListener(this.mCallbacks);
        durationSpinner.setOnItemSelectedListener(this.mCallbacks);
        sortSpinner.setOnItemSelectedListener(this.mCallbacks);
    }

    public void setQuery(String q) {
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
            this.currentRequest = null;
        }
        this.mQuery = q;
        reload();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrollStarted() {
        super.onScrollStarted();
        this.searchView.clearFocus();
    }

    public void reset() {
        this.data.clear();
        this.preloadedData.clear();
        this.mQuery = null;
        updateList();
        this.loaded = false;
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mExpandView.isOpened()) {
            this.mExpandView.closePanel();
            return true;
        }
        return false;
    }

    /* loaded from: classes3.dex */
    private class Callbacks implements VoidFloat, VoidFBool, CompoundButton.OnCheckedChangeListener, AdapterView.OnItemSelectedListener {
        private Callbacks() {
        }

        @Override // com.vkontakte.android.functions.VoidFBool
        public void f(boolean opened) {
            if (SearchVideoListFragment.this.mChanged && !opened) {
                SearchVideoListFragment.this.mChanged = false;
                SearchVideoListFragment.this.reload();
            }
        }

        @Override // com.vkontakte.android.functions.VoidFloat
        public void f(float percent) {
            SearchVideoListFragment.this.mSearchIcon.setRotation(180.0f * percent);
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            switch (buttonView.getId()) {
                case R.id.hd_only /* 2131756438 */:
                    if (SearchVideoListFragment.this.mHd != isChecked) {
                        SearchVideoListFragment.this.mHd = isChecked;
                        SearchVideoListFragment.this.mChanged = true;
                        return;
                    }
                    return;
                case R.id.safe_search /* 2131756439 */:
                    if (SearchVideoListFragment.this.mSafeSearch != isChecked) {
                        SearchVideoListFragment.this.mSafeSearch = isChecked;
                        SearchVideoListFragment.this.mChanged = true;
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        @Override // android.widget.AdapterView.OnItemSelectedListener
        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
            switch (parent.getId()) {
                case R.id.duration_spinner /* 2131756436 */:
                    if (SearchVideoListFragment.this.mVideoLength != position) {
                        SearchVideoListFragment.this.mVideoLength = position;
                        SearchVideoListFragment.this.mChanged = true;
                        return;
                    }
                    return;
                case R.id.sort_spinner /* 2131756437 */:
                    int[] map = {2, 0, 1};
                    int position2 = map[position];
                    if (position2 != SearchVideoListFragment.this.mSortMode) {
                        SearchVideoListFragment.this.mSortMode = position2;
                        SearchVideoListFragment.this.mChanged = true;
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        @Override // android.widget.AdapterView.OnItemSelectedListener
        public void onNothingSelected(AdapterView<?> parent) {
        }
    }
}
