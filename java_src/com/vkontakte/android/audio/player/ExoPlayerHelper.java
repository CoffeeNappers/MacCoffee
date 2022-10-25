package com.vkontakte.android.audio.player;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.exoplayer2.DefaultLoadControl;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.ExoPlayerFactory;
import com.google.android.exoplayer2.LoadControl;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.Timeline;
import com.google.android.exoplayer2.extractor.DefaultExtractorsFactory;
import com.google.android.exoplayer2.extractor.ExtractorsFactory;
import com.google.android.exoplayer2.source.ExtractorMediaSource;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.source.UnrecognizedInputFormatException;
import com.google.android.exoplayer2.trackselection.AdaptiveVideoTrackSelection;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DefaultAllocator;
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.upstream.DefaultHttpDataSourceFactory;
import com.vk.analytics.Analytics;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.exo.AudioDataSourceFactory;
import com.vkontakte.android.audio.player.exo.AudioOkHttpDataSourceFactory;
import com.vkontakte.android.audio.utils.Timer;
import com.vkontakte.android.audio.utils.WakeLockEx;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import okhttp3.Call;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class ExoPlayerHelper implements MediaPlayerHelperI {
    private Context context;
    private final int id;
    private int mAudioSessionId;
    private final MediaPlayerHelperI.MediaPlayerHelperListener mListener;
    private SimpleExoPlayer mPlayer;
    private boolean mPrepared;
    private Timer mProgressTimer;
    @NonNull
    private PlayerState mState = PlayerState.IDLE;
    private final WakeLockEx mWakeLock;
    private MediaPlayerHelperI.Refer refer;
    private boolean useLocalhost;
    private static Call.Factory factory = ExoPlayerHelper$$Lambda$1.lambdaFactory$();
    private static final Handler sMainHandler = new Handler(Looper.getMainLooper());
    private static final DefaultBandwidthMeter sBandwidthMeter = new DefaultBandwidthMeter();
    private static final DataSource.Factory sDataSourceFactoryCache = new AudioDataSourceFactory(VKApplication.context, sBandwidthMeter, new AudioOkHttpDataSourceFactory(factory, APIController.USER_AGENT, sBandwidthMeter));
    private static final DataSource.Factory sDataSourceFactoryLocalhost = new DefaultDataSourceFactory(VKApplication.context, sBandwidthMeter, new DefaultHttpDataSourceFactory(APIController.USER_AGENT, sBandwidthMeter));
    private static final ExtractorsFactory sExtractorFactory = new DefaultExtractorsFactory();
    private static final TrackSelection.Factory sVideoTrackSelectionFactory = new AdaptiveVideoTrackSelection.Factory(sBandwidthMeter);

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExoPlayerHelper(Context context, int id, MediaPlayerHelperI.MediaPlayerHelperListener listener, boolean useLocalhost) {
        this.context = context;
        this.id = id;
        this.mListener = listener;
        this.useLocalhost = useLocalhost;
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

    private DataSource.Factory getsDataSourceFactory() {
        return this.useLocalhost ? sDataSourceFactoryLocalhost : sDataSourceFactoryCache;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public void play(@Nullable MusicTrack track, String url, @Nullable MediaPlayerHelperI.Refer refer) throws IOException {
        this.refer = refer;
        releaseInit();
        MediaSource mediaSource = new ExtractorMediaSource(Uri.parse(url), getsDataSourceFactory(), sExtractorFactory, sMainHandler, null);
        this.mPlayer.prepare(mediaSource);
        setState(PlayerState.PLAYING);
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
            if (!this.mPrepared) {
                return true;
            }
            this.mPlayer.setPlayWhenReady(true);
            startProgressTimer();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI
    public boolean pause() {
        if (this.mState == PlayerState.PLAYING) {
            setState(PlayerState.PAUSED);
            if (this.mPrepared) {
                this.mPlayer.setPlayWhenReady(false);
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
            this.mPlayer.setVolume(volume);
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
            TrackSelector trackSelector = new DefaultTrackSelector(sVideoTrackSelectionFactory);
            DefaultAllocator allocator = new DefaultAllocator(true, 1048576);
            LoadControl loadControl = new DefaultLoadControl(allocator, 480000, 600000, (long) DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_MS, 5000);
            this.mPlayer = ExoPlayerFactory.newSimpleInstance(this.context, trackSelector, loadControl);
            this.mPlayer.addListener(new ExoPlayer.EventListener() { // from class: com.vkontakte.android.audio.player.ExoPlayerHelper.1
                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onLoadingChanged(boolean isLoading) {
                }

                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onPlayerStateChanged(boolean playWhenReady, int playbackState) {
                    SimpleExoPlayer player = ExoPlayerHelper.this.mPlayer;
                    if (player != null) {
                        if (playbackState == 4) {
                            ExoPlayerHelper.this.stop();
                            ExoPlayerHelper.this.mListener.onCompleted(ExoPlayerHelper.this);
                        }
                        if (playbackState == 3 && !ExoPlayerHelper.this.mPrepared) {
                            ExoPlayerHelper.this.mPrepared = true;
                            if (ExoPlayerHelper.this.mState == PlayerState.PLAYING) {
                                ExoPlayerHelper.this.mPlayer.setPlayWhenReady(true);
                                ExoPlayerHelper.this.startProgressTimer();
                            }
                            ExoPlayerHelper.this.mListener.onPrepared(ExoPlayerHelper.this, (int) ExoPlayerHelper.this.mPlayer.getDuration());
                        }
                    }
                }

                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onTimelineChanged(Timeline timeline, Object manifest) {
                }

                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onTracksChanged(TrackGroupArray trackGroups, TrackSelectionArray trackSelections) {
                }

                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onPlayerError(ExoPlaybackException error) {
                    Exception exception;
                    ExoPlayerHelper.this.stop();
                    switch (error.type) {
                        case 0:
                            Exception exception2 = null;
                            try {
                                if (error.getSourceException() != null) {
                                    exception2 = error.getSourceException();
                                }
                                Exception exception3 = error.getUnexpectedException() != null ? error.getUnexpectedException() : exception2;
                                if (exception3 != null) {
                                    try {
                                        if (exception3 instanceof UnrecognizedInputFormatException) {
                                            Uri uri = ((UnrecognizedInputFormatException) exception3).uri;
                                            exception = new Exception(exception3.getMessage() + "|uri=" + uri, exception3);
                                        } else {
                                            exception = exception3;
                                        }
                                        Analytics.logException(exception);
                                    } catch (Exception e) {
                                        e = e;
                                        L.e(e, new Object[0]);
                                        ExoPlayerHelper.this.mListener.onError(ExoPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.unknown);
                                        return;
                                    }
                                }
                            } catch (Exception e2) {
                                e = e2;
                            }
                            ExoPlayerHelper.this.mListener.onError(ExoPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.unknown);
                            return;
                        default:
                            ExoPlayerHelper.this.mListener.onError(ExoPlayerHelper.this, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType.unknown);
                            return;
                    }
                }

                @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
                public void onPositionDiscontinuity() {
                }
            });
            this.mAudioSessionId = this.mPlayer.getAudioSessionId();
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
    public class ProgressRunnable implements Runnable {
        private ProgressRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (ExoPlayerHelper.this.mPlayer.getPlaybackState() == 3 && ExoPlayerHelper.this.mPlayer.getPlayWhenReady()) {
                ExoPlayerHelper.this.mListener.onProgress(ExoPlayerHelper.this, (int) ExoPlayerHelper.this.mPlayer.getCurrentPosition());
                ExoPlayerHelper.this.mListener.onBufferingProgress(ExoPlayerHelper.this, ExoPlayerHelper.this.mPlayer.getBufferedPercentage());
            }
        }
    }
}
