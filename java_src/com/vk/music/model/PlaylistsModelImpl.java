package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.PlaylistLink;
import com.vk.music.event.MusicEventBus;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.PlaylistCreated;
import com.vk.music.event.PlaylistRemoved;
import com.vk.music.event.Subscriber;
import com.vk.music.model.PlaylistsModel;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioDeletePlaylist;
import com.vkontakte.android.api.audio.AudioFollowPlaylist;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class PlaylistsModelImpl extends ObservableModel<PlaylistsModel.Callback> implements PlaylistsModel {
    private static final int PLAYLISTS_PORTION = 20;
    private final boolean canAddPlaylist;
    private boolean canLoadMore;
    private final boolean currentUser;
    private Map<String, VKAPIRequest> deletePlaylistsRequests;
    private String errorMessage;
    private Map<String, VKAPIRequest> followPlaylistsRequests;
    private VKAPIRequest loadPlaylistsRequest;
    private int offset;
    private final Subscriber<PlaylistChanged> playlistChangedSubscriber;
    private final Subscriber<PlaylistCreated> playlistCreatedSubscriber;
    private final Subscriber<PlaylistRemoved> playlistRemovedSubscriber;
    private ArrayList<Playlist> playlists;
    @NonNull
    private final RequestCreator<VKList<Playlist>> requestCreator;
    private final boolean select;
    private String title;

    /* loaded from: classes2.dex */
    public interface RequestCreator<T> {
        VKAPIRequest<T> createLoadRequest(@NonNull PlaylistsModelImpl playlistsModelImpl, int i, int i2);
    }

    /* synthetic */ PlaylistsModelImpl(Builder x0, AnonymousClass1 x1) {
        this(x0);
    }

    @Override // com.vk.music.model.PlaylistsModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull PlaylistsModel.Callback callback) {
        super.subscribe((PlaylistsModelImpl) callback);
    }

    @Override // com.vk.music.model.PlaylistsModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull PlaylistsModel.Callback callback) {
        super.unsubscribe((PlaylistsModelImpl) callback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String key(@NonNull Playlist playlist) {
        return playlist.id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + playlist.ownerId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(PlaylistChanged event) {
        int index;
        if (this.playlists != null && (index = this.playlists.indexOf(event.playlist)) != -1) {
            this.playlists.set(index, event.playlist);
            notifyObservers(PlaylistsModelImpl$$Lambda$6.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(PlaylistChanged event, PlaylistsModel.Callback callback) {
        callback.onPlaylistChanged(this, event.playlist);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(PlaylistCreated event) {
        if (this.playlists != null) {
            this.playlists.add(0, event.playlist);
            if (!this.canLoadMore && this.playlists.size() >= this.offset) {
                this.canLoadMore = false;
            }
            notifyObservers(PlaylistsModelImpl$$Lambda$5.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$2(PlaylistCreated event, PlaylistsModel.Callback callback) {
        callback.onPlaylistCreated(this, event.playlist);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(PlaylistRemoved event) {
        if (this.playlists != null && this.playlists.remove(event.playlist)) {
            notifyObservers(PlaylistsModelImpl$$Lambda$4.lambdaFactory$(this, event));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$4(PlaylistRemoved event, PlaylistsModel.Callback callback) {
        callback.onPlaylistRemoved(this, event.playlist);
    }

    private PlaylistsModelImpl(Builder builder) {
        this.canLoadMore = true;
        this.followPlaylistsRequests = new HashMap();
        this.deletePlaylistsRequests = new HashMap();
        this.playlistChangedSubscriber = PlaylistsModelImpl$$Lambda$1.lambdaFactory$(this);
        this.playlistCreatedSubscriber = PlaylistsModelImpl$$Lambda$2.lambdaFactory$(this);
        this.playlistRemovedSubscriber = PlaylistsModelImpl$$Lambda$3.lambdaFactory$(this);
        this.requestCreator = builder.requestCreator;
        this.currentUser = builder.currentUser;
        this.title = builder.title;
        this.select = builder.selectMode;
        this.canAddPlaylist = builder.canAddPlaylist;
        MusicEventBus.subscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
        MusicEventBus.subscribe(PlaylistCreated.class, this.playlistCreatedSubscriber);
        MusicEventBus.subscribe(PlaylistRemoved.class, this.playlistRemovedSubscriber);
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putBoolean("canLoadMore", this.canLoadMore);
        state.putInt("offset", this.offset);
        state.putParcelableArrayList("playlists", this.playlists);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.canLoadMore = state.getBoolean("canLoadMore");
        this.offset = state.getInt("offset");
        this.playlists = state.getParcelableArrayList("playlists");
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        MusicEventBus.unsubscribe(PlaylistChanged.class, this.playlistChangedSubscriber);
        MusicEventBus.unsubscribe(PlaylistCreated.class, this.playlistCreatedSubscriber);
        MusicEventBus.unsubscribe(PlaylistRemoved.class, this.playlistRemovedSubscriber);
        if (this.loadPlaylistsRequest != null) {
            this.loadPlaylistsRequest.cancel();
        }
    }

    @Override // com.vk.music.model.PlaylistsModel
    @Nullable
    public List<Playlist> getPlaylists() {
        return this.playlists;
    }

    @Override // com.vk.music.model.PlaylistsModel
    @NonNull
    public Playlist getOriginalPlaylist(@NonNull Playlist playlist) {
        return playlist.getOriginalPlaylist();
    }

    @Override // com.vk.music.model.PlaylistsModel
    public String getTitle(Context ctx) {
        return this.title;
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean canLoadMore() {
        return this.canLoadMore;
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean isCurrentUser() {
        return this.currentUser;
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean canAddPlaylist() {
        return this.canAddPlaylist;
    }

    @Override // com.vk.music.model.PlaylistsModel
    public void loadPlaylists() {
        load(0, this.offset > 0 ? this.offset : 20);
    }

    @Override // com.vk.music.model.PlaylistsModel
    public void loadMore() {
        load(this.offset, 20);
    }

    private void load(int playlistOffset, int playlistCount) {
        if (this.loadPlaylistsRequest == null) {
            this.loadPlaylistsRequest = this.requestCreator.createLoadRequest(this, playlistOffset, playlistCount).setCallback(new AnonymousClass1(playlistOffset, playlistCount)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistsModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Callback<VKList<Playlist>> {
        final /* synthetic */ int val$playlistCount;
        final /* synthetic */ int val$playlistOffset;

        AnonymousClass1(int i, int i2) {
            this.val$playlistOffset = i;
            this.val$playlistCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<Playlist> result) {
            boolean z = true;
            PlaylistsModelImpl.this.loadPlaylistsRequest = null;
            if (this.val$playlistOffset == 0) {
                PlaylistsModelImpl playlistsModelImpl = PlaylistsModelImpl.this;
                boolean z2 = PlaylistsModelImpl.this.canLoadMore;
                if (result.isEmpty()) {
                    z = false;
                }
                playlistsModelImpl.canLoadMore = z & z2;
                PlaylistsModelImpl.this.offset = this.val$playlistCount;
                PlaylistsModelImpl.this.playlists = result;
            } else {
                PlaylistsModelImpl playlistsModelImpl2 = PlaylistsModelImpl.this;
                if (result.isEmpty()) {
                    z = false;
                }
                playlistsModelImpl2.canLoadMore = z;
                if (PlaylistsModelImpl.this.canLoadMore) {
                    PlaylistsModelImpl.this.offset = this.val$playlistOffset + this.val$playlistCount;
                    PlaylistsModelImpl.this.playlists.addAll(result);
                }
            }
            if (this.val$playlistOffset == 0) {
                PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$1$$Lambda$1.lambdaFactory$(this));
            } else {
                PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$1$$Lambda$2.lambdaFactory$(this, result));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(PlaylistsModel.Callback callback) {
            callback.onLoadingDone(PlaylistsModelImpl.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(VKList result, PlaylistsModel.Callback callback) {
            callback.onMoreLoadingDone(PlaylistsModelImpl.this, result);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistsModelImpl.this.loadPlaylistsRequest = null;
            L.w(error);
            PlaylistsModelImpl.this.errorMessage = error.message;
            if (this.val$playlistOffset == 0) {
                PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$1$$Lambda$3.lambdaFactory$(this, error));
            } else {
                PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$1$$Lambda$4.lambdaFactory$(this, error));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(VKAPIRequest.VKErrorResponse error, PlaylistsModel.Callback callback) {
            callback.onLoadingError(PlaylistsModelImpl.this, error);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(VKAPIRequest.VKErrorResponse error, PlaylistsModel.Callback callback) {
            callback.onMoreLoadingError(PlaylistsModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean canAddPlaylist(@NonNull Playlist playlist) {
        boolean z = true;
        if (!VKAccountManager.isCurrentUser(playlist.ownerId) && playlist.followed == null) {
            if (playlist.original == null) {
                return true;
            }
            if (VKAccountManager.isCurrentUser(playlist.original.ownerId)) {
                z = false;
            }
            return z;
        }
        return false;
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean canDeletePlaylist(@NonNull Playlist playlist) {
        return VKAccountManager.isCurrentUser(playlist.ownerId);
    }

    @Override // com.vk.music.model.PlaylistsModel
    public void addPlaylist(@NonNull Playlist playlist) {
        if (!this.followPlaylistsRequests.containsKey(key(playlist))) {
            this.followPlaylistsRequests.put(key(playlist), new AudioFollowPlaylist(playlist.id, playlist.ownerId, playlist.accessKey).setCallback(new AnonymousClass2(playlist)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistsModelImpl$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<PlaylistLink> {
        final /* synthetic */ Playlist val$playlist;

        AnonymousClass2(Playlist playlist) {
            this.val$playlist = playlist;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(PlaylistLink result) {
            PlaylistsModelImpl.this.followPlaylistsRequests.remove(PlaylistsModelImpl.key(this.val$playlist));
            this.val$playlist.followed = result;
            PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$2$$Lambda$1.lambdaFactory$(this, this.val$playlist));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(@NonNull Playlist playlist, PlaylistsModel.Callback callback) {
            callback.onAdditionDone(PlaylistsModelImpl.this, playlist);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistsModelImpl.this.followPlaylistsRequests.remove(PlaylistsModelImpl.key(this.val$playlist));
            L.w(error);
            PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$2$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistsModel.Callback callback) {
            callback.onAdditionError(PlaylistsModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistsModel
    public void deletePlaylist(@NonNull Playlist playlist) {
        if (!this.deletePlaylistsRequests.containsKey(key(playlist))) {
            this.deletePlaylistsRequests.put(key(playlist), new AudioDeletePlaylist(playlist.id, playlist.ownerId).setCallback(new AnonymousClass3(playlist)).exec(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.PlaylistsModelImpl$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 implements Callback<Boolean> {
        final /* synthetic */ Playlist val$playlist;

        AnonymousClass3(Playlist playlist) {
            this.val$playlist = playlist;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Boolean result) {
            PlaylistsModelImpl.this.deletePlaylistsRequests.remove(PlaylistsModelImpl.key(this.val$playlist));
            PlaylistsModelImpl.this.playlists.remove(this.val$playlist);
            PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$3$$Lambda$1.lambdaFactory$(this, this.val$playlist));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(@NonNull Playlist playlist, PlaylistsModel.Callback callback) {
            callback.onDeletionDone(PlaylistsModelImpl.this, playlist);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            PlaylistsModelImpl.this.deletePlaylistsRequests.remove(PlaylistsModelImpl.key(this.val$playlist));
            L.w(error);
            PlaylistsModelImpl.this.notifyObservers(PlaylistsModelImpl$3$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, PlaylistsModel.Callback callback) {
            callback.onDeletionError(PlaylistsModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.PlaylistsModel
    public boolean isSelect() {
        return this.select;
    }

    @Override // com.vk.music.model.PlaylistsModel
    @Nullable
    public String getError() {
        return this.errorMessage;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        private boolean canAddPlaylist;
        private boolean currentUser;
        private final RequestCreator<VKList<Playlist>> requestCreator;
        private boolean selectMode;
        private String title;

        public Builder(RequestCreator<VKList<Playlist>> requestCreator) {
            this.requestCreator = requestCreator;
        }

        public Builder currentUser(boolean val) {
            this.currentUser = val;
            return this;
        }

        public Builder title(String val) {
            this.title = val;
            return this;
        }

        public Builder selectMode(boolean val) {
            this.selectMode = val;
            return this;
        }

        public Builder canAddPlaylist(boolean val) {
            this.canAddPlaylist = val;
            return this;
        }

        public PlaylistsModelImpl build() {
            return new PlaylistsModelImpl(this, null);
        }
    }
}
