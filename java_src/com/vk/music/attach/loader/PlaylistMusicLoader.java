package com.vk.music.attach.loader;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import com.vkontakte.android.audio.MusicTrack;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class PlaylistMusicLoader extends Fragment {
    private static final String KEY_CAN_LOAD_MORE = "PlaylistMusicLoader.key.canLoadMore";
    private static final String KEY_MUSIC_TRACKS = "PlaylistMusicLoader.key.musicTracks";
    private static final String KEY_OFFSET = "PlaylistMusicLoader.key.offset";
    private static final String KEY_PLAYLIST = "PlaylistMusicLoader.key.playlist";
    private static final String KEY_REASON = "PlaylistMusicLoader.key.reason";
    private static final int LOAD_PORTION = 100;
    List<Callback> callbacks;
    boolean canLoadMore = true;
    private VKAPIRequest loadRequest;
    ArrayList<MusicTrack> musicTracks;
    int offset;
    private Playlist playlist;
    String reason;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onMusicLoadingDone(@NonNull PlaylistMusicLoader playlistMusicLoader);

        void onMusicLoadingError(@NonNull PlaylistMusicLoader playlistMusicLoader, @NonNull String str);

        void onMusicLoadingMoreDone(@NonNull PlaylistMusicLoader playlistMusicLoader, @NonNull List<MusicTrack> list);

        void onMusicLoadingMoreError(@NonNull PlaylistMusicLoader playlistMusicLoader, @NonNull String str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface Notification<T> {
        void accept(@NonNull T t);
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelable(KEY_PLAYLIST, this.playlist);
        outState.putInt(KEY_OFFSET, this.offset);
        outState.putBoolean(KEY_CAN_LOAD_MORE, this.canLoadMore);
        outState.putParcelableArrayList(KEY_MUSIC_TRACKS, this.musicTracks);
        outState.putString(KEY_REASON, this.reason);
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        if (savedInstanceState != null) {
            this.playlist = (Playlist) savedInstanceState.getParcelable(KEY_PLAYLIST);
            this.offset = savedInstanceState.getInt(KEY_OFFSET);
            this.canLoadMore = savedInstanceState.getBoolean(KEY_CAN_LOAD_MORE);
            this.musicTracks = savedInstanceState.getParcelableArrayList(KEY_MUSIC_TRACKS);
            this.reason = savedInstanceState.getString(KEY_REASON);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
            this.loadRequest = null;
        }
    }

    public void subscribe(@NonNull Callback callback) {
        if (this.callbacks == null) {
            this.callbacks = new ArrayList();
        }
        this.callbacks.add(callback);
    }

    public void unsubscribe(@NonNull Callback callback) {
        if (this.callbacks != null) {
            this.callbacks.remove(callback);
        }
    }

    public void setPlaylist(@NonNull Playlist playlist) {
        if (!playlist.equals(this.playlist)) {
            this.playlist = playlist;
            reset();
        }
    }

    private void reset() {
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
            this.loadRequest = null;
        }
        this.offset = 0;
        this.canLoadMore = true;
        this.musicTracks = null;
        this.reason = null;
    }

    @Nullable
    public List<MusicTrack> getMusicTracks() {
        return this.musicTracks;
    }

    @Nullable
    public String getReason() {
        return this.reason;
    }

    public void load() {
        load(0, this.offset != 0 ? this.offset : 100);
    }

    public boolean canLoadMore() {
        return this.canLoadMore;
    }

    public void loadMore() {
        load(this.offset, 100);
    }

    private void load(int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            if (this.playlist == null) {
                Log.w("vk", "PlaylistMusicLoader: playlist is not initialized");
            } else {
                this.loadRequest = new AudioGetPlaylist.Builder(this.playlist.id, this.playlist.ownerId).accessKey(this.playlist.accessKey).audioOffset(audioOffset).audioCount(audioCount).build().setCallback(new AnonymousClass1(audioOffset, audioCount)).exec(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.attach.loader.PlaylistMusicLoader$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements com.vkontakte.android.api.Callback<AudioGetPlaylist.Result> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;

        AnonymousClass1(int i, int i2) {
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioGetPlaylist.Result result) {
            boolean z = true;
            PlaylistMusicLoader.this.loadRequest = null;
            if (this.val$audioOffset == 0) {
                PlaylistMusicLoader playlistMusicLoader = PlaylistMusicLoader.this;
                boolean z2 = playlistMusicLoader.canLoadMore;
                if (result.musicTracks.isEmpty()) {
                    z = false;
                }
                playlistMusicLoader.canLoadMore = z & z2;
                PlaylistMusicLoader.this.offset = this.val$audioCount;
                PlaylistMusicLoader.this.musicTracks = result.musicTracks;
                PlaylistMusicLoader.this.notifyCallbacks(PlaylistMusicLoader$1$$Lambda$1.lambdaFactory$(this));
                return;
            }
            PlaylistMusicLoader playlistMusicLoader2 = PlaylistMusicLoader.this;
            if (result.musicTracks.isEmpty()) {
                z = false;
            }
            playlistMusicLoader2.canLoadMore = z;
            if (PlaylistMusicLoader.this.canLoadMore) {
                PlaylistMusicLoader.this.offset = this.val$audioOffset + this.val$audioCount;
                PlaylistMusicLoader.this.musicTracks.addAll(result.musicTracks);
            }
            PlaylistMusicLoader.this.notifyCallbacks(PlaylistMusicLoader$1$$Lambda$2.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(Callback callback) {
            callback.onMusicLoadingDone(PlaylistMusicLoader.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(AudioGetPlaylist.Result result, Callback callback) {
            callback.onMusicLoadingMoreDone(PlaylistMusicLoader.this, result.musicTracks);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistMusicLoader.this.loadRequest = null;
            PlaylistMusicLoader.this.reason = error.toString();
            Log.w("vk", PlaylistMusicLoader.this.reason);
            if (this.val$audioOffset == 0) {
                PlaylistMusicLoader.this.notifyCallbacks(PlaylistMusicLoader$1$$Lambda$3.lambdaFactory$(this));
            } else {
                PlaylistMusicLoader.this.notifyCallbacks(PlaylistMusicLoader$1$$Lambda$4.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(Callback callback) {
            callback.onMusicLoadingError(PlaylistMusicLoader.this, PlaylistMusicLoader.this.reason);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(Callback callback) {
            callback.onMusicLoadingMoreError(PlaylistMusicLoader.this, PlaylistMusicLoader.this.reason);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyCallbacks(@NonNull Notification<Callback> notification) {
        if (this.callbacks != null) {
            for (Callback callback : this.callbacks) {
                notification.accept(callback);
            }
        }
    }
}
