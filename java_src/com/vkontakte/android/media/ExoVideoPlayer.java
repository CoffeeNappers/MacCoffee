package com.vkontakte.android.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.Surface;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.DefaultLoadControl;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.LoadControl;
import com.google.android.exoplayer2.Renderer;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.Timeline;
import com.google.android.exoplayer2.decoder.DecoderCounters;
import com.google.android.exoplayer2.drm.DrmSessionManager;
import com.google.android.exoplayer2.drm.FrameworkMediaCrypto;
import com.google.android.exoplayer2.ext.okhttp.OkHttpDataSourceFactory;
import com.google.android.exoplayer2.extractor.DefaultExtractorsFactory;
import com.google.android.exoplayer2.extractor.ExtractorsFactory;
import com.google.android.exoplayer2.mediacodec.MediaCodecInfo;
import com.google.android.exoplayer2.mediacodec.MediaCodecSelector;
import com.google.android.exoplayer2.mediacodec.MediaCodecUtil;
import com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener;
import com.google.android.exoplayer2.source.ExtractorMediaSource;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.TrackGroup;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.source.hls.HlsMediaSource;
import com.google.android.exoplayer2.trackselection.AdaptiveVideoTrackSelection;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.upstream.BandwidthMeter;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.DefaultAllocator;
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.upstream.DefaultHttpDataSourceFactory;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.upstream.TransferListener;
import com.google.android.exoplayer2.util.Util;
import com.google.android.exoplayer2.video.MediaCodecVideoRenderer;
import com.google.android.exoplayer2.video.VideoRendererEventListener;
import com.vk.analytics.Analytics;
import com.vk.analytics.AnalyticsEvent;
import com.vk.core.network.Network;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoLiveHeartbeat;
import com.vkontakte.android.api.video.VideoStopHeartbeat;
import com.vkontakte.android.auth.configs.VideoConfig;
import com.vkontakte.android.data.BenchmarkTracker;
import com.vkontakte.android.media.AbsVideoPlayer;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.util.ArrayList;
import okhttp3.Call;
import okhttp3.HttpUrl;
import okhttp3.Request;
@TargetApi(16)
/* loaded from: classes3.dex */
public class ExoVideoPlayer extends TextureVideoPlayer implements ExoPlayer.EventListener, VideoRendererEventListener {
    private boolean mBuffering;
    private boolean mCompleted;
    private final DataSource.Factory mDataSourceFactory;
    private ExoPlaybackException mLastException;
    private final Runnable mLiveHeartbeat;
    private final Runnable mLiveStopHeartbeat;
    @Nullable
    private volatile SimpleExoPlayer mPlayer;
    private boolean mPrepared;
    private int mQuality;
    private MediaSource mSource;
    private CustomHttpDataSourceFactory mSourceFactory;
    private Surface mSurface;
    private Format mTrackFormat;
    private final Runnable mUpdateTimingsAction;
    private final AdaptiveVideoSelection.Factory mVideoTrackSelectionFactory;
    private final VigoDelegate mVigo;
    private final MediaSourceEventListener mediaSourceListener;
    private static final String TAG = ExoVideoPlayer.class.getSimpleName();
    private static final Handler mainHandler = new Handler();
    private static final BenchmarkTracker benchmarkTracker = BenchmarkTracker.getInstance();
    private static final DefaultBandwidthMeter sBandwidthMeter = new DefaultBandwidthMeter();
    private static final ExtractorsFactory sExtractorFactory = new DefaultExtractorsFactory();

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            int bufferedPercentage = player.getBufferedPercentage();
            this.handler.onUpdateBuffered(this, bufferedPercentage);
            long duration = player.getDuration();
            boolean schedule = true;
            this.mVigo.onBufferingUpdate(bufferedPercentage, duration, player.getCurrentPosition());
            long currentPosition = player.getCurrentPosition();
            if (currentPosition > duration) {
                currentPosition = duration;
                schedule = false;
            }
            this.handler.onUpdatePlaybackPosition(this, (int) currentPosition);
            this.mVigo.onUpdatePlaybackPosition(duration, currentPosition);
            if (schedule) {
                scheduleUpdateTimings(player);
            }
        }
    }

    public ExoVideoPlayer(Context context, VideoFile file, String referrer) {
        super(context, file, referrer);
        this.mSourceFactory = new CustomHttpDataSourceFactory(sBandwidthMeter);
        this.mDataSourceFactory = new DefaultDataSourceFactory(this.context, sBandwidthMeter, this.mSourceFactory);
        this.mVideoTrackSelectionFactory = new AdaptiveVideoSelection.Factory(this, sBandwidthMeter);
        this.mSurface = null;
        this.mediaSourceListener = new MediaSourceEventListener();
        this.mVigo = new VigoDelegate();
        this.mPrepared = false;
        this.mBuffering = false;
        this.mLastException = null;
        this.mUpdateTimingsAction = ExoVideoPlayer$$Lambda$1.lambdaFactory$(this);
        VideoRenderer.Settings.instance.adaptiveDisable = VideoConfig.getInstance().isDecoderAdaptiveDisable();
        this.mLiveHeartbeat = ExoVideoPlayer$$Lambda$2.lambdaFactory$(this);
        this.mLiveStopHeartbeat = ExoVideoPlayer$$Lambda$3.lambdaFactory$(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1() {
        new VideoLiveHeartbeat(this.mFile.oid, this.mFile.vid).exec();
        postRunnable(this.mLiveHeartbeat, 5000);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2() {
        new VideoStopHeartbeat(this.mFile.oid, this.mFile.vid).exec();
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setPlayerStateListener(AbsVideoPlayer.PlayerStateListener l) {
        super.setPlayerStateListener(l);
        if (this.mLastException != null) {
            dispatchError(this.mLastException);
        } else if (l != null) {
            notifyPreparedIfReady(this.mPlayer);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void createPlayer(int minBufferMs, int maxBufferMs, int bufferForPlaybackMs, int bufferForPlaybackAfterRebufferMs) {
        SimpleExoPlayer player = this.mPlayer;
        if (player == null) {
            player = create(minBufferMs, maxBufferMs, bufferForPlaybackMs, bufferForPlaybackAfterRebufferMs);
            this.mPlayer = player;
        }
        if (!this.mPrepared) {
            player.prepare(this.mSource);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void replay(int position) {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            this.mVigo.play(player.getDuration(), position);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void play(boolean replay) {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            if (this.mCompleted) {
                this.mCompleted = false;
                player.seekTo(0L);
            }
            if (!replay) {
                this.mVigo.play(player.getDuration(), player.getCurrentPosition());
            }
            player.setPlayWhenReady(true);
            scheduleUpdateTimings(player);
            startHeartBeatSending();
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void pause() {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            int state = player.getPlaybackState();
            boolean isPlaying = (state == 3 && player.getPlayWhenReady()) || state == 2;
            this.mVigo.pause(isPlaying, player.getDuration(), player.getCurrentPosition());
            player.setPlayWhenReady(false);
            unscheduleUpdateTimings();
            if (player.getDuration() - player.getCurrentPosition() < 1000) {
                this.mCompleted = true;
                this.handler.onPlaybackCompleted(this);
            }
        }
        stopHeartBeatSending();
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void seek(int offset) {
        boolean isPlaying = false;
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            this.mCompleted = false;
            int state = player.getPlaybackState();
            if ((state == 3 && player.getPlayWhenReady()) || state == 2) {
                isPlaying = true;
            }
            this.mVigo.seek(offset, isPlaying, player.getDuration(), player.getCurrentPosition());
            player.seekTo(offset);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public int getPosition() {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            return (int) player.getCurrentPosition();
        }
        return 0;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public boolean isCompleted() {
        return this.mCompleted;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setVolume(float gain) {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            player.setVolume(gain);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void recallReady() {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            notifyPreparedIfReady(player);
        }
    }

    @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
    public void onLoadingChanged(boolean isLoading) {
    }

    @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
    public void onPlayerStateChanged(boolean playWhenReady, int playbackState) {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            switch (playbackState) {
                case 2:
                    dispatchBufferingStart(player);
                    return;
                case 3:
                    dispatchPreparedOnce(player);
                    dispatchBufferingEnd(player);
                    scheduleUpdateTimings(player);
                    return;
                case 4:
                    dispatchEnd(player);
                    return;
                default:
                    return;
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
        RuntimeException e;
        boolean isVideo = true;
        L.e(TAG, "onPlayerError " + toString(), error + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + error.getMessage());
        this.mLastException = error;
        int errorCode = dispatchError(error);
        this.mVigo.onError(errorCode, 0);
        if (Analytics.isEnabled()) {
            AnalyticsEvent event = null;
            if (error.type == 1) {
                Exception e2 = error.getRendererException();
                SimpleExoPlayer player = this.mPlayer;
                if (e2 != null && player != null) {
                    if (2 != player.getRendererType(error.rendererIndex)) {
                        isVideo = false;
                    }
                    event = new AnalyticsEvent.MediaDecoderErrorEvent(isVideo, e2.getMessage());
                }
            } else if (error.type == 0) {
                IOException e3 = error.getSourceException();
                if (e3 != null) {
                    event = new AnalyticsEvent.MediaPlayerErrorEvent(e3.getMessage());
                }
            } else if (error.type == 2 && (e = error.getUnexpectedException()) != null) {
                event = new AnalyticsEvent.MediaPlayerErrorEvent(e.getMessage());
            }
            Analytics.log(event);
        }
    }

    @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
    public void onPositionDiscontinuity() {
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onVideoEnabled(DecoderCounters counters) {
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onVideoDecoderInitialized(String decoderName, long initializedTimestampMs, long initializationDurationMs) {
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onVideoInputFormatChanged(Format format) {
        AdaptiveVideoSelection s = this.mVideoTrackSelectionFactory.getSelection();
        if (s != null) {
            s.checkVideoFormat(format);
        }
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            this.mVigo.bitrateChange(format.bitrate, player.getDuration(), player.getCurrentPosition());
        }
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onDroppedFrames(int count, long elapsedMs) {
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onVideoSizeChanged(int width, int height, int unappliedRotationDegrees, float pixelWidthHeightRatio) {
        L.i(TAG, "onVideoSizeChanged " + width + "x" + height);
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onRenderedFirstFrame(Surface surface) {
        this.handler.onRenderedFirstFrame(this);
        Analytics.logOnce(new AnalyticsEvent.MediaPlayerSuccessEvent());
    }

    @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
    public void onVideoDisabled(DecoderCounters counters) {
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void setDataSourceAndPrepare(String url, int quality, boolean useVigo, boolean autoplay) {
        this.mPrepared = false;
        this.mQuality = quality;
        this.isAutoplay = autoplay;
        String svcid = VigoDelegate.getSVCid(autoplay);
        SimpleExoPlayer player = this.mPlayer;
        if (player != null && this.mSource != null) {
            this.mVigo.release(player.getDuration(), player.getCurrentPosition());
        }
        this.mediaSourceListener.setUrl(url);
        if (quality == -2) {
            this.mSource = new HlsMediaSource(Uri.parse(url), this.mDataSourceFactory, mainHandler, this.mediaSourceListener);
            this.mVigo.setDataSourceAndPrepare(url, 100, svcid);
        } else {
            this.mSource = new ExtractorMediaSource(Uri.parse(url), this.mDataSourceFactory, sExtractorFactory, mainHandler, this.mediaSourceListener);
            VigoDelegate vigoDelegate = this.mVigo;
            if (!useVigo) {
                quality = -1;
            }
            vigoDelegate.setDataSourceAndPrepare(url, quality, svcid);
        }
        doSetDataSource(this.renderView != null ? this.renderView.getSurfaceTexture() : null);
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public int getQuality() {
        return this.mQuality;
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, com.vkontakte.android.media.AbsVideoPlayer
    public void stopAndRelease() {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            this.mVigo.release(player.getDuration(), player.getCurrentPosition());
            player.stop();
            release(player);
            unscheduleUpdateTimings();
            this.mPrepared = false;
            this.mLastException = null;
        }
        stopHeartBeatSending();
        super.stopAndRelease();
    }

    private void release(SimpleExoPlayer player) {
        player.release();
        player.removeListener(this);
        player.setVideoDebugListener(null);
        this.mPlayer = null;
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture texture, int width, int height) {
        mainHandler.post(ExoVideoPlayer$$Lambda$4.lambdaFactory$(this, texture));
        super.onSurfaceTextureAvailable(texture, width, height);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onSurfaceTextureAvailable$3(SurfaceTexture texture) {
        SimpleExoPlayer player = this.mPlayer;
        L.d("AUTOPLAY", "surfaceTextureReady " + texture + " p=" + player);
        if (this.mSource != null && player == null) {
            doSetDataSource(texture);
        } else {
            updateTexture(player, texture);
        }
    }

    @Override // com.vkontakte.android.media.TextureVideoPlayer, android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture texture) {
        mainHandler.post(ExoVideoPlayer$$Lambda$5.lambdaFactory$(this, texture));
        return super.onSurfaceTextureDestroyed(texture);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onSurfaceTextureDestroyed$4(SurfaceTexture texture) {
        SimpleExoPlayer player = this.mPlayer;
        if (player != null) {
            L.d("AUTOPLAY", "surfaceTextureDestroyed " + texture + " p=" + player);
            releaseSurface();
            player.clearVideoSurface();
        }
    }

    private void startHeartBeatSending() {
        if (this.mFile.isLive()) {
            cancelRunnable(this.mLiveHeartbeat);
            postRunnable(this.mLiveHeartbeat, 0);
        }
    }

    private void stopHeartBeatSending() {
        if (this.mFile.isLive()) {
            cancelRunnable(this.mLiveHeartbeat);
            cancelRunnable(this.mLiveStopHeartbeat);
            postRunnable(this.mLiveStopHeartbeat, 0);
        }
    }

    private void releaseSurface() {
        if (this.mSurface != null) {
            this.mSurface.release();
            this.mSurface = null;
        }
    }

    private void updateTexture(SimpleExoPlayer player, SurfaceTexture texture) {
        releaseSurface();
        this.mSurface = new Surface(texture);
        player.setVideoSurface(this.mSurface);
    }

    private void doSetDataSource(SurfaceTexture texture) {
        this.mVigo.beforeSetDataSource();
        SimpleExoPlayer player = this.mPlayer;
        if (player == null) {
            player = create(15000, 30000, DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_MS, 5000);
            this.mPlayer = player;
        }
        if (texture != null) {
            updateTexture(player, texture);
        }
        if (!player.isLoading()) {
            player.prepare(this.mSource);
        }
        this.mVigo.afterSetDataSource();
    }

    private SimpleExoPlayer create(int minBufferMs, int maxBufferMs, int bufferForPlaybackMs, int bufferForPlaybackAfterRebufferMs) {
        TrackSelector trackSelector = new DefaultTrackSelector(this.mVideoTrackSelectionFactory);
        DefaultAllocator allocator = new DefaultAllocator(true, 65536);
        LoadControl loadControl = new DefaultLoadControl(allocator, minBufferMs, maxBufferMs, bufferForPlaybackMs, bufferForPlaybackAfterRebufferMs);
        SimpleExoPlayer player = new ExoPlayerHolder(this.context, trackSelector, loadControl);
        player.addListener(this);
        player.setVideoDebugListener(this);
        return player;
    }

    private void scheduleUpdateTimings(SimpleExoPlayer player) {
        if (player != null && player.getPlaybackState() == 3 && player.getPlayWhenReady()) {
            mainHandler.removeCallbacks(this.mUpdateTimingsAction);
            mainHandler.postDelayed(this.mUpdateTimingsAction, 500L);
        }
    }

    private void unscheduleUpdateTimings() {
        mainHandler.removeCallbacks(this.mUpdateTimingsAction);
    }

    private void notifyPreparedIfReady(SimpleExoPlayer player) {
        if (player != null && this.mPrepared) {
            Format videoFormat = player.getVideoFormat();
            if (videoFormat != null) {
                if (videoFormat.rotationDegrees == -1 || videoFormat.rotationDegrees == 0 || videoFormat.rotationDegrees == 180) {
                    this.handler.onPlayerReady(this, videoFormat.width, videoFormat.height);
                    return;
                } else if (videoFormat.rotationDegrees == 90 || videoFormat.rotationDegrees == 270) {
                    this.handler.onPlayerReady(this, videoFormat.height, videoFormat.width);
                    return;
                } else {
                    return;
                }
            }
            this.handler.onPlayerReady(this, -1, -1);
        }
    }

    private void dispatchEnd(SimpleExoPlayer player) {
        this.mCompleted = true;
        this.mVigo.onPlaybackComplete(player.getDuration(), player.getCurrentPosition());
        this.handler.onPlaybackCompleted(this);
    }

    private void dispatchPreparedOnce(SimpleExoPlayer player) {
        if (!this.mPrepared) {
            this.mPrepared = true;
            notifyPreparedIfReady(player);
            this.mVigo.vigoOnPrepared(player.getDuration(), player.getCurrentPosition());
        }
    }

    private void dispatchBufferingStart(SimpleExoPlayer player) {
        if (!this.mBuffering) {
            this.mBuffering = true;
            this.handler.onEndOfBuffer(this);
            this.mVigo.onBufferingStart(player.getDuration(), player.getCurrentPosition());
        }
    }

    private void dispatchBufferingEnd(SimpleExoPlayer player) {
        if (this.mBuffering) {
            this.mBuffering = false;
            this.handler.onPlaybackResumed(this);
            this.mVigo.onBufferingEnd(player.getDuration(), player.getCurrentPosition());
        }
    }

    private int dispatchError(ExoPlaybackException error) {
        boolean z = true;
        int errorCode = -1;
        if (error.type == 1) {
            errorCode = 1;
        } else if (error.type == 0 && (error.getSourceException() instanceof HttpDataSource.InvalidResponseCodeException)) {
            errorCode = 2;
        } else if (error.type == 2) {
            errorCode = 8;
            VideoRenderer.Settings settings = VideoRenderer.Settings.instance;
            if (this.mVideoTrackSelectionFactory.checkVideoFormat(this.mTrackFormat)) {
                z = false;
            }
            settings.aboveScreenResolutionDisable = z;
        }
        this.handler.onError(this, errorCode);
        return errorCode;
    }

    private void postRunnable(Runnable runnable, int delayMillis) {
        mainHandler.postDelayed(runnable, delayMillis);
    }

    private void cancelRunnable(Runnable runnable) {
        mainHandler.removeCallbacks(runnable);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ExoPlayerHolder extends SimpleExoPlayer {
        public static final long DEFAULT_ALLOWED_VIDEO_JOINING_TIME_MS = 5000;

        private ExoPlayerHolder(Context context, TrackSelector trackSelector, LoadControl loadControl) {
            super(context, trackSelector, loadControl, null, 0, 5000L);
        }

        @Override // com.google.android.exoplayer2.SimpleExoPlayer
        protected void buildVideoRenderers(Context context, Handler mainHandler, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode, VideoRendererEventListener eventListener, long allowedVideoJoiningTimeMs, ArrayList<Renderer> out) {
            out.add(new VideoRenderer(context, MediaCodecSelector.DEFAULT, allowedVideoJoiningTimeMs, drmSessionManager, false, mainHandler, eventListener, 50));
        }
    }

    /* loaded from: classes3.dex */
    private static class VideoRenderer extends MediaCodecVideoRenderer {

        /* loaded from: classes3.dex */
        public static class Settings {
            static final Settings instance = new Settings();
            boolean aboveScreenResolutionDisable = false;
            boolean adaptiveDisable = false;
        }

        public VideoRenderer(Context context, MediaCodecSelector mediaCodecSelector, long allowedJoiningTimeMs, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, boolean playClearSamplesWithoutKeys, Handler eventHandler, VideoRendererEventListener eventListener, int maxDroppedFramesToNotify) {
            super(context, mediaCodecSelector, allowedJoiningTimeMs, drmSessionManager, playClearSamplesWithoutKeys, eventHandler, eventListener, maxDroppedFramesToNotify);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.exoplayer2.mediacodec.MediaCodecRenderer
        public MediaCodecInfo getDecoderInfo(MediaCodecSelector mediaCodecSelector, Format format, boolean requiresSecureDecoder) throws MediaCodecUtil.DecoderQueryException {
            MediaCodecInfo info = super.getDecoderInfo(mediaCodecSelector, format, requiresSecureDecoder);
            if (Settings.instance.adaptiveDisable) {
                return MediaCodecInfo.newPassthroughInstance(info.name);
            }
            return info;
        }
    }

    /* loaded from: classes3.dex */
    private class MediaSourceEventListener implements AdaptiveMediaSourceEventListener, ExtractorMediaSource.EventListener {
        private String url;

        private MediaSourceEventListener() {
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onLoadStarted(DataSpec dataSpec, int dataType, int trackType, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long mediaStartTimeMs, long mediaEndTimeMs, long elapsedRealtimeMs) {
            ExoVideoPlayer.this.mVigo.setHost(dataSpec.uri);
            if (dataType == 1) {
                ExoVideoPlayer.this.mTrackFormat = trackFormat;
                if (VideoRenderer.Settings.instance.aboveScreenResolutionDisable && !ExoVideoPlayer.this.mVideoTrackSelectionFactory.checkVideoFormat(trackFormat)) {
                    SimpleExoPlayer player = ExoVideoPlayer.this.mPlayer;
                    if (player != null) {
                        player.stop();
                    }
                    ExoVideoPlayer.this.handler.onError(ExoVideoPlayer.this, 1);
                }
            }
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onLoadCompleted(DataSpec dataSpec, int dataType, int trackType, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long mediaStartTimeMs, long mediaEndTimeMs, long elapsedRealtimeMs, long loadDurationMs, long bytesLoaded) {
            ExoVideoPlayer.benchmarkTracker.trackContentDownload(dataSpec.uri.toString(), bytesLoaded, loadDurationMs, 0, null);
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onLoadCanceled(DataSpec dataSpec, int dataType, int trackType, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long mediaStartTimeMs, long mediaEndTimeMs, long elapsedRealtimeMs, long loadDurationMs, long bytesLoaded) {
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onLoadError(DataSpec dataSpec, int dataType, int trackType, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long mediaStartTimeMs, long mediaEndTimeMs, long elapsedRealtimeMs, long loadDurationMs, long bytesLoaded, IOException error, boolean wasCanceled) {
            ExoVideoPlayer.benchmarkTracker.trackContentDownload(dataSpec.uri.toString(), bytesLoaded, loadDurationMs, 0, error);
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onUpstreamDiscarded(int trackType, long mediaStartTimeMs, long mediaEndTimeMs) {
        }

        @Override // com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener
        public void onDownstreamFormatChanged(int trackType, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long mediaTimeMs) {
        }

        @Override // com.google.android.exoplayer2.source.ExtractorMediaSource.EventListener
        public void onLoadError(IOException error) {
            ExoVideoPlayer.benchmarkTracker.trackContentDownload(this.url, 0L, 0L, 0, error);
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class AdaptiveVideoSelection extends AdaptiveVideoTrackSelection {
        private static final int DEFAULT_INDEX = -1;
        private boolean hasIncorrectResolution;
        private boolean isResolutionChecked;
        private int maxResolution;
        private final ExoVideoPlayer player;
        private int selectedIndexAdaptive;

        /* loaded from: classes3.dex */
        public static final class Factory implements TrackSelection.Factory {
            private final DefaultBandwidthMeter bandwidthMeter;
            private final ExoVideoPlayer player;
            private AdaptiveVideoSelection selection;

            public Factory(ExoVideoPlayer player, DefaultBandwidthMeter bandwidthMeter) {
                this.player = player;
                this.bandwidthMeter = bandwidthMeter;
            }

            @Override // com.google.android.exoplayer2.trackselection.TrackSelection.Factory
            /* renamed from: createTrackSelection */
            public TrackSelection mo377createTrackSelection(TrackGroup group, int... tracks) {
                this.selection = new AdaptiveVideoSelection(group, tracks, this.player, this.bandwidthMeter);
                return this.selection;
            }

            public boolean checkVideoFormat(Format format) {
                if (this.selection == null) {
                    Point maxViewportSize = Util.getPhysicalDisplaySize(this.player.context);
                    if (format != null && format.height * format.width > maxViewportSize.x * maxViewportSize.y) {
                        L.d(ExoVideoPlayer.TAG, "incorrect format " + format.toString() + " max " + maxViewportSize.y + "x" + maxViewportSize.x);
                        return false;
                    }
                }
                return true;
            }

            public AdaptiveVideoSelection getSelection() {
                return this.selection;
            }
        }

        public AdaptiveVideoSelection(TrackGroup group, int[] tracks, ExoVideoPlayer player, BandwidthMeter bandwidthMeter) {
            super(group, tracks, bandwidthMeter, AdaptiveVideoTrackSelection.DEFAULT_MAX_INITIAL_BITRATE, 10000L, 25000L, 25000L, 0.75f);
            this.isResolutionChecked = false;
            this.selectedIndexAdaptive = -1;
            this.maxResolution = 0;
            this.hasIncorrectResolution = false;
            this.player = player;
        }

        public void checkVideoFormat(Format format) {
            if (format != null && !this.hasIncorrectResolution && this.maxResolution != 0 && length() != 1) {
                int width = format.width;
                int height = format.height;
                int index = getSelectedIndex();
                Format selected = getFormat(index);
                if (selected.width != width && selected.height != height && !findResolution(width, height)) {
                    this.hasIncorrectResolution = true;
                    blacklist(0, 2147483647L);
                    if (length() > 2) {
                        blacklist(1, 2147483647L);
                    }
                    if (Analytics.isEnabled() && this.player != null) {
                        AnalyticsEvent.MediaVideoStreamEvent event = new AnalyticsEvent.MediaVideoStreamEvent(this.player.mFile.oid, this.player.mFile.vid);
                        Analytics.log(event);
                    }
                }
            }
        }

        @Override // com.google.android.exoplayer2.trackselection.AdaptiveVideoTrackSelection, com.google.android.exoplayer2.trackselection.TrackSelection
        public int getSelectedIndex() {
            return this.selectedIndexAdaptive > -1 ? this.selectedIndexAdaptive : super.getSelectedIndex();
        }

        @Override // com.google.android.exoplayer2.trackselection.AdaptiveVideoTrackSelection, com.google.android.exoplayer2.trackselection.TrackSelection
        public void updateSelectedTrack(long bufferedDurationUs) {
            if (!this.isResolutionChecked) {
                this.isResolutionChecked = true;
                filterFormats();
            }
            super.updateSelectedTrack(bufferedDurationUs);
            filterFormatByOrientation();
        }

        private boolean findResolution(int width, int height) {
            TrackGroup videoFormats = getTrackGroup();
            if (videoFormats != null) {
                for (int i = 0; i < videoFormats.length; i++) {
                    Format f = videoFormats.getFormat(i);
                    if (f.height == height && f.width == width) {
                        return true;
                    }
                }
            }
            return false;
        }

        private void filterFormats() {
            Point maxViewportSize = Util.getPhysicalDisplaySize(this.player.context);
            this.maxResolution = maxViewportSize.x * maxViewportSize.y;
            int length = length();
            int blacklisted = 0;
            for (int i = 0; i < length && this.maxResolution > 0; i++) {
                Format format = getFormat(i);
                int resolution = format.width * format.height;
                boolean disable = resolution > this.maxResolution;
                if (disable) {
                    blacklist(i, 2147483647L);
                    blacklisted++;
                    if (length - blacklisted == 1) {
                        return;
                    }
                }
                Object[] objArr = new Object[2];
                objArr[0] = ExoVideoPlayer.TAG;
                objArr[1] = (disable ? "disable" : "enable") + " format " + format.toString() + " max " + maxViewportSize.x + "x" + maxViewportSize.y;
                L.d(objArr);
            }
        }

        private void filterFormatByOrientation() {
            Point maxViewportSize = Util.getPhysicalDisplaySize(this.player.context);
            int index = -1;
            if (maxViewportSize.x < maxViewportSize.y) {
                int selectedIndex = super.getSelectedIndex();
                Format selected = getFormat(selectedIndex);
                long nowMs = SystemClock.elapsedRealtime();
                int i = 1;
                while (true) {
                    if (i >= length()) {
                        break;
                    }
                    Format format = getFormat(i);
                    if (selected.bitrate <= format.bitrate || format.width >= maxViewportSize.x || isBlacklisted(i, nowMs)) {
                        i++;
                    } else {
                        int newIndex = i - 1;
                        if (newIndex != selectedIndex) {
                            index = newIndex;
                        }
                    }
                }
                this.selectedIndexAdaptive = index;
            }
        }
    }

    /* loaded from: classes3.dex */
    private static class CustomHttpDataSourceFactory implements DataSource.Factory {
        private DataSource.Factory factory;
        private String lastHost;
        private boolean useProxy = Network.getInstance().proxy().isEnable();
        private Call.Factory client = new Call.Factory() { // from class: com.vkontakte.android.media.ExoVideoPlayer.CustomHttpDataSourceFactory.1
            @Override // okhttp3.Call.Factory
            public Call newCall(Request request) {
                if (CustomHttpDataSourceFactory.this.useProxy) {
                    String proxy = Network.getInstance().proxy().host();
                    if (!TextUtils.isEmpty(proxy)) {
                        String host = request.url().host();
                        if (TextUtils.equals(proxy, host)) {
                            HttpUrl newUrl = request.url().newBuilder().host(CustomHttpDataSourceFactory.this.lastHost).build();
                            Request r = request.newBuilder().url(newUrl).build();
                            return Network.getInstance().getClient(Network.ClientType.CLIENT_PLAYER).newCall(r);
                        }
                        CustomHttpDataSourceFactory.this.lastHost = host;
                    }
                }
                return Network.getInstance().getClient(Network.ClientType.CLIENT_PLAYER).newCall(request);
            }
        };

        public CustomHttpDataSourceFactory(TransferListener<? super DataSource> listener) {
            String userAgent = Network.getInstance().getUserAgent().userAgent();
            if (this.useProxy) {
                this.factory = new OkHttpDataSourceFactory(this.client, userAgent, listener);
            } else {
                this.factory = new DefaultHttpDataSourceFactory(userAgent, listener);
            }
        }

        @Override // com.google.android.exoplayer2.upstream.DataSource.Factory
        /* renamed from: createDataSource */
        public DataSource mo949createDataSource() {
            return this.factory.mo949createDataSource();
        }
    }
}
