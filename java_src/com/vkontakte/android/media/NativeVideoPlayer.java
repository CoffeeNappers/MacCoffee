package com.vkontakte.android.media;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.Surface;
import com.vkontakte.android.Log;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.media.AbsVideoPlayer;
import java.io.IOException;
/* loaded from: classes3.dex */
public class NativeVideoPlayer extends TextureVideoPlayer {
    public static final int MEDIA_ERROR_SYSTEM = Integer.MIN_VALUE;
    private boolean mCompleted;
    private int mLastPosition;
    @Nullable
    private MediaPlayer mPlayer;
    private boolean mPrepared;
    private int mQuality;
    private String mUrl;
    final VigoDelegate mVigo;
    Runnable ticker;

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        int position;
        MediaPlayer player = this.mPlayer;
        if (player != null && (position = player.getCurrentPosition()) != this.mLastPosition) {
            this.mLastPosition = position;
            this.handler.onUpdatePlaybackPosition(this, this.mLastPosition);
            this.mVigo.onUpdatePlaybackPosition(player.getDuration(), player.getCurrentPosition());
        }
        tick();
    }

    public NativeVideoPlayer(Context context, VideoFile videoFile, String referrer) {
        super(context, videoFile, referrer);
        this.mVigo = new VigoDelegate();
        this.ticker = NativeVideoPlayer$$Lambda$1.lambdaFactory$(this);
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setPlayerStateListener(AbsVideoPlayer.PlayerStateListener l) {
        super.setPlayerStateListener(l);
        MediaPlayer player = this.mPlayer;
        if (player != null && this.mPrepared) {
            dispatchPlayerReady();
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setDataSourceAndPrepare(String url, int quality, boolean useVigo, boolean autoplay) {
        SurfaceTexture surfaceTexture;
        this.mQuality = quality;
        this.isAutoplay = autoplay;
        VigoDelegate vigoDelegate = this.mVigo;
        if (!useVigo) {
            quality = -1;
        }
        vigoDelegate.setDataSourceAndPrepare(url, quality, VigoDelegate.getSVCid(autoplay));
        this.mUrl = url;
        if (this.renderView != null && (surfaceTexture = this.renderView.getSurfaceTexture()) != null) {
            doSetDataSource(surfaceTexture);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public int getQuality() {
        return this.mQuality;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void createPlayer(int minBufferMs, int maxBufferMs, int bufferForPlaybackMs, int bufferForPlaybackAfterRebufferMs) {
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void replay(int position) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            this.mVigo.play(player.getDuration(), position);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void play(boolean replay) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            this.mCompleted = false;
            this.mVigo.play(player.getDuration(), player.getCurrentPosition());
            player.start();
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void pause() {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            this.mVigo.pause(player.isPlaying(), player.getDuration(), player.getCurrentPosition());
            player.pause();
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void seek(int offset) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            this.mCompleted = false;
            this.mVigo.seek(offset, player.isPlaying(), player.getDuration(), player.getCurrentPosition());
            player.seekTo(offset);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void recallReady() {
        dispatchPlayerReady();
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, com.vkontakte.android.media.AbsVideoPlayer
    public void stopAndRelease() {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            tock();
            this.mVigo.release(player.getDuration(), player.getCurrentPosition());
            player.pause();
            player.release();
            this.mPlayer = null;
            this.mPrepared = false;
        }
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture texture, int width, int height) {
        if (this.mUrl != null && this.mPlayer == null) {
            doSetDataSource(texture);
        } else {
            updateTexture(texture);
        }
        super.onSurfaceTextureAvailable(texture, width, height);
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture texture) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            player.setSurface(null);
        }
        return super.onSurfaceTextureDestroyed(texture);
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public int getPosition() {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            return player.getCurrentPosition();
        }
        return 0;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public boolean isCompleted() {
        return this.mCompleted;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setVolume(float gain) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            player.setVolume(gain, gain);
        }
    }

    void updateTexture(SurfaceTexture texture) {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            player.setSurface(new Surface(texture));
        }
    }

    void dispatchPlayerReady() {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            this.handler.onPlayerReady(this, player.getVideoWidth(), player.getVideoHeight());
        }
    }

    void doSetDataSource(@NonNull SurfaceTexture texture) {
        this.mVigo.beforeSetDataSource();
        MediaPlayer player = new MediaPlayer();
        this.mPlayer = player;
        player.setOnCompletionListener(NativeVideoPlayer$$Lambda$2.lambdaFactory$(this));
        player.setOnErrorListener(NativeVideoPlayer$$Lambda$3.lambdaFactory$(this));
        player.setOnInfoListener(NativeVideoPlayer$$Lambda$4.lambdaFactory$(this, player));
        player.setOnBufferingUpdateListener(NativeVideoPlayer$$Lambda$5.lambdaFactory$(this, player));
        player.setOnPreparedListener(NativeVideoPlayer$$Lambda$6.lambdaFactory$(this, player));
        tick();
        updateTexture(texture);
        try {
            player.setDataSource(this.context, Uri.parse(this.mUrl));
            player.prepareAsync();
            this.mVigo.afterSetDataSource();
        } catch (IOException e) {
            Log.e("NativeVideoPlayer", "setDataSource failed: " + this.mUrl, e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doSetDataSource$1(MediaPlayer mp) {
        this.mVigo.onPlaybackComplete(mp.getDuration(), mp.getCurrentPosition());
        this.handler.onPlaybackCompleted(this);
        this.mCompleted = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$doSetDataSource$2(MediaPlayer mp, int what, int extra) {
        int i;
        if (what == 1 || what == -1007 || what == -1010) {
            AbsVideoPlayer.UiHandler uiHandler = this.handler;
            if (extra == Integer.MIN_VALUE) {
                i = -1;
            } else {
                i = extra == -1004 ? 4 : 1;
            }
            uiHandler.onError(this, i);
        }
        if (what == -1004 || what == 100 || what == -110) {
            this.handler.onError(this, -1);
        }
        this.mVigo.onError(what, extra);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$doSetDataSource$3(MediaPlayer player, MediaPlayer mp, int what, int extra) {
        if (what == 701) {
            this.handler.onEndOfBuffer(this);
            this.mVigo.onBufferingStart(player.getDuration(), player.getCurrentPosition());
        }
        if (what == 702) {
            this.handler.onPlaybackResumed(this);
            this.mVigo.onBufferingEnd(player.getDuration(), player.getCurrentPosition());
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doSetDataSource$4(MediaPlayer player, MediaPlayer mp, int percent) {
        this.handler.onUpdateBuffered(this, percent);
        this.mVigo.onBufferingUpdate(percent, player.getDuration(), player.getCurrentPosition());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doSetDataSource$5(MediaPlayer player, MediaPlayer mp) {
        this.mPrepared = true;
        dispatchPlayerReady();
        this.mVigo.vigoOnPrepared(player.getDuration(), player.getCurrentPosition());
    }

    void tick() {
        MediaPlayer player = this.mPlayer;
        if (player != null) {
            ViewUtils.postDelayed(this.ticker, 500L);
        }
    }

    void tock() {
        ViewUtils.removeCallbacks(this.ticker);
    }
}
