package com.vk.music.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.audio.MusicTrack;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes.dex */
public interface SearchResultModel extends ActiveModel {

    /* loaded from: classes.dex */
    public interface Callback {
        void onLoadingDone(@NonNull SearchResultModel searchResultModel);

        void onLoadingError(@NonNull SearchResultModel searchResultModel, @NonNull ErrorResponse errorResponse);

        void onLoadingMoreDone(@NonNull SearchResultModel searchResultModel, @NonNull List<MusicTrack> list, @NonNull List<MusicTrack> list2);

        void onLoadingMoreError(@NonNull SearchResultModel searchResultModel, @NonNull ErrorResponse errorResponse);

        void onQueryChanged(@NonNull SearchResultModel searchResultModel);
    }

    boolean canLoadMore();

    @Nullable
    List<Group> getCommunities();

    @Nullable
    String getError();

    @Nullable
    List<MusicTrack> getGlobalResults();

    @Nullable
    List<MusicTrack> getLocalResults();

    @NonNull
    MusicTrackModel getMusicTrackModel();

    @NonNull
    PlayerModel getPlayerModel();

    @NonNull
    String getQuery();

    @Nullable
    List<MusicTrack> getResults();

    boolean isLoaded();

    void loadMoreResults();

    void loadResults();

    void setQuery(@NonNull String str);

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
