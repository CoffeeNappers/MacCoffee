package com.vk.core.view;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.AttributeSet;
import android.view.TextureView;
import com.facebook.imagepipeline.common.RotationOptions;
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
import com.google.android.exoplayer2.source.LoopingMediaSource;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.trackselection.AdaptiveVideoTrackSelection;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DefaultAllocator;
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.util.Util;
import com.vk.core.network.Network;
import com.vkontakte.android.Log;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.utils.Utils;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class SimpleVideoView extends TextureView implements TextureView.SurfaceTextureListener {
    private static final int STATE_ERROR = -1;
    private static final int STATE_IDLE = 0;
    private static final int STATE_PLAYBACK_COMPLETED = 3;
    private static final int STATE_PREPARED = 2;
    private static final int STATE_PREPARING = 1;
    private static final String TAG = SimpleVideoView.class.getSimpleName();
    private static final HandlerThread backgroundThread = new HandlerThread(TAG + "Thread", 10);
    private final DefaultBandwidthMeter bandwidthMeter;
    private final Handler bgHandler;
    private int bufferForPlaybackMs;
    private boolean buffering;
    private final ComponentListener componentListener;
    private int currentState;
    private final DataSource.Factory dataSourceFactory;
    private final ExtractorsFactory extractorsFactory;
    private boolean fitVideo;
    private final FocusListener focusListener;
    private final Handler handler;
    private boolean loop;
    private boolean mute;
    private OnBufferingEventsListener onBufferingEventsListener;
    private OnEndListener onEndListener;
    private OnErrorListener onErrorListener;
    private OnFirstFrameRenderedListener onFirstFrameRenderedListener;
    private OnPreparedListener onPreparedListener;
    private boolean playWhenReady;
    private final AtomicReference<SimpleExoPlayer> playerRef;
    private Uri sourceUri;
    private TextureView.SurfaceTextureListener surfaceTextureListener;
    private int unappliedRotationDegrees;
    private final VideoHandler videoHandler;
    private int videoHeight;
    private int videoWidth;

    /* loaded from: classes2.dex */
    public interface OnBufferingEventsListener {
        void onBufferingEnd(SimpleExoPlayer simpleExoPlayer);

        void onBufferingStart(SimpleExoPlayer simpleExoPlayer);
    }

    /* loaded from: classes2.dex */
    public interface OnEndListener {
        void onEnd(SimpleExoPlayer simpleExoPlayer);
    }

    /* loaded from: classes2.dex */
    public interface OnErrorListener {
        void onErrorListener(int i);
    }

    /* loaded from: classes2.dex */
    public interface OnFirstFrameRenderedListener {
        void onFirstFrameRendered(SimpleExoPlayer simpleExoPlayer);
    }

    /* loaded from: classes2.dex */
    public interface OnPreparedListener {
        void onPrepared(SimpleExoPlayer simpleExoPlayer);
    }

    static {
        backgroundThread.start();
    }

    public SimpleVideoView(Context context) {
        super(context);
        this.handler = new Handler(Looper.getMainLooper());
        this.videoHandler = new VideoHandler();
        this.bgHandler = new Handler(backgroundThread.getLooper());
        this.bandwidthMeter = new DefaultBandwidthMeter();
        this.componentListener = new ComponentListener();
        this.dataSourceFactory = new DefaultDataSourceFactory(getContext(), Network.getInstance().getUserAgent().userAgent(), this.bandwidthMeter);
        this.extractorsFactory = new DefaultExtractorsFactory();
        this.playerRef = new AtomicReference<>();
        this.focusListener = new FocusListener();
        this.currentState = 0;
        this.buffering = false;
        this.bufferForPlaybackMs = 500;
        this.loop = false;
        this.mute = false;
        this.fitVideo = true;
        this.playWhenReady = false;
        init();
    }

    public SimpleVideoView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.handler = new Handler(Looper.getMainLooper());
        this.videoHandler = new VideoHandler();
        this.bgHandler = new Handler(backgroundThread.getLooper());
        this.bandwidthMeter = new DefaultBandwidthMeter();
        this.componentListener = new ComponentListener();
        this.dataSourceFactory = new DefaultDataSourceFactory(getContext(), Network.getInstance().getUserAgent().userAgent(), this.bandwidthMeter);
        this.extractorsFactory = new DefaultExtractorsFactory();
        this.playerRef = new AtomicReference<>();
        this.focusListener = new FocusListener();
        this.currentState = 0;
        this.buffering = false;
        this.bufferForPlaybackMs = 500;
        this.loop = false;
        this.mute = false;
        this.fitVideo = true;
        this.playWhenReady = false;
        init();
    }

    public SimpleVideoView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.handler = new Handler(Looper.getMainLooper());
        this.videoHandler = new VideoHandler();
        this.bgHandler = new Handler(backgroundThread.getLooper());
        this.bandwidthMeter = new DefaultBandwidthMeter();
        this.componentListener = new ComponentListener();
        this.dataSourceFactory = new DefaultDataSourceFactory(getContext(), Network.getInstance().getUserAgent().userAgent(), this.bandwidthMeter);
        this.extractorsFactory = new DefaultExtractorsFactory();
        this.playerRef = new AtomicReference<>();
        this.focusListener = new FocusListener();
        this.currentState = 0;
        this.buffering = false;
        this.bufferForPlaybackMs = 500;
        this.loop = false;
        this.mute = false;
        this.fitVideo = true;
        this.playWhenReady = false;
        init();
    }

    private void init() {
        super.setSurfaceTextureListener(this);
    }

    @Override // android.view.TextureView
    public void setSurfaceTextureListener(TextureView.SurfaceTextureListener listener) {
        this.surfaceTextureListener = listener;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i1) {
        if (this.surfaceTextureListener != null) {
            this.surfaceTextureListener.onSurfaceTextureAvailable(surfaceTexture, i, i1);
        }
        if (this.sourceUri != null && getCurrentState() == 0) {
            setVideoUri(this.sourceUri);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i1) {
        if (this.surfaceTextureListener != null) {
            this.surfaceTextureListener.onSurfaceTextureSizeChanged(surfaceTexture, i, i1);
        }
        updateMatrix();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        if (this.surfaceTextureListener != null) {
            this.surfaceTextureListener.onSurfaceTextureDestroyed(surfaceTexture);
        }
        releasePlayer();
        setPlayWhenReady(false);
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        if (this.surfaceTextureListener != null) {
            this.surfaceTextureListener.onSurfaceTextureUpdated(surfaceTexture);
        }
    }

    public synchronized SimpleExoPlayer getPlayer() {
        return this.playerRef.get();
    }

    private synchronized void setPlayer(SimpleExoPlayer simpleExoPlayer) {
        this.playerRef.set(simpleExoPlayer);
    }

    public int getBufferForPlaybackMs() {
        return this.bufferForPlaybackMs;
    }

    public void setBufferForPlaybackMs(int bufferForPlaybackMs) {
        this.bufferForPlaybackMs = bufferForPlaybackMs;
    }

    public boolean isLoop() {
        return this.loop;
    }

    public void setLoop(boolean loop) {
        this.loop = loop;
    }

    public OnPreparedListener getOnPreparedListener() {
        return this.onPreparedListener;
    }

    public void setOnPreparedListener(OnPreparedListener onPreparedListener) {
        this.onPreparedListener = onPreparedListener;
    }

    public OnEndListener getOnEndListener() {
        return this.onEndListener;
    }

    public void setOnEndListener(OnEndListener onEndListener) {
        this.onEndListener = onEndListener;
    }

    public OnBufferingEventsListener getOnBufferingEventsListener() {
        return this.onBufferingEventsListener;
    }

    public void setOnBufferingEventsListener(OnBufferingEventsListener onBufferingEventsListener) {
        this.onBufferingEventsListener = onBufferingEventsListener;
    }

    public OnFirstFrameRenderedListener getOnFirstFrameRenderedListener() {
        return this.onFirstFrameRenderedListener;
    }

    public void setOnFirstFrameRenderedListener(OnFirstFrameRenderedListener onFirstFrameRenderedListener) {
        this.onFirstFrameRenderedListener = onFirstFrameRenderedListener;
    }

    public OnErrorListener getOnErrorListener() {
        return this.onErrorListener;
    }

    public void setOnErrorListener(OnErrorListener onErrorListener) {
        this.onErrorListener = onErrorListener;
    }

    public int getVideoWidth() {
        return this.videoWidth;
    }

    public int getVideoHeight() {
        return this.videoHeight;
    }

    public boolean isMute() {
        return this.mute;
    }

    public void setMute(boolean mute) {
        this.mute = mute;
        SimpleExoPlayer player = getPlayer();
        if (player != null) {
            if (mute) {
                player.setVolume(0.0f);
            } else {
                player.setVolume(1.0f);
            }
        }
    }

    public boolean isFitVideo() {
        return this.fitVideo;
    }

    public void setFitVideo(boolean fitVideo) {
        this.fitVideo = fitVideo;
        updateMatrix();
    }

    public void initPlayer() {
        if (getPlayer() == null) {
            this.bgHandler.post(SimpleVideoView$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$initPlayer$0() {
        if (getPlayer() == null) {
            TrackSelection.Factory videoTrackSelectionFactory = new AdaptiveVideoTrackSelection.Factory(this.bandwidthMeter);
            TrackSelector trackSelector = new DefaultTrackSelector(videoTrackSelectionFactory);
            LoadControl loadControl = new DefaultLoadControl(new DefaultAllocator(true, 65536), this.bufferForPlaybackMs, this.bufferForPlaybackMs * 2, this.bufferForPlaybackMs, this.bufferForPlaybackMs * 2);
            SimpleExoPlayer exoPlayer = ExoPlayerFactory.newSimpleInstance(getContext(), trackSelector, loadControl);
            exoPlayer.setPlayWhenReady(this.playWhenReady);
            exoPlayer.setVideoTextureView(this);
            exoPlayer.setVideoListener(this.componentListener);
            exoPlayer.addListener(this.componentListener);
            if (this.mute) {
                exoPlayer.setVolume(0.0f);
            } else {
                exoPlayer.setVolume(1.0f);
            }
            if (getPlayer() != null) {
                exoPlayer.release();
                return;
            }
            Log.d(TAG, "initPlayer");
            setPlayer(exoPlayer);
        }
    }

    public void releasePlayer() {
        this.bgHandler.post(SimpleVideoView$$Lambda$2.lambdaFactory$(this));
        this.handler.post(SimpleVideoView$$Lambda$3.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$releasePlayer$1() {
        SimpleExoPlayer exoPlayer = getPlayer();
        if (exoPlayer != null) {
            exoPlayer.setTextOutput(null);
            exoPlayer.setVideoListener(null);
            exoPlayer.removeListener(this.componentListener);
            exoPlayer.setVideoSurface(null);
            exoPlayer.release();
            Log.d(TAG, "releasePlayer");
            setCurrentState(0);
            setPlayer(null);
        }
    }

    public void setVideoUri(Uri uri) {
        if (uri != null) {
            this.sourceUri = uri;
            setCurrentState(1);
            initPlayer();
            this.buffering = false;
            this.videoWidth = 0;
            this.videoHeight = 0;
            this.bgHandler.post(SimpleVideoView$$Lambda$4.lambdaFactory$(this, uri));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$setVideoUri$3(Uri uri) {
        MediaSource videoSource = new ExtractorMediaSource(uri, this.dataSourceFactory, this.extractorsFactory, null, null);
        if (this.loop) {
            videoSource = new LoopingMediaSource(videoSource);
        }
        SimpleExoPlayer exoPlayer = getPlayer();
        if (exoPlayer != null) {
            Log.d(TAG, "setVideoUri");
            exoPlayer.prepare(videoSource);
            exoPlayer.setPlayWhenReady(this.playWhenReady);
        }
    }

    public void stop() {
        this.sourceUri = null;
        setCurrentState(0);
        this.buffering = false;
        this.videoWidth = 0;
        this.videoHeight = 0;
        this.bgHandler.post(SimpleVideoView$$Lambda$5.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$stop$4() {
        SimpleExoPlayer exoPlayer = getPlayer();
        if (exoPlayer != null) {
            exoPlayer.stop();
        }
    }

    public void setPlayWhenReady(boolean playWhenReady) {
        this.playWhenReady = playWhenReady;
        SimpleExoPlayer player = getPlayer();
        if (player != null) {
            player.setPlayWhenReady(playWhenReady);
            if (playWhenReady) {
                requestAudioFocus();
            }
        }
    }

    public boolean isPlayWhenReady() {
        return this.playWhenReady;
    }

    public long getCurrentPosition() {
        SimpleExoPlayer player = getPlayer();
        if (player != null) {
            return player.getCurrentPosition();
        }
        return 0L;
    }

    public long getDuration() {
        SimpleExoPlayer player = getPlayer();
        if (player != null) {
            return player.getDuration();
        }
        return 0L;
    }

    public void seekTo(long seekToMs) {
        SimpleExoPlayer player = getPlayer();
        if (player != null) {
            try {
                player.seekTo(seekToMs);
            } catch (Exception e) {
            }
        }
    }

    private void requestAudioFocus() {
        int result = Utils.getAudioManager(getContext()).requestAudioFocus(this.focusListener, 3, 2);
        if (result == 1) {
            this.focusListener.onAudioFocusChange(2);
        } else {
            this.focusListener.onAudioFocusChange(-1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: abandonAudioFocus */
    public void lambda$releasePlayer$2() {
        Utils.getAudioManager(getContext()).abandonAudioFocus(this.focusListener);
    }

    private void fitCenter() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.videoWidth / viewWidth;
            float mScaleY2 = this.videoHeight / viewHeight;
            float mBoundX = viewWidth - (this.videoWidth / mScaleY2);
            float mBoundY = viewHeight - (this.videoHeight / mScaleX2);
            if (mScaleX2 > mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
                mBoundX = 0.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
                mBoundY = 0.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
            mMatrix.postRotate(this.unappliedRotationDegrees, viewWidth / 2, viewHeight / 2);
            if (this.unappliedRotationDegrees % RotationOptions.ROTATE_180 == 90) {
                float viewAspectRatio = viewHeight / viewWidth;
                mMatrix.postScale(1.0f / viewAspectRatio, viewAspectRatio, viewWidth / 2, viewHeight / 2);
            }
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void centerCrop() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.videoWidth / viewWidth;
            float mScaleY2 = this.videoHeight / viewHeight;
            float mBoundX = viewWidth - (this.videoWidth / mScaleY2);
            float mBoundY = viewHeight - (this.videoHeight / mScaleX2);
            if (mScaleX2 < mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
                mBoundX = 0.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
                mBoundY = 0.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
            mMatrix.postRotate(this.unappliedRotationDegrees, viewWidth / 2, viewHeight / 2);
            if (this.unappliedRotationDegrees % RotationOptions.ROTATE_180 == 90) {
                float viewAspectRatio = viewHeight / viewWidth;
                mMatrix.postScale(1.0f / viewAspectRatio, viewAspectRatio, viewWidth / 2, viewHeight / 2);
            }
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMatrix() {
        if (this.fitVideo) {
            fitCenter();
        } else {
            centerCrop();
        }
    }

    public synchronized int getCurrentState() {
        return this.currentState;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void setCurrentState(int state) {
        this.currentState = state;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchEnd(SimpleExoPlayer player) {
        if (3 != getCurrentState()) {
            setCurrentState(3);
            this.videoHandler.dispatchEnd(player);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchPrepared(SimpleExoPlayer player) {
        if (2 != getCurrentState()) {
            setCurrentState(2);
            this.videoHandler.dispatchOnPrepared(player);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchBufferingStart(SimpleExoPlayer player) {
        if (!this.buffering) {
            this.buffering = true;
            this.videoHandler.dispatchBufferingStart(player);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchBufferingEnd(SimpleExoPlayer player) {
        if (this.buffering) {
            this.buffering = false;
            this.videoHandler.dispatchBufferingEnd(player);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchFirstFrameRendered(SimpleExoPlayer player) {
        this.videoHandler.dispatchFirstFrameRendered(player);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchVideoSizeChanged(int videoWidth, int videoHeight, int unappliedRotationDegrees) {
        this.videoHandler.dispatchVideoSizeChanged(videoWidth, videoHeight, unappliedRotationDegrees);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchError(int what) {
        this.videoHandler.dispatchError(what);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class ComponentListener implements SimpleExoPlayer.VideoListener, ExoPlayer.EventListener {
        private ComponentListener() {
        }

        @Override // com.google.android.exoplayer2.SimpleExoPlayer.VideoListener
        public void onVideoSizeChanged(int width, int height, int unappliedRotationDegrees, float pixelWidthHeightRatio) {
            SimpleExoPlayer exoPlayer = SimpleVideoView.this.getPlayer();
            if (exoPlayer != null) {
                SimpleVideoView.this.dispatchVideoSizeChanged(width, height, unappliedRotationDegrees);
            }
        }

        @Override // com.google.android.exoplayer2.SimpleExoPlayer.VideoListener
        public void onRenderedFirstFrame() {
            SimpleExoPlayer exoPlayer = SimpleVideoView.this.getPlayer();
            if (exoPlayer != null) {
                SimpleVideoView.this.dispatchFirstFrameRendered(exoPlayer);
            }
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onLoadingChanged(boolean isLoading) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerStateChanged(boolean playWhenReady, int playbackState) {
            SimpleExoPlayer exoPlayer = SimpleVideoView.this.getPlayer();
            if (exoPlayer != null) {
                switch (playbackState) {
                    case 2:
                        SimpleVideoView.this.dispatchBufferingStart(exoPlayer);
                        return;
                    case 3:
                        SimpleVideoView.this.dispatchPrepared(exoPlayer);
                        SimpleVideoView.this.dispatchBufferingEnd(exoPlayer);
                        return;
                    case 4:
                        SimpleVideoView.this.dispatchEnd(exoPlayer);
                        return;
                    default:
                        return;
                }
            }
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerError(ExoPlaybackException e) {
            Point p = Util.getPhysicalDisplaySize(SimpleVideoView.this.getContext());
            if (p != null && SimpleVideoView.this.videoWidth * SimpleVideoView.this.videoHeight > p.x * p.y) {
                SimpleVideoView.this.stop();
            }
            SimpleVideoView.this.setCurrentState(-1);
            SimpleVideoView.this.dispatchError(-1);
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPositionDiscontinuity() {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTimelineChanged(Timeline timeline, Object manifest) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTracksChanged(TrackGroupArray trackGroups, TrackSelectionArray trackSelections) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class VideoHandler extends Handler {
        private final int MSG_BUFFERING_END;
        private final int MSG_BUFFERING_START;
        private final int MSG_END;
        private final int MSG_FIRST_FRAME_RENDERED;
        private final int MSG_ON_PREPARED;
        private final int MSG_VIDEO_ERROR;
        private final int MSG_VIDEO_SIZE_CHANGED;

        public VideoHandler() {
            super(Looper.getMainLooper());
            this.MSG_ON_PREPARED = 0;
            this.MSG_BUFFERING_START = 1;
            this.MSG_BUFFERING_END = 2;
            this.MSG_END = 3;
            this.MSG_FIRST_FRAME_RENDERED = 4;
            this.MSG_VIDEO_SIZE_CHANGED = 5;
            this.MSG_VIDEO_ERROR = 6;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    if (SimpleVideoView.this.onPreparedListener != null) {
                        SimpleVideoView.this.onPreparedListener.onPrepared((SimpleExoPlayer) msg.obj);
                        return;
                    }
                    return;
                case 1:
                    if (SimpleVideoView.this.onBufferingEventsListener != null) {
                        SimpleVideoView.this.onBufferingEventsListener.onBufferingStart((SimpleExoPlayer) msg.obj);
                        return;
                    }
                    return;
                case 2:
                    if (SimpleVideoView.this.onBufferingEventsListener != null) {
                        SimpleVideoView.this.onBufferingEventsListener.onBufferingEnd((SimpleExoPlayer) msg.obj);
                        return;
                    }
                    return;
                case 3:
                    if (SimpleVideoView.this.onEndListener != null) {
                        SimpleVideoView.this.onEndListener.onEnd((SimpleExoPlayer) msg.obj);
                        return;
                    }
                    return;
                case 4:
                    if (SimpleVideoView.this.onFirstFrameRenderedListener != null) {
                        SimpleVideoView.this.onFirstFrameRenderedListener.onFirstFrameRendered((SimpleExoPlayer) msg.obj);
                        return;
                    }
                    return;
                case 5:
                    if (msg.obj == null) {
                        SimpleVideoView.this.unappliedRotationDegrees = 0;
                    } else {
                        SimpleVideoView.this.unappliedRotationDegrees = ((Integer) msg.obj).intValue();
                    }
                    if (SimpleVideoView.this.unappliedRotationDegrees % RotationOptions.ROTATE_180 == 90) {
                        SimpleVideoView.this.videoWidth = msg.arg2;
                        SimpleVideoView.this.videoHeight = msg.arg1;
                    } else {
                        SimpleVideoView.this.videoWidth = msg.arg1;
                        SimpleVideoView.this.videoHeight = msg.arg2;
                    }
                    SimpleVideoView.this.updateMatrix();
                    return;
                case 6:
                    if (SimpleVideoView.this.onErrorListener != null) {
                        SimpleVideoView.this.onErrorListener.onErrorListener(msg.arg1);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        public void dispatchOnPrepared(SimpleExoPlayer player) {
            sendMessage(Message.obtain(this, 0, player));
        }

        public void dispatchBufferingStart(SimpleExoPlayer player) {
            sendMessage(Message.obtain(this, 1, player));
        }

        public void dispatchBufferingEnd(SimpleExoPlayer player) {
            sendMessage(Message.obtain(this, 2, player));
        }

        public void dispatchEnd(SimpleExoPlayer player) {
            sendMessage(Message.obtain(this, 3, player));
        }

        public void dispatchFirstFrameRendered(SimpleExoPlayer player) {
            sendMessage(Message.obtain(this, 4, player));
        }

        public void dispatchVideoSizeChanged(int w, int h, int unappliedRotationDegrees) {
            sendMessage(Message.obtain(this, 5, w, h, Integer.valueOf(unappliedRotationDegrees)));
        }

        public void dispatchError(int what) {
            sendMessage(Message.obtain(this, 6, what, 0));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private FocusListener() {
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            switch (focusChange) {
                case -2:
                case -1:
                    SimpleExoPlayer player = SimpleVideoView.this.getPlayer();
                    if (player != null) {
                        player.setVolume(0.0f);
                        return;
                    }
                    return;
                case 0:
                default:
                    return;
                case 1:
                case 2:
                    ViewUtils.postDelayed(SimpleVideoView$FocusListener$$Lambda$1.lambdaFactory$(this), 1500L);
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onAudioFocusChange$0() {
            SimpleExoPlayer player = SimpleVideoView.this.getPlayer();
            if (player != null) {
                player.setVolume(SimpleVideoView.this.mute ? 0.0f : 1.0f);
            }
        }
    }
}
