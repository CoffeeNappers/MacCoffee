package com.google.android.exoplayer2.extractor.ts;

import android.util.SparseArray;
import com.google.android.exoplayer2.extractor.ts.TsPayloadReader;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public final class DefaultTsPayloadReaderFactory implements TsPayloadReader.Factory {
    public static final int FLAG_ALLOW_NON_IDR_KEYFRAMES = 1;
    public static final int FLAG_DETECT_ACCESS_UNITS = 8;
    public static final int FLAG_IGNORE_AAC_STREAM = 2;
    public static final int FLAG_IGNORE_H264_STREAM = 4;
    public static final int FLAG_IGNORE_SPLICE_INFO_STREAM = 16;
    private final int flags;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Flags {
    }

    public DefaultTsPayloadReaderFactory() {
        this(0);
    }

    public DefaultTsPayloadReaderFactory(int flags) {
        this.flags = flags;
    }

    @Override // com.google.android.exoplayer2.extractor.ts.TsPayloadReader.Factory
    public SparseArray<TsPayloadReader> createInitialPayloadReaders() {
        return new SparseArray<>();
    }

    @Override // com.google.android.exoplayer2.extractor.ts.TsPayloadReader.Factory
    public TsPayloadReader createPayloadReader(int streamType, TsPayloadReader.EsInfo esInfo) {
        switch (streamType) {
            case 2:
                return new PesReader(new H262Reader());
            case 3:
            case 4:
                return new PesReader(new MpegAudioReader(esInfo.language));
            case 15:
                if (isSet(2)) {
                    return null;
                }
                return new PesReader(new AdtsReader(false, esInfo.language));
            case 21:
                return new PesReader(new Id3Reader());
            case 27:
                if (isSet(4)) {
                    return null;
                }
                return new PesReader(new H264Reader(isSet(1), isSet(8)));
            case 36:
                return new PesReader(new H265Reader());
            case TsExtractor.TS_STREAM_TYPE_AC3 /* 129 */:
            case 135:
                return new PesReader(new Ac3Reader(esInfo.language));
            case 130:
            case TsExtractor.TS_STREAM_TYPE_DTS /* 138 */:
                return new PesReader(new DtsReader(esInfo.language));
            case TsExtractor.TS_STREAM_TYPE_SPLICE_INFO /* 134 */:
                if (isSet(16)) {
                    return null;
                }
                return new SectionReader(new SpliceInfoSectionReader());
            default:
                return null;
        }
    }

    private boolean isSet(int flag) {
        return (this.flags & flag) != 0;
    }
}
