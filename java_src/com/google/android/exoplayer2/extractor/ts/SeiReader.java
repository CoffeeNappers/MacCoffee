package com.google.android.exoplayer2.extractor.ts;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.extractor.TrackOutput;
import com.google.android.exoplayer2.text.cea.CeaUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.exoplayer2.util.ParsableByteArray;
/* loaded from: classes.dex */
final class SeiReader {
    private final TrackOutput output;

    public SeiReader(TrackOutput output) {
        this.output = output;
        output.format(Format.createTextSampleFormat(null, MimeTypes.APPLICATION_CEA608, null, -1, 0, null, null));
    }

    public void consume(long pesTimeUs, ParsableByteArray seiBuffer) {
        CeaUtil.consume(pesTimeUs, seiBuffer, this.output);
    }
}
