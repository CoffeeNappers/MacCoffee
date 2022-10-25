package com.my.target.ads.instream;

import android.content.Context;
import android.net.Uri;
/* loaded from: classes2.dex */
public interface InstreamAudioAdPlayer {

    /* loaded from: classes2.dex */
    public interface AdPlayerListener {
        void onAdAudioCompleted();

        void onAdAudioError(String str);

        void onAdAudioPaused();

        void onAdAudioResumed();

        void onAdAudioStarted();

        void onAdAudioStopped();

        void onVolumeChanged(float f);
    }

    void destroy();

    float getAdAudioDuration();

    float getAdAudioTimeElapsed();

    AdPlayerListener getAdPlayerListener();

    Context getCurrentContext();

    void pauseAdAudio();

    void playAdAudio(Uri uri);

    void resumeAdAudio();

    void setAdPlayerListener(AdPlayerListener adPlayerListener);

    void setVolume(float f);

    void stopAdAudio();
}
