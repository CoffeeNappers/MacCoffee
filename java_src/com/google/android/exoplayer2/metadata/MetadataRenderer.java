package com.google.android.exoplayer2.metadata;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer2.BaseRenderer;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.FormatHolder;
import com.google.android.exoplayer2.util.Assertions;
/* loaded from: classes.dex */
public final class MetadataRenderer extends BaseRenderer implements Handler.Callback {
    private static final int MSG_INVOKE_RENDERER = 0;
    private final MetadataInputBuffer buffer;
    private MetadataDecoder decoder;
    private final MetadataDecoderFactory decoderFactory;
    private final FormatHolder formatHolder;
    private boolean inputStreamEnded;
    private final Output output;
    private final Handler outputHandler;
    private Metadata pendingMetadata;
    private long pendingMetadataTimestamp;

    /* loaded from: classes.dex */
    public interface Output {
        void onMetadata(Metadata metadata);
    }

    public MetadataRenderer(Output output, Looper outputLooper) {
        this(output, outputLooper, MetadataDecoderFactory.DEFAULT);
    }

    public MetadataRenderer(Output output, Looper outputLooper, MetadataDecoderFactory decoderFactory) {
        super(4);
        this.output = (Output) Assertions.checkNotNull(output);
        this.outputHandler = outputLooper == null ? null : new Handler(outputLooper, this);
        this.decoderFactory = (MetadataDecoderFactory) Assertions.checkNotNull(decoderFactory);
        this.formatHolder = new FormatHolder();
        this.buffer = new MetadataInputBuffer();
    }

    @Override // com.google.android.exoplayer2.RendererCapabilities
    public int supportsFormat(Format format) {
        return this.decoderFactory.supportsFormat(format) ? 3 : 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.BaseRenderer
    public void onStreamChanged(Format[] formats) throws ExoPlaybackException {
        this.decoder = this.decoderFactory.createDecoder(formats[0]);
    }

    @Override // com.google.android.exoplayer2.BaseRenderer
    protected void onPositionReset(long positionUs, boolean joining) {
        this.pendingMetadata = null;
        this.inputStreamEnded = false;
    }

    @Override // com.google.android.exoplayer2.Renderer
    public void render(long positionUs, long elapsedRealtimeUs) throws ExoPlaybackException {
        if (!this.inputStreamEnded && this.pendingMetadata == null) {
            this.buffer.clear();
            int result = readSource(this.formatHolder, this.buffer);
            if (result == -4) {
                if (this.buffer.isEndOfStream()) {
                    this.inputStreamEnded = true;
                } else if (!this.buffer.isDecodeOnly()) {
                    this.pendingMetadataTimestamp = this.buffer.timeUs;
                    this.buffer.subsampleOffsetUs = this.formatHolder.format.subsampleOffsetUs;
                    this.buffer.flip();
                    try {
                        this.pendingMetadata = this.decoder.decode(this.buffer);
                    } catch (MetadataDecoderException e) {
                        throw ExoPlaybackException.createForRenderer(e, getIndex());
                    }
                }
            }
        }
        if (this.pendingMetadata != null && this.pendingMetadataTimestamp <= positionUs) {
            invokeRenderer(this.pendingMetadata);
            this.pendingMetadata = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.BaseRenderer
    public void onDisabled() {
        this.pendingMetadata = null;
        this.decoder = null;
        super.onDisabled();
    }

    @Override // com.google.android.exoplayer2.Renderer
    public boolean isEnded() {
        return this.inputStreamEnded;
    }

    @Override // com.google.android.exoplayer2.Renderer
    public boolean isReady() {
        return true;
    }

    private void invokeRenderer(Metadata metadata) {
        if (this.outputHandler != null) {
            this.outputHandler.obtainMessage(0, metadata).sendToTarget();
        } else {
            invokeRendererInternal(metadata);
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                invokeRendererInternal((Metadata) msg.obj);
                return true;
            default:
                return false;
        }
    }

    private void invokeRendererInternal(Metadata metadata) {
        this.output.onMetadata(metadata);
    }
}
