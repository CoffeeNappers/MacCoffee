package com.vk.music.model;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.actions.SearchIntents;
import com.vkontakte.android.VKApplication;
/* loaded from: classes.dex */
public class SearchModel implements ActiveModel {
    @View.Page
    private int page;
    @Nullable
    private String query;
    @Nullable
    private SearchResultModel searchResultByArtistModel;
    @Nullable
    private SearchResultModel searchResultByTitleModel;
    @NonNull
    private final SearchSuggestionModel searchSuggestionModel = new SearchSuggestionModelImpl(VKApplication.context.getSharedPreferences("music_search", 0));
    @View.State
    private int state;

    /* loaded from: classes.dex */
    public interface View {
        public static final int PAGE_BY_ARTIST = 1;
        public static final int PAGE_BY_TITLE = 0;
        public static final int STATE_RESULTS = 1;
        public static final int STATE_SEARCHING = 0;

        /* loaded from: classes.dex */
        public @interface Page {
        }

        /* loaded from: classes.dex */
        public @interface State {
        }
    }

    public SearchModel(@Nullable String query, boolean openResults, boolean openArtistPage) {
        if (query != null) {
            setQuery(query);
            if (openResults) {
                setState(1);
            }
            if (openArtistPage) {
                setPage(1);
            }
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle savedState) {
        this.query = savedState.getString(SearchIntents.EXTRA_QUERY);
        this.state = savedState.getInt("state");
        this.page = savedState.getInt("page");
        Bundle b = savedState.getBundle("suggestion");
        if (b != null) {
            this.searchSuggestionModel.restore(b);
        }
        if (this.query != null) {
            initSearchResults(this.query);
            Bundle b2 = savedState.getBundle("resultByTitle");
            if (b2 != null && this.searchResultByTitleModel != null) {
                this.searchResultByTitleModel.restore(b2);
            }
            Bundle b3 = savedState.getBundle("resultByArtist");
            if (b3 != null && this.searchResultByArtistModel != null) {
                this.searchResultByArtistModel.restore(b3);
            }
        }
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle outState = new Bundle();
        outState.putString(SearchIntents.EXTRA_QUERY, this.query);
        outState.putInt("state", this.state);
        outState.putInt("page", this.page);
        outState.putBundle("suggestion", this.searchSuggestionModel.save());
        if (this.searchResultByTitleModel != null) {
            outState.putString(SearchIntents.EXTRA_QUERY, this.searchResultByTitleModel.getQuery());
            outState.putBundle("resultByTitle", this.searchResultByTitleModel.save());
        }
        if (this.searchResultByArtistModel != null) {
            outState.putBundle("resultByArtist", this.searchResultByArtistModel.save());
        }
        return outState;
    }

    @Override // com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        this.searchSuggestionModel.clearCallbacks();
        if (this.searchResultByTitleModel != null) {
            this.searchResultByTitleModel.clearCallbacks();
        }
        if (this.searchResultByArtistModel != null) {
            this.searchResultByArtistModel.clearCallbacks();
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        this.searchSuggestionModel.release();
        if (this.searchResultByTitleModel != null) {
            this.searchResultByTitleModel.release();
        }
        if (this.searchResultByArtistModel != null) {
            this.searchResultByArtistModel.release();
        }
    }

    @Nullable
    public String getQuery() {
        return this.query;
    }

    public void setQuery(@NonNull String query) {
        if (!query.equals(this.query)) {
            this.query = query;
            initSearchResults(query);
        }
    }

    private void initSearchResults(@NonNull String query) {
        if (this.searchResultByTitleModel != null) {
            this.searchResultByTitleModel.setQuery(query);
        } else {
            this.searchResultByTitleModel = new SearchResultModelImpl(query, 1);
        }
        if (this.searchResultByArtistModel != null) {
            this.searchResultByArtistModel.setQuery(query);
        } else {
            this.searchResultByArtistModel = new SearchResultModelImpl(query, 2);
        }
    }

    @View.State
    public int getState() {
        return this.state;
    }

    public void setState(@View.State int state) {
        this.state = state;
    }

    @View.Page
    public int getPage() {
        return this.page;
    }

    public void setPage(@View.Page int page) {
        this.page = page;
    }

    @NonNull
    public SearchSuggestionModel getSearchSuggestionModel() {
        return this.searchSuggestionModel;
    }

    @Nullable
    public SearchResultModel getSearchResultByTitleModel() {
        return this.searchResultByTitleModel;
    }

    @Nullable
    public SearchResultModel getSearchResultByArtistModel() {
        return this.searchResultByArtistModel;
    }
}
