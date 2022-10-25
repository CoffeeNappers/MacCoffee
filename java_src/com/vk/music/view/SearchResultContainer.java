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
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.ToastUtils;
import com.vk.music.dto.Playlist;
import com.vk.music.formatter.DurationFormatter;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.AudioActionsBottomSheet;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.PlayerModel;
import com.vk.music.model.SearchResultModel;
import com.vk.music.view.LastReachedScrollListener;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlayingMusicBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vk.music.view.adapter.ViewRefs;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.utils.Utils;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.views.UsableRecyclerView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class SearchResultContainer extends ViewAnimator implements SearchResultModel.Callback, PlayerModel.Callback, MusicTrackModel.Callback {
    private static final int VIEW_TYPE_FOOTER1 = 6;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_HEADER2 = 2;
    private static final int VIEW_TYPE_RESULTS1 = 3;
    private static final int VIEW_TYPE_RESULTS2 = 4;
    private static final int VIEW_TYPE_RESULTS3 = 5;
    final Activity activity;
    final ItemAdapter<Group> communitiesAdapter;
    final ViewAdapter communitiesHeaderAdapter;
    final ErrorViewHelper errorViewHelper;
    final ViewAdapter globalCaptionAdapter;
    TextView globalCaptionView;
    final ItemAdapter<MusicTrack> globalResultsAdapter;
    private Host host;
    final LayoutInflater inflater;
    final ViewAdapter loadingFooterAdapter;
    final ItemAdapter<MusicTrack> localResultsAdapter;
    final SearchResultModel model;
    final View progressView;
    final SwipeRefreshLayout refreshLayout;
    final UserListener userListener;

    /* loaded from: classes2.dex */
    public interface Host {
        void requestPlaylist();
    }

    /* loaded from: classes2.dex */
    public final class UserListener implements ActionsBottomSheet.Callback<MusicTrack>, View.OnClickListener, LastReachedScrollListener.OnLastReachedListener {
        UserListener() {
            SearchResultContainer.this = this$0;
        }

        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.Callback
        public void onActionClick(@NonNull MusicTrack musicTrack, int actionId) {
            DialogInterface.OnClickListener onClickListener;
            switch (actionId) {
                case R.id.music_action_add_to_my_music /* 2131755102 */:
                    if (SearchResultContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack)) {
                        SearchResultContainer.this.model.getMusicTrackModel().addAudio(musicTrack, null);
                        return;
                    }
                    return;
                case R.id.music_action_add_to_playlist /* 2131755103 */:
                    SearchResultContainer.this.model.getMusicTrackModel().setTarget(musicTrack);
                    if (SearchResultContainer.this.host != null) {
                        SearchResultContainer.this.host.requestPlaylist();
                        return;
                    }
                    return;
                case R.id.music_action_header /* 2131755104 */:
                default:
                    return;
                case R.id.music_action_play_next /* 2131755105 */:
                    SearchResultContainer.this.model.getPlayerModel().addToPlayNext(SearchResultContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_play_similar /* 2131755106 */:
                    SearchResultContainer.this.model.getPlayerModel().loadAndPlayTheSame(SearchResultContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_remove_from_my_music /* 2131755107 */:
                    if (SearchResultContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)) {
                        VKAlertDialog.Builder builder = new VKAlertDialog.Builder(SearchResultContainer.this.getContext());
                        builder.setTitle(R.string.confirm);
                        builder.setMessage(R.string.music_alert_remove_audio_message);
                        builder.setPositiveButton(R.string.picker_yes, SearchResultContainer$UserListener$$Lambda$1.lambdaFactory$(this, musicTrack));
                        onClickListener = SearchResultContainer$UserListener$$Lambda$2.instance;
                        builder.setNegativeButton(R.string.picker_no, onClickListener);
                        builder.show();
                        return;
                    }
                    return;
                case R.id.music_action_share /* 2131755108 */:
                    Sharing.from(SearchResultContainer.this.activity).withAttachment(Attachments.createInfo(musicTrack, "music")).withActions(Actions.createInfo(musicTrack)).share();
                    return;
                case R.id.music_action_toggle_download /* 2131755109 */:
                    if (!SearchResultContainer.this.model.getMusicTrackModel().isDownloaded(musicTrack)) {
                        SearchResultContainer.this.model.getMusicTrackModel().download(musicTrack, SearchResultContainer.this.getContext());
                        return;
                    } else {
                        SearchResultContainer.this.model.getMusicTrackModel().clearDownloaded(musicTrack);
                        return;
                    }
            }
        }

        public /* synthetic */ void lambda$onActionClick$0(@NonNull MusicTrack musicTrack, DialogInterface dialog, int which) {
            SearchResultContainer.this.model.getMusicTrackModel().removeAudio(musicTrack, null);
        }

        public void onClick(@NonNull MusicTrack musicTrack) {
            SearchResultContainer.this.model.getPlayerModel().togglePlayer(musicTrack, SearchResultContainer.this.model.getResults());
        }

        void onMenuClick(@NonNull MusicTrack musicTrack) {
            new AudioActionsBottomSheet.Builder(musicTrack, this, SearchResultContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack), SearchResultContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)).show(SearchResultContainer.this.activity);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.error_retry /* 2131755426 */:
                    SearchResultContainer.this.onErrorRetryClick();
                    return;
                case R.id.music_show_all_btn /* 2131755988 */:
                default:
                    return;
            }
        }

        @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
        public void onLastReached() {
            if (SearchResultContainer.this.model.canLoadMore()) {
                SearchResultContainer.this.model.loadMoreResults();
            }
        }
    }

    void onErrorRetryClick() {
        this.model.loadResults();
        setDisplayedChild(indexOfChild(this.progressView));
    }

    public SearchResultContainer(@NonNull Context context, @NonNull SearchResultModel model) {
        super(context);
        IdResolver idResolver;
        IdResolver idResolver2;
        this.userListener = new UserListener();
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.inflater = LayoutInflater.from(context);
        this.inflater.inflate(R.layout.music_page, this);
        View emptyView = this.inflater.inflate(R.layout.appkit_empty, (ViewGroup) null);
        addView(emptyView);
        TextView emptyText = (TextView) emptyView.findViewById(R.id.empty_text);
        emptyText.setText(R.string.nothing_found);
        setMeasureAllChildren(false);
        this.progressView = findViewById(R.id.progress);
        this.errorViewHelper = new ErrorViewHelper(findViewById(R.id.error));
        this.errorViewHelper.setOnRetryListener(SearchResultContainer$$Lambda$1.lambdaFactory$(this));
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.refresh_layout);
        this.refreshLayout.setEnabled(false);
        UsableRecyclerView recyclerView = (UsableRecyclerView) findViewById(R.id.list);
        recyclerView.setHasFixedSize(true);
        recyclerView.setEmptyView(emptyView);
        LinearLayoutManager layoutManager = new LinearLayoutManager(context);
        recyclerView.setLayoutManager(layoutManager);
        LastReachedScrollListener scrollListener = new LastReachedScrollListener(layoutManager);
        scrollListener.setListener(this.userListener);
        recyclerView.addOnScrollListener(scrollListener);
        ItemAdapter.Builder binder = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_community_item).binder(new ItemViewHolder.Binder<Group>() { // from class: com.vk.music.view.SearchResultContainer.1
            {
                SearchResultContainer.this = this;
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            @NonNull
            public ViewRefs onCreate(@NonNull View itemView) {
                return new ViewRefs().put(itemView.findViewById(R.id.community_image)).put(itemView.findViewById(R.id.community_title));
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            public void onBind(@NonNull ViewRefs refs, @NonNull Group group, int position) {
                ((CommunityImageView) refs.next()).setVerified(group.verified);
                ((TextView) refs.next()).setText(group.name);
            }
        });
        idResolver = SearchResultContainer$$Lambda$2.instance;
        this.communitiesAdapter = binder.resolver(idResolver).viewType(3).build();
        this.communitiesAdapter.setHasStableIds(true);
        this.communitiesHeaderAdapter = new ViewAdapter(SearchResultContainer$$Lambda$3.lambdaFactory$(this), 1);
        ItemAdapter.Builder registerClickListener = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_audio_item4).binder(new PlayingMusicBinder(model.getPlayerModel()) { // from class: com.vk.music.view.SearchResultContainer.2
            {
                SearchResultContainer.this = this;
            }

            @Override // com.vk.music.view.adapter.PlayingMusicBinder, com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
            @NonNull
            public ViewRefs onCreate(@NonNull View itemView) {
                return super.onCreate(itemView).put(itemView.findViewById(R.id.audio_duration));
            }

            @Override // com.vk.music.view.adapter.PlayingMusicBinder, com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
            public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
                super.onBind(refs, musicTrack, position);
                ((TextView) refs.next()).setText(DurationFormatter.formatDurationShort(musicTrack.duration));
            }
        }).registerClickListener(SearchResultContainer$$Lambda$4.lambdaFactory$(this)).registerClickListener(R.id.audio_menu, SearchResultContainer$$Lambda$5.lambdaFactory$(this));
        idResolver2 = SearchResultContainer$$Lambda$6.instance;
        ItemAdapter.Builder<MusicTrack> builder = registerClickListener.resolver(idResolver2).viewType(4);
        this.localResultsAdapter = builder.build();
        this.globalCaptionAdapter = new ViewAdapter(SearchResultContainer$$Lambda$7.lambdaFactory$(this), SearchResultContainer$$Lambda$8.lambdaFactory$(this, model), 2);
        this.globalResultsAdapter = builder.viewType(5).build();
        this.loadingFooterAdapter = new ViewAdapter(this.inflater, (int) R.layout.music_footer_loading, 6);
        this.loadingFooterAdapter.setEnabled(false);
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.addAdapter(this.communitiesHeaderAdapter);
        adapter.addAdapter(this.localResultsAdapter);
        adapter.addAdapter(this.globalCaptionAdapter);
        adapter.addAdapter(this.globalResultsAdapter);
        adapter.addAdapter(this.loadingFooterAdapter);
        recyclerView.setAdapter(adapter);
    }

    public /* synthetic */ void lambda$new$0(View v) {
        onErrorRetryClick();
    }

    public /* synthetic */ View lambda$new$2(ViewGroup viewGroup) {
        View v = this.inflater.inflate(R.layout.music_header_scrolling_block, viewGroup, false);
        ((TextView) v.findViewById(R.id.music_block_title)).setText(R.string.music_title_communities);
        v.findViewById(R.id.music_show_all_btn).setOnClickListener(this.userListener);
        RecyclerView communitiesRecyclerView = (RecyclerView) v.findViewById(R.id.list);
        communitiesRecyclerView.setHasFixedSize(true);
        communitiesRecyclerView.setLayoutManager(new LinearLayoutManager(this.activity, 0, false));
        communitiesRecyclerView.setAdapter(this.communitiesAdapter);
        communitiesRecyclerView.setNestedScrollingEnabled(false);
        return v;
    }

    public /* synthetic */ void lambda$new$3(View v, MusicTrack musicTrack, int position) {
        this.userListener.onClick(musicTrack);
    }

    public /* synthetic */ void lambda$new$4(View v, MusicTrack musicTrack, int position) {
        this.userListener.onMenuClick(musicTrack);
    }

    public /* synthetic */ View lambda$new$5(ViewGroup viewGroup) {
        this.globalCaptionView = (TextView) this.inflater.inflate(R.layout.music_caption, viewGroup, false);
        this.globalCaptionView.setText(R.string.music_caption_global_search);
        return this.globalCaptionView;
    }

    public /* synthetic */ void lambda$new$6(@NonNull SearchResultModel model) {
        DrawableUtils.setLeft(this.globalCaptionView, CollectionUtils.isEmpty(model.getLocalResults()) ? 0 : R.drawable.music_divider_1);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.model.subscribe(this);
        this.model.getPlayerModel().subscribe(this);
        this.model.getMusicTrackModel().subscribe(this);
        AudioActionsBottomSheet.restoreCallback(this.activity, this.userListener);
        bind();
        this.model.loadResults();
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
        if (!this.model.isLoaded()) {
            if (this.model.getError() != null) {
                setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
                return;
            }
            setDisplayedChild(indexOfChild(this.progressView));
            this.model.loadResults();
            return;
        }
        setDisplayedChild(indexOfChild(this.refreshLayout));
        List<Group> communities = this.model.getCommunities();
        this.communitiesAdapter.setItems(communities);
        this.communitiesHeaderAdapter.setEnabled(!CollectionUtils.isEmpty(communities));
        List<MusicTrack> localResults = this.model.getLocalResults();
        this.localResultsAdapter.setItems(localResults);
        List<MusicTrack> globalResults = this.model.getGlobalResults();
        this.globalResultsAdapter.setItems(globalResults);
        ViewAdapter viewAdapter = this.globalCaptionAdapter;
        if (CollectionUtils.isEmpty(globalResults)) {
            z = false;
        }
        viewAdapter.setEnabled(z);
        this.loadingFooterAdapter.setEnabled(this.model.canLoadMore());
    }

    @Override // com.vk.music.model.SearchResultModel.Callback
    public void onLoadingDone(@NonNull SearchResultModel model) {
        bind();
    }

    @Override // com.vk.music.model.SearchResultModel.Callback
    public void onLoadingError(@NonNull SearchResultModel model, @NonNull ErrorResponse response) {
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (model.getResults() == null) {
            setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
            response.bindErrorView(this.errorViewHelper.getView());
        }
    }

    @Override // com.vk.music.model.SearchResultModel.Callback
    public void onLoadingMoreDone(@NonNull SearchResultModel model, @NonNull List<MusicTrack> localResults, @NonNull List<MusicTrack> globalResults) {
        if (!localResults.isEmpty()) {
            this.localResultsAdapter.addItems(localResults);
        }
        if (!globalResults.isEmpty()) {
            this.globalResultsAdapter.addItems(globalResults);
        }
        this.loadingFooterAdapter.setEnabled(model.canLoadMore());
    }

    @Override // com.vk.music.model.SearchResultModel.Callback
    public void onLoadingMoreError(@NonNull SearchResultModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.SearchResultModel.Callback
    public void onQueryChanged(@NonNull SearchResultModel model) {
        bind();
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
        ToastUtils.showToast((int) R.string.music_toast_audio_addition_done);
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioAdditionError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalDone(@NonNull MusicTrackModel model, @NonNull MusicTrack musicTrack) {
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
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingStopped(@NonNull PlayerModel model) {
        this.localResultsAdapter.notifyDataSetChanged();
        this.globalResultsAdapter.notifyDataSetChanged();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingPaused(@NonNull PlayerModel model) {
        this.localResultsAdapter.notifyDataSetChanged();
        this.globalResultsAdapter.notifyDataSetChanged();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingResumed(@NonNull PlayerModel model) {
        this.localResultsAdapter.notifyDataSetChanged();
        this.globalResultsAdapter.notifyDataSetChanged();
    }
}
