package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.PlaylistLink;
import com.vk.music.event.MusicEventBus;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.Subscriber;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.PlaylistModel;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioAddToPlaylist;
import com.vkontakte.android.api.audio.AudioDeletePlaylist;
import com.vkontakte.android.api.audio.AudioFollowPlaylist;
import com.vkontakte.android.api.audio.AudioGet;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.SavedTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes2.dex */
public class PlaylistModelImpl extends ObservableModel<PlaylistModel.Callback> implements PlaylistModel {
    static final int AUDIO_ITEMS_PORTION = 100;
    final String accessKey;
    VKAPIRequest attachRequest;
    VKAPIRequest deleteRequest;
    String errorMessage;
    VKAPIRequest loadRequest;
    ArrayList<MusicTrack> musicTracks;
    int offset;
    String owner;
    final int ownerId;
    final PlayerModel playerModel;
    Playlist playlist;
    final int playlistId;
    final int playlistType;
    VKAPIRequest toggleRequest;
    boolean canLoadMore = true;
    final Subscriber<PlaylistChanged> playlistChangedSubscriber = PlaylistModelImpl$$Lambda$1.lambdaFactory$(this);
    private final MusicTrackModel.Callback musicTrackModelCallback = new MusicTrackModel.Callback() { // from class: com.vk.music.model.PlaylistModelImpl.8
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
        }

        @Override // com.vk.music.model.MusicTrackModel.Callback
        public void onAudioAdditionToPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        }

        @Override // com.vk.music.model.MusicTrackModel.Callback
        public void onAudioRemovalFromPlaylistDone(@NonNull MusicTrackModel model, @NonNull Playlist playlist, @NonNull MusicTrack musicTrack) {
            if (playlist.equals(PlaylistModelImpl.this.getPlaylist()) && PlaylistModelImpl.this.musicTracks != null) {
                PlaylistModelImpl.this.setPlaylist(playlist);
                PlaylistModelImpl.this.musicTracks.remove(musicTrack);
            }
        }

        @Override // com.vk.music.model.MusicTrackModel.Callback
        public void onAudioRemovalFromPlaylistError(@NonNull MusicTrackModel model, @NonNull ErrorResponse response) {
        }
    };
    final MusicTrackModel musicTrackModel = new MusicTrackModelImpl();

    @Override // com.vk.music.model.PlaylistModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull PlaylistModel.Callback callback) {
        super.subscribe((PlaylistModelImpl) callback);
    }

    @Override // com.vk.music.model.PlaylistModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull PlaylistModel.Callback callback) {
        super.unsubscribe((PlaylistModelImpl) callback);
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
        if (this.playlist.getPid() == event.playlist.getPid()) {
            this.playlist = event.playlist;
            notifyObservers(PlaylistModelImpl$$Lambda$3.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(PlaylistModel.Callback callback) {
        callback.onPlaylistChanged(this);
    }

    public PlaylistModelImpl(int ownerId, int playlistId, int playlistType, @Nullable Playlist playlist, String accessKey) {
        this.ownerId = ownerId;
        this.playlistId = playlistId;
        this.playlistType = playlistType;
        this.playlist = playlist;
        this.accessKey = accessKey;
        this.playerModel = new PlayerModelImpl(getRefer(ownerId));
        this.musicTrackModel.subscribe(this.musicTrackModelCallback);
        MusicEventBus.subscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putInt("offset", this.offset);
        state.putBoolean("canLoadMore", this.canLoadMore);
        state.putString("owner", this.owner);
        state.putParcelable("playlist", this.playlist);
        state.putParcelableArrayList("music", this.musicTracks);
        ModelHelper.saveAll(state, this.playerModel, this.musicTrackModel);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.offset = state.getInt("offset");
        this.canLoadMore = state.getBoolean("canLoadMore");
        this.owner = state.getString("owner");
        this.playlist = (Playlist) state.getParcelable("playlist");
        this.musicTracks = state.getParcelableArrayList("music");
        ModelHelper.restoreAll(state, this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        this.musicTrackModel.unsubscribe(this.musicTrackModelCallback);
        MusicEventBus.unsubscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
        }
        ModelHelper.releaseAll(this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.PlaylistModel
    public int getOwnerId() {
        return this.ownerId;
    }

    @Override // com.vk.music.model.PlaylistModel
    public boolean isCurrentUser() {
        return VKAccountManager.isCurrentUser(this.ownerId);
    }

    @Override // com.vk.music.model.PlaylistModel
    public String getOwner() {
        return this.owner;
    }

    @Override // com.vk.music.model.PlaylistModel
    @Nullable
    public Playlist getPlaylist() {
        return this.playlist;
    }

    public void setPlaylist(@NonNull Playlist playlist) {
        this.playlist = playlist;
    }

    @Override // com.vk.music.model.PlaylistModel
    @Nullable
    public List<MusicTrack> getMusicTracks() {
        return this.musicTracks;
    }

    @Override // com.vk.music.model.PlaylistModel
    public int getOffset() {
        return this.offset;
    }

    @Override // com.vk.music.model.PlaylistModel
    public boolean canLoadMore() {
        return this.canLoadMore;
    }

    @Override // com.vk.music.model.PlaylistModel
    public boolean isLoaded() {
        return this.playlist != null;
    }

    @Override // com.vk.music.model.PlaylistModel
    public void load() {
        load(true, true, 0, this.offset != 0 ? this.offset : 100);
    }

    @Override // com.vk.music.model.PlaylistModel
    public void loadMore() {
        load(false, false, this.offset, 100);
    }

    private void load(boolean loadOwner, boolean loadPlaylist, int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            if (this.playlistType == 2) {
                this.loadRequest = new VKAPIRequest("");
                new AnonymousClass1(loadOwner, audioOffset).execPool(new Void[0]);
                return;
            }
            this.loadRequest = new AudioGetPlaylist.Builder(this.playlistId, this.ownerId).needOwner(loadOwner).needPlaylist(loadPlaylist).audioOffset(audioOffset).audioCount(audioCount).accessKey(this.accessKey).build().setCallback(new AnonymousClass2(loadOwner, loadPlaylist, audioOffset, audioCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 extends AsyncTask<Void, Void, ArrayList<MusicTrack>> {
        final /* synthetic */ int val$audioOffset;
        final /* synthetic */ boolean val$loadOwner;

        AnonymousClass1(boolean z, int i) {
            this.val$loadOwner = z;
            this.val$audioOffset = i;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public ArrayList<MusicTrack> doInBackground(Void... args) throws Throwable {
            List<SavedTrack> savedTracks = AudioFacade.getSavedTracks();
            return savedTracks != null ? new ArrayList<>(savedTracks) : new ArrayList<>();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onPostExecute(ArrayList<MusicTrack> _musicTracks) {
            PlaylistModelImpl.this.loadRequest = null;
            if (this.val$loadOwner) {
                PlaylistModelImpl.this.owner = VKAccountManager.getCurrent().getName();
            }
            PlaylistModelImpl.this.musicTracks = _musicTracks;
            PlaylistModelImpl.this.canLoadMore = false;
            PlaylistModelImpl.this.playlist = new Playlist(VKApplication.context.getString(R.string.music_saved_playlist), VKAccountManager.getCurrent().getUid(), 2);
            if (this.val$audioOffset == 0) {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$1$$Lambda$1.lambdaFactory$(this));
            } else {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$1$$Lambda$2.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPostExecute$0(PlaylistModel.Callback callback) {
            callback.onLoadingDone(PlaylistModelImpl.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPostExecute$1(PlaylistModel.Callback callback) {
            callback.onLoadingMoreDone(PlaylistModelImpl.this, new ArrayList());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<AudioGetPlaylist.Result> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;
        final /* synthetic */ boolean val$loadOwner;
        final /* synthetic */ boolean val$loadPlaylist;

        AnonymousClass2(boolean z, boolean z2, int i, int i2) {
            this.val$loadOwner = z;
            this.val$loadPlaylist = z2;
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioGetPlaylist.Result result) {
            boolean z = true;
            PlaylistModelImpl.this.loadRequest = null;
            if (this.val$loadOwner) {
                PlaylistModelImpl.this.owner = result.owner;
            }
            if (this.val$loadPlaylist) {
                PlaylistModelImpl.this.playlist = result.playlist;
            }
            if (this.val$audioOffset == 0) {
                PlaylistModelImpl playlistModelImpl = PlaylistModelImpl.this;
                boolean z2 = playlistModelImpl.canLoadMore;
                if (result.musicTracks.isEmpty()) {
                    z = false;
                }
                playlistModelImpl.canLoadMore = z & z2;
                PlaylistModelImpl.this.offset = this.val$audioCount;
                PlaylistModelImpl.this.musicTracks = result.musicTracks;
            } else {
                PlaylistModelImpl playlistModelImpl2 = PlaylistModelImpl.this;
                if (result.musicTracks.isEmpty()) {
                    z = false;
                }
                playlistModelImpl2.canLoadMore = z;
                if (PlaylistModelImpl.this.canLoadMore) {
                    PlaylistModelImpl.this.offset = this.val$audioOffset + this.val$audioCount;
                    PlaylistModelImpl.this.musicTracks.addAll(result.musicTracks);
                }
            }
            if (this.val$audioOffset == 0) {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$2$$Lambda$1.lambdaFactory$(this));
            } else {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$2$$Lambda$2.lambdaFactory$(this, result));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(PlaylistModel.Callback callback) {
            callback.onLoadingDone(PlaylistModelImpl.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(AudioGetPlaylist.Result result, PlaylistModel.Callback callback) {
            callback.onLoadingMoreDone(PlaylistModelImpl.this, result.musicTracks);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistModelImpl.this.loadRequest = null;
            Log.w("vk", error.toString());
            PlaylistModelImpl.this.errorMessage = error.message;
            if (this.val$audioOffset == 0) {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$2$$Lambda$3.lambdaFactory$(this, error));
            } else {
                PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$2$$Lambda$4.lambdaFactory$(this, error));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onLoadingError(PlaylistModelImpl.this, error);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onLoadingMoreError(PlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistModel
    public void toggleFollowing() {
        if (this.toggleRequest == null) {
            if (this.playlist.followed == null) {
                this.toggleRequest = new AudioFollowPlaylist(this.playlistId, this.ownerId, this.accessKey).setCallback(new AnonymousClass3()).exec(this);
            } else {
                this.toggleRequest = new AudioDeletePlaylist(this.playlist.followed.id, this.playlist.followed.ownerId).setCallback(new AnonymousClass4()).exec(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 implements Callback<PlaylistLink> {
        AnonymousClass3() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(PlaylistLink result) {
            PlaylistModelImpl.this.toggleRequest = null;
            PlaylistModelImpl.this.playlist.followed = result;
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$3$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(PlaylistModel.Callback callback) {
            callback.onFollowingTogglingDone(PlaylistModelImpl.this, PlaylistModelImpl.this.playlist);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistModelImpl.this.toggleRequest = null;
            Log.w("vk", error.toString());
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$3$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onFollowingTogglingError(PlaylistModelImpl.this, error);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$4  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements Callback<Boolean> {
        AnonymousClass4() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Boolean result) {
            PlaylistModelImpl.this.toggleRequest = null;
            PlaylistModelImpl.this.playlist.followed = null;
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$4$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(PlaylistModel.Callback callback) {
            callback.onFollowingTogglingDone(PlaylistModelImpl.this, PlaylistModelImpl.this.playlist);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistModelImpl.this.toggleRequest = null;
            Log.w("vk", error.toString());
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$4$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onFollowingTogglingError(PlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistModel
    public boolean isFollowed() {
        return (this.playlist == null || this.playlist.followed == null) ? false : true;
    }

    @Override // com.vk.music.model.PlaylistModel
    public boolean canShare() {
        return (this.playlist == null || this.playlist.type == 2) ? false : true;
    }

    @Override // com.vk.music.model.PlaylistModel
    public void loadAndPlayShuffleAll(@NonNull Context ctx) {
        if (!canLoadMore() && this.musicTracks != null && !this.musicTracks.isEmpty()) {
            ArrayList<MusicTrack> shuffleTracks = new ArrayList<>(this.musicTracks);
            Collections.shuffle(shuffleTracks);
            getPlayerModel().togglePlayer(null, shuffleTracks);
            return;
        }
        new AudioGet(this.ownerId).playlistId(this.playlistId).offset(0).count(200).accessKey(this.accessKey).shuffle().setCallback(new SimpleCallback<VKList<MusicTrack>>() { // from class: com.vk.music.model.PlaylistModelImpl.5
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<MusicTrack> result) {
                if (result != null && !result.isEmpty()) {
                    PlaylistModelImpl.this.getPlayerModel().togglePlayer(null, result);
                }
            }
        }).wrapProgress(ctx).exec(ctx);
    }

    @Override // com.vk.music.model.PlaylistModel
    public void delete() {
        if (this.deleteRequest == null) {
            if (this.playlist != null && this.playlist.type == 2) {
                AudioFacade.removeSavedTrack(new String[0]);
                notifyObservers(PlaylistModelImpl$$Lambda$2.lambdaFactory$(this));
                return;
            }
            this.deleteRequest = new AudioDeletePlaylist(this.playlistId, this.ownerId).setCallback(new AnonymousClass6()).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$delete$2(PlaylistModel.Callback callback) {
        callback.onDeletionDone(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$6  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass6 implements Callback<Boolean> {
        AnonymousClass6() {
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(PlaylistModel.Callback callback) {
            callback.onDeletionDone(PlaylistModelImpl.this);
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Boolean result) {
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$6$$Lambda$1.lambdaFactory$(this));
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            Log.w("vk", error.toString());
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$6$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onDeletionError(PlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistModel
    public void attachMusic(@NonNull List<MusicTrack> tracksToAttach) {
        if (this.attachRequest == null) {
            AudioAddToPlaylist.Builder builder = new AudioAddToPlaylist.Builder();
            for (MusicTrack musicTrack : tracksToAttach) {
                builder.addAudio(musicTrack);
            }
            builder.ownerId(this.ownerId);
            builder.playlistId(this.playlistId);
            this.attachRequest = builder.build().setCallback(new AnonymousClass7(tracksToAttach)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistModelImpl$7  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass7 implements Callback<AudioAddToPlaylist.Result> {
        final /* synthetic */ List val$tracksToAttach;

        AnonymousClass7(List list) {
            this.val$tracksToAttach = list;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioAddToPlaylist.Result result) {
            PlaylistModelImpl.this.attachRequest = null;
            PlaylistModelImpl.this.setPlaylist(result.playlist);
            int i = 0;
            if (result.ids.length == this.val$tracksToAttach.size()) {
                for (MusicTrack track : this.val$tracksToAttach) {
                    track.changeIds(track.oid, result.ids[i]);
                    i++;
                }
            }
            if (PlaylistModelImpl.this.musicTracks != null) {
                Iterator<MusicTrack> it = this.val$tracksToAttach.iterator();
                while (it.hasNext()) {
                    MusicTrack next = it.next();
                    if (PlaylistModelImpl.this.musicTracks.contains(next)) {
                        it.remove();
                    } else {
                        PlaylistModelImpl.this.musicTracks.add(0, next);
                    }
                }
            }
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$7$$Lambda$1.lambdaFactory$(this, this.val$tracksToAttach));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(@NonNull List tracksToAttach, PlaylistModel.Callback callback) {
            callback.onAttachingDone(PlaylistModelImpl.this, tracksToAttach);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistModelImpl.this.attachRequest = null;
            Log.w("vk", error.toString());
            PlaylistModelImpl.this.notifyObservers(PlaylistModelImpl$7$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistModel.Callback callback) {
            callback.onAttachingError(PlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistModel
    @NonNull
    public PlayerModel getPlayerModel() {
        return this.playerModel;
    }

    @Override // com.vk.music.model.PlaylistModel
    @NonNull
    public MusicTrackModel getMusicTrackModel() {
        return this.musicTrackModel;
    }

    @Override // com.vk.music.model.PlaylistModel
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
