package com.google.android.exoplayer2.extractor.ts;

import android.util.SparseArray;
import com.google.android.exoplayer2.extractor.ExtractorOutput;
import com.google.android.exoplayer2.util.ParsableByteArray;
import com.google.android.exoplayer2.util.TimestampAdjuster;
/* loaded from: classes.dex */
public interface TsPayloadReader {

    /* loaded from: classes.dex */
    public interface Factory {
        SparseArray<TsPayloadReader> createInitialPayloadReaders();

        TsPayloadReader createPayloadReader(int i, EsInfo esInfo);
    }

    void consume(ParsableByteArray parsableByteArray, boolean z);

    void init(TimestampAdjuster timestampAdjuster, ExtractorOutput extractorOutput, TrackIdGenerator trackIdGenerator);

    void seek();

    /* loaded from: classes.dex */
    public static final class EsInfo {
        public final byte[] descriptorBytes;
        public final String language;
        public final int streamType;

        public EsInfo(int streamType, String language, byte[] descriptorBytes) {
            this.streamType = streamType;
            this.language = language;
            this.descriptorBytes = descriptorBytes;
        }
    }

    /* loaded from: classes.dex */
    public static final class TrackIdGenerator {
        private final int firstId;
        private int generatedIdCount;
        private final int idIncrement;

        public TrackIdGenerator(int firstId, int idIncrement) {
            this.firstId = firstId;
            this.idIncrement = idIncrement;
        }

        public int getNextId() {
            int i = this.firstId;
            int i2 = this.idIncrement;
            int i3 = this.generatedIdCount;
            this.generatedIdCount = i3 + 1;
            return i + (i2 * i3);
        }
    }
}
