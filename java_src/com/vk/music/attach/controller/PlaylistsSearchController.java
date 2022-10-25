package com.vk.music.attach.controller;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.KeyboardUtils;
import com.vk.core.util.Resourcer;
import com.vk.music.attach.loader.PlaylistSearchResultsLoader;
import com.vk.music.attach.sharedstate.Search;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.PlaylistLink;
import com.vk.music.dto.PlaylistSearchResult;
import com.vk.music.utils.Bundler;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlaylistBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public final class PlaylistsSearchController extends SearchController implements PlaylistSearchResultsLoader.Callback {
    private static final int VIEW_TYPE_FOOTER1 = 3;
    private static final int VIEW_TYPE_FOOTER2 = 4;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_PLAYLIST = 2;
    ViewAdapter emptyAdapter;
    ViewAdapter errorAdapter;
    ItemAdapter<Playlist> globalResultsAdapter;
    ViewAdapter globalResultsHeaderAdapter;
    ViewAdapter loaderAdapter;
    ViewAdapter loadingFooterAdapter;
    ItemAdapter<Playlist> localResultsAdapter;
    ViewAdapter retryFooterAdapter;
    PlaylistSearchResultsLoader searchLoader;
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
        this.searchLoader = (PlaylistSearchResultsLoader) getHostController().addLoader(PlaylistSearchResultsLoader.class, null);
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.searchLoader = null;
        getHostController().destroyLoader(PlaylistSearchResultsLoader.class);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewAttached(@Nullable Bundle savedState) {
        ItemViewHolder.Builder.Init init;
        IdResolver idResolver;
        super.onViewAttached(savedState);
        if (this.searchResultsAdapter == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            ItemAdapter.Builder layout = new ItemAdapter.Builder(inflater).layout(R.layout.music_playlist_item1);
            init = PlaylistsSearchController$$Lambda$1.instance;
            ItemAdapter.Builder viewType = layout.init(init).binder(new PlaylistBinder(Resourcer.of(getContext()))).registerClickListener(PlaylistsSearchController$$Lambda$2.lambdaFactory$(this)).viewType(2);
            idResolver = PlaylistsSearchController$$Lambda$3.instance;
            ItemAdapter.Builder<Playlist> playlistAdapterBuilder = viewType.resolver(idResolver);
            this.searchResultsAdapter = new MergeRecyclerAdapter();
            this.searchResultsAdapter.setHasStableIds(true);
            this.localResultsAdapter = playlistAdapterBuilder.build();
            this.searchResultsAdapter.addAdapter(this.localResultsAdapter);
            this.globalResultsHeaderAdapter = new ViewAdapter(PlaylistsSearchController$$Lambda$4.lambdaFactory$(inflater), 1);
            this.searchResultsAdapter.addAdapter(this.globalResultsHeaderAdapter);
            this.globalResultsAdapter = playlistAdapterBuilder.build();
            this.searchResultsAdapter.addAdapter(this.globalResultsAdapter);
            this.loadingFooterAdapter = new ViewAdapter(inflater, (int) R.layout.music_footer_loading, 3);
            this.searchResultsAdapter.addAdapter(this.loadingFooterAdapter);
            this.errorAdapter = new ViewAdapter(PlaylistsSearchController$$Lambda$5.lambdaFactory$(this, inflater), 0);
            this.emptyAdapter = new ViewAdapter(PlaylistsSearchController$$Lambda$6.lambdaFactory$(inflater), 0);
            this.loaderAdapter = new ViewAdapter(inflater, (int) R.layout.music_loader, 0);
        }
        getHostController().getLeftButton().setImageResource(R.drawable.ic_ab_back);
        getHostController().getRightButton().setImageResource(R.drawable.picker_ic_close_24dp);
        getHostController().getRightButton().setVisibility(0);
        getHostController().getTitleView().setVisibility(8);
        getHostController().getSearchView().setVisibility(0);
        getHostController().getSearchView().setHint(R.string.music_hint_playlist_search);
        this.searchLoader.setQuery(getSearchText());
        this.searchLoader.subscribe(this);
        bind();
        KeyboardUtils.showKeyboard(getHostController().getSearchView());
    }

    public /* synthetic */ void lambda$onViewAttached$1(View v, Playlist playlist, int position) {
        onPlaylistClick(playlist);
    }

    public static /* synthetic */ View lambda$onViewAttached$2(LayoutInflater inflater, ViewGroup viewGroup) {
        TextView captionView = (TextView) inflater.inflate(R.layout.music_caption, viewGroup, false);
        captionView.setText(R.string.music_caption_global_search);
        return captionView;
    }

    public /* synthetic */ View lambda$onViewAttached$4(LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_error, viewGroup, false);
        view.findViewById(R.id.error_retry).setOnClickListener(PlaylistsSearchController$$Lambda$7.lambdaFactory$(this));
        return view;
    }

    public /* synthetic */ void lambda$null$3(View v) {
        onRetryButtonClick();
    }

    public static /* synthetic */ View lambda$onViewAttached$5(LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_empty, viewGroup, false);
        ((TextView) view.findViewById(R.id.empty_text)).setText(R.string.music_playlists_search_empty_text);
        return view;
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

    private void onRetryButtonClick() {
        getHostController().setAdapter(this.loaderAdapter);
        this.searchLoader.load();
    }

    private void onPlaylistClick(@NonNull Playlist playlist) {
        Playlist original;
        if (playlist.original == null) {
            original = playlist;
        } else {
            original = new Playlist(playlist);
            original.id = playlist.original.id;
            original.ownerId = playlist.original.ownerId;
            original.accessKey = playlist.original.accessKey;
            original.original = null;
            original.following = true;
            original.followed = new PlaylistLink(playlist.id, playlist.ownerId);
        }
        moveNext(PlaylistMusicController.class, new Bundler().put(PlaylistMusicController.ARG_PLAYLIST, original));
    }

    private void bind() {
        boolean z = false;
        PlaylistSearchResult searchResult = this.searchLoader.getPlaylistSearchResult();
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

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Callback
    public void onSearchResultsLoadingDone(@NonNull PlaylistSearchResultsLoader loader) {
        bind();
    }

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Callback
    public void onSearchResultsLoadingError(@NonNull PlaylistSearchResultsLoader loader, @NonNull String error) {
        bind();
    }

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Callback
    public void onSearchResultsLoadingMoreDone(@NonNull PlaylistSearchResultsLoader loader, @NonNull PlaylistSearchResult playlistSearchResult) {
        if (!CollectionUtils.isEmpty(playlistSearchResult.getLocal())) {
            this.localResultsAdapter.addItems(playlistSearchResult.getLocal());
        }
        if (!CollectionUtils.isEmpty(playlistSearchResult.getGlobal())) {
            this.globalResultsAdapter.addItems(playlistSearchResult.getGlobal());
        }
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
    }

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Callback
    public void onSearchResultsLoadingMoreError(@NonNull PlaylistSearchResultsLoader loader, @NonNull String error) {
    }
}
