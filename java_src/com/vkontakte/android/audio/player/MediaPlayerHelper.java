package com.vkontakte.android.audio.player;

import android.content.Context;
import android.media.MediaPlayer;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.utils.Timer;
import com.vkontakte.android.audio.utils.WakeLockEx;
import com.vkontakte.android.utils.L;
import java.io.IOException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class MediaPlayerHelper implements MediaPlayerHelperI {
    private final int id;
    private int mAudioSessionId;
    private final MediaPlayerHelperI.MediaPlayerHelperListener mListener;
    private MediaPlayer mPlayer;
    private boolean mPrepared;
    private Timer mProgressTimer;
    @NonNull
    private PlayerState mState = PlayerState.IDLE;
    private final WakeLockEx mWakeLock;
    private MediaPlayerHelperI.Refer refer;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MediaPlayerHelper(Context context, int id, MediaPlayerHelperI.MediaPlayerHelperListener listener) {
        this.id = id;
        this.mListener = listener;
        this.mWakeLock = new WakeLockEx(context, MediaPlayerHelper.class.getName());
        setState(PlayerState.STOPPED);
        init();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void release() {
        setState(PlayerState.STOPPED);
        this.mWakeLock.releaseSafety();
        if (this.mPlayer != null) {
            this.mPlayer.release();
            this.mPlayer = null;
        }
        this.mPrepared = false;
        stopProgressTimer();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    @NonNull
    public PlayerState getState() {
        return this.mState;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getId() {
        return this.id;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public MediaPlayerHelperI.Refer getRefer() {
        return this.refer;
    }

    private void setState(@NonNull PlayerState state) {
        this.mState = state;
        if (this.mState == PlayerState.PLAYING) {
            this.mWakeLock.acquire();
        } else {
            this.mWakeLock.releaseSafety();
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void stop() {
        release();
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void play(@Nullable MusicTrack track, String url, @Nullable MediaPlayerHelperI.Refer refer) throws IOException {
        this.refer = refer;
        releaseInit();
        try {
            this.mPlayer.setDataSource(url);
            setState(PlayerState.PLAYING);
            this.mPlayer.prepareAsync();
        } catch (IOException e) {
            stop();
            throw e;
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean canPlay() {
        return true;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean rewind() {
        return seekTo(0);
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean tryNext() {
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean seekTo(int millis) {
        if (this.mPrepared) {
            stopProgressTimer();
            this.mPlayer.seekTo(millis);
            startProgressTimer();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean resume() {
        if (this.mState == PlayerState.PAUSED) {
            setState(PlayerState.PLAYING);
            if (this.mPrepared) {
                this.mPlayer.start();
                startProgressTimer();
            }
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean pause() {
        if (this.mState == PlayerState.PLAYING) {
            setState(PlayerState.PAUSED);
            if (this.mPrepared) {
                this.mPlayer.pause();
            }
            stopProgressTimer();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getDuration() {
        if (this.mPrepared) {
            return this.mPlayer.getDuration();
        }
        return 0L;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public long getCurrentPosition() {
        if (this.mPrepared) {
            return this.mPlayer.getCurrentPosition();
        }
        return 0L;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void setVolume(float volume) {
        if (this.mPlayer != null) {
            this.mPlayer.setVolume(volume, volume);
        }
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public int getAudioSessionId() {
        if (this.mAudioSessionId == 0) {
            init();
        }
        return this.mAudioSessionId;
    }

    private void init() {
        if (this.mPlayer == null) {
            this.mPlayer = new MediaPlayer();
            this.mPlayer.setAudioStreamType(3);
            if (this.mAudioSessionId != 0) {
                this.mPlayer.setAudioSessionId(this.mAudioSessionId);
            } else {
                this.mAudioSessionId = this.mPlayer.getAudioSessionId();
            }
            MyPlayerListener listener = new MyPlayerListener();
            this.mPlayer.setOnPreparedListener(listener);
            this.mPlayer.setOnErrorListener(listener);
            this.mPlayer.setOnCompletionListener(listener);
            this.mPlayer.setOnBufferingUpdateListener(listener);
        }
    }

    private void releaseInit() {
        release();
        init();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startProgressTimer() {
        if (this.mProgressTimer == null) {
            this.mProgressTimer = Timer.startNewTimer(new ProgressRunnable(), 0L, 500L);
        }
    }

    private void stopProgressTimer() {
        if (this.mProgressTimer != null) {
            this.mProgressTimer.stop();
            this.mProgressTimer = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class MyPlayerListener implements MediaPlayer.OnPreparedListener, MediaPlayer.OnErrorListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnBufferingUpdateListener {
        private MyPlayerListener() {
        }

        @Override // android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer mp) {
            MediaPlayerHelper.this.stop();
            MediaPlayerHelper.this.mListener.onCompleted(MediaPlayerHelper.this);
        }

        @Override // android.media.MediaPlayer.OnErrorListener
        public boolean onError(MediaPlayer mp, int what, int extra) {
            L.e(mp, Integer.valueOf(what), Integer.valueOf(extra));
            MediaPlayerHelper.this.stop();
            switch (extra) {
                case -1010:
                    MediaPlayerHelper.this.mListener.onError(MediaPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.unsupported);
                    break;
                case -110:
                    MediaPlayerHelper.this.mListener.onError(MediaPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.timeout);
                    break;
                default:
                    MediaPlayerHelper.this.mListener.onError(MediaPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.unknown);
                    break;
            }
            return true;
        }

        @Override // android.media.MediaPlayer.OnPreparedListener
        public void onPrepared(MediaPlayer mp) {
            MediaPlayerHelper.this.mPrepared = true;
            if (MediaPlayerHelper.this.mState == PlayerState.PLAYING) {
                MediaPlayerHelper.this.mPlayer.start();
                MediaPlayerHelper.this.startProgressTimer();
            }
            MediaPlayerHelper.this.mListener.onPrepared(MediaPlayerHelper.this, MediaPlayerHelper.this.mPlayer.getDuration());
        }

        @Override // android.media.MediaPlayer.OnBufferingUpdateListener
        public void onBufferingUpdate(MediaPlayer mp, int percent) {
            MediaPlayerHelper.this.mListener.onBufferingProgress(MediaPlayerHelper.this, percent);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ProgressRunnable implements Runnable {
        private ProgressRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (MediaPlayerHelper.this.mPlayer.isPlaying()) {
                MediaPlayerHelper.this.mListener.onProgress(MediaPlayerHelper.this, MediaPlayerHelper.this.mPlayer.getCurrentPosition());
            }
        }
    }
}
