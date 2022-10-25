package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Section;
import com.vk.music.model.MusicModel;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetCatalogBlockById;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class MusicModelCatalogBlock extends ObservableModel<MusicModel.Callback> implements MusicModel {
    private static final int AUDIO_ITEMS_PORTION = 100;
    final int catalogBlockId;
    String errorMessage;
    VKAPIRequest loadRequest;
    ArrayList<MusicTrack> musicTracks;
    int offset;
    String owner;
    final PlayerModel playerModel;
    boolean canLoadMore = true;
    final MusicTrackModel musicTrackModel = new MusicTrackModelImpl();

    @Override // com.vk.music.model.MusicModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull MusicModel.Callback callback) {
        super.subscribe((MusicModelCatalogBlock) callback);
    }

    @Override // com.vk.music.model.MusicModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull MusicModel.Callback callback) {
        super.unsubscribe((MusicModelCatalogBlock) callback);
    }

    public MusicModelCatalogBlock(Section section) {
        this.catalogBlockId = section.id;
        this.playerModel = new PlayerModelImpl(PlayerRefer.parseRecommended(section.source));
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putBoolean("canLoadMore", this.canLoadMore);
        state.putInt("offset", this.offset);
        state.putString("owner", this.owner);
        state.putParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO, this.musicTracks);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.canLoadMore = state.getBoolean("canLoadMore");
        this.offset = state.getInt("offset");
        this.owner = state.getString("owner");
        this.musicTracks = state.getParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO);
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
            this.loadRequest = null;
        }
        this.playerModel.release();
        this.musicTrackModel.release();
    }

    @Override // com.vk.music.model.MusicModel
    public int getOwnerId() {
        return 0;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean isNeedLoadTitle() {
        return true;
    }

    @Override // com.vk.music.model.MusicModel
    @Nullable
    public String getTitle(Context context) {
        return this.owner;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean hasIcon() {
        return false;
    }

    @Override // com.vk.music.model.MusicModel
    public String getIcon() {
        return null;
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public List<Playlist> getPlaylists() {
        return Collections.emptyList();
    }

    @Override // com.vk.music.model.MusicModel
    @Nullable
    public List<MusicTrack> getMusicTracks() {
        return this.musicTracks;
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public Playlist getOriginalPlaylist(@NonNull Playlist playlist) {
        return playlist;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean canLoadMoreAudio() {
        return this.canLoadMore;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean isCurrentUser() {
        return false;
    }

    @Override // com.vk.music.model.MusicModel
    public void loadPage() {
        load(true, 0, this.offset != 0 ? this.offset : 100);
    }

    @Override // com.vk.music.model.MusicModel
    public void loadMoreAudio() {
        load(false, this.offset, 100);
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public PlayerModel getPlayerModel() {
        return this.playerModel;
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public MusicTrackModel getMusicTrackModel() {
        return this.musicTrackModel;
    }

    @Override // com.vk.music.model.MusicModel
    @Nullable
    public String getError() {
        return this.errorMessage;
    }

    @Override // com.vk.music.model.MusicModel
    public void loadAndPlayShuffleAll(@NonNull Context ctx) {
        if (!canLoadMoreAudio() && this.musicTracks != null && !this.musicTracks.isEmpty()) {
            ArrayList<MusicTrack> shuffleTracks = new ArrayList<>(this.musicTracks);
            Collections.shuffle(shuffleTracks);
            getPlayerModel().togglePlayer(null, shuffleTracks);
            return;
        }
        new AudioGetCatalogBlockById.Builder(this.catalogBlockId, 0, 200).shuffle().buildAudios().setCallback(new SimpleCallback<VKList<MusicTrack>>() { // from class: com.vk.music.model.MusicModelCatalogBlock.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<MusicTrack> result) {
                if (result != null && !result.isEmpty()) {
                    MusicModelCatalogBlock.this.getPlayerModel().togglePlayer((MusicTrack) result.get(0), result);
                }
            }
        }).wrapProgress(ctx).exec(ctx);
    }

    private void load(boolean loadOwner, int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            this.loadRequest = new AudioGetCatalogBlockById.Builder(this.catalogBlockId, audioOffset, audioCount).buildSection().setCallback(new AnonymousClass2(loadOwner, audioOffset, audioCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicModelCatalogBlock$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<Section> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;
        final /* synthetic */ boolean val$loadOwner;

        AnonymousClass2(boolean z, int i, int i2) {
            this.val$loadOwner = z;
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Section result) {
            boolean z = true;
            MusicModelCatalogBlock.this.loadRequest = null;
            if (this.val$loadOwner) {
                MusicModelCatalogBlock.this.owner = result.title;
            }
            if (this.val$audioOffset == 0) {
                MusicModelCatalogBlock musicModelCatalogBlock = MusicModelCatalogBlock.this;
                boolean z2 = musicModelCatalogBlock.canLoadMore;
                if (result.audios.isEmpty()) {
                    z = false;
                }
                musicModelCatalogBlock.canLoadMore = z & z2;
                MusicModelCatalogBlock.this.offset = this.val$audioCount;
                MusicModelCatalogBlock.this.musicTracks = result.audios;
            } else {
                MusicModelCatalogBlock musicModelCatalogBlock2 = MusicModelCatalogBlock.this;
                if (result.audios.isEmpty()) {
                    z = false;
                }
                musicModelCatalogBlock2.canLoadMore = z;
                if (MusicModelCatalogBlock.this.canLoadMore) {
                    MusicModelCatalogBlock.this.offset = this.val$audioOffset + this.val$audioCount;
                    MusicModelCatalogBlock.this.musicTracks.addAll(result.audios);
                }
            }
            if (this.val$audioOffset == 0) {
                MusicModelCatalogBlock.this.notifyObservers(MusicModelCatalogBlock$2$$Lambda$1.lambdaFactory$(this));
            } else {
                MusicModelCatalogBlock.this.notifyObservers(MusicModelCatalogBlock$2$$Lambda$2.lambdaFactory$(this, result));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(MusicModel.Callback callback) {
            callback.onLoadingDone(MusicModelCatalogBlock.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(Section result, MusicModel.Callback callback) {
            callback.onAudioLoadingDone(MusicModelCatalogBlock.this, result.audios);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicModelCatalogBlock.this.loadRequest = null;
            Log.w("vk", error.toString());
            MusicModelCatalogBlock.this.errorMessage = error.message;
            if (this.val$audioOffset == 0) {
                MusicModelCatalogBlock.this.notifyObservers(MusicModelCatalogBlock$2$$Lambda$3.lambdaFactory$(this, error));
            } else {
                MusicModelCatalogBlock.this.notifyObservers(MusicModelCatalogBlock$2$$Lambda$4.lambdaFactory$(this, error));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(VKAPIRequest.VKErrorResponse error, MusicModel.Callback callback) {
            callback.onLoadingError(MusicModelCatalogBlock.this, error);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(VKAPIRequest.VKErrorResponse error, MusicModel.Callback callback) {
            callback.onAudioLoadingError(MusicModelCatalogBlock.this, error);
        }
    }
}
