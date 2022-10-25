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
import com.vk.music.attach.loader.MusicLoader;
import com.vk.music.attach.sharedstate.Search;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.MusicTrack;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public final class MyMusicController extends Controller implements MusicLoader.Callback {
    private static final String KEY_SEARCH_EXPANDED = "MyMusicController.key.searchExpanded";
    private static final int VIEW_TYPE_FOOTER1 = 3;
    private static final int VIEW_TYPE_FOOTER2 = 4;
    private static final int VIEW_TYPE_HEADER = 1;
    private static final int VIEW_TYPE_MUSIC_TRACK = 2;
    MergeRecyclerAdapter contentAdapter;
    ViewAdapter emptyAdapter;
    ViewAdapter errorAdapter;
    ViewAdapter loaderAdapter;
    ViewAdapter loadingFooterAdapter;
    ItemAdapter<MusicTrack> musicTrackAdapter;
    TextView playlistCounterView;
    ViewAdapter playlistsHeaderAdapter;
    ViewAdapter retryFooterAdapter;
    boolean searchExpanded;
    TextWatcher searchStarterWatcher = new TextWatcher() { // from class: com.vk.music.attach.controller.MyMusicController.1
        {
            MyMusicController.this = this;
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
                MyMusicController.this.moveNext(MyMusicSearchController.class);
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
        super.onViewAttached(savedState);
        Bundle sharedState = getHostController().getSharedState(Search.class);
        if (sharedState != null) {
            this.searchExpanded = sharedState.getBoolean(Search.EXPANDED);
            if (!this.searchExpanded) {
                KeyboardUtils.hideKeyboard(getContext());
            }
            getHostController().removeSharedState(Search.class);
        }
        if (this.contentAdapter == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            this.playlistsHeaderAdapter = new ViewAdapter(MyMusicController$$Lambda$1.lambdaFactory$(this, inflater), 1);
            this.musicTrackAdapter = AdapterHelper.createMusicAdapter(inflater, getHostController(), 2);
            this.loadingFooterAdapter = AdapterHelper.createLoadingFooterAdapter(inflater, 3);
            this.errorAdapter = AdapterHelper.createErrorAdapter(inflater, MyMusicController$$Lambda$2.lambdaFactory$(this));
            this.emptyAdapter = AdapterHelper.createEmptyAdapter(inflater);
            this.loaderAdapter = AdapterHelper.createLoaderAdapter(inflater);
            this.contentAdapter = new MergeRecyclerAdapter();
            this.contentAdapter.setHasStableIds(true);
            this.contentAdapter.addAdapter(this.playlistsHeaderAdapter);
            this.contentAdapter.addAdapter(this.musicTrackAdapter);
            this.contentAdapter.addAdapter(this.loadingFooterAdapter);
        }
        getHostController().getTitleView().setText(R.string.music_title_attach_music);
        getHostController().getSearchView().setText((CharSequence) null);
        getHostController().getSearchView().addTextChangedListener(this.searchStarterWatcher);
        getHostController().getMusicLoader().subscribe(this);
        bind(getHostController().getMusicLoader());
        bindExpanded();
    }

    public /* synthetic */ View lambda$onViewAttached$1(LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.music_header_playlists, viewGroup, false);
        view.findViewById(R.id.music_playlists_button).setOnClickListener(MyMusicController$$Lambda$3.lambdaFactory$(this));
        this.playlistCounterView = (TextView) view.findViewById(R.id.music_playlists_counter);
        updatePlaylistCounterView();
        return view;
    }

    public /* synthetic */ void lambda$null$0(View v) {
        onPlaylistsButtonClick();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewDetached() {
        super.onViewDetached();
        this.playlistCounterView = null;
        getHostController().getSearchView().removeTextChangedListener(this.searchStarterWatcher);
        getHostController().getMusicLoader().unsubscribe(this);
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        getHostController().getMusicLoader().load();
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
        getHostController().close();
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
        getHostController().getMusicLoader().load();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onEndOfListReached() {
        super.onEndOfListReached();
        if (getHostController().getMusicLoader().canLoadMore()) {
            getHostController().getMusicLoader().loadMore();
        }
    }

    private void onPlaylistsButtonClick() {
        moveNext(PlaylistsController.class);
    }

    public void onRetryButtonClick() {
        getHostController().setAdapter(this.loaderAdapter);
        getHostController().getMusicLoader().load();
    }

    @Override // com.vk.music.attach.controller.Controller
    public void onVoiceSearchResult(@NonNull String query) {
        super.onVoiceSearchResult(query);
        getHostController().getSearchView().setText(query);
        getHostController().getSearchView().setSelection(query.length());
    }

    private void updatePlaylistCounterView() {
        Integer playlistsCount = getHostController().getMusicLoader().getPlaylistsCount();
        ViewUtils.setText(this.playlistCounterView, playlistsCount != null ? String.valueOf(playlistsCount) : "", true);
    }

    private void bind(@NonNull MusicLoader loader) {
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
        updatePlaylistCounterView();
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
        this.musicTrackAdapter.setItems(musicTracks);
        if (getHostController().getAdapter() != this.contentAdapter) {
            getHostController().setAdapter(this.contentAdapter);
        }
    }

    private void bindExpanded() {
        this.playlistsHeaderAdapter.setEnabled(!this.searchExpanded);
        if (this.searchExpanded) {
            getHostController().getLeftButton().setImageResource(R.drawable.ic_ab_back);
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
        getHostController().getLeftButton().setImageResource(R.drawable.picker_ic_close_24dp);
        getHostController().getRightButton().setImageResource(R.drawable.ic_menu_search);
        getHostController().getRightButton().setVisibility(0);
        getHostController().getSearchView().setVisibility(8);
        getHostController().getTitleView().setVisibility(0);
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Callback
    public void onMusicLoadingDone(@NonNull MusicLoader loader) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Callback
    public void onMusicLoadingError(@NonNull MusicLoader loader, @NonNull String reason) {
        bind(loader);
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Callback
    public void onMusicLoadingMoreDone(@NonNull MusicLoader loader, @NonNull List<MusicTrack> musicTracks) {
        this.musicTrackAdapter.addItems(musicTracks);
        this.loadingFooterAdapter.setEnabled(loader.canLoadMore());
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Callback
    public void onMusicLoadingMoreError(@NonNull MusicLoader loader, @NonNull String reason) {
    }
}
