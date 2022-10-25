package com.vkontakte.android.media;

import android.app.Activity;
/* loaded from: classes.dex */
public interface AutoPlay {

    /* loaded from: classes3.dex */
    public interface Listener {
        AutoPlay getPlayingNow();

        void onComplete(AutoPlay autoPlay);

        void onError(AutoPlay autoPlay);

        void onPause(Activity activity);

        void onReady(AutoPlay autoPlay);

        void onResume(Activity activity);

        void playPrepared(AutoPlay autoPlay);
    }

    /* loaded from: classes3.dex */
    public enum Type {
        VIDEO,
        GIF
    }

    boolean canAutoPlay();

    void detachSurface();

    float getPercentageOnScreen();

    int getScreenCenterDistance();

    Type getType();

    boolean isComplete();

    boolean isPlaying();

    boolean isPrepared();

    void pause();

    void play(boolean z);

    void prepare();

    void removeListener(Listener listener);

    void setListener(Listener listener);

    void stop();

    void waiting();
}
