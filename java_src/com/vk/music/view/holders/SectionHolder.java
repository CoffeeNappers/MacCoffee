package com.vk.music.view.holders;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.util.Resourcer;
import com.vk.imageloader.view.VKImageView;
import com.vk.music.dto.ExtendedPlaylist;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Section;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.fragment.menu.AudioActionsBottomSheet;
import com.vk.music.graphics.PlayingDrawable;
import com.vk.music.model.PlayerModel;
import com.vk.music.model.RecommendedModel;
import com.vk.music.view.ThumbsImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.fragments.MusicCatalogBlockProfilesFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.gamepage.GameInfoHolder;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class SectionHolder extends RecyclerHolder<Section> implements View.OnClickListener {
    private final Adapter adapter;
    @Nullable
    private final TextView subtitle;
    @Nullable
    private final TextView title;
    private final Section.Type type;
    private final UsableRecyclerView usableRecyclerView;

    public SectionHolder(ViewGroup parent, int viewType, @NonNull RecommendedModel recommendedModel, @NonNull ActionsBottomSheet.Callback<MusicTrack> callback) {
        super((int) R.layout.music_section, parent);
        this.type = getTypeByOrdinal(viewType);
        this.title = (TextView) $(16908308);
        this.subtitle = (TextView) $(16908309);
        $(R.id.music_show_all_btn).setOnClickListener(this);
        this.adapter = new Adapter(this.type, recommendedModel, callback);
        UsableRecyclerView rv = (UsableRecyclerView) $(R.id.recycle);
        rv.setNestedScrollingEnabled(false);
        switch (this.type) {
            case audios:
                rv.setLayoutManager(new GridLayoutManager(rv.getContext(), 3, 0, false));
                rv.getLayoutParams().height = V.dp(192.0f);
                rv.setPadding(V.dp(0.0f), rv.getPaddingTop(), V.dp(0.0f), rv.getPaddingBottom());
                break;
            case users:
            case groups:
            case owners:
                rv.setLayoutManager(new LinearLayoutManager(rv.getContext(), 0, false));
                rv.getLayoutParams().height = V.dp(110.0f);
                rv.addItemDecoration(new GameInfoHolder.SpacesItemDecoration(V.dp(8.0f)));
                break;
            case playlists:
            case extended_playlists:
                rv.setLayoutManager(new LinearLayoutManager(rv.getContext(), 0, false));
                rv.getLayoutParams().height = V.dp(195.0f);
                rv.addItemDecoration(new GameInfoHolder.SpacesItemDecoration(V.dp(2.0f)));
                break;
            default:
                throw new IllegalArgumentException("Wrong view type:" + viewType);
        }
        rv.setAdapter(this.adapter);
        this.usableRecyclerView = rv;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Section item) {
        ViewUtils.setText(this.title, item.title);
        ViewUtils.setText(this.subtitle, item.subtitle, true);
        switch (item.type) {
            case audios:
                this.adapter.setDataAndUpdateView(item.audios, item);
                return;
            case users:
            case groups:
            case owners:
                this.adapter.setDataAndUpdateView(item.profiles, item);
                return;
            case playlists:
                this.adapter.setDataAndUpdateView(item.playlists, item);
                return;
            case extended_playlists:
                this.adapter.setDataAndUpdateView(item.extendedPlaylists, item);
                return;
            default:
                return;
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.music_show_all_btn /* 2131755988 */:
                onMusicShowAllButtonClick(v.getContext());
                return;
            default:
                return;
        }
    }

    private void onMusicShowAllButtonClick(Context ctx) {
        switch (((Section) this.item).type) {
            case audios:
                new MusicFragment.Builder().catalogBlockId(getItem()).go(ctx);
                return;
            case users:
            case groups:
            case owners:
                new MusicCatalogBlockProfilesFragment.Builder(getItem().id).title(getItem().title).go(ctx);
                return;
            case playlists:
            case extended_playlists:
                new PlaylistsFragment.Builder().catalogBlockId(getItem().id).title(getItem().title).go(ctx);
                return;
            default:
                return;
        }
    }

    public void updatePlayingState() {
        switch (this.type) {
            case audios:
                int count = this.usableRecyclerView.getChildCount();
                for (int i = 0; i < count; i++) {
                    AudioHolder holder = (AudioHolder) this.usableRecyclerView.mo1205getChildViewHolder(this.usableRecyclerView.getChildAt(i));
                    holder.updatePlayingState();
                }
                return;
            default:
                return;
        }
    }

    public static Section.Type getTypeByOrdinal(int ordinal) {
        return (ordinal < 0 || ordinal >= Section.Type.values().length) ? Section.Type.unknown : Section.Type.values()[ordinal];
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Adapter extends UsableRecyclerView.Adapter<RecyclerHolder> {
        @NonNull
        final ActionsBottomSheet.Callback<MusicTrack> callback;
        ArrayList data = null;
        @NonNull
        final RecommendedModel recommendedModel;
        Section section;
        final Section.Type type;

        public Adapter(Section.Type type, @NonNull RecommendedModel recommendedModel, @NonNull ActionsBottomSheet.Callback<MusicTrack> callback) {
            this.type = type;
            this.recommendedModel = recommendedModel;
            this.callback = callback;
            setHasStableIds(true);
        }

        void setDataAndUpdateView(ArrayList data, Section section) {
            this.data = data;
            this.section = section;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (this.type) {
                case audios:
                    return new AudioHolder(parent, this.recommendedModel, this);
                case users:
                case groups:
                case owners:
                    return new ProfileHolder(parent);
                case playlists:
                    return new PlaylistHolder(parent);
                case extended_playlists:
                    return new PlaylistHolder(parent);
                default:
                    throw new IllegalArgumentException("Wrong view type:" + this.type);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            switch (this.type) {
                case audios:
                    return ((MusicTrack) this.data.get(position)).getMidId();
                case users:
                case groups:
                case owners:
                    return ((UserProfile) this.data.get(position)).uid;
                case playlists:
                    return ((Playlist) this.data.get(position)).id;
                case extended_playlists:
                    return ((ExtendedPlaylist) this.data.get(position)).playlist.id;
                default:
                    throw new IllegalArgumentException("Wrong view type");
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            holder.bind(this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return this.type.ordinal();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            switch (this.type) {
                case audios:
                    if (this.data == null) {
                        return 0;
                    }
                    return (this.data.size() / 3) * 3;
                default:
                    if (this.data != null) {
                        return this.data.size();
                    }
                    return 0;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class AudioHolder extends RecyclerHolder<MusicTrack> implements View.OnClickListener {
        @NonNull
        final Adapter adapter;
        final ThumbsImageView imageView;
        final ImageView playingIndicator;
        @NonNull
        final RecommendedModel recommendedModel;
        final TextView textViewSubtitle;
        final TextView textViewTitle;

        AudioHolder(ViewGroup parent, @NonNull RecommendedModel recommendedModel, @NonNull Adapter adapter) {
            super((int) R.layout.music_audio_item1, parent);
            this.itemView.getLayoutParams().width = V.dp(320.0f);
            this.recommendedModel = recommendedModel;
            this.adapter = adapter;
            $(R.id.audio_menu).setOnClickListener(this);
            this.itemView.setOnClickListener(this);
            this.textViewTitle = (TextView) $(R.id.audio_title);
            this.textViewSubtitle = (TextView) $(R.id.audio_artist);
            this.imageView = (ThumbsImageView) $(R.id.audio_image);
            this.playingIndicator = (ImageView) $(R.id.audio_playing_indicator);
            this.playingIndicator.setImageDrawable(new PlayingDrawable.ResourceBuilder(Resourcer.from(this.itemView)).count(R.integer.music_playing_drawable_rect_count).rectWidth(R.dimen.music_playing_drawable_rect_width).rectHeight(R.dimen.music_playing_drawable_rect_height).rectMinHeight(R.dimen.music_playing_drawable_rect_min_height).rectColor(R.color.music_playing_drawable_rect_white).gapWidth(R.dimen.music_playing_drawable_gap).build());
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(MusicTrack item) {
            this.textViewTitle.setText(item.title);
            this.textViewSubtitle.setText(item.artist);
            this.imageView.setThumb(item.getThumb());
            updatePlayingState();
        }

        void updatePlayingState() {
            PlayerModel playerModel = this.recommendedModel.getPlayerModel();
            if (Utils.equals(this.item, playerModel.getPlayingTrack())) {
                this.playingIndicator.setVisibility(0);
                this.playingIndicator.setActivated(playerModel.isPlayerPlaying());
            } else if (this.playingIndicator.getVisibility() != 8) {
                this.playingIndicator.setVisibility(8);
                this.playingIndicator.setActivated(false);
            }
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.audio_menu /* 2131755967 */:
                    Activity act = Utils.castToActivity(v.getContext());
                    if (act != null) {
                        new AudioActionsBottomSheet.Builder(getItem(), this.adapter.callback, this.recommendedModel.getMusicTrackModel().canAddAudio(getItem()), this.recommendedModel.getMusicTrackModel().canRemoveAudio(getItem())).show(act);
                        return;
                    }
                    return;
                default:
                    this.recommendedModel.playSection(this.adapter.section, getItem());
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PlaylistHolder<T> extends RecyclerHolder<T> implements View.OnClickListener {
        final TextView subtitle;
        final ThumbsImageView thumbsImageView;
        final TextView title;

        PlaylistHolder(ViewGroup parent) {
            super((int) R.layout.music_playlist_item2, parent);
            this.title = (TextView) $(R.id.playlist_title);
            this.subtitle = (TextView) $(R.id.playlist_subtitle);
            this.thumbsImageView = (ThumbsImageView) $(R.id.playlist_image);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(T item) {
            if (item instanceof Playlist) {
                Playlist pl = (Playlist) item;
                onBindPlaylist(pl, pl.title, (pl.artists == null || pl.artists.isEmpty()) ? null : pl.artists.get(0).name);
                return;
            }
            ExtendedPlaylist ePlaylist = (ExtendedPlaylist) item;
            onBindPlaylist(ePlaylist.playlist, ePlaylist.title, ePlaylist.subtitle);
        }

        void onBindPlaylist(Playlist item, String title, String subtitle) {
            if (item.photo != null) {
                this.thumbsImageView.setThumb(item.photo);
            } else {
                this.thumbsImageView.setThumbs(item.thumbs);
            }
            this.title.setText(title);
            this.subtitle.setText(subtitle);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.item instanceof Playlist) {
                new PlaylistFragment.Builder((Playlist) this.item).go(getContext());
            } else {
                new PlaylistFragment.Builder(((ExtendedPlaylist) this.item).playlist).go(getContext());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ProfileHolder extends RecyclerHolder<UserProfile> implements View.OnClickListener {
        final VKImageView imageView;
        final TextView textView;

        ProfileHolder(ViewGroup parent) {
            super((int) R.layout.music_section_user, parent);
            this.imageView = (VKImageView) $(16908294);
            this.textView = (TextView) $(16908310);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile item) {
            this.textView.setText(item.fullName);
            this.imageView.setPlaceholderImage(item.uid > 0 ? R.drawable.placeholder_user_large : R.drawable.placeholder_community_large);
            String image = getImage();
            if (TextUtils.isEmpty(image)) {
                this.imageView.clear();
            } else {
                this.imageView.load(item.photo);
            }
        }

        private String getImage() {
            if (((UserProfile) this.item).photo == null || (!((UserProfile) this.item).photo.endsWith("/community_50.png") && !((UserProfile) this.item).photo.endsWith("/community_100.png") && !((UserProfile) this.item).photo.endsWith("/community_200.png"))) {
                return ((UserProfile) this.item).photo;
            }
            return null;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            new MusicFragment.Builder().ownerId(getItem().uid).setOwnerImage(getImage()).setOwnerNameGen(getItem().getNameInCase(11)).setOwnerNameFull(getItem().fullName).go(getContext());
        }
    }
}
