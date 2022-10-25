package com.google.android.exoplayer2.extractor.flv;

import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.extractor.TrackOutput;
import com.google.android.exoplayer2.util.ParsableByteArray;
/* loaded from: classes.dex */
abstract class TagPayloadReader {
    protected final TrackOutput output;

    protected abstract boolean parseHeader(ParsableByteArray parsableByteArray) throws ParserException;

    protected abstract void parsePayload(ParsableByteArray parsableByteArray, long j) throws ParserException;

    public abstract void seek();

    /* loaded from: classes.dex */
    public static final class UnsupportedFormatException extends ParserException {
        public UnsupportedFormatException(String msg) {
            super(msg);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TagPayloadReader(TrackOutput output) {
        this.output = output;
    }

    public final void consume(ParsableByteArray data, long timeUs) throws ParserException {
        if (parseHeader(data)) {
            parsePayload(data, timeUs);
        }
    }
}
