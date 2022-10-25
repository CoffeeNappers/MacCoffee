package com.vk.music.attach.loader;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import com.vk.music.dto.MusicSearchResult;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioSearch;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class MusicSearchResultsLoader extends Fragment {
    private static final String KEY_CAN_LOAD_MORE = "MusicSearchResultsLoader.key.canLoadMore";
    private static final String KEY_OFFSET = "MusicSearchResultsLoader.key.offset";
    private static final String KEY_QUERY = "MusicSearchResultsLoader.key.query";
    private static final String KEY_REASON = "MusicSearchResultsLoader.key.reason";
    private static final String KEY_SEARCH_RESULT = "MusicSearchResultsLoader.key.musicSearchResult";
    private static final int LOAD_PORTION = 100;
    List<Callback> callbacks;
    boolean canLoadMore = true;
    private VKAPIRequest loadRequest;
    MusicSearchResult musicSearchResult;
    int offset;
    private String query;
    String reason;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onSearchResultsLoadingDone(@NonNull MusicSearchResultsLoader musicSearchResultsLoader);

        void onSearchResultsLoadingError(@NonNull MusicSearchResultsLoader musicSearchResultsLoader, @NonNull String str);

        void onSearchResultsLoadingMoreDone(@NonNull MusicSearchResultsLoader musicSearchResultsLoader, @NonNull MusicSearchResult musicSearchResult);

        void onSearchResultsLoadingMoreError(@NonNull MusicSearchResultsLoader musicSearchResultsLoader, @NonNull String str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface Notification<T> {
        void accept(@NonNull T t);
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(KEY_QUERY, this.query);
        outState.putInt(KEY_OFFSET, this.offset);
        outState.putBoolean(KEY_CAN_LOAD_MORE, this.canLoadMore);
        outState.putParcelable(KEY_SEARCH_RESULT, this.musicSearchResult);
        outState.putString(KEY_REASON, this.reason);
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        if (savedInstanceState != null) {
            this.query = savedInstanceState.getString(KEY_QUERY);
            this.offset = savedInstanceState.getInt(KEY_OFFSET);
            this.canLoadMore = savedInstanceState.getBoolean(KEY_CAN_LOAD_MORE);
            this.musicSearchResult = (MusicSearchResult) savedInstanceState.getParcelable(KEY_SEARCH_RESULT);
            this.reason = savedInstanceState.getString(KEY_REASON);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        cancel();
    }

    public void setQuery(@NonNull String query) {
        this.query = query;
        cancel();
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
    public MusicSearchResult getMusicSearchResult() {
        return this.musicSearchResult;
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
            if (this.query == null) {
                Log.w("vk", "MusicSearchResultsLoader: query is not initialized");
            } else {
                this.loadRequest = new AudioSearch(this.query, false, audioOffset, audioCount).setCallback(new AnonymousClass1(audioOffset, audioCount)).exec(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.attach.loader.MusicSearchResultsLoader$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements com.vkontakte.android.api.Callback<VKList<MusicTrack>> {
        final /* synthetic */ int val$audioCount;
        final /* synthetic */ int val$audioOffset;

        AnonymousClass1(int i, int i2) {
            this.val$audioOffset = i;
            this.val$audioCount = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<MusicTrack> result) {
            boolean z = true;
            MusicSearchResultsLoader.this.loadRequest = null;
            MusicSearchResult searchResult = new MusicSearchResult(result);
            if (this.val$audioOffset == 0) {
                MusicSearchResultsLoader musicSearchResultsLoader = MusicSearchResultsLoader.this;
                if (result.isEmpty()) {
                    z = false;
                }
                musicSearchResultsLoader.canLoadMore = z;
                MusicSearchResultsLoader.this.offset = this.val$audioCount;
                MusicSearchResultsLoader.this.musicSearchResult = searchResult;
                MusicSearchResultsLoader.this.notifyCallbacks(MusicSearchResultsLoader$1$$Lambda$1.lambdaFactory$(this));
                return;
            }
            MusicSearchResultsLoader musicSearchResultsLoader2 = MusicSearchResultsLoader.this;
            if (result.isEmpty()) {
                z = false;
            }
            musicSearchResultsLoader2.canLoadMore = z;
            if (MusicSearchResultsLoader.this.canLoadMore) {
                MusicSearchResultsLoader.this.offset = this.val$audioOffset + this.val$audioCount;
                MusicSearchResultsLoader.this.musicSearchResult.fill(searchResult);
            }
            MusicSearchResultsLoader.this.notifyCallbacks(MusicSearchResultsLoader$1$$Lambda$2.lambdaFactory$(this, searchResult));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(Callback callback) {
            callback.onSearchResultsLoadingDone(MusicSearchResultsLoader.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(MusicSearchResult searchResult, Callback callback) {
            callback.onSearchResultsLoadingMoreDone(MusicSearchResultsLoader.this, searchResult);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            MusicSearchResultsLoader.this.loadRequest = null;
            MusicSearchResultsLoader.this.reason = error.toString();
            Log.w("vk", MusicSearchResultsLoader.this.reason);
            if (this.val$audioOffset == 0) {
                MusicSearchResultsLoader.this.notifyCallbacks(MusicSearchResultsLoader$1$$Lambda$3.lambdaFactory$(this));
            } else {
                MusicSearchResultsLoader.this.notifyCallbacks(MusicSearchResultsLoader$1$$Lambda$4.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(Callback callback) {
            callback.onSearchResultsLoadingError(MusicSearchResultsLoader.this, MusicSearchResultsLoader.this.reason);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(Callback callback) {
            callback.onSearchResultsLoadingMoreError(MusicSearchResultsLoader.this, MusicSearchResultsLoader.this.reason);
        }
    }

    public void cancel() {
        if (this.loadRequest != null) {
            this.loadRequest.cancel();
            this.loadRequest = null;
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
