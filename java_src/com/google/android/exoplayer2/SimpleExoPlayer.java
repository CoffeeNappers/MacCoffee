package com.google.android.exoplayer2;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.PlaybackParams;
import android.os.Handler;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.TextureView;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.audio.AudioRendererEventListener;
import com.google.android.exoplayer2.decoder.DecoderCounters;
import com.google.android.exoplayer2.drm.DrmSessionManager;
import com.google.android.exoplayer2.drm.FrameworkMediaCrypto;
import com.google.android.exoplayer2.mediacodec.MediaCodecSelector;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.MetadataRenderer;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.text.Cue;
import com.google.android.exoplayer2.text.TextRenderer;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.video.MediaCodecVideoRenderer;
import com.google.android.exoplayer2.video.VideoRendererEventListener;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
@TargetApi(16)
/* loaded from: classes.dex */
public class SimpleExoPlayer implements ExoPlayer {
    public static final int EXTENSION_RENDERER_MODE_OFF = 0;
    public static final int EXTENSION_RENDERER_MODE_ON = 1;
    public static final int EXTENSION_RENDERER_MODE_PREFER = 2;
    protected static final int MAX_DROPPED_VIDEO_FRAME_COUNT_TO_NOTIFY = 50;
    private static final String TAG = "SimpleExoPlayer";
    private AudioRendererEventListener audioDebugListener;
    private DecoderCounters audioDecoderCounters;
    private Format audioFormat;
    private final int audioRendererCount;
    private int audioSessionId;
    private int audioStreamType;
    private float audioVolume;
    private MetadataRenderer.Output metadataOutput;
    private boolean ownsSurface;
    private PlaybackParamsHolder playbackParamsHolder;
    private final ExoPlayer player;
    private final Renderer[] renderers;
    private Surface surface;
    private SurfaceHolder surfaceHolder;
    private TextRenderer.Output textOutput;
    private TextureView textureView;
    private VideoRendererEventListener videoDebugListener;
    private DecoderCounters videoDecoderCounters;
    private Format videoFormat;
    private VideoListener videoListener;
    private final int videoRendererCount;
    private int videoScalingMode;
    private final Handler mainHandler = new Handler();
    private final ComponentListener componentListener = new ComponentListener();

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface ExtensionRendererMode {
    }

    /* loaded from: classes.dex */
    public interface VideoListener {
        void onRenderedFirstFrame();

        void onVideoSizeChanged(int i, int i2, int i3, float f);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public SimpleExoPlayer(Context context, TrackSelector trackSelector, LoadControl loadControl, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode, long allowedVideoJoiningTimeMs) {
        Renderer[] rendererArr;
        ArrayList<Renderer> renderersList = new ArrayList<>();
        buildRenderers(context, this.mainHandler, drmSessionManager, extensionRendererMode, allowedVideoJoiningTimeMs, renderersList);
        this.renderers = (Renderer[]) renderersList.toArray(new Renderer[renderersList.size()]);
        int videoRendererCount = 0;
        int audioRendererCount = 0;
        for (Renderer renderer : this.renderers) {
            switch (renderer.getTrackType()) {
                case 1:
                    audioRendererCount++;
                    break;
                case 2:
                    videoRendererCount++;
                    break;
            }
        }
        this.videoRendererCount = videoRendererCount;
        this.audioRendererCount = audioRendererCount;
        this.audioVolume = 1.0f;
        this.audioSessionId = 0;
        this.audioStreamType = 3;
        this.videoScalingMode = 1;
        this.player = new ExoPlayerImpl(this.renderers, trackSelector, loadControl);
    }

    public void setVideoScalingMode(int videoScalingMode) {
        int count;
        this.videoScalingMode = videoScalingMode;
        ExoPlayer.ExoPlayerMessage[] messages = new ExoPlayer.ExoPlayerMessage[this.videoRendererCount];
        Renderer[] rendererArr = this.renderers;
        int length = rendererArr.length;
        int i = 0;
        int count2 = 0;
        while (i < length) {
            Renderer renderer = rendererArr[i];
            if (renderer.getTrackType() == 2) {
                count = count2 + 1;
                messages[count2] = new ExoPlayer.ExoPlayerMessage(renderer, 5, Integer.valueOf(videoScalingMode));
            } else {
                count = count2;
            }
            i++;
            count2 = count;
        }
        this.player.sendMessages(messages);
    }

    public int getVideoScalingMode() {
        return this.videoScalingMode;
    }

    public void clearVideoSurface() {
        setVideoSurface(null);
    }

    public void setVideoSurface(Surface surface) {
        removeSurfaceCallbacks();
        setVideoSurfaceInternal(surface, false);
    }

    public void setVideoSurfaceHolder(SurfaceHolder surfaceHolder) {
        removeSurfaceCallbacks();
        this.surfaceHolder = surfaceHolder;
        if (surfaceHolder == null) {
            setVideoSurfaceInternal(null, false);
            return;
        }
        setVideoSurfaceInternal(surfaceHolder.getSurface(), false);
        surfaceHolder.addCallback(this.componentListener);
    }

    public void setVideoSurfaceView(SurfaceView surfaceView) {
        setVideoSurfaceHolder(surfaceView.getHolder());
    }

    public void setVideoTextureView(TextureView textureView) {
        Surface surface = null;
        removeSurfaceCallbacks();
        this.textureView = textureView;
        if (textureView == null) {
            setVideoSurfaceInternal(null, true);
            return;
        }
        if (textureView.getSurfaceTextureListener() != null) {
            Log.w(TAG, "Replacing existing SurfaceTextureListener.");
        }
        SurfaceTexture surfaceTexture = textureView.getSurfaceTexture();
        if (surfaceTexture != null) {
            surface = new Surface(surfaceTexture);
        }
        setVideoSurfaceInternal(surface, true);
        textureView.setSurfaceTextureListener(this.componentListener);
    }

    public void setAudioStreamType(int audioStreamType) {
        int count;
        this.audioStreamType = audioStreamType;
        ExoPlayer.ExoPlayerMessage[] messages = new ExoPlayer.ExoPlayerMessage[this.audioRendererCount];
        Renderer[] rendererArr = this.renderers;
        int length = rendererArr.length;
        int i = 0;
        int count2 = 0;
        while (i < length) {
            Renderer renderer = rendererArr[i];
            if (renderer.getTrackType() == 1) {
                count = count2 + 1;
                messages[count2] = new ExoPlayer.ExoPlayerMessage(renderer, 4, Integer.valueOf(audioStreamType));
            } else {
                count = count2;
            }
            i++;
            count2 = count;
        }
        this.player.sendMessages(messages);
    }

    public int getAudioStreamType() {
        return this.audioStreamType;
    }

    public void setVolume(float audioVolume) {
        int count;
        this.audioVolume = audioVolume;
        ExoPlayer.ExoPlayerMessage[] messages = new ExoPlayer.ExoPlayerMessage[this.audioRendererCount];
        Renderer[] rendererArr = this.renderers;
        int length = rendererArr.length;
        int i = 0;
        int count2 = 0;
        while (i < length) {
            Renderer renderer = rendererArr[i];
            if (renderer.getTrackType() == 1) {
                count = count2 + 1;
                messages[count2] = new ExoPlayer.ExoPlayerMessage(renderer, 2, Float.valueOf(audioVolume));
            } else {
                count = count2;
            }
            i++;
            count2 = count;
        }
        this.player.sendMessages(messages);
    }

    public float getVolume() {
        return this.audioVolume;
    }

    @TargetApi(23)
    public void setPlaybackParams(PlaybackParams params) {
        int count;
        if (params != null) {
            params.allowDefaults();
            this.playbackParamsHolder = new PlaybackParamsHolder(params);
        } else {
            this.playbackParamsHolder = null;
        }
        ExoPlayer.ExoPlayerMessage[] messages = new ExoPlayer.ExoPlayerMessage[this.audioRendererCount];
        Renderer[] rendererArr = this.renderers;
        int length = rendererArr.length;
        int i = 0;
        int count2 = 0;
        while (i < length) {
            Renderer renderer = rendererArr[i];
            if (renderer.getTrackType() == 1) {
                count = count2 + 1;
                messages[count2] = new ExoPlayer.ExoPlayerMessage(renderer, 3, params);
            } else {
                count = count2;
            }
            i++;
            count2 = count;
        }
        this.player.sendMessages(messages);
    }

    @TargetApi(23)
    public PlaybackParams getPlaybackParams() {
        if (this.playbackParamsHolder == null) {
            return null;
        }
        return this.playbackParamsHolder.params;
    }

    public Format getVideoFormat() {
        return this.videoFormat;
    }

    public Format getAudioFormat() {
        return this.audioFormat;
    }

    public int getAudioSessionId() {
        return this.audioSessionId;
    }

    public DecoderCounters getVideoDecoderCounters() {
        return this.videoDecoderCounters;
    }

    public DecoderCounters getAudioDecoderCounters() {
        return this.audioDecoderCounters;
    }

    public void setVideoListener(VideoListener listener) {
        this.videoListener = listener;
    }

    public void setVideoDebugListener(VideoRendererEventListener listener) {
        this.videoDebugListener = listener;
    }

    public void setAudioDebugListener(AudioRendererEventListener listener) {
        this.audioDebugListener = listener;
    }

    public void setTextOutput(TextRenderer.Output output) {
        this.textOutput = output;
    }

    public void setMetadataOutput(MetadataRenderer.Output output) {
        this.metadataOutput = output;
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void addListener(ExoPlayer.EventListener listener) {
        this.player.addListener(listener);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void removeListener(ExoPlayer.EventListener listener) {
        this.player.removeListener(listener);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getPlaybackState() {
        return this.player.getPlaybackState();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void prepare(MediaSource mediaSource) {
        this.player.prepare(mediaSource);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void prepare(MediaSource mediaSource, boolean resetPosition, boolean resetState) {
        this.player.prepare(mediaSource, resetPosition, resetState);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void setPlayWhenReady(boolean playWhenReady) {
        this.player.setPlayWhenReady(playWhenReady);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public boolean getPlayWhenReady() {
        return this.player.getPlayWhenReady();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public boolean isLoading() {
        return this.player.isLoading();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void seekToDefaultPosition() {
        this.player.seekToDefaultPosition();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void seekToDefaultPosition(int windowIndex) {
        this.player.seekToDefaultPosition(windowIndex);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void seekTo(long positionMs) {
        this.player.seekTo(positionMs);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void seekTo(int windowIndex, long positionMs) {
        this.player.seekTo(windowIndex, positionMs);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void stop() {
        this.player.stop();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void release() {
        this.player.release();
        removeSurfaceCallbacks();
        if (this.surface != null) {
            if (this.ownsSurface) {
                this.surface.release();
            }
            this.surface = null;
        }
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void sendMessages(ExoPlayer.ExoPlayerMessage... messages) {
        this.player.sendMessages(messages);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public void blockingSendMessages(ExoPlayer.ExoPlayerMessage... messages) {
        this.player.blockingSendMessages(messages);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getRendererCount() {
        return this.player.getRendererCount();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getRendererType(int index) {
        return this.player.getRendererType(index);
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public TrackGroupArray getCurrentTrackGroups() {
        return this.player.getCurrentTrackGroups();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public TrackSelectionArray getCurrentTrackSelections() {
        return this.player.getCurrentTrackSelections();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public Timeline getCurrentTimeline() {
        return this.player.getCurrentTimeline();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public Object getCurrentManifest() {
        return this.player.getCurrentManifest();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getCurrentPeriodIndex() {
        return this.player.getCurrentPeriodIndex();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getCurrentWindowIndex() {
        return this.player.getCurrentWindowIndex();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public long getDuration() {
        return this.player.getDuration();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public long getCurrentPosition() {
        return this.player.getCurrentPosition();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public long getBufferedPosition() {
        return this.player.getBufferedPosition();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public int getBufferedPercentage() {
        return this.player.getBufferedPercentage();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public boolean isCurrentWindowDynamic() {
        return this.player.isCurrentWindowDynamic();
    }

    @Override // com.google.android.exoplayer2.ExoPlayer
    public boolean isCurrentWindowSeekable() {
        return this.player.isCurrentWindowSeekable();
    }

    private void buildRenderers(Context context, Handler mainHandler, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode, long allowedVideoJoiningTimeMs, ArrayList<Renderer> out) {
        buildVideoRenderers(context, mainHandler, drmSessionManager, extensionRendererMode, this.componentListener, allowedVideoJoiningTimeMs, out);
        buildAudioRenderers(context, mainHandler, drmSessionManager, extensionRendererMode, this.componentListener, out);
        buildTextRenderers(context, mainHandler, extensionRendererMode, this.componentListener, out);
        buildMetadataRenderers(context, mainHandler, extensionRendererMode, this.componentListener, out);
        buildMiscellaneousRenderers(context, mainHandler, extensionRendererMode, out);
    }

    protected void buildVideoRenderers(Context context, Handler mainHandler, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode, VideoRendererEventListener eventListener, long allowedVideoJoiningTimeMs, ArrayList<Renderer> out) {
        out.add(new MediaCodecVideoRenderer(context, MediaCodecSelector.DEFAULT, allowedVideoJoiningTimeMs, drmSessionManager, false, mainHandler, eventListener, 50));
        if (extensionRendererMode != 0) {
            int extensionRendererIndex = out.size();
            int extensionRendererIndex2 = extensionRendererMode == 2 ? extensionRendererIndex - 1 : extensionRendererIndex;
            try {
                Class<?> clazz = Class.forName("com.google.android.exoplayer2.ext.vp9.LibvpxVideoRenderer");
                Constructor<?> constructor = clazz.getConstructor(Boolean.TYPE, Long.TYPE, Handler.class, VideoRendererEventListener.class, Integer.TYPE);
                Renderer renderer = (Renderer) constructor.newInstance(true, Long.valueOf(allowedVideoJoiningTimeMs), mainHandler, this.componentListener, 50);
                int i = extensionRendererIndex2 + 1;
                try {
                    out.add(extensionRendererIndex2, renderer);
                    Log.i(TAG, "Loaded LibvpxVideoRenderer.");
                } catch (ClassNotFoundException e) {
                } catch (Exception e2) {
                    e = e2;
                    throw new RuntimeException(e);
                }
            } catch (ClassNotFoundException e3) {
            } catch (Exception e4) {
                e = e4;
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(14:5|(1:7)(1:60)|(3:8|9|10)|(3:11|12|13)|14|15|16|17|18|19|20|21|22|(3:23|24|26)) */
    /* JADX WARN: Can't wrap try/catch for region: R(16:5|(1:7)(1:60)|8|9|10|(3:11|12|13)|14|15|16|17|18|19|20|21|22|(3:23|24|26)) */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00e5, code lost:
        r11 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00e6, code lost:
        r12 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00e8, code lost:
        r10 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00ef, code lost:
        throw new java.lang.RuntimeException(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00fe, code lost:
        r10 = e;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void buildAudioRenderers(android.content.Context r15, android.os.Handler r16, com.google.android.exoplayer2.drm.DrmSessionManager<com.google.android.exoplayer2.drm.FrameworkMediaCrypto> r17, int r18, com.google.android.exoplayer2.audio.AudioRendererEventListener r19, java.util.ArrayList<com.google.android.exoplayer2.Renderer> r20) {
        /*
            Method dump skipped, instructions count: 265
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.exoplayer2.SimpleExoPlayer.buildAudioRenderers(android.content.Context, android.os.Handler, com.google.android.exoplayer2.drm.DrmSessionManager, int, com.google.android.exoplayer2.audio.AudioRendererEventListener, java.util.ArrayList):void");
    }

    protected void buildTextRenderers(Context context, Handler mainHandler, int extensionRendererMode, TextRenderer.Output output, ArrayList<Renderer> out) {
        out.add(new TextRenderer(output, mainHandler.getLooper()));
    }

    protected void buildMetadataRenderers(Context context, Handler mainHandler, int extensionRendererMode, MetadataRenderer.Output output, ArrayList<Renderer> out) {
        out.add(new MetadataRenderer(output, mainHandler.getLooper()));
    }

    protected void buildMiscellaneousRenderers(Context context, Handler mainHandler, int extensionRendererMode, ArrayList<Renderer> out) {
    }

    private void removeSurfaceCallbacks() {
        if (this.textureView != null) {
            if (this.textureView.getSurfaceTextureListener() != this.componentListener) {
                Log.w(TAG, "SurfaceTextureListener already unset or replaced.");
            } else {
                this.textureView.setSurfaceTextureListener(null);
            }
            this.textureView = null;
        }
        if (this.surfaceHolder != null) {
            this.surfaceHolder.removeCallback(this.componentListener);
            this.surfaceHolder = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVideoSurfaceInternal(Surface surface, boolean ownsSurface) {
        int count;
        ExoPlayer.ExoPlayerMessage[] messages = new ExoPlayer.ExoPlayerMessage[this.videoRendererCount];
        Renderer[] rendererArr = this.renderers;
        int length = rendererArr.length;
        int i = 0;
        int count2 = 0;
        while (i < length) {
            Renderer renderer = rendererArr[i];
            if (renderer.getTrackType() == 2) {
                count = count2 + 1;
                messages[count2] = new ExoPlayer.ExoPlayerMessage(renderer, 1, surface);
            } else {
                count = count2;
            }
            i++;
            count2 = count;
        }
        if (this.surface != null && this.surface != surface) {
            if (this.ownsSurface) {
                this.surface.release();
            }
            this.player.blockingSendMessages(messages);
        } else {
            this.player.sendMessages(messages);
        }
        this.surface = surface;
        this.ownsSurface = ownsSurface;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public final class ComponentListener implements VideoRendererEventListener, AudioRendererEventListener, TextRenderer.Output, MetadataRenderer.Output, SurfaceHolder.Callback, TextureView.SurfaceTextureListener {
        private ComponentListener() {
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onVideoEnabled(DecoderCounters counters) {
            SimpleExoPlayer.this.videoDecoderCounters = counters;
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onVideoEnabled(counters);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onVideoDecoderInitialized(String decoderName, long initializedTimestampMs, long initializationDurationMs) {
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onVideoDecoderInitialized(decoderName, initializedTimestampMs, initializationDurationMs);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onVideoInputFormatChanged(Format format) {
            SimpleExoPlayer.this.videoFormat = format;
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onVideoInputFormatChanged(format);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onDroppedFrames(int count, long elapsed) {
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onDroppedFrames(count, elapsed);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onVideoSizeChanged(int width, int height, int unappliedRotationDegrees, float pixelWidthHeightRatio) {
            if (SimpleExoPlayer.this.videoListener != null) {
                SimpleExoPlayer.this.videoListener.onVideoSizeChanged(width, height, unappliedRotationDegrees, pixelWidthHeightRatio);
            }
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onVideoSizeChanged(width, height, unappliedRotationDegrees, pixelWidthHeightRatio);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onRenderedFirstFrame(Surface surface) {
            if (SimpleExoPlayer.this.videoListener != null && SimpleExoPlayer.this.surface == surface) {
                SimpleExoPlayer.this.videoListener.onRenderedFirstFrame();
            }
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onRenderedFirstFrame(surface);
            }
        }

        @Override // com.google.android.exoplayer2.video.VideoRendererEventListener
        public void onVideoDisabled(DecoderCounters counters) {
            if (SimpleExoPlayer.this.videoDebugListener != null) {
                SimpleExoPlayer.this.videoDebugListener.onVideoDisabled(counters);
            }
            SimpleExoPlayer.this.videoFormat = null;
            SimpleExoPlayer.this.videoDecoderCounters = null;
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioEnabled(DecoderCounters counters) {
            SimpleExoPlayer.this.audioDecoderCounters = counters;
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioEnabled(counters);
            }
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioSessionId(int sessionId) {
            SimpleExoPlayer.this.audioSessionId = sessionId;
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioSessionId(sessionId);
            }
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioDecoderInitialized(String decoderName, long initializedTimestampMs, long initializationDurationMs) {
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioDecoderInitialized(decoderName, initializedTimestampMs, initializationDurationMs);
            }
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioInputFormatChanged(Format format) {
            SimpleExoPlayer.this.audioFormat = format;
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioInputFormatChanged(format);
            }
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioTrackUnderrun(int bufferSize, long bufferSizeMs, long elapsedSinceLastFeedMs) {
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioTrackUnderrun(bufferSize, bufferSizeMs, elapsedSinceLastFeedMs);
            }
        }

        @Override // com.google.android.exoplayer2.audio.AudioRendererEventListener
        public void onAudioDisabled(DecoderCounters counters) {
            if (SimpleExoPlayer.this.audioDebugListener != null) {
                SimpleExoPlayer.this.audioDebugListener.onAudioDisabled(counters);
            }
            SimpleExoPlayer.this.audioFormat = null;
            SimpleExoPlayer.this.audioDecoderCounters = null;
            SimpleExoPlayer.this.audioSessionId = 0;
        }

        @Override // com.google.android.exoplayer2.text.TextRenderer.Output
        public void onCues(List<Cue> cues) {
            if (SimpleExoPlayer.this.textOutput != null) {
                SimpleExoPlayer.this.textOutput.onCues(cues);
            }
        }

        @Override // com.google.android.exoplayer2.metadata.MetadataRenderer.Output
        public void onMetadata(Metadata metadata) {
            if (SimpleExoPlayer.this.metadataOutput != null) {
                SimpleExoPlayer.this.metadataOutput.onMetadata(metadata);
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceCreated(SurfaceHolder holder) {
            SimpleExoPlayer.this.setVideoSurfaceInternal(holder.getSurface(), false);
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceDestroyed(SurfaceHolder holder) {
            SimpleExoPlayer.this.setVideoSurfaceInternal(null, false);
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int width, int height) {
            SimpleExoPlayer.this.setVideoSurfaceInternal(new Surface(surfaceTexture), true);
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int width, int height) {
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
            SimpleExoPlayer.this.setVideoSurfaceInternal(null, true);
            return true;
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        }
    }

    @TargetApi(23)
    /* loaded from: classes.dex */
    private static final class PlaybackParamsHolder {
        public final PlaybackParams params;

        public PlaybackParamsHolder(PlaybackParams params) {
            this.params = params;
        }
    }
}
