package com.vkontakte.android.audio.player.ads;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.my.target.ads.instream.InstreamAudioAdPlayer;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.ads.AudioAd;
import com.vkontakte.android.auth.configs.AudioAdConfig;
import com.vkontakte.android.utils.L;
import java.io.IOException;
/* loaded from: classes2.dex */
public class AdPlayerHelper implements MediaPlayerHelperI, MediaPlayerHelperI.MediaPlayerHelperListener, AudioAd.OnStateChangedListener {
    private AudioAd audioAd;
    private final Context ctx;
    private final int idAd;
    private final int idContent;
    @NonNull
    private PlayerState mState = PlayerState.IDLE;
    private MediaPlayerHelperI.MediaPlayerHelperListener mediaPlayerHelperListener;
    @Nullable
    private InstreamAudioAdPlayerAdapter playerAd;
    private final MediaPlayerHelperI playerContent;
    private final MediaPlayerHelperI.Type type;

    public AdPlayerHelper(MediaPlayerHelperI.Type type, Context ctx, int idContent, int idAd, MediaPlayerHelperI.MediaPlayerHelperListener listener) {
        this.type = type;
        this.ctx = ctx;
        this.idContent = idContent;
        this.idAd = idAd;
        this.mediaPlayerHelperListener = listener;
        this.playerContent = MediaPlayerHelperI.Factory.get(type, ctx, idContent, this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized InstreamAudioAdPlayer getOrCreateAdPlayer() {
        if (this.playerAd == null) {
            this.playerAd = new InstreamAudioAdPlayerAdapter(this.type, this.ctx, this.idAd, this);
        }
        return this.playerAd;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void play(@Nullable MusicTrack track, String url, @Nullable MediaPlayerHelperI.Refer refer) throws IOException {
        this.mState = PlayerState.PLAYING;
        this.playerContent.stop();
        if (this.audioAd != null) {
            this.audioAd.release();
        }
        this.audioAd = new AudioAd(this.ctx, track, this, this, refer);
        this.audioAd.work(AudioAdConfig.Type.preroll, AdPlayerHelper$$Lambda$1.lambdaFactory$(this, track, url, refer));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$play$0(@Nullable MusicTrack track, String url, @Nullable MediaPlayerHelperI.Refer refer) {
        try {
            if (this.mState == PlayerState.PLAYING || this.mState == PlayerState.PAUSED) {
                this.playerContent.play(track, url, refer);
                if (this.mState == PlayerState.PAUSED) {
                    this.playerContent.pause();
                }
            }
        } catch (IOException e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean canPlay() {
        return !AudioAd.isWorking(this.audioAd) || this.audioAd.isAllowTrackChange();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void release() {
        this.playerContent.release();
        if (this.playerAd != null) {
            this.playerAd.release();
        }
        if (this.audioAd != null) {
            this.audioAd.release();
            this.audioAd = null;
        }
        this.mState = PlayerState.STOPPED;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean pause() {
        boolean retValue;
        if (this.mState == PlayerState.PLAYING) {
            if (AudioAd.isWorking(this.audioAd)) {
                retValue = this.audioAd.pause();
            } else {
                retValue = this.playerContent.pause();
            }
            if (retValue) {
                this.mState = PlayerState.PAUSED;
                return retValue;
            }
            return retValue;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean resume() {
        boolean retValue;
        if (this.mState == PlayerState.PAUSED) {
            if (AudioAd.isWorking(this.audioAd)) {
                retValue = this.audioAd.resume();
            } else {
                retValue = this.playerContent.resume();
            }
            if (retValue) {
                this.mState = PlayerState.PLAYING;
                return retValue;
            }
            return retValue;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean rewind() {
        if (AudioAd.isWorking(this.audioAd)) {
            return !this.audioAd.isAllowTrackChange();
        }
        return this.playerContent.rewind();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean tryNext() {
        if (AudioAd.isWorking(this.audioAd)) {
            if (this.audioAd.isAllowSkip()) {
                this.audioAd.skip();
            }
            return true;
        }
        return this.playerContent.tryNext();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean seekTo(int millis) {
        if (AudioAd.isWorking(this.audioAd)) {
            return this.audioAd.isAllowSeek() && this.playerAd != null && this.playerAd.seekTo(millis);
        }
        return this.playerContent.seekTo(millis);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getDuration() {
        return AudioAd.isWorking(this.audioAd) ? this.audioAd.getCurrentDuration() : this.playerContent.getDuration();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getCurrentPosition() {
        if (AudioAd.isWorking(this.audioAd)) {
            if (this.playerAd != null) {
                return this.playerAd.getCurrentPosition();
            }
            return 0L;
        }
        return this.playerContent.getCurrentPosition();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void stop() {
        this.playerContent.stop();
        if (this.playerAd != null) {
            this.playerAd.stop();
        }
        this.mState = PlayerState.STOPPED;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void setVolume(float volume) {
        this.playerContent.setVolume(volume);
        if (this.playerAd != null) {
            this.playerAd.setVolume(volume);
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getAudioSessionId() {
        if (AudioAd.isWorking(this.audioAd)) {
            if (this.playerAd != null) {
                return this.playerAd.getAudioSessionId();
            }
            return 0;
        }
        return this.playerContent.getAudioSessionId();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    @NonNull
    public PlayerState getState() {
        return this.mState;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getId() {
        return AudioAd.isWorking(this.audioAd) ? this.idAd : this.idContent;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public MediaPlayerHelperI.Refer getRefer() {
        return this.playerContent.getRefer();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onPrepared(@NonNull MediaPlayerHelperI helper, int duration) {
        this.mediaPlayerHelperListener.onPrepared(helper, duration);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onCompleted(@NonNull MediaPlayerHelperI helper) {
        if (this.idContent == helper.getId()) {
            if (this.audioAd != null) {
                this.audioAd.work(AudioAdConfig.Type.postroll, AdPlayerHelper$$Lambda$2.lambdaFactory$(this, helper));
                return;
            }
            return;
        }
        this.mediaPlayerHelperListener.onCompleted(helper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCompleted$1(@NonNull MediaPlayerHelperI helper) {
        this.mediaPlayerHelperListener.onCompleted(helper);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onError(@NonNull MediaPlayerHelperI helper, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType errorType) {
        this.mediaPlayerHelperListener.onError(helper, errorType);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onProgress(@NonNull MediaPlayerHelperI helper, int progress) {
        int progressSec = progress / 1000;
        if (this.idContent == helper.getId() && this.audioAd != null && this.audioAd.checkMidroll(progressSec) && this.playerContent.pause()) {
            this.audioAd.work(AudioAdConfig.Type.midlroll, AdPlayerHelper$$Lambda$3.lambdaFactory$(this), progressSec);
        }
        this.mediaPlayerHelperListener.onProgress(helper, progress);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onProgress$2() {
        if (this.mState == PlayerState.PLAYING) {
            this.playerContent.resume();
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onBufferingProgress(@NonNull MediaPlayerHelperI helper, int percent) {
        if (helper.getId() == this.idContent) {
            this.mediaPlayerHelperListener.onBufferingProgress(helper, percent);
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
    public void onHelperIdChange(int newId) {
        this.mediaPlayerHelperListener.onHelperIdChange(newId);
    }

    @Override // com.vkontakte.android.audio.player.ads.AudioAd.OnStateChangedListener
    public void onStateChange() {
        onHelperIdChange(AudioAd.isWorking(this.audioAd) ? this.idAd : this.idContent);
    }

    public String getAdText() {
        if (this.audioAd == null) {
            return null;
        }
        return this.audioAd.getAdText();
    }

    public PlayerAction[] getPlayerActions() {
        if (this.audioAd == null) {
            return null;
        }
        return this.audioAd.getPlayerActions();
    }
}
