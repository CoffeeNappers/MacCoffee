package com.vk.music.attach.loader;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetPlaylists;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class PlaylistsLoader extends Fragment {
    private static final String KEY_CAN_LOAD_MORE = "PlaylistsLoader.key.canLoadMore";
    private static final String KEY_OFFSET = "PlaylistsLoader.key.offset";
    private static final String KEY_PLAYLISTS = "PlaylistsLoader.key.playlists";
    private static final String KEY_REASON = "PlaylistsLoader.key.reason";
    private static final int LOAD_PORTION = 100;
    List<Callback> callbacks;
    boolean canLoadMore = true;
    private VKAPIRequest loadRequest;
    int offset;
    ArrayList<Playlist> playlists;
    String reason;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onPlaylistsLoadingDone(@NonNull PlaylistsLoader playlistsLoader);

        void onPlaylistsLoadingError(@NonNull PlaylistsLoader playlistsLoader, @NonNull String str);

        void onPlaylistsLoadingMoreDone(@NonNull PlaylistsLoader playlistsLoader, @NonNull List<Playlist> list);

        void onPlaylistsLoadingMoreError(@NonNull PlaylistsLoader playlistsLoader, @NonNull String str);
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
        outState.putParcelableArrayList(KEY_PLAYLISTS, this.playlists);
        outState.putString(KEY_REASON, this.reason);
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        if (savedInstanceState != null) {
            this.offset = savedInstanceState.getInt(KEY_OFFSET);
            this.canLoadMore = savedInstanceState.getBoolean(KEY_CAN_LOAD_MORE);
            this.playlists = savedInstanceState.getParcelableArrayList(KEY_PLAYLISTS);
            this.reason = savedInstanceState.getString(KEY_REASON);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
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
    public List<Playlist> getPlaylists() {
        return this.playlists;
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

    private void load(int playlistsOffset, int playlistsCount) {
        if (this.loadRequest == null) {
            this.loadRequest = new AudioGetPlaylists.Builder(VKAccountManager.getCurrent().getUid()).offset(playlistsOffset).count(playlistsCount).build().setCallback(new AnonymousClass1(playlistsOffset, playlistsCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.attach.loader.PlaylistsLoader$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements com.vkontakte.android.api.Callback<VKList<Playlist>> {
        final /* synthetic */ int val$playlistsCount;
        final /* synthetic */ int val$playlistsOffset;

        AnonymousClass1(int i, int i2) {
            this.val$playlistsOffset = i;
            this.val$playlistsCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<Playlist> result) {
            boolean z = true;
            PlaylistsLoader.this.loadRequest = null;
            if (this.val$playlistsOffset == 0) {
                PlaylistsLoader playlistsLoader = PlaylistsLoader.this;
                boolean z2 = playlistsLoader.canLoadMore;
                if (result.isEmpty()) {
                    z = false;
                }
                playlistsLoader.canLoadMore = z & z2;
                PlaylistsLoader.this.offset = this.val$playlistsCount;
                PlaylistsLoader.this.playlists = result;
                PlaylistsLoader.this.notifyCallbacks(PlaylistsLoader$1$$Lambda$1.lambdaFactory$(this));
                return;
            }
            PlaylistsLoader playlistsLoader2 = PlaylistsLoader.this;
            if (result.isEmpty()) {
                z = false;
            }
            playlistsLoader2.canLoadMore = z;
            if (PlaylistsLoader.this.canLoadMore) {
                PlaylistsLoader.this.offset = this.val$playlistsOffset + this.val$playlistsCount;
                PlaylistsLoader.this.playlists.addAll(result);
            }
            PlaylistsLoader.this.notifyCallbacks(PlaylistsLoader$1$$Lambda$2.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(Callback callback) {
            callback.onPlaylistsLoadingDone(PlaylistsLoader.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(VKList result, Callback callback) {
            callback.onPlaylistsLoadingMoreDone(PlaylistsLoader.this, result);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistsLoader.this.loadRequest = null;
            PlaylistsLoader.this.reason = error.toString();
            Log.w("vk", PlaylistsLoader.this.reason);
            if (this.val$playlistsOffset == 0) {
                PlaylistsLoader.this.notifyCallbacks(PlaylistsLoader$1$$Lambda$3.lambdaFactory$(this));
            } else {
                PlaylistsLoader.this.notifyCallbacks(PlaylistsLoader$1$$Lambda$4.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(Callback callback) {
            callback.onPlaylistsLoadingError(PlaylistsLoader.this, PlaylistsLoader.this.reason);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(Callback callback) {
            callback.onPlaylistsLoadingMoreError(PlaylistsLoader.this, PlaylistsLoader.this.reason);
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
