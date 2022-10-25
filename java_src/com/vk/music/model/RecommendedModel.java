package com.vk.music.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Section;
import com.vkontakte.android.audio.MusicTrack;
import java.util.ArrayList;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes.dex */
public interface RecommendedModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onLoadingDone(@NonNull RecommendedModel recommendedModel);

        void onLoadingError(@NonNull RecommendedModel recommendedModel, @NonNull ErrorResponse errorResponse);
    }

    @Nullable
    String getError();

    @NonNull
    MusicTrackModel getMusicTrackModel();

    @NonNull
    PlayerModel getPlayerModel();

    @Nullable
    ArrayList<Section> getSections();

    void load();

    void playSection(@NonNull Section section, @Nullable MusicTrack musicTrack);

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
