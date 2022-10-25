package com.vk.music.view;

import android.annotation.SuppressLint;
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
import android.widget.ViewAnimator;
import com.vk.core.util.ToastUtils;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Section;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.AudioActionsBottomSheet;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.PlayerModel;
import com.vk.music.model.RecommendedModel;
import com.vk.music.view.holders.SectionAudioSpecialHolder;
import com.vk.music.view.holders.SectionHolder;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class RecommendedContainer extends ViewAnimator implements SwipeRefreshLayout.OnRefreshListener, RecommendedModel.Callback, PlayerModel.Callback, MusicTrackModel.Callback {
    final Adapter adapter;
    ActionsBottomSheet.Callback<MusicTrack> callback;
    final ErrorViewHelper errorViewHelper;
    Host host;
    final LayoutInflater inflater;
    final RecommendedModel model;
    final View progressView;
    final RecyclerView recyclerView;
    final SwipeRefreshLayout refreshLayout;

    /* loaded from: classes2.dex */
    public interface Host {
        void requestPlaylist();
    }

    public RecommendedContainer(Context ctx, RecommendedModel recommendedModel) {
        super(ctx);
        this.callback = new AnonymousClass1();
        this.model = recommendedModel;
        this.adapter = new Adapter(this.model, this.callback);
        this.inflater = LayoutInflater.from(ctx);
        this.inflater.inflate(R.layout.music_page, this);
        setMeasureAllChildren(false);
        this.progressView = findViewById(R.id.progress);
        this.errorViewHelper = new ErrorViewHelper(findViewById(R.id.error));
        this.errorViewHelper.setOnRetryListener(RecommendedContainer$$Lambda$1.lambdaFactory$(this));
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.refresh_layout);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        this.refreshLayout.setOnRefreshListener(this);
        this.recyclerView = (RecyclerView) findViewById(R.id.list);
        this.recyclerView.setPadding(this.recyclerView.getPaddingLeft(), 0, this.recyclerView.getPaddingRight(), 0);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(ctx);
        this.recyclerView.setLayoutManager(layoutManager);
        this.recyclerView.setAdapter(this.adapter);
        DividerItemDecoration decor1 = new DividerItemDecoration(ctx, (int) R.drawable.music_divider_1);
        decor1.setProvider(RecommendedContainer$$Lambda$2.lambdaFactory$(this));
        this.recyclerView.addItemDecoration(decor1);
    }

    public /* synthetic */ void lambda$new$0(View v) {
        onErrorRetryClick();
    }

    public /* synthetic */ boolean lambda$new$1(int position) {
        return this.adapter.getItemViewType(position) != Section.Type.audios_special.ordinal() && position < this.adapter.getItemCount() + (-1);
    }

    void onErrorRetryClick() {
        this.model.load();
        setDisplayedChild(indexOfChild(this.progressView));
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.model.subscribe(this);
        this.model.getMusicTrackModel().subscribe(this);
        this.model.getPlayerModel().subscribe(this);
        AudioActionsBottomSheet.restoreCallback(Utils.castToActivity(getContext()), this.callback);
        bind();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.model.unsubscribe(this);
        this.model.getMusicTrackModel().unsubscribe(this);
        this.model.getPlayerModel().unsubscribe(this);
        AudioActionsBottomSheet.restoreCallback(Utils.castToActivity(getContext()), null);
    }

    private void bind() {
        if (this.model.getSections() == null) {
            if (this.model.getError() != null) {
                setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
                return;
            }
            setDisplayedChild(indexOfChild(this.progressView));
            this.model.load();
            return;
        }
        setDisplayedChild(indexOfChild(this.refreshLayout));
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        this.adapter.setSectionsAndUpdateView(this.model.getSections());
    }

    private void notifyDataSetChangedInMusicHolders() {
        int count = this.recyclerView.getChildCount();
        for (int i = 0; i < count; i++) {
            RecyclerView.ViewHolder holder = this.recyclerView.mo1205getChildViewHolder(this.recyclerView.getChildAt(i));
            if (holder instanceof SectionHolder) {
                ((SectionHolder) holder).updatePlayingState();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class Adapter extends UsableRecyclerView.Adapter<RecyclerHolder<Section>> {
        @NonNull
        final ActionsBottomSheet.Callback<MusicTrack> callback;
        @NonNull
        final RecommendedModel recommendedModel;
        ArrayList<Section> sections = null;

        public Adapter(@NonNull RecommendedModel recommendedModel, @NonNull ActionsBottomSheet.Callback<MusicTrack> callback) {
            this.recommendedModel = recommendedModel;
            this.callback = callback;
            setHasStableIds(true);
        }

        void setSectionsAndUpdateView(ArrayList<Section> sections) {
            this.sections = sections;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder<Section> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (SectionHolder.getTypeByOrdinal(viewType)) {
                case audios_special:
                    return new SectionAudioSpecialHolder(parent, this.recommendedModel);
                default:
                    return new SectionHolder(parent, viewType, this.recommendedModel, this.callback);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<Section> holder, int position) {
            holder.bind(this.sections.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return this.sections.get(position).type.ordinal();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return this.sections.get(position).id;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (this.sections == null) {
                return 0;
            }
            return this.sections.size();
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        this.model.load();
    }

    @Override // com.vk.music.model.RecommendedModel.Callback
    public void onLoadingDone(@NonNull RecommendedModel model) {
        this.adapter.setSectionsAndUpdateView(model.getSections());
        bind();
    }

    @Override // com.vk.music.model.RecommendedModel.Callback
    public void onLoadingError(@NonNull RecommendedModel model, @NonNull ErrorResponse response) {
        if (this.refreshLayout.isRefreshing()) {
            this.refreshLayout.setRefreshing(false);
        }
        if (model.getSections() == null) {
            setDisplayedChild(indexOfChild(this.errorViewHelper.getView()));
            response.bindErrorView(this.errorViewHelper.getView());
        }
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingStopped(@NonNull PlayerModel model) {
        notifyDataSetChangedInMusicHolders();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingPaused(@NonNull PlayerModel model) {
        notifyDataSetChangedInMusicHolders();
    }

    @Override // com.vk.music.model.PlayerModel.Callback
    public void onPlayingResumed(@NonNull PlayerModel model) {
        notifyDataSetChangedInMusicHolders();
    }

    public void onPlaylistResult(@Nullable Playlist playlist) {
        MusicTrack target;
        if (playlist != null && (target = this.model.getMusicTrackModel().getTarget()) != null) {
            this.model.getMusicTrackModel().addAudio(target, playlist);
        }
    }

    public void setHost(@Nullable Host host) {
        this.host = host;
    }

    /* renamed from: com.vk.music.view.RecommendedContainer$1 */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements ActionsBottomSheet.Callback<MusicTrack> {
        AnonymousClass1() {
            RecommendedContainer.this = this$0;
        }

        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.Callback
        public void onActionClick(@NonNull MusicTrack musicTrack, int actionId) {
            DialogInterface.OnClickListener onClickListener;
            switch (actionId) {
                case R.id.music_action_add_to_my_music /* 2131755102 */:
                    if (RecommendedContainer.this.model.getMusicTrackModel().canAddAudio(musicTrack)) {
                        RecommendedContainer.this.model.getMusicTrackModel().addAudio(musicTrack, null);
                        return;
                    }
                    return;
                case R.id.music_action_add_to_playlist /* 2131755103 */:
                    RecommendedContainer.this.model.getMusicTrackModel().setTarget(musicTrack);
                    if (RecommendedContainer.this.host != null) {
                        RecommendedContainer.this.host.requestPlaylist();
                        return;
                    }
                    return;
                case R.id.music_action_header /* 2131755104 */:
                default:
                    return;
                case R.id.music_action_play_next /* 2131755105 */:
                    RecommendedContainer.this.model.getPlayerModel().addToPlayNext(RecommendedContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_play_similar /* 2131755106 */:
                    RecommendedContainer.this.model.getPlayerModel().loadAndPlayTheSame(RecommendedContainer.this.getContext(), musicTrack);
                    return;
                case R.id.music_action_remove_from_my_music /* 2131755107 */:
                    if (RecommendedContainer.this.model.getMusicTrackModel().canRemoveAudio(musicTrack)) {
                        VKAlertDialog.Builder builder = new VKAlertDialog.Builder(RecommendedContainer.this.getContext());
                        builder.setTitle(R.string.confirm);
                        builder.setMessage(R.string.music_alert_remove_audio_message);
                        builder.setPositiveButton(R.string.picker_yes, RecommendedContainer$1$$Lambda$1.lambdaFactory$(this, musicTrack));
                        onClickListener = RecommendedContainer$1$$Lambda$2.instance;
                        builder.setNegativeButton(R.string.picker_no, onClickListener);
                        builder.show();
                        return;
                    }
                    return;
                case R.id.music_action_share /* 2131755108 */:
                    Sharing.from(RecommendedContainer.this.getContext()).withAttachment(Attachments.createInfo(musicTrack, "music")).withActions(Actions.createInfo(musicTrack)).share();
                    return;
                case R.id.music_action_toggle_download /* 2131755109 */:
                    if (!RecommendedContainer.this.model.getMusicTrackModel().isDownloaded(musicTrack)) {
                        RecommendedContainer.this.model.getMusicTrackModel().download(musicTrack, RecommendedContainer.this.getContext());
                        return;
                    } else {
                        RecommendedContainer.this.model.getMusicTrackModel().clearDownloaded(musicTrack);
                        return;
                    }
            }
        }

        public /* synthetic */ void lambda$onActionClick$0(@NonNull MusicTrack musicTrack, DialogInterface dialog, int which) {
            RecommendedContainer.this.model.getMusicTrackModel().removeAudio(musicTrack, null);
        }
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
        ToastUtils.showToast((int) R.string.music_toast_audio_removal_done);
    }

    @Override // com.vk.music.model.MusicTrackModel.Callback
    public void onAudioRemovalFromPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }
}
