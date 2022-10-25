package com.vkontakte.android.audio.player.ads;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.mopub.mobileads.MyTargetMopubCustomEventRewardedVideo;
import com.my.target.ads.instream.InstreamAudioAdPlayer;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.utils.L;
import java.io.IOException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class InstreamAudioAdPlayerAdapter implements InstreamAudioAdPlayer, MediaPlayerHelperI.MediaPlayerHelperListener, MediaPlayerHelperI {
    private InstreamAudioAdPlayer.AdPlayerListener adPlayerListener;
    private final Context ctx;
    private final MediaPlayerHelperI mediaPlayerHelper;
    private MediaPlayerHelperI.MediaPlayerHelperListener mediaPlayerHelperListener;
    private final MediaPlayerHelperI.Type type;

    /* JADX INFO: Access modifiers changed from: package-private */
    public InstreamAudioAdPlayerAdapter(MediaPlayerHelperI.Type type, Context ctx, int id, MediaPlayerHelperI.MediaPlayerHelperListener listener) {
        this.type = type;
        this.ctx = ctx;
        this.mediaPlayerHelperListener = listener;
        this.mediaPlayerHelper = MediaPlayerHelperI.Factory.get(type, ctx, id, this);
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public InstreamAudioAdPlayer.AdPlayerListener getAdPlayerListener() {
        return this.adPlayerListener;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void setAdPlayerListener(InstreamAudioAdPlayer.AdPlayerListener adPlayerListener) {
        this.adPlayerListener = adPlayerListener;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public float getAdAudioDuration() {
        return ((float) this.mediaPlayerHelper.getDuration()) / 1000.0f;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public float getAdAudioTimeElapsed() {
        return ((float) this.mediaPlayerHelper.getCurrentPosition()) / 1000.0f;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public Context getCurrentContext() {
        return this.ctx;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void playAdAudio(Uri uri) {
        try {
            this.mediaPlayerHelper.play(null, this.type.createHttpUrl(null, String.valueOf(uri)), null);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void pauseAdAudio() {
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener;
        if (this.mediaPlayerHelper.pause() && (adPlayerListener = this.adPlayerListener) != null) {
            adPlayerListener.onAdAudioPaused();
        }
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void resumeAdAudio() {
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener;
        if (this.mediaPlayerHelper.resume() && (adPlayerListener = this.adPlayerListener) != null) {
            adPlayerListener.onAdAudioResumed();
        }
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void stopAdAudio() {
        this.mediaPlayerHelper.stop();
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener = this.adPlayerListener;
        if (adPlayerListener != null) {
            adPlayerListener.onAdAudioStopped();
        }
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer
    public void destroy() {
        this.mediaPlayerHelper.release();
    }

    @Override // com.my.target.ads.instream.InstreamAudioAdPlayer, com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void setVolume(float v) {
        this.mediaPlayerHelper.setVolume(v);
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener = this.adPlayerListener;
        if (adPlayerListener != null) {
            adPlayerListener.onVolumeChanged(v);
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onPrepared(@NonNull MediaPlayerHelperI helper, int duration) {
        this.mediaPlayerHelperListener.onPrepared(helper, duration);
        L.e(MyTargetMopubCustomEventRewardedVideo.NETWORK_ID, this.adPlayerListener);
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener = this.adPlayerListener;
        if (adPlayerListener != null) {
            adPlayerListener.onAdAudioStarted();
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onCompleted(@NonNull MediaPlayerHelperI helper) {
        this.mediaPlayerHelperListener.onCompleted(helper);
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener = this.adPlayerListener;
        if (adPlayerListener != null) {
            adPlayerListener.onAdAudioCompleted();
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onError(@NonNull MediaPlayerHelperI helper, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType errorType) {
        this.mediaPlayerHelperListener.onError(helper, errorType);
        InstreamAudioAdPlayer.AdPlayerListener adPlayerListener = this.adPlayerListener;
        if (adPlayerListener != null) {
            adPlayerListener.onAdAudioError(String.valueOf(errorType));
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onProgress(@NonNull MediaPlayerHelperI helper, int progress) {
        this.mediaPlayerHelperListener.onProgress(helper, progress);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onBufferingProgress(@NonNull MediaPlayerHelperI helper, int percent) {
        this.mediaPlayerHelperListener.onBufferingProgress(helper, percent);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onHelperIdChange(int newId) {
        this.mediaPlayerHelperListener.onHelperIdChange(newId);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void play(@Nullable MusicTrack track, String url, @Nullable MediaPlayerHelperI.Refer refer) throws IOException {
        this.mediaPlayerHelper.play(track, url, refer);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean canPlay() {
        return this.mediaPlayerHelper.canPlay();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void release() {
        this.mediaPlayerHelper.release();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean pause() {
        return this.mediaPlayerHelper.pause();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean resume() {
        return this.mediaPlayerHelper.resume();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean rewind() {
        return this.mediaPlayerHelper.rewind();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean tryNext() {
        return this.mediaPlayerHelper.tryNext();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean seekTo(int millis) {
        return this.mediaPlayerHelper.seekTo(millis);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getDuration() {
        return this.mediaPlayerHelper.getDuration();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getCurrentPosition() {
        return this.mediaPlayerHelper.getCurrentPosition();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void stop() {
        this.mediaPlayerHelper.stop();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getAudioSessionId() {
        return this.mediaPlayerHelper.getAudioSessionId();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    @NonNull
    public PlayerState getState() {
        return this.mediaPlayerHelper.getState();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getId() {
        return this.mediaPlayerHelper.getId();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public MediaPlayerHelperI.Refer getRefer() {
        return this.mediaPlayerHelper.getRefer();
    }
}
