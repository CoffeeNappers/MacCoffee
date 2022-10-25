package com.google.android.exoplayer2.source.chunk;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.extractor.Extractor;
import com.google.android.exoplayer2.extractor.ExtractorInput;
import com.google.android.exoplayer2.extractor.ExtractorOutput;
import com.google.android.exoplayer2.extractor.SeekMap;
import com.google.android.exoplayer2.extractor.TrackOutput;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.ParsableByteArray;
import java.io.IOException;
/* loaded from: classes.dex */
public final class ChunkExtractorWrapper implements ExtractorOutput, TrackOutput {
    public final Extractor extractor;
    private boolean extractorInitialized;
    private final Format manifestFormat;
    private final boolean preferManifestDrmInitData;
    private final boolean resendFormatOnInit;
    private SeekMapOutput seekMapOutput;
    private boolean seenTrack;
    private int seenTrackId;
    private Format sentFormat;
    private TrackOutput trackOutput;

    /* loaded from: classes.dex */
    public interface SeekMapOutput {
        void seekMap(SeekMap seekMap);
    }

    public ChunkExtractorWrapper(Extractor extractor, Format manifestFormat, boolean preferManifestDrmInitData, boolean resendFormatOnInit) {
        this.extractor = extractor;
        this.manifestFormat = manifestFormat;
        this.preferManifestDrmInitData = preferManifestDrmInitData;
        this.resendFormatOnInit = resendFormatOnInit;
    }

    public void init(SeekMapOutput seekMapOutput, TrackOutput trackOutput) {
        this.seekMapOutput = seekMapOutput;
        this.trackOutput = trackOutput;
        if (!this.extractorInitialized) {
            this.extractor.init(this);
            this.extractorInitialized = true;
            return;
        }
        this.extractor.seek(0L, 0L);
        if (this.resendFormatOnInit && this.sentFormat != null) {
            trackOutput.format(this.sentFormat);
        }
    }

    @Override // com.google.android.exoplayer2.extractor.ExtractorOutput
    /* renamed from: track */
    public TrackOutput mo366track(int id) {
        Assertions.checkState(!this.seenTrack || this.seenTrackId == id);
        this.seenTrack = true;
        this.seenTrackId = id;
        return this;
    }

    @Override // com.google.android.exoplayer2.extractor.ExtractorOutput
    public void endTracks() {
        Assertions.checkState(this.seenTrack);
    }

    @Override // com.google.android.exoplayer2.extractor.ExtractorOutput
    public void seekMap(SeekMap seekMap) {
        this.seekMapOutput.seekMap(seekMap);
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void format(Format format) {
        this.sentFormat = format.copyWithManifestFormatInfo(this.manifestFormat, this.preferManifestDrmInitData);
        this.trackOutput.format(this.sentFormat);
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        return this.trackOutput.sampleData(input, length, allowEndOfInput);
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void sampleData(ParsableByteArray data, int length) {
        this.trackOutput.sampleData(data, length);
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        this.trackOutput.sampleMetadata(timeUs, flags, size, offset, encryptionKey);
    }
}
