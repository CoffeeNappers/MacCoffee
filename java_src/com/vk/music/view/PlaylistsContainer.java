package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.ViewAnimator;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.Resourcer;
import com.vk.core.util.ToastUtils;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.EditPlaylistFragment;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.PlaylistActionsBottomSheet;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.view.LastReachedScrollListener;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlaylistBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.utils.Utils;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class PlaylistsContainer extends FrameLayout implements PlaylistsModel.Callback {
    private static final int VIEW_TYPE_FOOTER = 3;
    private static final int VIEW_TYPE_HEADER = 1;
    private static final int VIEW_TYPE_PLAYLIST = 2;
    final Activity activity;
    final ViewAdapter addPlaylistAdapter;
    final ViewAnimator animator;
    final ErrorViewHelper errorViewHelper;
    final LayoutInflater inflater;
    final LifecycleHandler lifecycleHandler;
    final ViewAdapter loadingFooterAdapter;
    final PlaylistsModel model;
    final ItemAdapter<Playlist> playlistAdapter;
    final View progressView;
    final RecyclerView recyclerView;
    final SwipeRefreshLayout refreshLayout;
    final UserListener userListener;

    /* loaded from: classes2.dex */
    public final class UserListener extends LifecycleListener implements ActionsBottomSheet.Callback<Playlist>, View.OnClickListener, SwipeRefreshLayout.OnRefreshListener, LastReachedScrollListener.OnLastReachedListener {
        private UserListener() {
            PlaylistsContainer.this = r1;
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStarted(@NonNull Activity activity) {
            super.onActivityStarted(activity);
            PlaylistsContainer.this.model.loadPlaylists();
        }

        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.Callback
        public void onActionClick(@NonNull Playlist playlist, int actionId) {
            DialogInterface.OnClickListener onClickListener;
            switch (actionId) {
                case R.id.music_action_header /* 2131755104 */:
                    onClick(playlist);
                    return;
                case R.id.music_action_play_next /* 2131755105 */:
                    new AudioGetPlaylist.Builder(playlist).audioOffset(0).audioCount(100).build().setCallback(new Callback<AudioGetPlaylist.Result>() { // from class: com.vk.music.view.PlaylistsContainer.UserListener.1
                        {
                            UserListener.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(AudioGetPlaylist.Result result) {
                            if (result != null && result.musicTracks != null && result.musicTracks.size() > 0) {
                                AudioFacade.addToPlayNext(PlaylistsContainer.this.getContext(), result.musicTracks);
                            }
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                        }
                    }).exec(this);
                    return;
                case R.id.music_action_play_similar /* 2131755106 */:
                default:
                    return;
                case R.id.music_action_remove_from_my_music /* 2131755107 */:
                    if (PlaylistsContainer.this.model.canAddPlaylist(playlist)) {
                        PlaylistsContainer.this.model.addPlaylist(playlist);
                        return;
                    } else if (PlaylistsContainer.this.model.canDeletePlaylist(playlist)) {
                        VKAlertDialog.Builder builder = new VKAlertDialog.Builder(PlaylistsContainer.this.getContext());
                        builder.setTitle(R.string.confirm);
                        builder.setMessage(R.string.music_alert_remove_playlist_message);
                        builder.setPositiveButton(R.string.picker_yes, PlaylistsContainer$UserListener$$Lambda$1.lambdaFactory$(this, playlist));
                        onClickListener = PlaylistsContainer$UserListener$$Lambda$2.instance;
                        builder.setNegativeButton(R.string.picker_no, onClickListener);
                        builder.show();
                        return;
                    } else {
                        return;
                    }
                case R.id.music_action_share /* 2131755108 */:
                    Sharing.from(PlaylistsContainer.this.activity).withAttachment(Attachments.createInfo(playlist, "playlists")).withActions(Actions.createInfo(playlist)).share();
                    return;
            }
        }

        public /* synthetic */ void lambda$onActionClick$0(@NonNull Playlist playlist, DialogInterface dialog, int which) {
            PlaylistsContainer.this.model.deletePlaylist(playlist);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.error_retry /* 2131755426 */:
                    PlaylistsContainer.this.onErrorRetryClick();
                    return;
                case R.id.music_add_playlist_btn /* 2131755984 */:
                    new EditPlaylistFragment.Builder().go(PlaylistsContainer.this.activity);
                    return;
                case R.id.back_btn /* 2131755992 */:
                    PlaylistsContainer.this.activity.finish();
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
        public void onRefresh() {
            PlaylistsContainer.this.model.loadPlaylists();
        }

        @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
        public void onLastReached() {
            if (PlaylistsContainer.this.model.canLoadMore()) {
                PlaylistsContainer.this.model.loadMore();
            }
        }

        public void onClick(@NonNull Playlist playlist) {
            if (PlaylistsContainer.this.model.isSelect()) {
                Intent intent = new Intent();
                intent.putExtra("result", playlist);
                PlaylistsContainer.this.activity.setResult(-1, intent);
                PlaylistsContainer.this.activity.finish();
                return;
            }
            Playlist original = PlaylistsContainer.this.model.getOriginalPlaylist(playlist);
            new PlaylistFragment.Builder(original).go(PlaylistsContainer.this.activity);
        }

        void onMenuClick(@NonNull Playlist playlist) {
            new PlaylistActionsBottomSheet.Builder(playlist, this, PlaylistsContainer.this.model.canAddPlaylist(playlist), PlaylistsContainer.this.model.canDeletePlaylist(playlist)).show(PlaylistsContainer.this.activity);
        }
    }

    void onErrorRetryClick() {
        this.model.loadPlaylists();
        this.animator.setDisplayedChild(indexOfChild(this.progressView));
    }

    public PlaylistsContainer(Context context, @NonNull PlaylistsModel model) {
        super(context);
        IdResolver idResolver;
        ItemViewHolder.Builder.Init init;
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.inflater = LayoutInflater.from(context);
        this.userListener = new UserListener();
        this.inflater.inflate(R.layout.music_playlists, this);
        findViewById(R.id.back_btn).setOnClickListener(this.userListener);
        this.animator = (ViewAnimator) findViewById(R.id.content_animator);
        this.progressView = findViewById(R.id.progress);
        this.errorViewHelper = new ErrorViewHelper(findViewById(R.id.error));
        this.errorViewHelper.setOnRetryListener(PlaylistsContainer$$Lambda$1.lambdaFactory$(this));
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.refresh_layout);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        SwipeRefreshLayout swipeRefreshLayout = this.refreshLayout;
        model.getClass();
        swipeRefreshLayout.setOnRefreshListener(PlaylistsContainer$$Lambda$2.lambdaFactory$(model));
        this.recyclerView = (RecyclerView) findViewById(R.id.list);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this.activity);
        this.recyclerView.setLayoutManager(layoutManager);
        LastReachedScrollListener scrollListener = new LastReachedScrollListener(layoutManager);
        scrollListener.setListener(this.userListener);
        this.recyclerView.addOnScrollListener(scrollListener);
        TextView title = (TextView) findViewById(R.id.title);
        title.setText(model.getTitle(getContext()));
        this.loadingFooterAdapter = new ViewAdapter(this.inflater, (int) R.layout.music_footer_loading, 3);
        ItemViewHolder.ClickListener<Playlist> playlistClickListener = PlaylistsContainer$$Lambda$3.lambdaFactory$(this);
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.setHasStableIds(true);
        ItemAdapter.Builder registerClickListener = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_playlist_item1).binder(new PlaylistBinder(Resourcer.of(context))).registerClickListener(playlistClickListener);
        idResolver = PlaylistsContainer$$Lambda$4.instance;
        ItemAdapter.Builder<Playlist> builder = registerClickListener.resolver(idResolver).viewType(2);
        if (model.isSelect()) {
            init = PlaylistsContainer$$Lambda$5.instance;
            builder.init(init);
            this.addPlaylistAdapter = null;
        } else {
            builder.registerClickListener(R.id.playlist_menu, playlistClickListener);
            this.addPlaylistAdapter = new ViewAdapter(PlaylistsContainer$$Lambda$6.lambdaFactory$(this), 1);
            adapter.addAdapter(this.addPlaylistAdapter);
        }
        this.playlistAdapter = builder.build();
        adapter.addAdapter(this.playlistAdapter);
        adapter.addAdapter(this.loadingFooterAdapter);
        this.recyclerView.setAdapter(adapter);
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
    }

    public /* synthetic */ void lambda$new$0(View v) {
        onErrorRetryClick();
    }

    public /* synthetic */ void lambda$new$1(View v, Playlist playlist, int position) {
        if (v.getId() == R.id.playlist_menu) {
            this.userListener.onMenuClick(playlist);
        } else {
            this.userListener.onClick(playlist);
        }
    }

    public /* synthetic */ View lambda$new$3(ViewGroup viewGroup) {
        TextView v = (TextView) this.inflater.inflate(R.layout.music_header_add_playlist, viewGroup, false);
        DrawableUtils.setLeft(v, (int) R.drawable.ic_new_playlist_24dp, (int) R.color.music_action_button_blue);
        v.setOnClickListener(this.userListener);
        return v;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.model.subscribe(this);
        PlaylistActionsBottomSheet.restoreCallback(this.activity, this.userListener);
        bind();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.model.unsubscribe(this);
        PlaylistActionsBottomSheet.restoreCallback(this.activity, null);
    }

    private void bind() {
        List<Playlist> playlists = this.model.getPlaylists();
        if (playlists == null) {
            if (this.model.getError() != null) {
                this.animator.setDisplayedChild(this.animator.indexOfChild(this.errorViewHelper.getView()));
                return;
            }
            this.animator.setDisplayedChild(this.animator.indexOfChild(this.progressView));
            this.model.loadPlaylists();
            return;
        }
        this.animator.setDisplayedChild(this.animator.indexOfChild(this.refreshLayout));
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (this.addPlaylistAdapter != null) {
            this.addPlaylistAdapter.setEnabled(this.model.canAddPlaylist());
        }
        this.loadingFooterAdapter.setEnabled(this.model.canLoadMore());
        this.playlistAdapter.setItems(playlists);
    }

    private void updatePlaylist(@NonNull Playlist playlist) {
        int childCount = this.recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView.ViewHolder holder = this.recyclerView.findContainingViewHolder(this.recyclerView.getChildAt(i));
            if (holder != null && holder.getItemViewType() == 2 && holder.getItemId() == playlist.getPid()) {
                ((ItemViewHolder) holder).rebind(playlist);
            }
        }
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onLoadingDone(@NonNull PlaylistsModel model) {
        bind();
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onLoadingError(@NonNull PlaylistsModel model, @NonNull ErrorResponse response) {
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (model.getPlaylists() == null) {
            this.animator.setDisplayedChild(this.animator.indexOfChild(this.errorViewHelper.getView()));
            response.bindErrorView(this.errorViewHelper.getView());
        }
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onMoreLoadingDone(@NonNull PlaylistsModel model, @NonNull List<Playlist> playlists) {
        this.playlistAdapter.addItems(playlists);
        this.loadingFooterAdapter.setEnabled(model.canLoadMore());
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onMoreLoadingError(@NonNull PlaylistsModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onAdditionDone(@NonNull PlaylistsModel model, @NonNull Playlist playlist) {
        ToastUtils.showToast((int) R.string.music_toast_playlist_added);
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onAdditionError(@NonNull PlaylistsModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onDeletionDone(@NonNull PlaylistsModel model, @NonNull Playlist playlist) {
        this.playlistAdapter.removeItem(playlist);
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onDeletionError(@NonNull PlaylistsModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onPlaylistChanged(@NonNull PlaylistsModel model, @NonNull Playlist playlist) {
        updatePlaylist(playlist);
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onPlaylistCreated(@NonNull PlaylistsModel model, @NonNull Playlist playlist) {
        this.playlistAdapter.addItems(0, Collections.singletonList(playlist));
    }

    @Override // com.vk.music.model.PlaylistsModel.Callback
    public void onPlaylistRemoved(@NonNull PlaylistsModel model, @NonNull Playlist playlist) {
        this.playlistAdapter.removeItem(playlist);
    }
}
