package com.vk.music.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.List;
/* loaded from: classes.dex */
public interface SearchSuggestionModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onHintsLoadingDone(@NonNull SearchSuggestionModel searchSuggestionModel);

        void onHintsLoadingError(@NonNull SearchSuggestionModel searchSuggestionModel, @NonNull String str);

        void onPopularLoadingDone(@NonNull SearchSuggestionModel searchSuggestionModel);

        void onPopularLoadingError(@NonNull SearchSuggestionModel searchSuggestionModel, @NonNull String str);

        void onRecentsChanged(@NonNull SearchSuggestionModel searchSuggestionModel);
    }

    void addRecent(@NonNull String str);

    void clearRecents();

    @Nullable
    List<String> getHints();

    @Nullable
    List<String> getPopular();

    @NonNull
    List<String> getRecents();

    void loadHints(@NonNull String str);

    void loadPopular();

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
