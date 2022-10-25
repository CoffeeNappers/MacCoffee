package com.my.target.ads.instream;

import android.net.Uri;
import android.view.View;
/* loaded from: classes2.dex */
public interface InstreamAdPlayer {

    /* loaded from: classes2.dex */
    public interface AdPlayerListener {
        void onAdVideoCompleted();

        void onAdVideoError(String str);

        void onAdVideoPaused();

        void onAdVideoResumed();

        void onAdVideoStarted();

        void onAdVideoStopped();

        void onVolumeChanged(float f);
    }

    void destroy();

    AdPlayerListener getAdPlayerListener();

    float getAdVideoDuration();

    float getAdVideoTimeElapsed();

    View getView();

    void pauseAdVideo();

    void playAdVideo(Uri uri, int i, int i2);

    void resumeAdVideo();

    void setAdPlayerListener(AdPlayerListener adPlayerListener);

    void setVolume(float f);

    void stopAdVideo();
}
