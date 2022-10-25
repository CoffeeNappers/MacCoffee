package com.google.android.exoplayer2.extractor.ts;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.extractor.Extractor;
import com.google.android.exoplayer2.extractor.ExtractorInput;
import com.google.android.exoplayer2.extractor.ExtractorOutput;
import com.google.android.exoplayer2.extractor.ExtractorsFactory;
import com.google.android.exoplayer2.extractor.PositionHolder;
import com.google.android.exoplayer2.extractor.SeekMap;
import com.google.android.exoplayer2.extractor.ts.TsPayloadReader;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.ParsableBitArray;
import com.google.android.exoplayer2.util.ParsableByteArray;
import com.google.android.exoplayer2.util.TimestampAdjuster;
import com.google.android.exoplayer2.util.Util;
import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class TsExtractor implements Extractor {
    private static final int BUFFER_PACKET_COUNT = 5;
    private static final int BUFFER_SIZE = 940;
    private static final int MAX_PID_PLUS_ONE = 8192;
    private static final int TS_PACKET_SIZE = 188;
    private static final int TS_PAT_PID = 0;
    public static final int TS_STREAM_TYPE_AAC = 15;
    public static final int TS_STREAM_TYPE_AC3 = 129;
    public static final int TS_STREAM_TYPE_DTS = 138;
    public static final int TS_STREAM_TYPE_E_AC3 = 135;
    public static final int TS_STREAM_TYPE_H262 = 2;
    public static final int TS_STREAM_TYPE_H264 = 27;
    public static final int TS_STREAM_TYPE_H265 = 36;
    public static final int TS_STREAM_TYPE_HDMV_DTS = 130;
    public static final int TS_STREAM_TYPE_ID3 = 21;
    public static final int TS_STREAM_TYPE_MPA = 3;
    public static final int TS_STREAM_TYPE_MPA_LSF = 4;
    public static final int TS_STREAM_TYPE_SPLICE_INFO = 134;
    private static final int TS_SYNC_BYTE = 71;
    private final SparseIntArray continuityCounters;
    private final boolean hlsMode;
    private TsPayloadReader id3Reader;
    private ExtractorOutput output;
    private final TsPayloadReader.Factory payloadReaderFactory;
    private final TimestampAdjuster timestampAdjuster;
    private final SparseBooleanArray trackIds;
    private boolean tracksEnded;
    private final ParsableByteArray tsPacketBuffer;
    private final SparseArray<TsPayloadReader> tsPayloadReaders;
    private final ParsableBitArray tsScratch;
    public static final ExtractorsFactory FACTORY = new ExtractorsFactory() { // from class: com.google.android.exoplayer2.extractor.ts.TsExtractor.1
        @Override // com.google.android.exoplayer2.extractor.ExtractorsFactory
        public Extractor[] createExtractors() {
            return new Extractor[]{new TsExtractor()};
        }
    };
    private static final long AC3_FORMAT_IDENTIFIER = Util.getIntegerCodeForString("AC-3");
    private static final long E_AC3_FORMAT_IDENTIFIER = Util.getIntegerCodeForString("EAC3");
    private static final long HEVC_FORMAT_IDENTIFIER = Util.getIntegerCodeForString("HEVC");

    public TsExtractor() {
        this(new TimestampAdjuster(0L));
    }

    public TsExtractor(TimestampAdjuster timestampAdjuster) {
        this(timestampAdjuster, new DefaultTsPayloadReaderFactory(), false);
    }

    public TsExtractor(TimestampAdjuster timestampAdjuster, TsPayloadReader.Factory payloadReaderFactory, boolean hlsMode) {
        this.timestampAdjuster = timestampAdjuster;
        this.payloadReaderFactory = (TsPayloadReader.Factory) Assertions.checkNotNull(payloadReaderFactory);
        this.hlsMode = hlsMode;
        this.tsPacketBuffer = new ParsableByteArray((int) BUFFER_SIZE);
        this.tsScratch = new ParsableBitArray(new byte[3]);
        this.trackIds = new SparseBooleanArray();
        this.tsPayloadReaders = new SparseArray<>();
        this.continuityCounters = new SparseIntArray();
        resetPayloadReaders();
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0021, code lost:
        r2 = r2 + 1;
     */
    @Override // com.google.android.exoplayer2.extractor.Extractor
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean sniff(com.google.android.exoplayer2.extractor.ExtractorInput r7) throws java.io.IOException, java.lang.InterruptedException {
        /*
            r6 = this;
            r3 = 0
            com.google.android.exoplayer2.util.ParsableByteArray r4 = r6.tsPacketBuffer
            byte[] r0 = r4.data
            r4 = 940(0x3ac, float:1.317E-42)
            r7.peekFully(r0, r3, r4)
            r2 = 0
        Lb:
            r4 = 188(0xbc, float:2.63E-43)
            if (r2 >= r4) goto L17
            r1 = 0
        L10:
            r4 = 5
            if (r1 != r4) goto L18
            r7.skipFully(r2)
            r3 = 1
        L17:
            return r3
        L18:
            int r4 = r1 * 188
            int r4 = r4 + r2
            r4 = r0[r4]
            r5 = 71
            if (r4 == r5) goto L24
            int r2 = r2 + 1
            goto Lb
        L24:
            int r1 = r1 + 1
            goto L10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.exoplayer2.extractor.ts.TsExtractor.sniff(com.google.android.exoplayer2.extractor.ExtractorInput):boolean");
    }

    @Override // com.google.android.exoplayer2.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.output = output;
        output.seekMap(new SeekMap.Unseekable(C.TIME_UNSET));
    }

    @Override // com.google.android.exoplayer2.extractor.Extractor
    public void seek(long position, long timeUs) {
        this.timestampAdjuster.reset();
        this.tsPacketBuffer.reset();
        this.continuityCounters.clear();
        resetPayloadReaders();
    }

    @Override // com.google.android.exoplayer2.extractor.Extractor
    public void release() {
    }

    @Override // com.google.android.exoplayer2.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        TsPayloadReader payloadReader;
        byte[] data = this.tsPacketBuffer.data;
        if (940 - this.tsPacketBuffer.getPosition() < TS_PACKET_SIZE) {
            int bytesLeft = this.tsPacketBuffer.bytesLeft();
            if (bytesLeft > 0) {
                System.arraycopy(data, this.tsPacketBuffer.getPosition(), data, 0, bytesLeft);
            }
            this.tsPacketBuffer.reset(data, bytesLeft);
        }
        while (this.tsPacketBuffer.bytesLeft() < TS_PACKET_SIZE) {
            int limit = this.tsPacketBuffer.limit();
            int read = input.read(data, limit, 940 - limit);
            if (read == -1) {
                return -1;
            }
            this.tsPacketBuffer.setLimit(limit + read);
        }
        int limit2 = this.tsPacketBuffer.limit();
        int position = this.tsPacketBuffer.getPosition();
        while (position < limit2 && data[position] != 71) {
            position++;
        }
        this.tsPacketBuffer.setPosition(position);
        int endOfPacket = position + TS_PACKET_SIZE;
        if (endOfPacket > limit2) {
            return 0;
        }
        this.tsPacketBuffer.skipBytes(1);
        this.tsPacketBuffer.readBytes(this.tsScratch, 3);
        if (this.tsScratch.readBit()) {
            this.tsPacketBuffer.setPosition(endOfPacket);
            return 0;
        }
        boolean payloadUnitStartIndicator = this.tsScratch.readBit();
        this.tsScratch.skipBits(1);
        int pid = this.tsScratch.readBits(13);
        this.tsScratch.skipBits(2);
        boolean adaptationFieldExists = this.tsScratch.readBit();
        boolean payloadExists = this.tsScratch.readBit();
        boolean discontinuityFound = false;
        int continuityCounter = this.tsScratch.readBits(4);
        if (!this.hlsMode) {
            int previousCounter = this.continuityCounters.get(pid, continuityCounter - 1);
            this.continuityCounters.put(pid, continuityCounter);
            if (previousCounter == continuityCounter) {
                if (payloadExists) {
                    this.tsPacketBuffer.setPosition(endOfPacket);
                    return 0;
                }
            } else if (continuityCounter != (previousCounter + 1) % 16) {
                discontinuityFound = true;
            }
        }
        if (adaptationFieldExists) {
            int adaptationFieldLength = this.tsPacketBuffer.readUnsignedByte();
            this.tsPacketBuffer.skipBytes(adaptationFieldLength);
        }
        if (payloadExists && (payloadReader = this.tsPayloadReaders.get(pid)) != null) {
            if (discontinuityFound) {
                payloadReader.seek();
            }
            this.tsPacketBuffer.setLimit(endOfPacket);
            payloadReader.consume(this.tsPacketBuffer, payloadUnitStartIndicator);
            Assertions.checkState(this.tsPacketBuffer.getPosition() <= endOfPacket);
            this.tsPacketBuffer.setLimit(limit2);
        }
        this.tsPacketBuffer.setPosition(endOfPacket);
        return 0;
    }

    private void resetPayloadReaders() {
        this.trackIds.clear();
        this.tsPayloadReaders.clear();
        SparseArray<TsPayloadReader> initialPayloadReaders = this.payloadReaderFactory.createInitialPayloadReaders();
        int initialPayloadReadersSize = initialPayloadReaders.size();
        for (int i = 0; i < initialPayloadReadersSize; i++) {
            this.tsPayloadReaders.put(initialPayloadReaders.keyAt(i), initialPayloadReaders.valueAt(i));
        }
        this.tsPayloadReaders.put(0, new SectionReader(new PatReader()));
        this.id3Reader = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class PatReader implements SectionPayloadReader {
        private final ParsableBitArray patScratch = new ParsableBitArray(new byte[4]);

        public PatReader() {
        }

        @Override // com.google.android.exoplayer2.extractor.ts.SectionPayloadReader
        public void init(TimestampAdjuster timestampAdjuster, ExtractorOutput extractorOutput, TsPayloadReader.TrackIdGenerator idGenerator) {
        }

        @Override // com.google.android.exoplayer2.extractor.ts.SectionPayloadReader
        public void consume(ParsableByteArray sectionData) {
            int tableId = sectionData.readUnsignedByte();
            if (tableId == 0) {
                sectionData.skipBytes(7);
                int programCount = sectionData.bytesLeft() / 4;
                for (int i = 0; i < programCount; i++) {
                    sectionData.readBytes(this.patScratch, 4);
                    int programNumber = this.patScratch.readBits(16);
                    this.patScratch.skipBits(3);
                    if (programNumber == 0) {
                        this.patScratch.skipBits(13);
                    } else {
                        int pid = this.patScratch.readBits(13);
                        TsExtractor.this.tsPayloadReaders.put(pid, new SectionReader(new PmtReader(pid)));
                    }
                }
            }
        }
    }

    /* loaded from: classes.dex */
    private class PmtReader implements SectionPayloadReader {
        private static final int TS_PMT_DESC_AC3 = 106;
        private static final int TS_PMT_DESC_DTS = 123;
        private static final int TS_PMT_DESC_EAC3 = 122;
        private static final int TS_PMT_DESC_ISO639_LANG = 10;
        private static final int TS_PMT_DESC_REGISTRATION = 5;
        private final int pid;
        private final ParsableBitArray pmtScratch = new ParsableBitArray(new byte[5]);

        public PmtReader(int pid) {
            this.pid = pid;
        }

        @Override // com.google.android.exoplayer2.extractor.ts.SectionPayloadReader
        public void init(TimestampAdjuster timestampAdjuster, ExtractorOutput extractorOutput, TsPayloadReader.TrackIdGenerator idGenerator) {
        }

        @Override // com.google.android.exoplayer2.extractor.ts.SectionPayloadReader
        public void consume(ParsableByteArray sectionData) {
            TsPayloadReader reader;
            int tableId = sectionData.readUnsignedByte();
            if (tableId == 2) {
                sectionData.skipBytes(9);
                sectionData.readBytes(this.pmtScratch, 2);
                this.pmtScratch.skipBits(4);
                int programInfoLength = this.pmtScratch.readBits(12);
                sectionData.skipBytes(programInfoLength);
                if (TsExtractor.this.hlsMode && TsExtractor.this.id3Reader == null) {
                    TsPayloadReader.EsInfo dummyEsInfo = new TsPayloadReader.EsInfo(21, null, new byte[0]);
                    TsExtractor.this.id3Reader = TsExtractor.this.payloadReaderFactory.createPayloadReader(21, dummyEsInfo);
                    TsExtractor.this.id3Reader.init(TsExtractor.this.timestampAdjuster, TsExtractor.this.output, new TsPayloadReader.TrackIdGenerator(21, 8192));
                }
                int remainingEntriesLength = sectionData.bytesLeft();
                while (remainingEntriesLength > 0) {
                    sectionData.readBytes(this.pmtScratch, 5);
                    int streamType = this.pmtScratch.readBits(8);
                    this.pmtScratch.skipBits(3);
                    int elementaryPid = this.pmtScratch.readBits(13);
                    this.pmtScratch.skipBits(4);
                    int esInfoLength = this.pmtScratch.readBits(12);
                    TsPayloadReader.EsInfo esInfo = readEsInfo(sectionData, esInfoLength);
                    if (streamType == 6) {
                        streamType = esInfo.streamType;
                    }
                    remainingEntriesLength -= esInfoLength + 5;
                    int trackId = TsExtractor.this.hlsMode ? streamType : elementaryPid;
                    if (!TsExtractor.this.trackIds.get(trackId)) {
                        TsExtractor.this.trackIds.put(trackId, true);
                        if (!TsExtractor.this.hlsMode || streamType != 21) {
                            reader = TsExtractor.this.payloadReaderFactory.createPayloadReader(streamType, esInfo);
                            if (reader != null) {
                                reader.init(TsExtractor.this.timestampAdjuster, TsExtractor.this.output, new TsPayloadReader.TrackIdGenerator(trackId, 8192));
                            }
                        } else {
                            reader = TsExtractor.this.id3Reader;
                        }
                        if (reader != null) {
                            TsExtractor.this.tsPayloadReaders.put(elementaryPid, reader);
                        }
                    }
                }
                if (TsExtractor.this.hlsMode) {
                    if (!TsExtractor.this.tracksEnded) {
                        TsExtractor.this.output.endTracks();
                    }
                } else {
                    TsExtractor.this.tsPayloadReaders.remove(0);
                    TsExtractor.this.tsPayloadReaders.remove(this.pid);
                    TsExtractor.this.output.endTracks();
                }
                TsExtractor.this.tracksEnded = true;
            }
        }

        private TsPayloadReader.EsInfo readEsInfo(ParsableByteArray data, int length) {
            int descriptorsStartPosition = data.getPosition();
            int descriptorsEndPosition = descriptorsStartPosition + length;
            int streamType = -1;
            String language = null;
            while (data.getPosition() < descriptorsEndPosition) {
                int descriptorTag = data.readUnsignedByte();
                int descriptorLength = data.readUnsignedByte();
                int positionOfNextDescriptor = data.getPosition() + descriptorLength;
                if (descriptorTag == 5) {
                    long formatIdentifier = data.readUnsignedInt();
                    if (formatIdentifier != TsExtractor.AC3_FORMAT_IDENTIFIER) {
                        if (formatIdentifier != TsExtractor.E_AC3_FORMAT_IDENTIFIER) {
                            if (formatIdentifier == TsExtractor.HEVC_FORMAT_IDENTIFIER) {
                                streamType = 36;
                            }
                        } else {
                            streamType = 135;
                        }
                    } else {
                        streamType = TsExtractor.TS_STREAM_TYPE_AC3;
                    }
                } else if (descriptorTag == 106) {
                    streamType = TsExtractor.TS_STREAM_TYPE_AC3;
                } else if (descriptorTag == TS_PMT_DESC_EAC3) {
                    streamType = 135;
                } else if (descriptorTag == TS_PMT_DESC_DTS) {
                    streamType = TsExtractor.TS_STREAM_TYPE_DTS;
                } else if (descriptorTag == 10) {
                    language = new String(data.data, data.getPosition(), 3).trim();
                }
                data.skipBytes(positionOfNextDescriptor - data.getPosition());
            }
            data.setPosition(descriptorsEndPosition);
            return new TsPayloadReader.EsInfo(streamType, language, Arrays.copyOfRange(data.data, descriptorsStartPosition, descriptorsEndPosition));
        }
    }
}
