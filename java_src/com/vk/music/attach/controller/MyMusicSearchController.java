package com.vk.music.attach.controller;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.core.util.CollectionUtils;
import com.vk.music.attach.loader.MusicSearchResultsLoader;
import com.vk.music.attach.sharedstate.Search;
import com.vk.music.dto.MusicSearchResult;
import com.vk.music.utils.Bundler;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public final class MyMusicSearchController extends SearchController implements MusicSearchResultsLoader.Callback {
    private static final int VIEW_TYPE_FOOTER1 = 4;
    private static final int VIEW_TYPE_FOOTER2 = 5;
    private static final int VIEW_TYPE_GLOBAL = 3;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_LOCAL = 2;
    ViewAdapter emptyAdapter;
    ViewAdapter errorAdapter;
    ItemAdapter<MusicTrack> globalResultsAdapter;
    ViewAdapter globalResultsHeaderAdapter;
    ViewAdapter loaderAdapter;
    ViewAdapter loadingFooterAdapter;
    ItemAdapter<MusicTrack> localResultsAdapter;
    ViewAdapter retryFooterAdapter;
    MusicSearchResultsLoader searchLoader;
    MergeRecyclerAdapter searchResultsAdapter;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.SearchController
    public void onStartSearch() {
        getHostController().setAdapter(this.loaderAdapter);
        this.searchLoader.setQuery(getSearchText());
        this.searchLoader.load();
    }

    @Override // com.vk.music.attach.controller.SearchController
    protected void onStopSearch() {
        moveBack();
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        this.searchLoader = (MusicSearchResultsLoader) getHostController().addLoader(MusicSearchResultsLoader.class, null);
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.searchLoader = null;
        getHostController().destroyLoader(MusicSearchResultsLoader.class);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewAttached(@Nullable Bundle savedState) {
        super.onViewAttached(savedState);
        if (this.searchResultsAdapter == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            this.localResultsAdapter = AdapterHelper.createMusicAdapter(inflater, getHostController(), 2);
            this.globalResultsHeaderAdapter = new ViewAdapter(MyMusicSearchController$$Lambda$1.lambdaFactory$(inflater), 1);
            this.globalResultsAdapter = AdapterHelper.createMusicAdapter(inflater, getHostController(), 3);
            this.loadingFooterAdapter = AdapterHelper.createLoadingFooterAdapter(inflater, 4);
            this.errorAdapter = AdapterHelper.createErrorAdapter(inflater, MyMusicSearchController$$Lambda$2.lambdaFactory$(this));
            this.emptyAdapter = AdapterHelper.createEmptyAdapter(inflater);
            this.loaderAdapter = AdapterHelper.createLoaderAdapter(inflater);
            this.searchResultsAdapter = new MergeRecyclerAdapter();
            this.searchResultsAdapter.setHasStableIds(true);
            this.searchResultsAdapter.addAdapter(this.localResultsAdapter);
            this.searchResultsAdapter.addAdapter(this.globalResultsHeaderAdapter);
            this.searchResultsAdapter.addAdapter(this.globalResultsAdapter);
            this.searchResultsAdapter.addAdapter(this.loadingFooterAdapter);
        }
        getHostController().getLeftButton().setImageResource(R.drawable.ic_ab_back);
        getHostController().getRightButton().setImageResource(R.drawable.picker_ic_close_24dp);
        getHostController().getTitleView().setVisibility(8);
        getHostController().getSearchView().setVisibility(0);
        getHostController().getSearchView().setHint(R.string.music_hint_search);
        this.searchLoader.setQuery(getSearchText());
        this.searchLoader.subscribe(this);
        bind();
    }

    public static /* synthetic */ View lambda$onViewAttached$0(LayoutInflater inflater, ViewGroup viewGroup) {
        TextView captionView = (TextView) inflater.inflate(R.layout.music_caption, viewGroup, false);
        captionView.setText(R.string.music_caption_global_search);
        return captionView;
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        this.searchLoader.load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.SearchController, com.vk.music.attach.controller.Controller
    public void onViewDetached() {
        super.onViewDetached();
        this.searchLoader.unsubscribe(this);
    }

    @Override // com.vk.music.attach.controller.Controller
    public boolean onBackClicked() {
        getHostController().putSharedState(Search.class, new Bundler().put(Search.EXPANDED, false));
        moveBack();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onLeftButtonClicked() {
        super.onLeftButtonClicked();
        getHostController().putSharedState(Search.class, new Bundler().put(Search.EXPANDED, false));
        moveBack();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onRightButtonClicked() {
        super.onRightButtonClicked();
        moveBack();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onRefreshRequested() {
        super.onRefreshRequested();
        this.searchLoader.load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onEndOfListReached() {
        super.onEndOfListReached();
        if (this.searchLoader.canLoadMore()) {
            this.searchLoader.loadMore();
        }
    }

    public void onRetryButtonClick() {
        getHostController().setAdapter(this.loaderAdapter);
        this.searchLoader.load();
    }

    private void bind() {
        boolean z = false;
        MusicSearchResult searchResult = this.searchLoader.getMusicSearchResult();
        if (searchResult == null) {
            if (this.searchLoader.getReason() == null) {
                if (getHostController().getAdapter() != this.loaderAdapter) {
                    getHostController().setAdapter(this.loaderAdapter);
                    return;
                }
                return;
            } else if (getHostController().getAdapter() != this.errorAdapter) {
                getHostController().setAdapter(this.errorAdapter);
                return;
            } else {
                return;
            }
        }
        getHostController().setRefreshing(false);
        if (searchResult.isEmpty()) {
            if (getHostController().getAdapter() != this.emptyAdapter) {
                getHostController().setAdapter(this.emptyAdapter);
                return;
            }
            return;
        }
        this.loadingFooterAdapter.setEnabled(this.searchLoader.canLoadMore());
        this.localResultsAdapter.setItems(searchResult.getLocal());
        ViewAdapter viewAdapter = this.globalResultsHeaderAdapter;
        if (!CollectionUtils.isEmpty(searchResult.getGlobal())) {
            z = true;
        }
        viewAdapter.setEnabled(z);
        this.globalResultsAdapter.setItems(searchResult.getGlobal());
        if (getHostController().getAdapter() != this.searchResultsAdapter) {
            getHostController().setAdapter(this.searchResultsAdapter);
        }
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Callback
    public void onSearchResultsLoadingDone(@NonNull MusicSearchResultsLoader loader) {
        bind();
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Callback
    public void onSearchResultsLoadingError(@NonNull MusicSearchResultsLoader loader, @NonNull String error) {
        bind();
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Callback
    public void onSearchResultsLoadingMoreDone(@NonNull MusicSearchResultsLoader loader, @NonNull MusicSearchResult musicSearchResult) {
        if (!CollectionUtils.isEmpty(musicSearchResult.getLocal())) {
            this.localResultsAdapter.addItems(musicSearchResult.getLocal());
        }
        if (!CollectionUtils.isEmpty(musicSearchResult.getGlobal())) {
            this.globalResultsAdapter.addItems(musicSearchResult.getGlobal());
        }
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Callback
    public void onSearchResultsLoadingMoreError(@NonNull MusicSearchResultsLoader loader, @NonNull String error) {
    }
}
