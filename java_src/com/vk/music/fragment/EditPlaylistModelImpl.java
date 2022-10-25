package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.core.util.CollectionUtils;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Thumb;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import com.vkontakte.android.api.audio.AudioSavePlaylist;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: EditPlaylistFragment.java */
/* loaded from: classes2.dex */
public final class EditPlaylistModelImpl extends ObservableModel<EditPlaylistModel.Callback> implements EditPlaylistModel {
    static final int AUDIO_ITEMS_PORTION = 100;
    boolean canLoadMore;
    String description;
    VKAPIRequest loadRequest;
    ArrayList<MusicTrack> musicTracks;
    int offset;
    Thumb photoUrl;
    Playlist playlist;
    VKAPIRequest saveRequest;
    String title;
    ArrayList<MusicTrack> removed = new ArrayList<>();
    ArrayList<MusicTrack> attached = new ArrayList<>();

    @Override // com.vk.music.model.EditPlaylistModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull EditPlaylistModel.Callback callback) {
        super.subscribe((EditPlaylistModelImpl) callback);
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull EditPlaylistModel.Callback callback) {
        super.unsubscribe((EditPlaylistModelImpl) callback);
    }

    public EditPlaylistModelImpl(@Nullable Playlist playlist, int offset, @Nullable ArrayList<MusicTrack> musicTracks) {
        this.canLoadMore = true;
        this.playlist = playlist;
        this.offset = offset;
        if (playlist != null) {
            this.title = playlist.title;
            this.description = playlist.description;
            this.photoUrl = playlist.photo;
            this.musicTracks = musicTracks;
            return;
        }
        this.title = "";
        this.description = "";
        this.musicTracks = new ArrayList<>();
        this.canLoadMore = false;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public boolean isNew() {
        return this.playlist == null;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @NonNull
    public String getTitle() {
        return this.title;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void setTitle(@NonNull String title) {
        this.title = title;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @NonNull
    public String getDescription() {
        return this.description;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void setDescription(@NonNull String description) {
        this.description = description;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @Nullable
    public Thumb getPhotoUrl() {
        return this.photoUrl;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @Nullable
    public List<MusicTrack> getMusicTracks() {
        return this.musicTracks;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @NonNull
    public Collection<MusicTrack> getRemoved() {
        return this.removed;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    @NonNull
    public Collection<MusicTrack> getAttached() {
        return isNew() ? this.musicTracks : this.attached;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public boolean toggleRemoved(@NonNull MusicTrack musicTrack) {
        if (this.removed.contains(musicTrack)) {
            this.removed.remove(musicTrack);
            return false;
        }
        this.removed.add(musicTrack);
        return true;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void savePlaylist() {
        if (this.saveRequest == null) {
            AudioSavePlaylist.Builder builder = new AudioSavePlaylist.Builder();
            if (isNew()) {
                builder.ownerId(VKAccountManager.getCurrent().getUid());
                if (!CollectionUtils.isEmpty(this.musicTracks)) {
                    Iterator<MusicTrack> it = this.musicTracks.iterator();
                    while (it.hasNext()) {
                        MusicTrack musicTrack = it.next();
                        builder.addAudio(musicTrack);
                    }
                }
            } else {
                builder.ownerId(this.playlist.ownerId).playlistId(this.playlist.id);
                if (!CollectionUtils.isEmpty(this.attached)) {
                    Iterator<MusicTrack> it2 = this.attached.iterator();
                    while (it2.hasNext()) {
                        MusicTrack musicTrack2 = it2.next();
                        builder.addAudioToAdd(musicTrack2);
                    }
                }
                if (!CollectionUtils.isEmpty(this.removed)) {
                    Iterator<MusicTrack> it3 = this.removed.iterator();
                    while (it3.hasNext()) {
                        MusicTrack musicTrack3 = it3.next();
                        builder.addAudioToRemove(musicTrack3);
                    }
                }
            }
            this.saveRequest = builder.title(this.title).description(this.description).build().setCallback(new AnonymousClass1()).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: EditPlaylistFragment.java */
    /* renamed from: com.vk.music.fragment.EditPlaylistModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Callback<Playlist> {
        AnonymousClass1() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Playlist result) {
            EditPlaylistModelImpl.this.saveRequest = null;
            EditPlaylistModelImpl.this.notifyObservers(EditPlaylistModelImpl$1$$Lambda$1.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(Playlist result, EditPlaylistModel.Callback callback) {
            callback.onSavingDone(EditPlaylistModelImpl.this, result);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            EditPlaylistModelImpl.this.saveRequest = null;
            Log.w("vk", error.toString());
            EditPlaylistModelImpl.this.notifyObservers(EditPlaylistModelImpl$1$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, EditPlaylistModel.Callback callback) {
            callback.onSavingError(EditPlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public boolean canLoadMore() {
        return this.canLoadMore;
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void loadMore() {
        load(this.offset, 100);
    }

    private void load(int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            if (this.playlist == null) {
                Log.w("vk", "EditPlaylistModelImpl: playlist must not be null");
            } else {
                this.loadRequest = new AudioGetPlaylist.Builder(this.playlist.id, this.playlist.ownerId).audioOffset(audioOffset).audioCount(audioCount).build().setCallback(new AnonymousClass2(audioOffset, audioCount)).exec(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: EditPlaylistFragment.java */
    /* renamed from: com.vk.music.fragment.EditPlaylistModelImpl$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<AudioGetPlaylist.Result> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;

        AnonymousClass2(int i, int i2) {
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioGetPlaylist.Result result) {
            EditPlaylistModelImpl.this.loadRequest = null;
            EditPlaylistModelImpl.this.canLoadMore = !result.musicTracks.isEmpty();
            if (EditPlaylistModelImpl.this.canLoadMore) {
                EditPlaylistModelImpl.this.offset = this.val$audioOffset + this.val$audioCount;
                EditPlaylistModelImpl.this.musicTracks.addAll(result.musicTracks);
            }
            EditPlaylistModelImpl.this.notifyObservers(EditPlaylistModelImpl$2$$Lambda$1.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(AudioGetPlaylist.Result result, EditPlaylistModel.Callback callback) {
            callback.onLoadingMoreDone(EditPlaylistModelImpl.this, result.musicTracks);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            EditPlaylistModelImpl.this.loadRequest = null;
            Log.w("vk", error.toString());
            EditPlaylistModelImpl.this.notifyObservers(EditPlaylistModelImpl$2$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, EditPlaylistModel.Callback callback) {
            callback.onLoadingMoreError(EditPlaylistModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public boolean isTrackAttached(@NonNull MusicTrack musicTrack) {
        if (isNew()) {
            return this.musicTracks.contains(musicTrack);
        }
        return this.attached != null && this.attached.contains(musicTrack);
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void removeAttachedTrack(@NonNull MusicTrack musicTrack) {
        if (isNew()) {
            this.musicTracks.remove(musicTrack);
        } else if (this.attached != null) {
            this.attached.remove(musicTrack);
            this.musicTracks.remove(musicTrack);
        }
    }

    @Override // com.vk.music.model.EditPlaylistModel
    public void attachTracks(@NonNull List<MusicTrack> attachedMusicTracks) {
        if (!attachedMusicTracks.isEmpty()) {
            if (isNew()) {
                for (MusicTrack musicTrack : attachedMusicTracks) {
                    if (!this.musicTracks.contains(musicTrack)) {
                        this.musicTracks.add(0, musicTrack);
                    }
                }
                return;
            }
            if (this.attached == null) {
                this.attached = new ArrayList<>();
            }
            for (MusicTrack musicTrack2 : attachedMusicTracks) {
                if (!this.attached.contains(musicTrack2)) {
                    this.attached.add(0, musicTrack2);
                    this.musicTracks.add(0, musicTrack2);
                }
            }
        }
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putBoolean("canLoadMore", this.canLoadMore);
        state.putInt("offset", this.offset);
        state.putString("title", this.title);
        state.putString("description", this.description);
        state.putParcelable("photoUrl", this.photoUrl);
        state.putParcelable("playlist", this.playlist);
        state.putParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO, this.musicTracks);
        state.putParcelableArrayList("removed", this.removed);
        state.putParcelableArrayList("attached", this.attached);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.canLoadMore = state.getBoolean("canLoadMore");
        this.offset = state.getInt("offset");
        this.title = state.getString("title");
        this.description = state.getString("description");
        this.photoUrl = (Thumb) state.getParcelable("photoUrl");
        this.playlist = (Playlist) state.getParcelable("playlist");
        this.musicTracks = state.getParcelableArrayList(MimeTypes.BASE_TYPE_AUDIO);
        this.removed = state.getParcelableArrayList("removed");
        this.attached = state.getParcelableArrayList("attached");
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
        }
    }
}
