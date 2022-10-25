package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.music.dto.Playlist;
import com.vk.music.event.MusicEventBus;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.PlaylistCreated;
import com.vk.music.event.PlaylistRemoved;
import com.vk.music.event.Subscriber;
import com.vk.music.model.MusicModel;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGet;
import com.vkontakte.android.api.audio.AudioGetMusicPage;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class MusicModelImpl extends ObservableModel<MusicModel.Callback> implements MusicModel {
    private static final int AUDIO_ITEMS_PORTION = 100;
    private static final int PLAYLISTS_PORTION = 12;
    private boolean canLoadMore;
    private String errorMessage;
    private VKAPIRequest loadRequest;
    private final MusicTrackModel musicTrackModel;
    private ArrayList<MusicTrack> musicTracks;
    private int offset;
    private final int ownerId;
    private String ownerImage;
    private String ownerName;
    private final PlayerModel playerModel;
    private final Subscriber<PlaylistChanged> playlistChangedSubscriber;
    private final Subscriber<PlaylistCreated> playlistCreatedSubscriber;
    private final Subscriber<PlaylistRemoved> playlistRemovedSubscriber;
    private ArrayList<Playlist> playlists;
    private MusicTrack targetTrack;

    @Override // com.vk.music.model.MusicModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull MusicModel.Callback callback) {
        super.subscribe((MusicModelImpl) callback);
    }

    @Override // com.vk.music.model.MusicModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull MusicModel.Callback callback) {
        super.unsubscribe((MusicModelImpl) callback);
    }

    private static PlayerRefer getRefer(int ownerId) {
        if (VKAccountManager.isCurrentUser(ownerId)) {
            return PlayerRefer.audios_my;
        }
        if (ownerId < 0) {
            return PlayerRefer.audios_group;
        }
        return PlayerRefer.audios_user;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(PlaylistChanged event) {
        int index;
        if (getOwnerId() == event.playlist.ownerId && this.playlists != null && (index = this.playlists.indexOf(event.playlist)) != -1) {
            this.playlists.set(index, event.playlist);
            notifyObservers(MusicModelImpl$$Lambda$6.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(PlaylistChanged event, MusicModel.Callback callback) {
        callback.onPlaylistChanged(this, event.playlist);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(PlaylistCreated event) {
        if (getOwnerId() == event.playlist.ownerId && this.playlists != null) {
            this.playlists.add(0, event.playlist);
            notifyObservers(MusicModelImpl$$Lambda$5.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$2(PlaylistCreated event, MusicModel.Callback callback) {
        callback.onPlaylistCreated(this, event.playlist);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(PlaylistRemoved event) {
        if (getOwnerId() == event.playlist.ownerId && this.playlists != null && this.playlists.remove(event.playlist)) {
            notifyObservers(MusicModelImpl$$Lambda$4.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$4(PlaylistRemoved event, MusicModel.Callback callback) {
        callback.onPlaylistRemoved(this, event.playlist);
    }

    public MusicModelImpl(int ownerId, String ownerName, String ownerImage) {
        this(ownerId);
        this.ownerName = ownerName;
        this.ownerImage = ownerImage;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MusicModelImpl(int ownerId) {
        this.canLoadMore = true;
        this.playlistChangedSubscriber = MusicModelImpl$$Lambda$1.lambdaFactory$(this);
        this.playlistCreatedSubscriber = MusicModelImpl$$Lambda$2.lambdaFactory$(this);
        this.playlistRemovedSubscriber = MusicModelImpl$$Lambda$3.lambdaFactory$(this);
        this.ownerId = ownerId;
        this.playerModel = new PlayerModelImpl(getRefer(ownerId));
        this.musicTrackModel = new MusicTrackModelImpl();
        MusicEventBus.subscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
        MusicEventBus.subscribe(PlaylistCreated.class, this.playlistCreatedSubscriber);
        MusicEventBus.subscribe(PlaylistRemoved.class, this.playlistRemovedSubscriber);
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putParcelable("targetTrack", this.targetTrack);
        state.putBoolean("canLoadMore", this.canLoadMore);
        state.putString("ownerName", this.ownerName);
        state.putString("ownerImage", this.ownerImage);
        state.putParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO, this.musicTracks);
        state.putParcelableArrayList("playlists", this.playlists);
        ModelHelper.saveAll(state, this.playerModel, this.musicTrackModel);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.targetTrack = (MusicTrack) state.getParcelable("targetTrack");
        this.canLoadMore = state.getBoolean("canLoadMore");
        this.ownerName = state.getString("ownerName");
        this.ownerImage = state.getString("ownerImage");
        this.musicTracks = state.getParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO);
        this.playlists = state.getParcelableArrayList("playlists");
        ModelHelper.restoreAll(state, this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        MusicEventBus.unsubscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
        MusicEventBus.unsubscribe(PlaylistCreated.class, this.playlistCreatedSubscriber);
        MusicEventBus.unsubscribe(PlaylistRemoved.class, this.playlistRemovedSubscriber);
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
            this.loadRequest = null;
        }
        ModelHelper.releaseAll(this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.MusicModel
    public int getOwnerId() {
        return this.ownerId;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean isNeedLoadTitle() {
        return TextUtils.isEmpty(this.ownerName) || TextUtils.isEmpty(this.ownerImage);
    }

    @Override // com.vk.music.model.MusicModel
    @Nullable
    public String getTitle(Context context) {
        return this.ownerName;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean hasIcon() {
        return true;
    }

    @Override // com.vk.music.model.MusicModel
    public String getIcon() {
        return this.ownerImage;
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public List<Playlist> getPlaylists() {
        return this.playlists == null ? Collections.emptyList() : this.playlists;
    }

    @Override // com.vk.music.model.MusicModel
    @Nullable
    public List<MusicTrack> getMusicTracks() {
        return this.musicTracks;
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public Playlist getOriginalPlaylist(@NonNull Playlist playlist) {
        return playlist.getOriginalPlaylist();
    }

    @Override // com.vk.music.model.MusicModel
    public boolean canLoadMoreAudio() {
        return this.canLoadMore;
    }

    @Override // com.vk.music.model.MusicModel
    public boolean isCurrentUser() {
        return VKAccountManager.isCurrentUser(this.ownerId);
    }

    @Override // com.vk.music.model.MusicModel
    public void loadPage() {
        load(true, true, 0, this.offset != 0 ? this.offset : 100);
    }

    @Override // com.vk.music.model.MusicModel
    public void loadMoreAudio() {
        load(false, false, this.offset, 100);
    }

    private void load(boolean loadOwner, boolean loadPlaylists, int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            this.loadRequest = new AudioGetMusicPage.Builder(this.ownerId).needOwner(loadOwner).needPlaylists(loadPlaylists).playlistsCount(12).audioOffset(audioOffset).audioCount(audioCount).loadSaved(isCurrentUser()).build().setCallback(new AnonymousClass1(loadOwner, loadPlaylists, audioOffset, audioCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Callback<AudioGetMusicPage.Result> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;
        final /* synthetic */ boolean val$loadOwner;
        final /* synthetic */ boolean val$loadPlaylists;

        AnonymousClass1(boolean z, boolean z2, int i, int i2) {
            this.val$loadOwner = z;
            this.val$loadPlaylists = z2;
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioGetMusicPage.Result result) {
            boolean z = true;
            MusicModelImpl.this.loadRequest = null;
            if (this.val$loadOwner) {
                if (!TextUtils.isEmpty(result.ownerName)) {
                    MusicModelImpl.this.ownerName = result.ownerName;
                }
                if (!TextUtils.isEmpty(result.ownerImage)) {
                    MusicModelImpl.this.ownerImage = result.ownerImage;
                }
            }
            if (this.val$loadPlaylists) {
                if (result.savedAudios != null) {
                    if (result.playlists == null) {
                        result.playlists = new VKList<>();
                    }
                    result.playlists.add(0, result.savedAudios);
                }
                MusicModelImpl.this.playlists = result.playlists;
            }
            if (this.val$audioOffset == 0) {
                MusicModelImpl musicModelImpl = MusicModelImpl.this;
                boolean z2 = MusicModelImpl.this.canLoadMore;
                if (result.musicTracks.isEmpty()) {
                    z = false;
                }
                musicModelImpl.canLoadMore = z & z2;
                MusicModelImpl.this.offset = this.val$audioCount;
                MusicModelImpl.this.musicTracks = result.musicTracks;
                MusicModelImpl.this.notifyObservers(MusicModelImpl$1$$Lambda$1.lambdaFactory$(this));
                return;
            }
            MusicModelImpl musicModelImpl2 = MusicModelImpl.this;
            if (result.musicTracks.isEmpty()) {
                z = false;
            }
            musicModelImpl2.canLoadMore = z;
            if (MusicModelImpl.this.canLoadMore) {
                MusicModelImpl.this.offset = this.val$audioOffset + this.val$audioCount;
                MusicModelImpl.this.musicTracks.addAll(result.musicTracks);
            }
            MusicModelImpl.this.notifyObservers(MusicModelImpl$1$$Lambda$2.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(MusicModel.Callback callback) {
            callback.onLoadingDone(MusicModelImpl.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(AudioGetMusicPage.Result result, MusicModel.Callback callback) {
            callback.onAudioLoadingDone(MusicModelImpl.this, result.musicTracks);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicModelImpl.this.loadRequest = null;
            Log.w("vk", error.toString());
            MusicModelImpl.this.errorMessage = error.message;
            if (this.val$audioOffset == 0) {
                MusicModelImpl.this.notifyObservers(MusicModelImpl$1$$Lambda$3.lambdaFactory$(this, error));
            } else {
                MusicModelImpl.this.notifyObservers(MusicModelImpl$1$$Lambda$4.lambdaFactory$(this, error));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(VKAPIRequest.VKErrorResponse error, MusicModel.Callback callback) {
            callback.onLoadingError(MusicModelImpl.this, error);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(VKAPIRequest.VKErrorResponse error, MusicModel.Callback callback) {
            callback.onAudioLoadingError(MusicModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.MusicModel
    @NonNull
    public PlayerModel getPlayerModel() {
        return this.playerModel;
    }

    @Override // com.vk.music.model.MusicModel
    public void loadAndPlayShuffleAll(@NonNull Context ctx) {
        if (!canLoadMoreAudio() && this.musicTracks != null && !this.musicTracks.isEmpty()) {
            ArrayList<MusicTrack> shuffleTracks = new ArrayList<>(this.musicTracks);
            Collections.shuffle(shuffleTracks);
            getPlayerModel().togglePlayer(null, shuffleTracks);
            return;
        }
        new AudioGet(this.ownerId).offset(0).count(200).extended().shuffle().setCallback(new SimpleCallback<VKList<MusicTrack>>() { // from class: com.vk.music.model.MusicModelImpl.2
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<MusicTrack> result) {
                if (result != null && !result.isEmpty()) {
                    MusicModelImpl.this.getPlayerModel().togglePlayer(null, result);
                }
            }
        }).wrapProgress(ctx).exec(ctx);
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

    @Override // com.vk.music.model.ObservableModel, com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        super.clearCallbacks();
        ModelHelper.clearCallbacksAll(this.playerModel, this.musicTrackModel);
    }
}
