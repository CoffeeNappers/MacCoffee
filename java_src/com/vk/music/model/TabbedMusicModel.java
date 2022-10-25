package com.vk.music.model;

import android.support.annotation.NonNull;
import com.vkontakte.android.auth.VKAccountManager;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public final class TabbedMusicModel extends MergeModel implements ActiveModel {
    private int page;

    /* loaded from: classes.dex */
    public interface View {
        public static final int MUSIC_PAGE_MUSIC = 0;
        public static final int MUSIC_PAGE_RECOMMENDATIONS = 1;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface Page {
        }
    }

    public TabbedMusicModel(boolean openRecommendations) {
        super(new MusicModelImpl(VKAccountManager.getCurrent().getUid()), new RecommendedModelImpl());
        if (openRecommendations) {
            this.page = 1;
        }
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    @NonNull
    public MusicModel getMusicModel() {
        return (MusicModel) model(0);
    }

    @NonNull
    public RecommendedModel getRecommendedModel() {
        return (RecommendedModel) model(1);
    }
}
