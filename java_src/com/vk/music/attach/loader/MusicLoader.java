package com.vk.music.attach.loader;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetMusicPage;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class MusicLoader extends Fragment {
    private static final int AUDIO_ITEMS_PORTION = 100;
    private static final String KEY_CAN_LOAD_MORE = "MusicLoader.key.canLoadMore";
    private static final String KEY_MUSIC_TRACKS = "MusicLoader.key.musicTracks";
    private static final String KEY_OFFSET = "MusicLoader.key.offset";
    private static final String KEY_PLAYLISTS_COUNT = "MusicLoader.key.playlistsCount";
    private static final String KEY_REASON = "MusicLoader.key.reason";
    List<Callback> callbacks;
    boolean canLoadMore = true;
    private VKAPIRequest loadRequest;
    ArrayList<MusicTrack> musicTracks;
    int offset;
    Integer playlistsCount;
    String reason;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onMusicLoadingDone(@NonNull MusicLoader musicLoader);

        void onMusicLoadingError(@NonNull MusicLoader musicLoader, @NonNull String str);

        void onMusicLoadingMoreDone(@NonNull MusicLoader musicLoader, @NonNull List<MusicTrack> list);

        void onMusicLoadingMoreError(@NonNull MusicLoader musicLoader, @NonNull String str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface Notification<T> {
        void accept(@NonNull T t);
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt(KEY_OFFSET, this.offset);
        outState.putBoolean(KEY_CAN_LOAD_MORE, this.canLoadMore);
        if (this.playlistsCount != null) {
            outState.putInt(KEY_PLAYLISTS_COUNT, this.playlistsCount.intValue());
        }
        outState.putParcelableArrayList(KEY_MUSIC_TRACKS, this.musicTracks);
        outState.putString(KEY_REASON, this.reason);
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        if (savedInstanceState != null) {
            this.offset = savedInstanceState.getInt(KEY_OFFSET);
            this.canLoadMore = savedInstanceState.getBoolean(KEY_CAN_LOAD_MORE);
            if (savedInstanceState.containsKey(KEY_PLAYLISTS_COUNT)) {
                this.playlistsCount = Integer.valueOf(savedInstanceState.getInt(KEY_PLAYLISTS_COUNT));
            }
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

    @Nullable
    public Integer getPlaylistsCount() {
        return this.playlistsCount;
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
        load(true, 0, this.offset != 0 ? this.offset : 100);
    }

    public boolean canLoadMore() {
        return this.canLoadMore;
    }

    public void loadMore() {
        load(false, this.offset, 100);
    }

    private void load(boolean loadPlaylist, int audioOffset, int audioCount) {
        if (this.loadRequest == null) {
            this.loadRequest = new AudioGetMusicPage.Builder(VKAccountManager.getCurrent().getUid()).needPlaylists(true).playlistsCount(1).audioOffset(audioOffset).audioCount(audioCount).build().setCallback(new AnonymousClass1(loadPlaylist, audioOffset, audioCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.attach.loader.MusicLoader$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements com.vkontakte.android.api.Callback<AudioGetMusicPage.Result> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;
        final /* synthetic */ boolean val$loadPlaylist;

        AnonymousClass1(boolean z, int i, int i2) {
            this.val$loadPlaylist = z;
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AudioGetMusicPage.Result result) {
            boolean z = true;
            MusicLoader.this.loadRequest = null;
            if (this.val$loadPlaylist) {
                MusicLoader.this.playlistsCount = Integer.valueOf(result.playlists.total());
            }
            if (this.val$audioOffset == 0) {
                MusicLoader musicLoader = MusicLoader.this;
                if (result.musicTracks.isEmpty()) {
                    z = false;
                }
                musicLoader.canLoadMore = z;
                MusicLoader.this.offset = this.val$audioCount;
                MusicLoader.this.musicTracks = result.musicTracks;
                MusicLoader.this.notifyCallbacks(MusicLoader$1$$Lambda$1.lambdaFactory$(this));
                return;
            }
            MusicLoader musicLoader2 = MusicLoader.this;
            if (result.musicTracks.isEmpty()) {
                z = false;
            }
            musicLoader2.canLoadMore = z;
            if (MusicLoader.this.canLoadMore) {
                MusicLoader.this.offset = this.val$audioOffset + this.val$audioCount;
                MusicLoader.this.musicTracks.addAll(result.musicTracks);
            }
            MusicLoader.this.notifyCallbacks(MusicLoader$1$$Lambda$2.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(Callback callback) {
            callback.onMusicLoadingDone(MusicLoader.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(AudioGetMusicPage.Result result, Callback callback) {
            callback.onMusicLoadingMoreDone(MusicLoader.this, result.musicTracks);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicLoader.this.loadRequest = null;
            MusicLoader.this.reason = error.toString();
            Log.w("vk", MusicLoader.this.reason);
            if (this.val$audioOffset == 0) {
                MusicLoader.this.notifyCallbacks(MusicLoader$1$$Lambda$3.lambdaFactory$(this));
            } else {
                MusicLoader.this.notifyCallbacks(MusicLoader$1$$Lambda$4.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(Callback callback) {
            callback.onMusicLoadingError(MusicLoader.this, MusicLoader.this.reason);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(Callback callback) {
            callback.onMusicLoadingMoreError(MusicLoader.this, MusicLoader.this.reason);
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
