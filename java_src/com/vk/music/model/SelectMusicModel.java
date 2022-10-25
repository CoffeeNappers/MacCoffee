package com.vk.music.model;

import android.support.annotation.NonNull;
import com.vkontakte.android.audio.MusicTrack;
/* loaded from: classes2.dex */
public interface SelectMusicModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onLoadingDone(@NonNull SelectMusicModel selectMusicModel);

        void onLoadingError(@NonNull SelectMusicModel selectMusicModel, @NonNull String str);

        void onLoadingMoreDone(@NonNull SelectMusicModel selectMusicModel);

        void onLoadingMoreError(@NonNull SelectMusicModel selectMusicModel, @NonNull String str);
    }

    /* loaded from: classes2.dex */
    public interface View {
    }

    void load();

    void loadMore();

    void select(@NonNull MusicTrack musicTrack);

    void subscribe(@NonNull Callback callback);

    void unselect(@NonNull MusicTrack musicTrack);

    void unsubscribe(@NonNull Callback callback);
}
