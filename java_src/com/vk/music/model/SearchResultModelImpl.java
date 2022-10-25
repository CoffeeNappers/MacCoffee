package com.vk.music.model;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import com.vk.core.util.CollectionUtils;
import com.vk.music.model.SearchResultModel;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioSearch;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SearchResultModelImpl extends ObservableModel<SearchResultModel.Callback> implements SearchResultModel {
    static final int MODE_BY_ARTIST = 2;
    static final int MODE_BY_TITLE = 1;
    private static final int RESULTS_PORTION = 100;
    private ArrayList<Group> communities;
    private String errorMessage;
    private boolean full;
    private ArrayList<MusicTrack> globalResults;
    private VKAPIRequest loadResults;
    private boolean loaded;
    private ArrayList<MusicTrack> localResults;
    @Mode
    private final int mode;
    private String query;
    private ArrayList<MusicTrack> results;
    private final PlayerModel playerModel = new PlayerModelImpl(PlayerRefer.search);
    private final MusicTrackModel musicTrackModel = new MusicTrackModelImpl();

    /* loaded from: classes.dex */
    public @interface Mode {
    }

    @Override // com.vk.music.model.SearchResultModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull SearchResultModel.Callback callback) {
        super.subscribe((SearchResultModelImpl) callback);
    }

    @Override // com.vk.music.model.SearchResultModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull SearchResultModel.Callback callback) {
        super.unsubscribe((SearchResultModelImpl) callback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void fillResults(@NonNull List<MusicTrack> results, @NonNull List<MusicTrack> local, @NonNull List<MusicTrack> global) {
        for (MusicTrack result : results) {
            if (VKAccountManager.isCurrentUser(result.oid)) {
                local.add(result);
            } else {
                global.add(result);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SearchResultModelImpl(@NonNull String query, @Mode int mode) {
        this.query = query;
        this.mode = mode;
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.loaded = state.getBoolean("loaded");
        this.full = state.getBoolean("full");
        this.communities = state.getParcelableArrayList("communities");
        this.localResults = state.getParcelableArrayList("local");
        this.globalResults = state.getParcelableArrayList("global");
        ModelHelper.restoreAll(state, this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putBoolean("loaded", this.loaded);
        state.putBoolean("full", this.full);
        state.putParcelableArrayList("communities", this.communities);
        state.putParcelableArrayList("local", this.localResults);
        state.putParcelableArrayList("global", this.globalResults);
        ModelHelper.saveAll(state, this.playerModel, this.musicTrackModel);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        if (this.loadResults != null) {
            this.loadResults.cancel();
        }
        ModelHelper.releaseAll(this.playerModel, this.musicTrackModel);
    }

    @Override // com.vk.music.model.SearchResultModel
    @NonNull
    public String getQuery() {
        return this.query;
    }

    @Override // com.vk.music.model.SearchResultModel
    public void setQuery(@NonNull String query) {
        boolean changed = !TextUtils.equals(query, this.query);
        if (changed) {
            release();
            this.query = query;
            if (this.communities != null) {
                this.communities.clear();
            }
            if (this.results != null) {
                this.results.clear();
            }
            if (this.localResults != null) {
                this.localResults.clear();
            }
            if (this.globalResults != null) {
                this.globalResults.clear();
            }
            this.loaded = false;
            this.full = false;
            notifyObservers(SearchResultModelImpl$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$setQuery$0(SearchResultModel.Callback callback) {
        callback.onQueryChanged(this);
    }

    @Override // com.vk.music.model.SearchResultModel
    @Nullable
    public List<Group> getCommunities() {
        return this.communities;
    }

    @Override // com.vk.music.model.SearchResultModel
    @Nullable
    public List<MusicTrack> getResults() {
        return this.results;
    }

    @Override // com.vk.music.model.SearchResultModel
    @Nullable
    public List<MusicTrack> getLocalResults() {
        if (this.localResults == null) {
            fillResults();
        }
        return this.localResults;
    }

    @Override // com.vk.music.model.SearchResultModel
    @Nullable
    public List<MusicTrack> getGlobalResults() {
        if (this.globalResults == null) {
            fillResults();
        }
        return this.globalResults;
    }

    private void fillResults() {
        if (this.results != null) {
            this.localResults = new ArrayList<>();
            this.globalResults = new ArrayList<>();
            fillResults(this.results, this.localResults, this.globalResults);
        }
    }

    @Override // com.vk.music.model.SearchResultModel
    public boolean isLoaded() {
        return this.loaded;
    }

    @Override // com.vk.music.model.SearchResultModel
    public boolean canLoadMore() {
        return !this.full;
    }

    @Override // com.vk.music.model.SearchResultModel
    public void loadResults() {
        load(0, CollectionUtils.countIfNotLess(this.results, 100));
    }

    @Override // com.vk.music.model.SearchResultModel
    public void loadMoreResults() {
        load(CollectionUtils.count(this.results), 100);
    }

    @Override // com.vk.music.model.SearchResultModel
    @NonNull
    public PlayerModel getPlayerModel() {
        return this.playerModel;
    }

    @Override // com.vk.music.model.SearchResultModel
    @NonNull
    public MusicTrackModel getMusicTrackModel() {
        return this.musicTrackModel;
    }

    @Override // com.vk.music.model.SearchResultModel
    @Nullable
    public String getError() {
        return this.errorMessage;
    }

    private void load(int offset, int count) {
        if (this.loadResults == null) {
            this.loadResults = new AudioSearch(this.query, this.mode == 2, offset, count).setCallback(new AnonymousClass1(offset)).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.SearchResultModelImpl$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements Callback<VKList<MusicTrack>> {
        final /* synthetic */ int val$offset;

        AnonymousClass1(int i) {
            this.val$offset = i;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<MusicTrack> result) {
            List<MusicTrack> local;
            List<MusicTrack> global;
            boolean z = true;
            SearchResultModelImpl.this.loadResults = null;
            if (!SearchResultModelImpl.this.loaded) {
                SearchResultModelImpl.this.loaded = true;
            }
            SearchResultModelImpl.this.localResults = null;
            SearchResultModelImpl.this.globalResults = null;
            if (this.val$offset == 0) {
                SearchResultModelImpl.this.results = result;
                local = null;
                global = null;
            } else {
                SearchResultModelImpl.this.results.addAll(result);
                local = new ArrayList<>();
                global = new ArrayList<>();
                SearchResultModelImpl.fillResults(result, local, global);
            }
            SearchResultModelImpl searchResultModelImpl = SearchResultModelImpl.this;
            if (result.size() >= 100) {
                z = false;
            }
            searchResultModelImpl.full = z;
            if (this.val$offset == 0) {
                SearchResultModelImpl.this.notifyObservers(SearchResultModelImpl$1$$Lambda$1.lambdaFactory$(this));
            } else {
                SearchResultModelImpl.this.notifyObservers(SearchResultModelImpl$1$$Lambda$2.lambdaFactory$(this, local, global));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(SearchResultModel.Callback callback) {
            callback.onLoadingDone(SearchResultModelImpl.this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(List local, List global, SearchResultModel.Callback callback) {
            callback.onLoadingMoreDone(SearchResultModelImpl.this, local, global);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            SearchResultModelImpl.this.loadResults = null;
            Log.w("vk", error.toString());
            if (this.val$offset == 0) {
                SearchResultModelImpl.this.notifyObservers(SearchResultModelImpl$1$$Lambda$3.lambdaFactory$(this, error));
            } else {
                SearchResultModelImpl.this.notifyObservers(SearchResultModelImpl$1$$Lambda$4.lambdaFactory$(this, error));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(VKAPIRequest.VKErrorResponse error, SearchResultModel.Callback callback) {
            callback.onLoadingError(SearchResultModelImpl.this, error);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$3(VKAPIRequest.VKErrorResponse error, SearchResultModel.Callback callback) {
            callback.onLoadingMoreError(SearchResultModelImpl.this, error);
        }
    }

    @Override // com.vk.music.model.ObservableModel, com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        super.clearCallbacks();
        ModelHelper.clearCallbacksAll(this.playerModel, this.musicTrackModel);
    }
}
