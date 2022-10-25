package com.vk.music.model;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.core.util.CollectionUtils;
import com.vk.music.model.SearchSuggestionModel;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetHints;
import com.vkontakte.android.api.audio.AudioGetSearchTrends;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes.dex */
public final class SearchSuggestionModelImpl extends ObservableModel<SearchSuggestionModel.Callback> implements SearchSuggestionModel {
    private static final int MAX_POPULAR = 20;
    private static final int MAX_RECENTS = 5;
    private ArrayList<String> hints;
    private ArrayList<String> popular;
    private final SharedPreferences preferences;
    private LinkedList<String> recents;
    private VKAPIRequest loadPopularRequest = null;
    private VKAPIRequest loadHintsRequest = null;

    @Override // com.vk.music.model.SearchSuggestionModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull SearchSuggestionModel.Callback callback) {
        super.subscribe((SearchSuggestionModelImpl) callback);
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull SearchSuggestionModel.Callback callback) {
        super.unsubscribe((SearchSuggestionModelImpl) callback);
    }

    public SearchSuggestionModelImpl(@NonNull SharedPreferences preferences) {
        this.preferences = preferences;
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    @NonNull
    public List<String> getRecents() {
        if (this.recents == null) {
            loadRecents();
        }
        return this.recents;
    }

    private void loadRecents() {
        String val;
        this.recents = new LinkedList<>();
        for (int i = 0; i < 5 && (val = this.preferences.getString("rec" + i, null)) != null; i++) {
            this.recents.add(val);
        }
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    public void addRecent(@NonNull String recent) {
        if (this.recents == null) {
            loadRecents();
        }
        int index = this.recents.indexOf(recent);
        if (index != -1) {
            this.recents.push(this.recents.remove(index));
        } else {
            if (CollectionUtils.count(this.recents) == 5) {
                this.recents.pollLast();
            }
            this.recents.push(recent);
        }
        saveRecentsToPreferences();
        notifyObservers(SearchSuggestionModelImpl$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$addRecent$0(SearchSuggestionModel.Callback callback) {
        callback.onRecentsChanged(this);
    }

    private void saveRecentsToPreferences() {
        SharedPreferences.Editor editor = this.preferences.edit();
        int i = 0;
        Iterator<String> it = this.recents.iterator();
        while (it.hasNext()) {
            String recent = it.next();
            editor.putString("rec" + i, recent);
            i++;
        }
        editor.apply();
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    public void clearRecents() {
        if (this.recents != null) {
            this.recents.clear();
        }
        this.preferences.edit().clear().apply();
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    @Nullable
    public List<String> getPopular() {
        return this.popular;
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    @Nullable
    public List<String> getHints() {
        return this.hints;
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    public void loadPopular() {
        if (this.loadPopularRequest == null) {
            this.loadPopularRequest = new AudioGetSearchTrends(20).setCallback(new AnonymousClass1()).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.SearchSuggestionModelImpl$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Callback<VKList<String>> {
        AnonymousClass1() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<String> result) {
            SearchSuggestionModelImpl.this.loadPopularRequest = null;
            SearchSuggestionModelImpl.this.popular = result;
            SearchSuggestionModelImpl.this.notifyObservers(SearchSuggestionModelImpl$1$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(SearchSuggestionModel.Callback callback) {
            callback.onPopularLoadingDone(SearchSuggestionModelImpl.this);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            SearchSuggestionModelImpl.this.loadPopularRequest = null;
            Log.w("vk", error.toString());
            SearchSuggestionModelImpl.this.notifyObservers(SearchSuggestionModelImpl$1$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, SearchSuggestionModel.Callback callback) {
            callback.onPopularLoadingError(SearchSuggestionModelImpl.this, error.toString());
        }
    }

    @Override // com.vk.music.model.SearchSuggestionModel
    public void loadHints(@NonNull String query) {
        if (this.loadHintsRequest == null) {
            this.loadHintsRequest = new AudioGetHints(query).setCallback(new AnonymousClass2()).exec(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.music.model.SearchSuggestionModelImpl$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<VKList<String>> {
        AnonymousClass2() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<String> result) {
            SearchSuggestionModelImpl.this.loadHintsRequest = null;
            SearchSuggestionModelImpl.this.hints = result;
            SearchSuggestionModelImpl.this.notifyObservers(SearchSuggestionModelImpl$2$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(SearchSuggestionModel.Callback callback) {
            callback.onHintsLoadingDone(SearchSuggestionModelImpl.this);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            SearchSuggestionModelImpl.this.loadHintsRequest = null;
            Log.w("vk", error.toString());
            SearchSuggestionModelImpl.this.notifyObservers(SearchSuggestionModelImpl$2$$Lambda$2.lambdaFactory$(this, error));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, SearchSuggestionModel.Callback callback) {
            callback.onHintsLoadingError(SearchSuggestionModelImpl.this, error.toString());
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.popular = state.getStringArrayList("popular");
        this.hints = state.getStringArrayList("hints");
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putStringArrayList("popular", this.popular);
        state.putStringArrayList("hints", this.hints);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        if (this.loadPopularRequest != null) {
            this.loadPopularRequest.cancel();
        }
        if (this.loadHintsRequest != null) {
            this.loadHintsRequest.cancel();
        }
    }
}
