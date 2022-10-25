package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.ViewAnimator;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.ToastUtils;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.EditPlaylistFragment;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.AudioActionsBottomSheet;
import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.PlayerModel;
import com.vk.music.view.LastReachedScrollListener;
import com.vk.music.view.adapter.HorizontalPlaylistBinder;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlayingMusicBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.utils.Utils;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.views.UsableRecyclerView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class MusicContainer extends ViewAnimator implements MusicModel.Callback, PlayerModel.Callback, MusicTrackModel.Callback {
    private static final int VIEW_TYPE_FOOTER = 6;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_HEADER2 = 2;
    private static final int VIEW_TYPE_HEADER3 = 3;
    private static final int VIEW_TYPE_MUSIC_TRACK = 5;
    private static final int VIEW_TYPE_PLAYLIST = 4;
    final Activity activity;
    final ViewAdapter addPlaylistHeaderAdapter;
    final ErrorViewHelper errorViewHelper;
    Host host;
    final LayoutInflater inflater;
    final ViewAdapter loadingFooterAdapter;
    final MusicModel model;
    final ItemAdapter<MusicTrack> musicTracksAdapter;
    RecyclerView playlistRecyclerView;
    final ItemAdapter<Playlist> playlistsAdapter;
    final ViewAdapter playlistsHeaderAdapter;
    View progressView;
    UsableRecyclerView recyclerView;
    SwipeRefreshLayout refreshLayout;
    final ViewAdapter shuffleHeaderAdapter;
    final UserListener userListener;

    /* loaded from: classes2.dex */
    public interface Host {
        void requestPlaylist();
    }

    /* loaded from: classes2.dex */
    public final class UserListener implements ActionsBottomSheet.Callback<MusicTrack>, View.OnClickListener, SwipeRefreshLayout.OnRefreshListener, LastReachedScrollListener.OnLastReachedListener {
        private UserListener() {
            MusicContainer.this = r1;
        }

        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.Callback
        public void onActionClick(@NonNull MusicTrack musicTrack, int actionId) {
            DialogInterface.OnClickListener onClickListener;
            switch (actionId) {
                case R.id.music_action_add_to_my_music /* 2131755102 */:
                    if (MusicContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack)) {
                        MusicContainer.this.model.getMusicTrackModel().addAudio(musicTrack, null);
                        return;
                    }
                    return;
                case R.id.music_action_add_to_playlist /* 2131755103 */:
                    MusicContainer.this.model.getMusicTrackModel().setTarget(musicTrack);
                    if (MusicContainer.this.host != null) {
                        MusicContainer.this.host.requestPlaylist();
                        return;
                    }
                    return;
                case R.id.music_action_header /* 2131755104 */:
                default:
                    return;
                case R.id.music_action_play_next /* 2131755105 */:
                    MusicContainer.this.model.getPlayerModel().addToPlayNext(MusicContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_play_similar /* 2131755106 */:
                    MusicContainer.this.model.getPlayerModel().loadAndPlayTheSame(MusicContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_remove_from_my_music /* 2131755107 */:
                    if (MusicContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)) {
                        VKAlertDialog.Builder builder = new VKAlertDialog.Builder(MusicContainer.this.getContext());
                        builder.setTitle(R.string.confirm);
                        builder.setMessage(R.string.music_alert_remove_audio_message);
                        builder.setPositiveButton(R.string.picker_yes, MusicContainer$UserListener$$Lambda$1.lambdaFactory$(this, musicTrack));
                        onClickListener = MusicContainer$UserListener$$Lambda$2.instance;
                        builder.setNegativeButton(R.string.picker_no, onClickListener);
                        builder.show();
                        return;
                    }
                    return;
                case R.id.music_action_share /* 2131755108 */:
                    Sharing.from(MusicContainer.this.activity).withAttachment(Attachments.createInfo(musicTrack, "music")).withActions(Actions.createInfo(musicTrack)).share();
                    return;
                case R.id.music_action_toggle_download /* 2131755109 */:
                    if (!MusicContainer.this.model.getMusicTrackModel().isDownloaded(musicTrack)) {
                        MusicContainer.this.model.getMusicTrackModel().download(musicTrack, MusicContainer.this.getContext());
                        return;
                    } else {
                        MusicContainer.this.model.getMusicTrackModel().clearDownloaded(musicTrack);
                        return;
                    }
            }
        }

        public /* synthetic */ void lambda$onActionClick$0(@NonNull MusicTrack musicTrack, DialogInterface dialog, int which) {
            MusicContainer.this.model.getMusicTrackModel().removeAudio(musicTrack, null);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.error_retry /* 2131755426 */:
                    MusicContainer.this.onErrorRetryClick();
                    return;
                case R.id.music_add_playlist_btn /* 2131755984 */:
                    new EditPlaylistFragment.Builder().go(MusicContainer.this.activity);
                    return;
                case R.id.music_show_all_btn /* 2131755988 */:
                    new PlaylistsFragment.Builder().ownerId(MusicContainer.this.model.getOwnerId()).go(MusicContainer.this.activity);
                    return;
                case R.id.music_shuffle_btn /* 2131755989 */:
                    MusicContainer.this.model.loadAndPlayShuffleAll(v.getContext());
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
        public void onRefresh() {
            MusicContainer.this.model.loadPage();
        }

        @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
        public void onLastReached() {
            if (MusicContainer.this.model.canLoadMoreAudio()) {
                MusicContainer.this.model.loadMoreAudio();
            }
        }

        public void onClick(@NonNull Playlist playlist) {
            new PlaylistFragment.Builder(MusicContainer.this.model.getOriginalPlaylist(playlist)).go(MusicContainer.this.activity);
        }

        public void onClick(@NonNull MusicTrack musicTrack) {
            MusicContainer.this.model.getPlayerModel().togglePlayer(musicTrack, MusicContainer.this.model.getMusicTracks());
        }

        void onMenuClick(@NonNull MusicTrack musicTrack) {
            new AudioActionsBottomSheet.Builder(musicTrack, this, MusicContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack), MusicContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)).show(MusicContainer.this.activity);
        }
    }

    void onErrorRetryClick() {
        this.model.loadPage();
        setDisplayedChild(indexOfChild(this.progressView));
    }

    public MusicContainer(@NonNull Context context, @NonNull MusicModel model) {
        super(context);
        IdResolver idResolver;
        IdResolver idResolver2;
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.inflater = LayoutInflater.from(this.activity);
        this.userListener = new UserListener();
        this.inflater.inflate(R.layout.music_page, this);
        setMeasureAllChildren(false);
        this.progressView = findViewById(R.id.progress);
        this.errorViewHelper = new ErrorViewHelper(findViewById(R.id.error));
        this.errorViewHelper.setOnRetryListener(MusicContainer$$Lambda$1.lambdaFactory$(this));
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.refresh_layout);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        this.refreshLayout.setOnRefreshListener(this.userListener);
        this.recyclerView = (UsableRecyclerView) findViewById(R.id.list);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this.activity);
        this.recyclerView.setLayoutManager(layoutManager);
        LastReachedScrollListener scrollListener = new LastReachedScrollListener(layoutManager);
        scrollListener.setListener(this.userListener);
        this.recyclerView.addOnScrollListener(scrollListener);
        ItemAdapter.Builder registerClickListener = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_playlist_item2).binder(new HorizontalPlaylistBinder()).registerClickListener(MusicContainer$$Lambda$2.lambdaFactory$(this));
        idResolver = MusicContainer$$Lambda$3.instance;
        this.playlistsAdapter = registerClickListener.resolver(idResolver).viewType(4).build();
        this.playlistsAdapter.setHasStableIds(true);
        this.playlistsHeaderAdapter = new ViewAdapter(MusicContainer$$Lambda$4.lambdaFactory$(this), 1);
        this.addPlaylistHeaderAdapter = new ViewAdapter(MusicContainer$$Lambda$5.lambdaFactory$(this), 2);
        this.shuffleHeaderAdapter = new ViewAdapter(MusicContainer$$Lambda$6.lambdaFactory$(this), 3);
        this.loadingFooterAdapter = new ViewAdapter(this.inflater, (int) R.layout.music_footer_loading, 6);
        ItemViewHolder.ClickListener<MusicTrack> musicTrackClickListener = MusicContainer$$Lambda$7.lambdaFactory$(this);
        ItemAdapter.Builder registerClickListener2 = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_audio_item1).binder(new PlayingMusicBinder(model.getPlayerModel())).registerClickListener(musicTrackClickListener).registerClickListener(R.id.audio_menu, musicTrackClickListener);
        idResolver2 = MusicContainer$$Lambda$8.instance;
        this.musicTracksAdapter = registerClickListener2.resolver(idResolver2).viewType(5).build();
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.setHasStableIds(true);
        adapter.addAdapter(this.playlistsHeaderAdapter);
        adapter.addAdapter(this.addPlaylistHeaderAdapter);
        adapter.addAdapter(this.shuffleHeaderAdapter);
        adapter.addAdapter(this.musicTracksAdapter);
        adapter.addAdapter(this.loadingFooterAdapter);
        this.recyclerView.setAdapter(adapter);
    }

    public /* synthetic */ void lambda$new$0(View v) {
        onErrorRetryClick();
    }

    public /* synthetic */ void lambda$new$1(View v, Playlist playlist, int position) {
        this.userListener.onClick(playlist);
    }

    public /* synthetic */ View lambda$new$2(ViewGroup viewGroup) {
        View v = this.inflater.inflate(R.layout.music_header_scrolling_block, viewGroup, false);
        ((TextView) v.findViewById(R.id.music_block_title)).setText(R.string.music_title_playlists);
        v.findViewById(R.id.music_show_all_btn).setOnClickListener(this.userListener);
        this.playlistRecyclerView = (RecyclerView) v.findViewById(R.id.list);
        this.playlistRecyclerView.setHasFixedSize(true);
        this.playlistRecyclerView.setLayoutManager(new LinearLayoutManager(this.activity, 0, false));
        this.playlistRecyclerView.setAdapter(this.playlistsAdapter);
        this.playlistRecyclerView.setNestedScrollingEnabled(false);
        return v;
    }

    public /* synthetic */ View lambda$new$3(ViewGroup viewGroup) {
        TextView v = (TextView) this.inflater.inflate(R.layout.music_header_add_playlist, viewGroup, false);
        DrawableUtils.setLeft(v, (int) R.drawable.ic_new_playlist_24dp, (int) R.color.music_action_button_blue);
        v.setOnClickListener(this.userListener);
        return v;
    }

    public /* synthetic */ View lambda$new$4(ViewGroup viewGroup) {
        TextView v = (TextView) this.inflater.inflate(R.layout.music_header_shuffle, viewGroup, false);
        DrawableUtils.setLeft(v, (int) R.drawable.ic_shuffle_24dp, (int) R.color.music_action_button_blue);
        v.setOnClickListener(this.userListener);
        return v;
    }

    public /* synthetic */ void lambda$new$5(View v, MusicTrack musicTrack, int position) {
        if (v.getId() == R.id.audio_menu) {
            this.userListener.onMenuClick(musicTrack);
        } else {
            this.userListener.onClick(musicTrack);
        }
    }

    public MusicContainer(Context context, MusicModel model, View emptyView) {
        this(context, model);
        addView(emptyView);
        this.recyclerView.setEmptyView(emptyView);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.model.subscribe(this);
        this.model.getMusicTrackModel().subscribe(this);
        this.model.getPlayerModel().subscribe(this);
        AudioActionsBottomSheet.restoreCallback(this.activity, this.userListener);
        bind();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.model.unsubscribe(this);
        this.model.getMusicTrackModel().unsubscribe(this);
        this.model.getPlayerModel().unsubscribe(this);
        AudioActionsBottomSheet.restoreCallback(this.activity, null);
    }

    public void setHost(@Nullable Host host) {
        this.host = host;
    }

    public void onPlaylistResult(@Nullable Playlist playlist) {
        MusicTrack target;
        if (playlist != null && (target = this.model.getMusicTrackModel().getTarget()) != null) {
            this.model.getMusicTrackModel().addAudio(target, playlist);
        }
    }

    private void bind() {
        boolean z = true;
        List<MusicTrack> musicTracks = this.model.getMusicTracks();
        if (musicTracks == null) {
            if (this.model.getError() != null) {
                setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
                return;
            }
            setDisplayedChild(indexOfChild(this.progressView));
            this.model.loadPage();
            return;
        }
        setDisplayedChild(indexOfChild(this.refreshLayout));
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        List<Playlist> playlists = this.model.getPlaylists();
        boolean hasPlaylists = !playlists.isEmpty();
        this.playlistsHeaderAdapter.setEnabled(hasPlaylists);
        this.addPlaylistHeaderAdapter.setEnabled(!hasPlaylists && this.model.isCurrentUser() && !musicTracks.isEmpty());
        ViewAdapter viewAdapter = this.shuffleHeaderAdapter;
        if (musicTracks.isEmpty()) {
            z = false;
        }
        viewAdapter.setEnabled(z);
        this.loadingFooterAdapter.setEnabled(this.model.canLoadMoreAudio());
        this.playlistsAdapter.setItems(playlists);
        this.musicTracksAdapter.setItems(musicTracks);
    }

    private void updatePlaylist(@NonNull Playlist playlist) {
        if (this.playlistRecyclerView != null) {
            int childCount = this.playlistRecyclerView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                RecyclerView.ViewHolder holder = this.playlistRecyclerView.findContainingViewHolder(this.playlistRecyclerView.getChildAt(i));
                if (holder != null && holder.getItemViewType() == 4 && holder.getItemId() == playlist.getPid()) {
                    ((ItemViewHolder) holder).rebind(playlist);
                }
            }
        }
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onLoadingDone(@NonNull MusicModel model) {
        bind();
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onLoadingError(@NonNull MusicModel model, @NonNull ErrorResponse response) {
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (model.getMusicTracks() == null) {
            setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
            response.bindErrorView(this.errorViewHelper.getView());
        }
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onAudioLoadingDone(@NonNull MusicModel model, @NonNull List<MusicTrack> musicTracks) {
        this.musicTracksAdapter.addItems(musicTracks);
        this.loadingFooterAdapter.setEnabled(model.canLoadMoreAudio());
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onAudioLoadingError(@NonNull MusicModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistChanged(@NonNull MusicModel model, @NonNull Playlist playlist) {
        updatePlaylist(playlist);
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistCreated(@NonNull MusicModel model, @NonNull Playlist playlist) {
        this.playlistsAdapter.addItems(0, Collections.singletonList(playlist));
        syncHeaderEnable();
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistRemoved(@NonNull MusicModel model, @NonNull Playlist playlist) {
        this.playlistsAdapter.removeItem(playlist);
        syncHeaderEnable();
    }

    private void syncHeaderEnable() {
        boolean z = true;
        boolean hasPlaylists = this.playlistsAdapter.getItemCount() > 0;
        this.playlistsHeaderAdapter.setEnabled(hasPlaylists);
        ViewAdapter viewAdapter = this.addPlaylistHeaderAdapter;
        if (hasPlaylists || !this.model.isCurrentUser() || this.musicTracksAdapter.getItemCount() <= 0) {
            z = false;
        }
        viewAdapter.setEnabled(z);
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
        ToastUtils.showToast((int) R.string.music_toast_audio_addition_done);
        this.musicTracksAdapter.addItems(0, Collections.singletonList(musicTrack));
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
        this.musicTracksAdapter.removeItem(musicTrack);
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionToPlaylistDone(@NonNull MusicTrackModel model, @NonNull Playlist playlist) {
        ToastUtils.showToast(getResources().getString(R.string.music_toast_audio_addition_to_playlist_done, playlist.title));
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionToPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalFromPlaylistDone(@NonNull MusicTrackModel model, @NonNull Playlist playlist, @NonNull MusicTrack musicTrack) {
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalFromPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingStopped(@NonNull PlayerModel model) {
        updatePlaying();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingPaused(@NonNull PlayerModel model) {
        updatePlaying();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingResumed(@NonNull PlayerModel model) {
        updatePlaying();
    }

    private void updatePlaying() {
        int childCount = this.recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView.ViewHolder holder = this.recyclerView.findContainingViewHolder(this.recyclerView.getChildAt(i));
            if (holder != null && holder.getItemViewType() == 5) {
                ((ItemViewHolder) holder).rebind();
            }
        }
    }
}
