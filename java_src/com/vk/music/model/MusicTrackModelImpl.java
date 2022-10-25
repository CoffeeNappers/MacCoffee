package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vk.music.model.MusicTrackModel;
import com.vk.music.utils.BoomHelper;
import com.vk.sharing.SharingService;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioAdd;
import com.vkontakte.android.api.audio.AudioAddToPlaylist;
import com.vkontakte.android.api.audio.AudioDelete;
import com.vkontakte.android.api.audio.AudioRemoveFromPlaylist;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MusicTrackModelImpl extends ObservableModel<MusicTrackModel.Callback> implements MusicTrackModel {
    private MusicTrack target;
    private Map<String, VKAPIRequest> addRequests = new HashMap();
    private Map<String, VKAPIRequest> addToPlaylistRequests = new HashMap();
    private Map<String, VKAPIRequest> removeRequests = new HashMap();
    private Map<String, VKAPIRequest> removeFromPlaylistRequests = new HashMap();
    private BoomHelper boomHelper = new BoomHelper();

    @Override // com.vk.music.model.MusicTrackModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull MusicTrackModel.Callback callback) {
        super.subscribe((MusicTrackModelImpl) callback);
    }

    @Override // com.vk.music.model.MusicTrackModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull MusicTrackModel.Callback callback) {
        super.unsubscribe((MusicTrackModelImpl) callback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String key(MusicTrack musicTrack) {
        return musicTrack.getMid();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String key(MusicTrack musicTrack, Playlist playlist) {
        return musicTrack.getMid() + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + playlist.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + playlist.id;
    }

    @Override // com.vk.music.model.MusicTrackModel
    public void setTarget(@NonNull MusicTrack target) {
        this.target = target;
    }

    @Override // com.vk.music.model.MusicTrackModel
    @Nullable
    public MusicTrack getTarget() {
        return this.target;
    }

    @Override // com.vk.music.model.MusicTrackModel
    public boolean canAddAudio(@Nullable MusicTrack mt) {
        return mt != null && !VKAccountManager.isCurrentUser(mt.oid);
    }

    @Override // com.vk.music.model.MusicTrackModel
    public void addAudio(@NonNull MusicTrack musicTrack, @Nullable Playlist playlist) {
        if (playlist != null) {
            addMusicToPlaylist(musicTrack, playlist);
        } else {
            addMusic(musicTrack);
        }
    }

    @Override // com.vk.music.model.MusicTrackModel
    public boolean canRemoveAudio(@Nullable MusicTrack mt) {
        return mt != null && VKAccountManager.isCurrentUser(mt.oid);
    }

    @Override // com.vk.music.model.MusicTrackModel
    public void removeAudio(@NonNull MusicTrack musicTrack, @Nullable Playlist playlist) {
        if (playlist != null) {
            removeMusicFromPlaylist(musicTrack, playlist);
        } else {
            removeMusic(musicTrack);
        }
    }

    private void removeMusic(@NonNull MusicTrack musicTrack) {
        if (!this.removeRequests.containsKey(key(musicTrack))) {
            this.removeRequests.put(key(musicTrack), new AudioDelete(musicTrack).setCallback(new AnonymousClass1(musicTrack)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicTrackModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Callback<Boolean> {
        final /* synthetic */ MusicTrack val$musicTrack;

        AnonymousClass1(MusicTrack musicTrack) {
            this.val$musicTrack = musicTrack;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Boolean result) {
            MusicTrackModelImpl.this.removeRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack));
            AudioFacade.removeCachedFile(this.val$musicTrack.getMid());
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$1$$Lambda$1.lambdaFactory$(this, this.val$musicTrack));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(@NonNull MusicTrack musicTrack, MusicTrackModel.Callback callback) {
            callback.onAudioRemovalDone(MusicTrackModelImpl.this, musicTrack);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicTrackModelImpl.this.removeRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack));
            L.w("vk", error.toString());
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$1$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, MusicTrackModel.Callback callback) {
            callback.onAudioRemovalError(MusicTrackModelImpl.this, error);
        }
    }

    private void removeMusicFromPlaylist(@NonNull MusicTrack musicTrack, @NonNull Playlist playlist) {
        if (!this.removeFromPlaylistRequests.containsKey(key(musicTrack, playlist))) {
            this.removeFromPlaylistRequests.put(key(musicTrack, playlist), new AudioRemoveFromPlaylist.Builder().ownerId(playlist.ownerId).playlistId(playlist.id).addAudio(musicTrack).build().setCallback(new AnonymousClass2(musicTrack, playlist)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicTrackModelImpl$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<AudioRemoveFromPlaylist.Result> {
        final /* synthetic */ MusicTrack val$musicTrack;
        final /* synthetic */ Playlist val$playlist;

        AnonymousClass2(MusicTrack musicTrack, Playlist playlist) {
            this.val$musicTrack = musicTrack;
            this.val$playlist = playlist;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioRemoveFromPlaylist.Result result) {
            MusicTrackModelImpl.this.removeFromPlaylistRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack, this.val$playlist));
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$2$$Lambda$1.lambdaFactory$(this, result, this.val$musicTrack));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(AudioRemoveFromPlaylist.Result result, @NonNull MusicTrack musicTrack, MusicTrackModel.Callback callback) {
            callback.onAudioRemovalFromPlaylistDone(MusicTrackModelImpl.this, result.playlist, musicTrack);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicTrackModelImpl.this.removeFromPlaylistRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack, this.val$playlist));
            L.w("vk", error.toString());
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$2$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, MusicTrackModel.Callback callback) {
            callback.onAudioRemovalFromPlaylistError(MusicTrackModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.MusicTrackModel
    public boolean isDownloaded(@NonNull MusicTrack musicTrack) {
        return AudioFacade.isCached(musicTrack.getMid());
    }

    @Override // com.vk.music.model.MusicTrackModel
    public void download(@NonNull MusicTrack musicTrack, @NonNull Context ctx) {
        if (VKAccountManager.getCurrent().isMusicRestricted()) {
            this.boomHelper.loadTrack(ctx, musicTrack, BoomHelper.From.menu);
        } else {
            AudioFacade.startDownloadTracks((Collection<MusicTrack>) Collections.singletonList(musicTrack), true);
        }
    }

    @Override // com.vk.music.model.MusicTrackModel
    public void clearDownloaded(@NonNull MusicTrack musicTrack) {
        AudioFacade.removeSavedTrack(musicTrack.getMid());
    }

    private void addMusic(@NonNull MusicTrack musicTrack) {
        if (!this.addRequests.containsKey(key(musicTrack))) {
            this.addRequests.put(key(musicTrack), new AudioAdd(musicTrack.oid, musicTrack.aid, 0).setCallback(new AnonymousClass3(musicTrack)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicTrackModelImpl$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 implements Callback<Integer> {
        final /* synthetic */ MusicTrack val$musicTrack;

        AnonymousClass3(MusicTrack musicTrack) {
            this.val$musicTrack = musicTrack;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Integer result) {
            MusicTrackModelImpl.this.addRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack));
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$3$$Lambda$1.lambdaFactory$(this, this.val$musicTrack));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(@NonNull MusicTrack musicTrack, MusicTrackModel.Callback callback) {
            callback.onAudioAdditionDone(MusicTrackModelImpl.this, musicTrack);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicTrackModelImpl.this.addRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack));
            L.w("vk", error.toString());
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$3$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, MusicTrackModel.Callback callback) {
            callback.onAudioAdditionError(MusicTrackModelImpl.this, error);
        }
    }

    private void addMusicToPlaylist(@NonNull MusicTrack musicTrack, @NonNull Playlist playlist) {
        if (!this.addToPlaylistRequests.containsKey(key(musicTrack, playlist))) {
            this.addToPlaylistRequests.put(key(musicTrack, playlist), new AudioAddToPlaylist.Builder().ownerId(playlist.ownerId).playlistId(playlist.id).addAudio(musicTrack).build().setCallback(new AnonymousClass4(musicTrack, playlist)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.MusicTrackModelImpl$4  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements Callback<AudioAddToPlaylist.Result> {
        final /* synthetic */ MusicTrack val$musicTrack;
        final /* synthetic */ Playlist val$playlist;

        AnonymousClass4(MusicTrack musicTrack, Playlist playlist) {
            this.val$musicTrack = musicTrack;
            this.val$playlist = playlist;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioAddToPlaylist.Result result) {
            MusicTrackModelImpl.this.addToPlaylistRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack, this.val$playlist));
            if (result.ids.length == 1) {
                this.val$musicTrack.changeIds(this.val$musicTrack.oid, result.ids[0]);
            }
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$4$$Lambda$1.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(AudioAddToPlaylist.Result result, MusicTrackModel.Callback callback) {
            callback.onAudioAdditionToPlaylistDone(MusicTrackModelImpl.this, result.playlist);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicTrackModelImpl.this.addToPlaylistRequests.remove(MusicTrackModelImpl.key(this.val$musicTrack, this.val$playlist));
            Log.w("vk", error.toString());
            MusicTrackModelImpl.this.notifyObservers(MusicTrackModelImpl$4$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, MusicTrackModel.Callback callback) {
            callback.onAudioAdditionToPlaylistError(MusicTrackModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.target = (MusicTrack) state.getParcelable(SharingService.EXTRA_TARGET);
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putParcelable(SharingService.EXTRA_TARGET, this.target);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
    }
}
