package com.google.android.exoplayer2.source.chunk;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.extractor.DefaultTrackOutput;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
/* loaded from: classes.dex */
public abstract class BaseMediaChunk extends MediaChunk {
    private int firstSampleIndex;
    private DefaultTrackOutput trackOutput;

    public BaseMediaChunk(DataSource dataSource, DataSpec dataSpec, Format trackFormat, int trackSelectionReason, Object trackSelectionData, long startTimeUs, long endTimeUs, int chunkIndex) {
        super(dataSource, dataSpec, trackFormat, trackSelectionReason, trackSelectionData, startTimeUs, endTimeUs, chunkIndex);
    }

    public void init(DefaultTrackOutput trackOutput) {
        this.trackOutput = trackOutput;
        this.firstSampleIndex = trackOutput.getWriteIndex();
    }

    public final int getFirstSampleIndex() {
        return this.firstSampleIndex;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final DefaultTrackOutput getTrackOutput() {
        return this.trackOutput;
    }
}
