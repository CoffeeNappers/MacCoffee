package com.vk.music.attach.controller;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.core.util.KeyboardUtils;
import com.vk.core.util.Resourcer;
import com.vk.music.attach.loader.PlaylistsLoader;
import com.vk.music.attach.sharedstate.Search;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.PlaylistLink;
import com.vk.music.utils.Bundler;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlaylistBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public final class PlaylistsController extends Controller implements PlaylistsLoader.Callback {
    private static final String KEY_SEARCH_EXPANDED = "PlaylistsController.key.searchExpanded";
    private static final int VIEW_TYPE_FOOTER1 = 2;
    private static final int VIEW_TYPE_FOOTER2 = 3;
    private static final int VIEW_TYPE_PLAYLIST = 1;
    MergeRecyclerAdapter contentAdapter;
    ViewAdapter emptyAdapter;
    ViewAdapter errorAdapter;
    ViewAdapter loaderAdapter;
    ViewAdapter loadingFooterAdapter;
    ItemAdapter<Playlist> playlistsAdapter;
    ViewAdapter retryFooterAdapter;
    boolean searchExpanded;
    TextWatcher searchStarterWatcher = new TextWatcher() { // from class: com.vk.music.attach.controller.PlaylistsController.1
        {
            PlaylistsController.this = this;
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            if (TextUtils.isGraphic(s)) {
                PlaylistsController.this.moveNext(PlaylistsSearchController.class);
            }
        }
    };

    @Override // com.vk.music.attach.controller.Controller, android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putBoolean(KEY_SEARCH_EXPANDED, this.searchExpanded);
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            this.searchExpanded = savedInstanceState.getBoolean(KEY_SEARCH_EXPANDED);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewAttached(@Nullable Bundle savedState) {
        ItemViewHolder.Builder.Init init;
        IdResolver idResolver;
        super.onViewAttached(savedState);
        Bundle sharedState = getHostController().getSharedState(Search.class);
        if (sharedState != null) {
            this.searchExpanded = sharedState.getBoolean(Search.EXPANDED);
            getHostController().removeSharedState(Search.class);
        }
        if (this.contentAdapter == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            this.contentAdapter = new MergeRecyclerAdapter();
            this.contentAdapter.setHasStableIds(true);
            ItemAdapter.Builder layout = new ItemAdapter.Builder(inflater).layout(R.layout.music_playlist_item1);
            init = PlaylistsController$$Lambda$1.instance;
            ItemAdapter.Builder viewType = layout.init(init).binder(new PlaylistBinder(Resourcer.of(getContext()))).registerClickListener(PlaylistsController$$Lambda$2.lambdaFactory$(this)).viewType(1);
            idResolver = PlaylistsController$$Lambda$3.instance;
            this.playlistsAdapter = viewType.resolver(idResolver).build();
            this.contentAdapter.addAdapter(this.playlistsAdapter);
            this.loadingFooterAdapter = new ViewAdapter(inflater, (int) R.layout.music_footer_loading, 2);
            this.contentAdapter.addAdapter(this.loadingFooterAdapter);
            this.errorAdapter = new ViewAdapter(PlaylistsController$$Lambda$4.lambdaFactory$(this, inflater), 0);
            this.emptyAdapter = new ViewAdapter(PlaylistsController$$Lambda$5.lambdaFactory$(inflater), 0);
            this.loaderAdapter = new ViewAdapter(inflater, (int) R.layout.music_loader, 0);
        }
        getHostController().getLeftButton().setImageResource(R.drawable.ic_ab_back);
        getHostController().getTitleView().setText(R.string.music_title_playlists);
        getHostController().getSearchView().setText((CharSequence) null);
        getHostController().getSearchView().addTextChangedListener(this.searchStarterWatcher);
        getHostController().getPlaylistsLoader().subscribe(this);
        bind(getHostController().getPlaylistsLoader());
        bindExpanded();
        if (this.searchExpanded) {
            KeyboardUtils.showKeyboard(getHostController().getSearchView());
        } else {
            KeyboardUtils.hideKeyboard(getContext());
        }
    }

    public /* synthetic */ void lambda$onViewAttached$1(View v, Playlist playlist, int position) {
        onPlaylistClick(playlist);
    }

    public /* synthetic */ View lambda$onViewAttached$3(LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_error, viewGroup, false);
        view.findViewById(R.id.error_retry).setOnClickListener(PlaylistsController$$Lambda$6.lambdaFactory$(this));
        return view;
    }

    public /* synthetic */ void lambda$null$2(View v) {
        onRetryButtonClick();
    }

    public static /* synthetic */ View lambda$onViewAttached$4(LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_empty, viewGroup, false);
        ((TextView) view.findViewById(R.id.empty_text)).setText(R.string.music_playlists_empty_text);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewDetached() {
        super.onViewDetached();
        getHostController().getSearchView().removeTextChangedListener(this.searchStarterWatcher);
        getHostController().getPlaylistsLoader().unsubscribe(this);
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        getHostController().getPlaylistsLoader().load();
    }

    @Override // com.vk.music.attach.controller.Controller
    public boolean onBackClicked() {
        if (this.searchExpanded) {
            this.searchExpanded = false;
            bindExpanded();
            KeyboardUtils.hideKeyboard(getContext());
            return true;
        }
        return super.onBackClicked();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onLeftButtonClicked() {
        super.onLeftButtonClicked();
        if (this.searchExpanded) {
            this.searchExpanded = false;
            bindExpanded();
            KeyboardUtils.hideKeyboard(getContext());
            return;
        }
        moveBack();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onRightButtonClicked() {
        super.onRightButtonClicked();
        if (this.searchExpanded) {
            getHostController().startVoiceSearch();
            return;
        }
        this.searchExpanded = true;
        bindExpanded();
        KeyboardUtils.showKeyboard(getHostController().getSearchView());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onRefreshRequested() {
        super.onRefreshRequested();
        getHostController().getPlaylistsLoader().load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onEndOfListReached() {
        super.onEndOfListReached();
        if (getHostController().getPlaylistsLoader().canLoadMore()) {
            getHostController().getPlaylistsLoader().loadMore();
        }
    }

    @Override // com.vk.music.attach.controller.Controller
    public void onVoiceSearchResult(@NonNull String query) {
        super.onVoiceSearchResult(query);
        getHostController().getSearchView().setText(query);
        getHostController().getSearchView().setSelection(query.length());
    }

    private void onRetryButtonClick() {
        getHostController().setAdapter(this.loaderAdapter);
        getHostController().getPlaylistsLoader().load();
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

    private void bind(@NonNull PlaylistsLoader loader) {
        List<Playlist> playlists = loader.getPlaylists();
        if (playlists == null) {
            if (loader.getReason() == null) {
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
        if (playlists.isEmpty()) {
            if (getHostController().getAdapter() != this.emptyAdapter) {
                getHostController().setAdapter(this.emptyAdapter);
                return;
            }
            return;
        }
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
        this.playlistsAdapter.setItems(playlists);
        if (getHostController().getAdapter() != this.contentAdapter) {
            getHostController().setAdapter(this.contentAdapter);
        }
    }

    private void bindExpanded() {
        if (this.searchExpanded) {
            if (getHostController().supportsVoiceSearch()) {
                getHostController().getRightButton().setImageResource(R.drawable.ic_ab_voicesearch);
                getHostController().getRightButton().setVisibility(0);
            } else {
                getHostController().getRightButton().setVisibility(8);
            }
            getHostController().getSearchView().setVisibility(0);
            getHostController().getTitleView().setVisibility(8);
            return;
        }
        getHostController().getRightButton().setImageResource(R.drawable.ic_menu_search);
        getHostController().getRightButton().setVisibility(0);
        getHostController().getSearchView().setVisibility(8);
        getHostController().getTitleView().setVisibility(0);
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Callback
    public void onPlaylistsLoadingDone(@NonNull PlaylistsLoader loader) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Callback
    public void onPlaylistsLoadingError(@NonNull PlaylistsLoader loader, @NonNull String reason) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Callback
    public void onPlaylistsLoadingMoreDone(@NonNull PlaylistsLoader loader, @NonNull List<Playlist> playlists) {
        this.playlistsAdapter.addItems(playlists);
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Callback
    public void onPlaylistsLoadingMoreError(@NonNull PlaylistsLoader loader, @NonNull String reason) {
    }
}
