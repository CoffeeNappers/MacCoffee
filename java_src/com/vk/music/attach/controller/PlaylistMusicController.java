package com.vk.music.attach.controller;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import com.vk.core.util.KeyboardUtils;
import com.vk.music.attach.loader.PlaylistMusicLoader;
import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public final class PlaylistMusicController extends Controller implements PlaylistMusicLoader.Callback {
    public static final String ARG_PLAYLIST = "PlaylistMusicController.arg.playlist";
    private static final int VIEW_TYPE_FOOTER1 = 2;
    private static final int VIEW_TYPE_FOOTER2 = 3;
    private static final int VIEW_TYPE_MUSIC_TRACK = 1;
    MergeRecyclerAdapter contentAdapter;
    ViewAdapter emptyAdapter;
    ViewAdapter errorAdapter;
    ViewAdapter loaderAdapter;
    ViewAdapter loadingFooterAdapter;
    ItemAdapter<MusicTrack> musicTrackAdapter;
    Playlist playlist;
    ViewAdapter retryFooterAdapter;

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.playlist = (Playlist) getArguments().getParcelable(ARG_PLAYLIST);
        if (this.playlist != null) {
            getHostController().getPlaylistMusicLoader().setPlaylist(this.playlist);
        } else {
            Log.w("vk", "PlaylistMusicController: Playlist must be passed as an argument");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewAttached(@Nullable Bundle savedState) {
        super.onViewAttached(savedState);
        if (this.contentAdapter == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            this.musicTrackAdapter = AdapterHelper.createMusicAdapter(inflater, getHostController(), 1);
            this.loadingFooterAdapter = AdapterHelper.createLoadingFooterAdapter(inflater, 2);
            this.errorAdapter = AdapterHelper.createErrorAdapter(inflater, PlaylistMusicController$$Lambda$1.lambdaFactory$(this));
            this.emptyAdapter = AdapterHelper.createEmptyAdapter(inflater);
            this.loaderAdapter = AdapterHelper.createLoaderAdapter(inflater);
            this.contentAdapter = new MergeRecyclerAdapter();
            this.contentAdapter.setHasStableIds(true);
            this.contentAdapter.addAdapter(this.musicTrackAdapter);
            this.contentAdapter.addAdapter(this.loadingFooterAdapter);
        }
        getHostController().getLeftButton().setImageResource(R.drawable.ic_ab_back);
        getHostController().getRightButton().setVisibility(8);
        getHostController().getSearchView().setVisibility(8);
        getHostController().getTitleView().setVisibility(0);
        getHostController().getTitleView().setText(this.playlist != null ? this.playlist.title : null);
        getHostController().getPlaylistMusicLoader().subscribe(this);
        bind(getHostController().getPlaylistMusicLoader());
        KeyboardUtils.hideKeyboard(getContext());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewDetached() {
        super.onViewDetached();
        getHostController().getPlaylistMusicLoader().unsubscribe(this);
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        getHostController().getPlaylistMusicLoader().load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onLeftButtonClicked() {
        super.onLeftButtonClicked();
        moveBack();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onRefreshRequested() {
        super.onRefreshRequested();
        getHostController().getPlaylistMusicLoader().load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onEndOfListReached() {
        super.onEndOfListReached();
        if (getHostController().getPlaylistMusicLoader().canLoadMore()) {
            getHostController().getPlaylistMusicLoader().loadMore();
        }
    }

    public void onRetryButtonClick() {
        getHostController().setAdapter(this.loaderAdapter);
        getHostController().getPlaylistMusicLoader().load();
    }

    private void bind(@NonNull PlaylistMusicLoader loader) {
        List<MusicTrack> musicTracks = loader.getMusicTracks();
        if (musicTracks == null) {
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
        if (musicTracks.isEmpty()) {
            if (getHostController().getAdapter() != this.emptyAdapter) {
                getHostController().setAdapter(this.emptyAdapter);
                return;
            }
            return;
        }
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
        this.musicTrackAdapter.setItems(musicTracks);
        if (getHostController().getAdapter() != this.contentAdapter) {
            getHostController().setAdapter(this.contentAdapter);
        }
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Callback
    public void onMusicLoadingDone(@NonNull PlaylistMusicLoader loader) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Callback
    public void onMusicLoadingError(@NonNull PlaylistMusicLoader loader, @NonNull String reason) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Callback
    public void onMusicLoadingMoreDone(@NonNull PlaylistMusicLoader loader, @NonNull List<MusicTrack> musicTracks) {
        this.musicTrackAdapter.addItems(musicTracks);
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Callback
    public void onMusicLoadingMoreError(@NonNull PlaylistMusicLoader loader, @NonNull String reason) {
    }
}
