package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckedTextView;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.ViewAnimator;
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.Resourcer;
import com.vk.core.util.ToastUtils;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.attach.AttachMusicActivity;
import com.vk.music.dto.Playlist;
import com.vk.music.event.MusicEventBus;
import com.vk.music.event.PlaylistRemoved;
import com.vk.music.formatter.PlaylistFormatter;
import com.vk.music.fragment.EditPlaylistFragment;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.fragment.SearchFragment;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.AudioActionsBottomSheet;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.PlayerModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.utils.BoomHelper;
import com.vk.music.view.LastReachedScrollListener;
import com.vk.music.view.adapter.AlbumMusicBinder;
import com.vk.music.view.adapter.CompilationMusicBinder;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlayingMusicBinder;
import com.vk.music.view.adapter.TotalFooterCreatorBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.VoidF;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.utils.Utils;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class PlaylistContainer extends FrameLayout implements PlaylistModel.Callback, PlayerModel.Callback, MusicTrackModel.Callback {
    private static final int REQUEST_CODE_ATTACH_MUSIC = 11;
    private static final int REQUEST_CODE_GET_PLAYLIST = 10;
    private static final int VIEW_TYPE_FOOTER1 = 4;
    private static final int VIEW_TYPE_FOOTER2 = 5;
    private static final int VIEW_TYPE_FOOTER3 = 6;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_HEADER2 = 2;
    private static final int VIEW_TYPE_MUSIC_TRACK = 3;
    private static final int VIEW_TYPE_MUSIC_WITHOUT_NET = 7;
    final Activity activity;
    MergeRecyclerAdapter adapter;
    ViewAnimator animator;
    View editButton;
    ViewAdapter emptyFooterAdapter;
    final ErrorViewHelper errorViewHelper;
    final LayoutInflater inflater;
    ViewAdapter infoHeaderAdapter;
    InfoHeaderCreatorBinder infoHeaderCreatorBinder;
    final LifecycleHandler lifecycleHandler;
    ViewAdapter loadingFooterAdapter;
    final PlaylistModel model;
    ItemAdapter<MusicTrack> musicTracksAdapter;
    ViewAdapter musicWithoutNetAdapter;
    MusicWithoutNetCreatorBinder musicWithoutNetCreatorBinder;
    View progressView;
    RecyclerView recyclerView;
    SwipeRefreshLayout refreshLayout;
    final Resourcer resourcer;
    ViewAdapter shuffleHeaderAdapter;
    TextView titleView;
    ViewAdapter totalFooterAdapter;
    TotalFooterCreatorBinder totalFooterCreatorBinder;
    final UserListener userListener;

    /* loaded from: classes2.dex */
    public final class MusicWithoutNetCreatorBinder implements F1<View, ViewGroup>, VoidF {
        private MusicWithoutNetCreatorBinder() {
            PlaylistContainer.this = r1;
        }

        @Override // com.vkontakte.android.functions.VoidF
        public void f() {
        }

        @Override // com.vkontakte.android.functions.F1
        public View f(ViewGroup group) {
            View.OnClickListener onClickListener;
            View view = LayoutInflater.from(group.getContext()).inflate(R.layout.saved_tracks_header, group, false);
            TextView button = (TextView) view.findViewById(R.id.button);
            onClickListener = PlaylistContainer$MusicWithoutNetCreatorBinder$$Lambda$1.instance;
            button.setOnClickListener(onClickListener);
            button.setText(BoomHelper.isBoomInstalled(group.getContext()) ? R.string.music_saved_playlist_boom_open : R.string.music_saved_playlist_boom_install);
            return view;
        }
    }

    /* loaded from: classes2.dex */
    public final class InfoHeaderCreatorBinder implements F1<View, ViewGroup>, VoidF {
        View.OnClickListener artistListener;
        TextView description;
        CheckedTextView followButton;
        ThumbsImageView image;
        TextView owner;
        View.OnClickListener ownerListener;
        TextView snippet1;
        TextView snippet2;
        TextView title;

        private InfoHeaderCreatorBinder() {
            PlaylistContainer.this = r2;
            this.ownerListener = PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$1.lambdaFactory$(this);
            this.artistListener = PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$2.lambdaFactory$(this);
        }

        public /* synthetic */ void lambda$new$0(View v) {
            PlaylistContainer.this.userListener.onOwnerClick();
        }

        public /* synthetic */ void lambda$new$1(View v) {
            PlaylistContainer.this.userListener.onArtistClick();
        }

        @Override // com.vkontakte.android.functions.F1
        public View f(ViewGroup viewGroup) {
            View view = PlaylistContainer.this.inflater.inflate(R.layout.music_playlist_header_info, viewGroup, false);
            this.image = (ThumbsImageView) view.findViewById(R.id.playlist_image);
            this.title = (TextView) view.findViewById(R.id.playlist_title);
            this.owner = (TextView) view.findViewById(R.id.playlist_owner);
            this.snippet1 = (TextView) view.findViewById(R.id.playlist_snippet1);
            this.snippet2 = (TextView) view.findViewById(R.id.playlist_snippet2);
            this.description = (TextView) view.findViewById(R.id.playlist_description);
            this.followButton = (CheckedTextView) view.findViewById(R.id.playlist_follow_btn);
            if (PlaylistContainer.this.model.isCurrentUser()) {
                this.followButton.setVisibility(8);
            } else {
                this.followButton.setVisibility(0);
                this.followButton.setOnClickListener(PlaylistContainer.this.userListener);
            }
            return view;
        }

        @Override // com.vkontakte.android.functions.VoidF
        public void f() {
            Playlist playlist = PlaylistContainer.this.model.getPlaylist();
            if (playlist != null) {
                if (playlist.photo != null) {
                    this.image.setThumb(playlist.photo);
                } else {
                    this.image.setThumbs(playlist.thumbs);
                }
                this.title.setText(playlist.title);
                if (playlist.ownerId < 0 && playlist.artists != null && !playlist.artists.isEmpty()) {
                    this.owner.setOnClickListener(this.artistListener);
                    this.owner.setTextColor(PlaylistContainer.this.resourcer.colorList(R.color.music_link_text));
                    this.owner.setText(playlist.artists.get(0).name);
                } else if (playlist.type == 1) {
                    if (playlist.artists.size() == 1) {
                        this.owner.setOnClickListener(this.artistListener);
                        this.owner.setTextColor(PlaylistContainer.this.resourcer.colorList(R.color.music_link_text));
                    } else {
                        this.owner.setTextColor(PlaylistContainer.this.resourcer.color(R.color.music_list_item_snippet_color));
                    }
                    this.owner.setText(PlaylistFormatter.formatArtists(PlaylistContainer.this.resourcer, playlist.artists));
                } else {
                    this.owner.setOnClickListener(this.ownerListener);
                    this.owner.setTextColor(PlaylistContainer.this.resourcer.colorList(R.color.music_link_text));
                    this.owner.setText(PlaylistContainer.this.model.getOwner());
                }
                if (CollectionUtils.isEmpty(playlist.genres) && playlist.year != 0) {
                    this.snippet1.setVisibility(8);
                } else {
                    this.snippet1.setVisibility(0);
                    this.snippet1.setText(PlaylistFormatter.formatGenreYear(PlaylistContainer.this.resourcer, playlist.genres, playlist.year));
                }
                if (TextUtils.isEmpty(playlist.description)) {
                    this.description.setVisibility(8);
                } else {
                    this.description.setVisibility(0);
                    this.description.setText(playlist.description);
                }
                if (playlist.updateTime == 0) {
                    this.snippet2.setVisibility(8);
                } else {
                    this.snippet2.setVisibility(0);
                    this.snippet2.setText(PlaylistFormatter.formatListeningsUpdateTime(PlaylistContainer.this.resourcer, playlist.listeningsCount, playlist.updateTime));
                }
                if (PlaylistContainer.this.model.isFollowed()) {
                    this.followButton.setChecked(true);
                    this.followButton.setText(R.string.music_playlist_follow_button_label2);
                    DrawableUtils.setLeft(this.followButton, (int) R.drawable.ic_ab_done, (int) R.color.music_check_button_content_checked);
                    return;
                }
                this.followButton.setChecked(false);
                this.followButton.setText(R.string.music_playlist_follow_button_label1);
                DrawableUtils.setLeft(this.followButton, (int) R.drawable.ic_add, (int) R.color.music_check_button_content_normal);
            }
        }
    }

    /* loaded from: classes2.dex */
    public final class UserListener extends LifecycleListener implements ActionsBottomSheet.Callback<MusicTrack>, View.OnClickListener, SwipeRefreshLayout.OnRefreshListener, LastReachedScrollListener.OnLastReachedListener, PopupMenu.OnMenuItemClickListener {
        private UserListener() {
            PlaylistContainer.this = r1;
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStarted(@NonNull Activity activity) {
            super.onActivityStarted(activity);
            PlaylistContainer.this.model.load();
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
            super.onActivityResult(instanceId, requestCode, resultCode, data);
            if (resultCode == -1) {
                if (requestCode == 10) {
                    MusicTrack targetTrack = PlaylistContainer.this.model.getMusicTrackModel().getTarget();
                    if (targetTrack != null && data != null && data.hasExtra("result")) {
                        PlaylistContainer.this.model.getMusicTrackModel().addAudio(targetTrack, (Playlist) data.getParcelableExtra("result"));
                    }
                } else if (requestCode == 11 && data != null && data.hasExtra("result")) {
                    PlaylistContainer.this.model.attachMusic(data.getParcelableArrayListExtra("result"));
                }
            }
        }

        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.Callback
        public void onActionClick(@NonNull MusicTrack musicTrack, int actionId) {
            DialogInterface.OnClickListener onClickListener;
            switch (actionId) {
                case R.id.music_action_add_to_my_music /* 2131755102 */:
                    if (PlaylistContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack)) {
                        PlaylistContainer.this.model.getMusicTrackModel().addAudio(musicTrack, null);
                        return;
                    }
                    return;
                case R.id.music_action_add_to_playlist /* 2131755103 */:
                    PlaylistContainer.this.model.getMusicTrackModel().setTarget(musicTrack);
                    PlaylistContainer.this.lifecycleHandler.startActivityForResult(getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(PlaylistContainer.this.activity), 10);
                    return;
                case R.id.music_action_header /* 2131755104 */:
                default:
                    return;
                case R.id.music_action_play_next /* 2131755105 */:
                    PlaylistContainer.this.model.getPlayerModel().addToPlayNext(PlaylistContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_play_similar /* 2131755106 */:
                    PlaylistContainer.this.model.getPlayerModel().loadAndPlayTheSame(PlaylistContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_remove_from_my_music /* 2131755107 */:
                    if (PlaylistContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)) {
                        if (PlaylistContainer.this.model.getPlaylist() == null || PlaylistContainer.this.model.getPlaylist().type != 2) {
                            VKAlertDialog.Builder builder = new VKAlertDialog.Builder(PlaylistContainer.this.getContext());
                            builder.setTitle(R.string.confirm);
                            builder.setMessage(R.string.music_alert_remove_audio_message);
                            builder.setPositiveButton(R.string.picker_yes, PlaylistContainer$UserListener$$Lambda$1.lambdaFactory$(this, musicTrack));
                            onClickListener = PlaylistContainer$UserListener$$Lambda$2.instance;
                            builder.setNegativeButton(R.string.picker_no, onClickListener);
                            builder.show();
                            return;
                        } else if (PlaylistContainer.this.musicTracksAdapter.getItemCount() == 1) {
                            PlaylistContainer.this.model.delete();
                            return;
                        } else {
                            AudioFacade.removeSavedTrack(musicTrack.getMid());
                            if (PlaylistContainer.this.model.getMusicTracks() != null) {
                                PlaylistContainer.this.model.getMusicTracks().remove(musicTrack);
                            }
                            PlaylistContainer.this.onAudioRemovalFromPlaylistDone(PlaylistContainer.this.model.getMusicTrackModel(), PlaylistContainer.this.model.getPlaylist(), musicTrack);
                            return;
                        }
                    }
                    return;
                case R.id.music_action_share /* 2131755108 */:
                    Sharing.from(PlaylistContainer.this.activity).withAttachment(Attachments.createInfo(musicTrack, "music")).withActions(Actions.createInfo(musicTrack)).share();
                    return;
                case R.id.music_action_toggle_download /* 2131755109 */:
                    if (!PlaylistContainer.this.model.getMusicTrackModel().isDownloaded(musicTrack) || VKAccountManager.getCurrent().isMusicRestricted()) {
                        PlaylistContainer.this.model.getMusicTrackModel().download(musicTrack, PlaylistContainer.this.getContext());
                        return;
                    } else {
                        PlaylistContainer.this.model.getMusicTrackModel().clearDownloaded(musicTrack);
                        return;
                    }
            }
        }

        public /* synthetic */ void lambda$onActionClick$0(@NonNull MusicTrack musicTrack, DialogInterface dialog, int which) {
            PlaylistContainer.this.model.getMusicTrackModel().removeAudio(musicTrack, PlaylistContainer.this.model.getPlaylist());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.error_retry /* 2131755426 */:
                    PlaylistContainer.this.onErrorRetryClick();
                    return;
                case R.id.music_shuffle_btn /* 2131755989 */:
                    PlaylistContainer.this.model.loadAndPlayShuffleAll(v.getContext());
                    return;
                case R.id.back_btn /* 2131755992 */:
                    PlaylistContainer.this.activity.finish();
                    return;
                case R.id.edit_btn /* 2131755993 */:
                    new EditPlaylistFragment.Builder().playlist(PlaylistContainer.this.model.getPlaylist()).musicTracks(PlaylistContainer.this.model.getOffset(), PlaylistContainer.this.model.getMusicTracks()).go(v.getContext());
                    return;
                case R.id.more_btn /* 2131755994 */:
                    PopupMenu popup = new PopupMenu(v.getContext(), v, 5, 0, R.style.MenuPopup);
                    popup.inflate(R.menu.music_playlist);
                    if (!PlaylistContainer.this.model.isCurrentUser()) {
                        popup.getMenu().removeItem(R.id.mi_1);
                    }
                    if (!PlaylistContainer.this.model.canShare()) {
                        popup.getMenu().removeItem(R.id.mi_2);
                    }
                    popup.setOnMenuItemClickListener(PlaylistContainer.this.userListener);
                    popup.show();
                    return;
                case R.id.playlist_owner /* 2131755997 */:
                    new ProfileFragment.Builder(PlaylistContainer.this.model.getOwnerId()).go(v.getContext());
                    return;
                case R.id.playlist_follow_btn /* 2131755999 */:
                    PlaylistContainer.this.model.toggleFollowing();
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
        public void onRefresh() {
            PlaylistContainer.this.model.load();
        }

        @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
        public void onLastReached() {
            if (PlaylistContainer.this.model.canLoadMore()) {
                PlaylistContainer.this.model.loadMore();
            }
        }

        public void onClick(@NonNull MusicTrack musicTrack) {
            PlaylistContainer.this.model.getPlayerModel().togglePlayer(musicTrack, PlaylistContainer.this.model.getMusicTracks());
        }

        void onMenuClick(@NonNull MusicTrack musicTrack) {
            new AudioActionsBottomSheet.Builder(musicTrack, this, PlaylistContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack), PlaylistContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)).show(PlaylistContainer.this.activity);
        }

        @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
        public boolean onMenuItemClick(MenuItem item) {
            DialogInterface.OnClickListener onClickListener;
            switch (item.getItemId()) {
                case R.id.mi_1 /* 2131756524 */:
                    VKAlertDialog.Builder builder = new VKAlertDialog.Builder(PlaylistContainer.this.getContext());
                    builder.setTitle(R.string.confirm);
                    builder.setMessage(R.string.music_alert_remove_playlist_message);
                    builder.setPositiveButton(R.string.picker_yes, PlaylistContainer$UserListener$$Lambda$3.lambdaFactory$(this));
                    onClickListener = PlaylistContainer$UserListener$$Lambda$4.instance;
                    builder.setNegativeButton(R.string.picker_no, onClickListener);
                    builder.show();
                    return true;
                case R.id.mi_2 /* 2131756525 */:
                    Playlist playlist = PlaylistContainer.this.model.getPlaylist();
                    if (playlist != null) {
                        Sharing.from(PlaylistContainer.this.activity).withAttachment(Attachments.createInfo(playlist, "playlist")).withActions(Actions.createInfo(playlist)).share();
                        return true;
                    }
                    return true;
                default:
                    return true;
            }
        }

        public /* synthetic */ void lambda$onMenuItemClick$2(DialogInterface dialog, int which) {
            PlaylistContainer.this.model.delete();
        }

        public void onAttachMusicClick() {
            PlaylistContainer.this.lifecycleHandler.startActivityForResult(getUniqueId(), new Intent(PlaylistContainer.this.activity, AttachMusicActivity.class), 11);
        }

        void onOwnerClick() {
            new ProfileFragment.Builder(PlaylistContainer.this.model.getOwnerId()).go(PlaylistContainer.this.activity);
        }

        void onArtistClick() {
            Playlist playlist = PlaylistContainer.this.model.getPlaylist();
            if (playlist != null && CollectionUtils.count(playlist.artists) == 1) {
                new SearchFragment.Builder().query(playlist.artists.get(0).name).openResults(true).openArtistPage(true).go(PlaylistContainer.this.activity);
            }
        }
    }

    void onErrorRetryClick() {
        this.model.load();
        this.animator.setDisplayedChild(this.animator.indexOfChild(this.progressView));
    }

    public PlaylistContainer(Context context, final PlaylistModel model) {
        super(context);
        this.activity = Utils.castToActivity(context);
        this.resourcer = Resourcer.of(context);
        this.model = model;
        this.inflater = LayoutInflater.from(context);
        this.userListener = new UserListener();
        this.inflater.inflate(R.layout.music_playlist, this);
        this.titleView = (TextView) findViewById(R.id.toolbar_title);
        findViewById(R.id.back_btn).setOnClickListener(this.userListener);
        this.editButton = findViewById(R.id.edit_btn);
        findViewById(R.id.more_btn).setOnClickListener(this.userListener);
        this.animator = (ViewAnimator) findViewById(R.id.content_animator);
        this.progressView = findViewById(R.id.progress);
        this.errorViewHelper = new ErrorViewHelper(findViewById(R.id.error));
        this.errorViewHelper.setOnRetryListener(PlaylistContainer$$Lambda$1.lambdaFactory$(this));
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.refresh_layout);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        this.refreshLayout.setOnRefreshListener(this.userListener);
        this.recyclerView = (RecyclerView) findViewById(R.id.list);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this.activity);
        this.recyclerView.setLayoutManager(layoutManager);
        LastReachedScrollListener scrollListener = new LastReachedScrollListener(layoutManager);
        scrollListener.setListener(this.userListener);
        this.recyclerView.addOnScrollListener(scrollListener);
        this.infoHeaderCreatorBinder = new InfoHeaderCreatorBinder();
        this.infoHeaderAdapter = new ViewAdapter(this.infoHeaderCreatorBinder, this.infoHeaderCreatorBinder, 1);
        this.musicWithoutNetCreatorBinder = new MusicWithoutNetCreatorBinder();
        this.musicWithoutNetAdapter = new ViewAdapter(this.musicWithoutNetCreatorBinder, this.musicWithoutNetCreatorBinder, 7);
        this.shuffleHeaderAdapter = new ViewAdapter(PlaylistContainer$$Lambda$2.lambdaFactory$(this), 2);
        this.loadingFooterAdapter = new ViewAdapter(this.inflater, (int) R.layout.music_footer_loading, 4);
        this.loadingFooterAdapter.setEnabled(false);
        this.totalFooterCreatorBinder = new TotalFooterCreatorBinder(new TotalFooterCreatorBinder.Interactor() { // from class: com.vk.music.view.PlaylistContainer.1
            {
                PlaylistContainer.this = this;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @NonNull
            public LayoutInflater getLayoutInflater() {
                return PlaylistContainer.this.inflater;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @NonNull
            public Resourcer getResourcer() {
                return PlaylistContainer.this.resourcer;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @Nullable
            public List<MusicTrack> getMusicTracks() {
                return model.getMusicTracks();
            }
        });
        this.totalFooterAdapter = new ViewAdapter(this.totalFooterCreatorBinder, this.totalFooterCreatorBinder, 5);
        this.emptyFooterAdapter = new ViewAdapter(PlaylistContainer$$Lambda$3.lambdaFactory$(this), 6);
        this.adapter = new MergeRecyclerAdapter();
        this.adapter.setHasStableIds(true);
        if (VKAccountManager.getCurrent().isMusicRestricted()) {
            this.adapter.addAdapter(this.musicWithoutNetAdapter);
        }
        Playlist playlist = model.getPlaylist();
        if (playlist == null || playlist.type != 2) {
            this.adapter.addAdapter(this.infoHeaderAdapter);
        }
        this.adapter.addAdapter(this.shuffleHeaderAdapter);
        this.adapter.addAdapter(this.loadingFooterAdapter);
        this.adapter.addAdapter(this.totalFooterAdapter);
        this.adapter.addAdapter(this.emptyFooterAdapter);
        this.recyclerView.setAdapter(this.adapter);
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
    }

    public /* synthetic */ void lambda$new$0(View v) {
        onErrorRetryClick();
    }

    public /* synthetic */ View lambda$new$1(ViewGroup viewGroup) {
        TextView v = (TextView) this.inflater.inflate(R.layout.music_header_shuffle, viewGroup, false);
        DrawableUtils.setLeft(v, (int) R.drawable.ic_shuffle_24dp, (int) R.color.music_action_button_blue);
        v.setOnClickListener(this.userListener);
        return v;
    }

    public /* synthetic */ View lambda$new$3(ViewGroup viewGroup) {
        View view = this.inflater.inflate(R.layout.music_footer_playlist_attach_music, viewGroup, false);
        view.findViewById(R.id.music_playlist_attach_music_button).setOnClickListener(PlaylistContainer$$Lambda$6.lambdaFactory$(this));
        return view;
    }

    public /* synthetic */ void lambda$null$2(View v) {
        this.userListener.onAttachMusicClick();
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

    private void bind() {
        IdResolver<MusicTrack> idResolver;
        boolean z = false;
        Playlist playlist = this.model.getPlaylist();
        if (playlist == null) {
            if (this.model.getError() != null) {
                this.animator.setDisplayedChild(this.animator.indexOfChild(this.errorViewHelper.getView()));
                return;
            }
            this.animator.setDisplayedChild(this.animator.indexOfChild(this.progressView));
            this.model.load();
            return;
        }
        bindTitle(playlist);
        this.animator.setDisplayedChild(this.animator.indexOfChild(this.refreshLayout));
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (this.model.getOwner() == null) {
            this.model.load();
        }
        if (this.model.getMusicTracks() == null) {
            this.model.load();
        }
        updateInfoHeader();
        this.infoHeaderAdapter.setEnabled(playlist.type != 2);
        ViewAdapter viewAdapter = this.musicWithoutNetAdapter;
        if (playlist.type == 2) {
            z = true;
        }
        viewAdapter.setEnabled(z);
        updateShuffleHeader();
        updateEmptyFooter();
        updateLoadingFooter();
        updateTotalFooter();
        if (this.musicTracksAdapter == null) {
            ItemViewHolder.ClickListener<MusicTrack> musicTrackClickListener = PlaylistContainer$$Lambda$4.lambdaFactory$(this);
            ItemAdapter.Builder<MusicTrack> builder = new ItemAdapter.Builder<>(this.inflater);
            if (playlist.type == 1) {
                if (playlist.artists.size() == 1) {
                    builder.layout(R.layout.music_audio_item2).binder(new AlbumMusicBinder(this.model.getPlayerModel()));
                } else {
                    builder.layout(R.layout.music_audio_item3).binder(new CompilationMusicBinder(this.model.getPlayerModel()));
                }
            } else {
                builder.layout(R.layout.music_audio_item1).binder(new PlayingMusicBinder(this.model.getPlayerModel()));
            }
            ItemAdapter.Builder<MusicTrack> registerClickListener = builder.registerClickListener(musicTrackClickListener).registerClickListener(R.id.audio_menu, musicTrackClickListener);
            idResolver = PlaylistContainer$$Lambda$5.instance;
            this.musicTracksAdapter = registerClickListener.resolver(idResolver).viewType(3).build();
            this.adapter.addAdapter(this.adapter.getIndexOfAdapter(this.shuffleHeaderAdapter) + 1, this.musicTracksAdapter);
        }
        this.musicTracksAdapter.setItems(this.model.getMusicTracks());
    }

    public /* synthetic */ void lambda$bind$4(View v, MusicTrack musicTrack, int position) {
        if (v.getId() == R.id.audio_menu) {
            this.userListener.onMenuClick(musicTrack);
        } else {
            this.userListener.onClick(musicTrack);
        }
    }

    private void bindTitle(@NonNull Playlist playlist) {
        switch (playlist.type) {
            case 0:
                this.titleView.setText(R.string.music_title_playlist);
                break;
            case 1:
                this.titleView.setText(R.string.music_title_album);
                break;
            case 2:
                this.titleView.setText(playlist.title);
                break;
        }
        if (this.model.isCurrentUser() && (this.model.getPlaylist() == null || this.model.getPlaylist().type != 2)) {
            this.editButton.setVisibility(0);
            this.editButton.setOnClickListener(this.userListener);
            return;
        }
        this.editButton.setVisibility(8);
    }

    private void updateInfoHeader() {
        this.infoHeaderAdapter.notifyDataSetChanged();
    }

    private void updateShuffleHeader() {
        boolean z = true;
        ViewAdapter viewAdapter = this.shuffleHeaderAdapter;
        if (this.model.getMusicTracks() == null || this.model.getMusicTracks().size() <= 1) {
            z = false;
        }
        viewAdapter.setEnabled(z);
    }

    private void updateEmptyFooter() {
        if (CollectionUtils.isEmpty(this.model.getMusicTracks())) {
            this.emptyFooterAdapter.setEnabled(this.model.isCurrentUser());
        } else {
            this.emptyFooterAdapter.setEnabled(false);
        }
    }

    private void updateLoadingFooter() {
        if (CollectionUtils.isEmpty(this.model.getMusicTracks())) {
            this.loadingFooterAdapter.setEnabled(false);
        } else {
            this.loadingFooterAdapter.setEnabled(this.model.canLoadMore());
        }
    }

    private void updateTotalFooter() {
        boolean z = false;
        if (CollectionUtils.isEmpty(this.model.getMusicTracks())) {
            this.totalFooterAdapter.setEnabled(false);
            return;
        }
        ViewAdapter viewAdapter = this.totalFooterAdapter;
        if (!this.model.canLoadMore()) {
            z = true;
        }
        viewAdapter.setEnabled(z);
    }

    private void updatePlaying() {
        int childCount = this.recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView.ViewHolder holder = this.recyclerView.findContainingViewHolder(this.recyclerView.getChildAt(i));
            if (holder != null && holder.getItemViewType() == 3) {
                ((ItemViewHolder) holder).rebind();
            }
        }
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onLoadingDone(@NonNull PlaylistModel model) {
        bind();
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onLoadingError(@NonNull PlaylistModel model, @NonNull ErrorResponse response) {
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (model.getPlaylist() == null) {
            this.animator.setDisplayedChild(this.animator.indexOfChild(this.errorViewHelper.getView()));
            response.bindErrorView(this.errorViewHelper.getView());
        }
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onLoadingMoreDone(@NonNull PlaylistModel model, @NonNull List<MusicTrack> musicTracks) {
        this.musicTracksAdapter.addItems(musicTracks);
        boolean canLoadMoreAudio = model.canLoadMore();
        this.loadingFooterAdapter.setEnabled(canLoadMoreAudio);
        this.totalFooterAdapter.setEnabled(!CollectionUtils.isEmpty(model.getMusicTracks()) && !canLoadMoreAudio);
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onLoadingMoreError(@NonNull PlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onFollowingTogglingDone(@NonNull PlaylistModel model, @NonNull Playlist playlist) {
        this.infoHeaderAdapter.notifyDataSetChanged();
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onFollowingTogglingError(@NonNull PlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onDeletionDone(@NonNull PlaylistModel model) {
        ToastUtils.showToast((int) R.string.music_toast_playlist_deletion_done);
        Playlist playlist = model.getPlaylist();
        if (playlist != null) {
            MusicEventBus.post(new PlaylistRemoved(playlist));
        }
        this.activity.finish();
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onDeletionError(@NonNull PlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onAttachingDone(@NonNull PlaylistModel model, @NonNull List<MusicTrack> musicTracks) {
        ToastUtils.showToast(this.resourcer.pluralArg(R.plurals.music_toast_playlist_attaching_done, musicTracks.size()));
        this.musicTracksAdapter.setItems(model.getMusicTracks());
        updateInfoHeader();
        updateEmptyFooter();
        updateShuffleHeader();
        updateTotalFooter();
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onAttachingError(@NonNull PlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.PlaylistModel.Callback
    public void onPlaylistChanged(@NonNull PlaylistModel model) {
        bind();
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionToPlaylistDone(@NonNull MusicTrackModel model, @NonNull Playlist playlist) {
        ToastUtils.showToast(this.resourcer.str(R.string.music_toast_audio_addition_to_playlist_done, playlist.title));
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionToPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalFromPlaylistDone(@NonNull MusicTrackModel model, @NonNull Playlist playlist, @NonNull MusicTrack musicTrack) {
        this.musicTracksAdapter.removeItem(musicTrack);
        updateInfoHeader();
        updateEmptyFooter();
        updateShuffleHeader();
        updateTotalFooter();
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
}
