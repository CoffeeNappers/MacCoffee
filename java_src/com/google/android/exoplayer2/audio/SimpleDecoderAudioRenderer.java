package com.google.android.exoplayer2.audio;

import android.media.PlaybackParams;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.google.android.exoplayer2.BaseRenderer;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.FormatHolder;
import com.google.android.exoplayer2.audio.AudioRendererEventListener;
import com.google.android.exoplayer2.audio.AudioTrack;
import com.google.android.exoplayer2.decoder.DecoderCounters;
import com.google.android.exoplayer2.decoder.DecoderInputBuffer;
import com.google.android.exoplayer2.decoder.SimpleDecoder;
import com.google.android.exoplayer2.decoder.SimpleOutputBuffer;
import com.google.android.exoplayer2.drm.DrmSession;
import com.google.android.exoplayer2.drm.DrmSessionManager;
import com.google.android.exoplayer2.drm.ExoMediaCrypto;
import com.google.android.exoplayer2.util.MediaClock;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.exoplayer2.util.TraceUtil;
import com.google.android.exoplayer2.util.Util;
/* loaded from: classes.dex */
public abstract class SimpleDecoderAudioRenderer extends BaseRenderer implements MediaClock {
    private static final int REINITIALIZATION_STATE_NONE = 0;
    private static final int REINITIALIZATION_STATE_SIGNAL_END_OF_STREAM = 1;
    private static final int REINITIALIZATION_STATE_WAIT_END_OF_STREAM = 2;
    private boolean allowPositionDiscontinuity;
    private final AudioTrack audioTrack;
    private boolean audioTrackNeedsConfigure;
    private long currentPositionUs;
    private SimpleDecoder<DecoderInputBuffer, ? extends SimpleOutputBuffer, ? extends AudioDecoderException> decoder;
    private DecoderCounters decoderCounters;
    private boolean decoderReceivedBuffers;
    private int decoderReinitializationState;
    private DrmSession<ExoMediaCrypto> drmSession;
    private final DrmSessionManager<ExoMediaCrypto> drmSessionManager;
    private final AudioRendererEventListener.EventDispatcher eventDispatcher;
    private final FormatHolder formatHolder;
    private DecoderInputBuffer inputBuffer;
    private Format inputFormat;
    private boolean inputStreamEnded;
    private SimpleOutputBuffer outputBuffer;
    private boolean outputStreamEnded;
    private DrmSession<ExoMediaCrypto> pendingDrmSession;
    private final boolean playClearSamplesWithoutKeys;
    private boolean waitingForKeys;

    protected abstract SimpleDecoder<DecoderInputBuffer, ? extends SimpleOutputBuffer, ? extends AudioDecoderException> createDecoder(Format format, ExoMediaCrypto exoMediaCrypto) throws AudioDecoderException;

    protected abstract int supportsFormatInternal(Format format);

    public SimpleDecoderAudioRenderer() {
        this(null, null);
    }

    public SimpleDecoderAudioRenderer(Handler eventHandler, AudioRendererEventListener eventListener) {
        this(eventHandler, eventListener, null);
    }

    public SimpleDecoderAudioRenderer(Handler eventHandler, AudioRendererEventListener eventListener, AudioCapabilities audioCapabilities) {
        this(eventHandler, eventListener, audioCapabilities, null, false);
    }

    public SimpleDecoderAudioRenderer(Handler eventHandler, AudioRendererEventListener eventListener, AudioCapabilities audioCapabilities, DrmSessionManager<ExoMediaCrypto> drmSessionManager, boolean playClearSamplesWithoutKeys) {
        super(1);
        this.eventDispatcher = new AudioRendererEventListener.EventDispatcher(eventHandler, eventListener);
        this.audioTrack = new AudioTrack(audioCapabilities, new AudioTrackListener());
        this.drmSessionManager = drmSessionManager;
        this.formatHolder = new FormatHolder();
        this.playClearSamplesWithoutKeys = playClearSamplesWithoutKeys;
        this.decoderReinitializationState = 0;
        this.audioTrackNeedsConfigure = true;
    }

    @Override // com.google.android.exoplayer2.BaseRenderer, com.google.android.exoplayer2.Renderer
    public MediaClock getMediaClock() {
        return this;
    }

    @Override // com.google.android.exoplayer2.RendererCapabilities
    public final int supportsFormat(Format format) {
        int formatSupport = supportsFormatInternal(format);
        if (formatSupport != 0 && formatSupport != 1) {
            int tunnelingSupport = Util.SDK_INT >= 21 ? 16 : 0;
            return formatSupport | tunnelingSupport | 4;
        }
        return formatSupport;
    }

    @Override // com.google.android.exoplayer2.Renderer
    public void render(long positionUs, long elapsedRealtimeUs) throws ExoPlaybackException {
        if (!this.outputStreamEnded) {
            if (this.inputFormat != null || readFormat()) {
                maybeInitDecoder();
                if (this.decoder != null) {
                    try {
                        TraceUtil.beginSection("drainAndFeed");
                        do {
                        } while (drainOutputBuffer());
                        do {
                        } while (feedInputBuffer());
                        TraceUtil.endSection();
                        this.decoderCounters.ensureUpdated();
                    } catch (AudioDecoderException | AudioTrack.InitializationException | AudioTrack.WriteException e) {
                        throw ExoPlaybackException.createForRenderer(e, getIndex());
                    }
                }
            }
        }
    }

    protected void onAudioSessionId(int audioSessionId) {
    }

    protected void onAudioTrackPositionDiscontinuity() {
    }

    protected void onAudioTrackUnderrun(int bufferSize, long bufferSizeMs, long elapsedSinceLastFeedMs) {
    }

    protected Format getOutputFormat() {
        return Format.createAudioSampleFormat(null, MimeTypes.AUDIO_RAW, null, -1, -1, this.inputFormat.channelCount, this.inputFormat.sampleRate, 2, null, null, 0, null);
    }

    private boolean drainOutputBuffer() throws ExoPlaybackException, AudioDecoderException, AudioTrack.InitializationException, AudioTrack.WriteException {
        if (this.outputBuffer == null) {
            this.outputBuffer = this.decoder.mo370dequeueOutputBuffer();
            if (this.outputBuffer == null) {
                return false;
            }
            this.decoderCounters.skippedOutputBufferCount += this.outputBuffer.skippedOutputBufferCount;
        }
        if (this.outputBuffer.isEndOfStream()) {
            if (this.decoderReinitializationState == 2) {
                releaseDecoder();
                maybeInitDecoder();
                this.audioTrackNeedsConfigure = true;
                return false;
            }
            this.outputBuffer.release();
            this.outputBuffer = null;
            this.outputStreamEnded = true;
            this.audioTrack.handleEndOfStream();
            return false;
        }
        if (this.audioTrackNeedsConfigure) {
            Format outputFormat = getOutputFormat();
            this.audioTrack.configure(outputFormat.sampleMimeType, outputFormat.channelCount, outputFormat.sampleRate, outputFormat.pcmEncoding, 0);
            this.audioTrackNeedsConfigure = false;
        }
        if (!this.audioTrack.handleBuffer(this.outputBuffer.data, this.outputBuffer.timeUs)) {
            return false;
        }
        this.decoderCounters.renderedOutputBufferCount++;
        this.outputBuffer.release();
        this.outputBuffer = null;
        return true;
    }

    private boolean feedInputBuffer() throws AudioDecoderException, ExoPlaybackException {
        int result;
        if (this.decoder == null || this.decoderReinitializationState == 2 || this.inputStreamEnded) {
            return false;
        }
        if (this.inputBuffer == null) {
            this.inputBuffer = this.decoder.mo369dequeueInputBuffer();
            if (this.inputBuffer == null) {
                return false;
            }
        }
        if (this.decoderReinitializationState == 1) {
            this.inputBuffer.setFlags(4);
            this.decoder.queueInputBuffer((SimpleDecoder<DecoderInputBuffer, ? extends SimpleOutputBuffer, ? extends AudioDecoderException>) this.inputBuffer);
            this.inputBuffer = null;
            this.decoderReinitializationState = 2;
            return false;
        }
        if (this.waitingForKeys) {
            result = -4;
        } else {
            result = readSource(this.formatHolder, this.inputBuffer);
        }
        if (result == -3) {
            return false;
        }
        if (result == -5) {
            onInputFormatChanged(this.formatHolder.format);
            return true;
        } else if (this.inputBuffer.isEndOfStream()) {
            this.inputStreamEnded = true;
            this.decoder.queueInputBuffer((SimpleDecoder<DecoderInputBuffer, ? extends SimpleOutputBuffer, ? extends AudioDecoderException>) this.inputBuffer);
            this.inputBuffer = null;
            return false;
        } else {
            boolean bufferEncrypted = this.inputBuffer.isEncrypted();
            this.waitingForKeys = shouldWaitForKeys(bufferEncrypted);
            if (this.waitingForKeys) {
                return false;
            }
            this.inputBuffer.flip();
            this.decoder.queueInputBuffer((SimpleDecoder<DecoderInputBuffer, ? extends SimpleOutputBuffer, ? extends AudioDecoderException>) this.inputBuffer);
            this.decoderReceivedBuffers = true;
            this.decoderCounters.inputBufferCount++;
            this.inputBuffer = null;
            return true;
        }
    }

    private boolean shouldWaitForKeys(boolean bufferEncrypted) throws ExoPlaybackException {
        if (this.drmSession == null) {
            return false;
        }
        int drmSessionState = this.drmSession.getState();
        if (drmSessionState == 0) {
            throw ExoPlaybackException.createForRenderer(this.drmSession.getError(), getIndex());
        }
        if (drmSessionState == 4) {
            return false;
        }
        return bufferEncrypted || !this.playClearSamplesWithoutKeys;
    }

    private void flushDecoder() throws ExoPlaybackException {
        this.waitingForKeys = false;
        if (this.decoderReinitializationState != 0) {
            releaseDecoder();
            maybeInitDecoder();
            return;
        }
        this.inputBuffer = null;
        if (this.outputBuffer != null) {
            this.outputBuffer.release();
            this.outputBuffer = null;
        }
        this.decoder.flush();
        this.decoderReceivedBuffers = false;
    }

    @Override // com.google.android.exoplayer2.Renderer
    public boolean isEnded() {
        return this.outputStreamEnded && !this.audioTrack.hasPendingData();
    }

    @Override // com.google.android.exoplayer2.Renderer
    public boolean isReady() {
        return this.audioTrack.hasPendingData() || (this.inputFormat != null && !this.waitingForKeys && (isSourceReady() || this.outputBuffer != null));
    }

    @Override // com.google.android.exoplayer2.util.MediaClock
    public long getPositionUs() {
        long newCurrentPositionUs = this.audioTrack.getCurrentPositionUs(isEnded());
        if (newCurrentPositionUs != Long.MIN_VALUE) {
            if (!this.allowPositionDiscontinuity) {
                newCurrentPositionUs = Math.max(this.currentPositionUs, newCurrentPositionUs);
            }
            this.currentPositionUs = newCurrentPositionUs;
            this.allowPositionDiscontinuity = false;
        }
        return this.currentPositionUs;
    }

    @Override // com.google.android.exoplayer2.BaseRenderer
    protected void onEnabled(boolean joining) throws ExoPlaybackException {
        this.decoderCounters = new DecoderCounters();
        this.eventDispatcher.enabled(this.decoderCounters);
        int tunnelingAudioSessionId = getConfiguration().tunnelingAudioSessionId;
        if (tunnelingAudioSessionId != 0) {
            this.audioTrack.enableTunnelingV21(tunnelingAudioSessionId);
        } else {
            this.audioTrack.disableTunneling();
        }
    }

    @Override // com.google.android.exoplayer2.BaseRenderer
    protected void onPositionReset(long positionUs, boolean joining) throws ExoPlaybackException {
        this.audioTrack.reset();
        this.currentPositionUs = positionUs;
        this.allowPositionDiscontinuity = true;
        this.inputStreamEnded = false;
        this.outputStreamEnded = false;
        if (this.decoder != null) {
            flushDecoder();
        }
    }

    @Override // com.google.android.exoplayer2.BaseRenderer
    protected void onStarted() {
        this.audioTrack.play();
    }

    @Override // com.google.android.exoplayer2.BaseRenderer
    protected void onStopped() {
        this.audioTrack.pause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.BaseRenderer
    public void onDisabled() {
        this.inputFormat = null;
        this.audioTrackNeedsConfigure = true;
        this.waitingForKeys = false;
        try {
            releaseDecoder();
            this.audioTrack.release();
            try {
                if (this.drmSession != null) {
                    this.drmSessionManager.releaseSession(this.drmSession);
                }
                try {
                    if (this.pendingDrmSession != null && this.pendingDrmSession != this.drmSession) {
                        this.drmSessionManager.releaseSession(this.pendingDrmSession);
                    }
                } finally {
                }
            } catch (Throwable th) {
                try {
                    if (this.pendingDrmSession != null && this.pendingDrmSession != this.drmSession) {
                        this.drmSessionManager.releaseSession(this.pendingDrmSession);
                    }
                    throw th;
                } finally {
                }
            }
        } catch (Throwable th2) {
            try {
                if (this.drmSession != null) {
                    this.drmSessionManager.releaseSession(this.drmSession);
                }
                try {
                    if (this.pendingDrmSession != null && this.pendingDrmSession != this.drmSession) {
                        this.drmSessionManager.releaseSession(this.pendingDrmSession);
                    }
                    throw th2;
                } finally {
                }
            } catch (Throwable th3) {
                try {
                    if (this.pendingDrmSession != null && this.pendingDrmSession != this.drmSession) {
                        this.drmSessionManager.releaseSession(this.pendingDrmSession);
                    }
                    throw th3;
                } finally {
                }
            }
        }
    }

    private void maybeInitDecoder() throws ExoPlaybackException {
        if (this.decoder == null) {
            this.drmSession = this.pendingDrmSession;
            ExoMediaCrypto mediaCrypto = null;
            if (this.drmSession != null) {
                int drmSessionState = this.drmSession.getState();
                if (drmSessionState == 0) {
                    throw ExoPlaybackException.createForRenderer(this.drmSession.getError(), getIndex());
                }
                if (drmSessionState == 3 || drmSessionState == 4) {
                    mediaCrypto = this.drmSession.getMediaCrypto();
                } else {
                    return;
                }
            }
            try {
                long codecInitializingTimestamp = SystemClock.elapsedRealtime();
                TraceUtil.beginSection("createAudioDecoder");
                this.decoder = createDecoder(this.inputFormat, mediaCrypto);
                TraceUtil.endSection();
                long codecInitializedTimestamp = SystemClock.elapsedRealtime();
                this.eventDispatcher.decoderInitialized(this.decoder.getName(), codecInitializedTimestamp, codecInitializedTimestamp - codecInitializingTimestamp);
                this.decoderCounters.decoderInitCount++;
            } catch (AudioDecoderException e) {
                throw ExoPlaybackException.createForRenderer(e, getIndex());
            }
        }
    }

    private void releaseDecoder() {
        if (this.decoder != null) {
            this.inputBuffer = null;
            this.outputBuffer = null;
            this.decoder.release();
            this.decoder = null;
            this.decoderCounters.decoderReleaseCount++;
            this.decoderReinitializationState = 0;
            this.decoderReceivedBuffers = false;
        }
    }

    private boolean readFormat() throws ExoPlaybackException {
        int result = readSource(this.formatHolder, null);
        if (result == -5) {
            onInputFormatChanged(this.formatHolder.format);
            return true;
        }
        return false;
    }

    private void onInputFormatChanged(Format newFormat) throws ExoPlaybackException {
        Format oldFormat = this.inputFormat;
        this.inputFormat = newFormat;
        boolean drmInitDataChanged = !Util.areEqual(this.inputFormat.drmInitData, oldFormat == null ? null : oldFormat.drmInitData);
        if (drmInitDataChanged) {
            if (this.inputFormat.drmInitData != null) {
                if (this.drmSessionManager == null) {
                    throw ExoPlaybackException.createForRenderer(new IllegalStateException("Media requires a DrmSessionManager"), getIndex());
                }
                this.pendingDrmSession = this.drmSessionManager.acquireSession(Looper.myLooper(), this.inputFormat.drmInitData);
                if (this.pendingDrmSession == this.drmSession) {
                    this.drmSessionManager.releaseSession(this.pendingDrmSession);
                }
            } else {
                this.pendingDrmSession = null;
            }
        }
        if (this.decoderReceivedBuffers) {
            this.decoderReinitializationState = 1;
        } else {
            releaseDecoder();
            maybeInitDecoder();
            this.audioTrackNeedsConfigure = true;
        }
        this.eventDispatcher.inputFormatChanged(newFormat);
    }

    @Override // com.google.android.exoplayer2.BaseRenderer, com.google.android.exoplayer2.ExoPlayer.ExoPlayerComponent
    public void handleMessage(int messageType, Object message) throws ExoPlaybackException {
        switch (messageType) {
            case 2:
                this.audioTrack.setVolume(((Float) message).floatValue());
                return;
            case 3:
                this.audioTrack.setPlaybackParams((PlaybackParams) message);
                return;
            case 4:
                int streamType = ((Integer) message).intValue();
                this.audioTrack.setStreamType(streamType);
                return;
            default:
                super.handleMessage(messageType, message);
                return;
        }
    }

    /* loaded from: classes.dex */
    private final class AudioTrackListener implements AudioTrack.Listener {
        private AudioTrackListener() {
        }

        @Override // com.google.android.exoplayer2.audio.AudioTrack.Listener
        public void onAudioSessionId(int audioSessionId) {
            SimpleDecoderAudioRenderer.this.eventDispatcher.audioSessionId(audioSessionId);
            SimpleDecoderAudioRenderer.this.onAudioSessionId(audioSessionId);
        }

        @Override // com.google.android.exoplayer2.audio.AudioTrack.Listener
        public void onPositionDiscontinuity() {
            SimpleDecoderAudioRenderer.this.onAudioTrackPositionDiscontinuity();
            SimpleDecoderAudioRenderer.this.allowPositionDiscontinuity = true;
        }

        @Override // com.google.android.exoplayer2.audio.AudioTrack.Listener
        public void onUnderrun(int bufferSize, long bufferSizeMs, long elapsedSinceLastFeedMs) {
            SimpleDecoderAudioRenderer.this.eventDispatcher.audioTrackUnderrun(bufferSize, bufferSizeMs, elapsedSinceLastFeedMs);
            SimpleDecoderAudioRenderer.this.onAudioTrackUnderrun(bufferSize, bufferSizeMs, elapsedSinceLastFeedMs);
        }
    }
}
