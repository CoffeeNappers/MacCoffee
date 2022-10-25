package com.google.android.exoplayer2.extractor.ts;

import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.audio.Ac3Util;
import com.google.android.exoplayer2.extractor.ExtractorOutput;
import com.google.android.exoplayer2.extractor.TrackOutput;
import com.google.android.exoplayer2.extractor.ts.TsPayloadReader;
import com.google.android.exoplayer2.util.ParsableBitArray;
import com.google.android.exoplayer2.util.ParsableByteArray;
/* loaded from: classes.dex */
final class Ac3Reader implements ElementaryStreamReader {
    private static final int HEADER_SIZE = 8;
    private static final int STATE_FINDING_SYNC = 0;
    private static final int STATE_READING_HEADER = 1;
    private static final int STATE_READING_SAMPLE = 2;
    private int bytesRead;
    private Format format;
    private final ParsableBitArray headerScratchBits;
    private final ParsableByteArray headerScratchBytes;
    private boolean isEac3;
    private final String language;
    private boolean lastByteWas0B;
    private TrackOutput output;
    private long sampleDurationUs;
    private int sampleSize;
    private int state;
    private long timeUs;

    public Ac3Reader() {
        this(null);
    }

    public Ac3Reader(String language) {
        this.headerScratchBits = new ParsableBitArray(new byte[8]);
        this.headerScratchBytes = new ParsableByteArray(this.headerScratchBits.data);
        this.state = 0;
        this.language = language;
    }

    @Override // com.google.android.exoplayer2.extractor.ts.ElementaryStreamReader
    public void seek() {
        this.state = 0;
        this.bytesRead = 0;
        this.lastByteWas0B = false;
    }

    @Override // com.google.android.exoplayer2.extractor.ts.ElementaryStreamReader
    public void createTracks(ExtractorOutput extractorOutput, TsPayloadReader.TrackIdGenerator generator) {
        this.output = extractorOutput.mo366track(generator.getNextId());
    }

    @Override // com.google.android.exoplayer2.extractor.ts.ElementaryStreamReader
    public void packetStarted(long pesTimeUs, boolean dataAlignmentIndicator) {
        this.timeUs = pesTimeUs;
    }

    @Override // com.google.android.exoplayer2.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray data) {
        while (data.bytesLeft() > 0) {
            switch (this.state) {
                case 0:
                    if (!skipToNextSync(data)) {
                        break;
                    } else {
                        this.state = 1;
                        this.headerScratchBytes.data[0] = 11;
                        this.headerScratchBytes.data[1] = 119;
                        this.bytesRead = 2;
                        break;
                    }
                case 1:
                    if (!continueRead(data, this.headerScratchBytes.data, 8)) {
                        break;
                    } else {
                        parseHeader();
                        this.headerScratchBytes.setPosition(0);
                        this.output.sampleData(this.headerScratchBytes, 8);
                        this.state = 2;
                        break;
                    }
                case 2:
                    int bytesToRead = Math.min(data.bytesLeft(), this.sampleSize - this.bytesRead);
                    this.output.sampleData(data, bytesToRead);
                    this.bytesRead += bytesToRead;
                    if (this.bytesRead != this.sampleSize) {
                        break;
                    } else {
                        this.output.sampleMetadata(this.timeUs, 1, this.sampleSize, 0, null);
                        this.timeUs += this.sampleDurationUs;
                        this.state = 0;
                        break;
                    }
            }
        }
    }

    @Override // com.google.android.exoplayer2.extractor.ts.ElementaryStreamReader
    public void packetFinished() {
    }

    private boolean continueRead(ParsableByteArray source, byte[] target, int targetLength) {
        int bytesToRead = Math.min(source.bytesLeft(), targetLength - this.bytesRead);
        source.readBytes(target, this.bytesRead, bytesToRead);
        this.bytesRead += bytesToRead;
        return this.bytesRead == targetLength;
    }

    private boolean skipToNextSync(ParsableByteArray pesBuffer) {
        while (pesBuffer.bytesLeft() > 0) {
            if (!this.lastByteWas0B) {
                this.lastByteWas0B = pesBuffer.readUnsignedByte() == 11;
            } else {
                int secondByte = pesBuffer.readUnsignedByte();
                if (secondByte == 119) {
                    this.lastByteWas0B = false;
                    return true;
                }
                this.lastByteWas0B = secondByte == 11;
            }
        }
        return false;
    }

    private void parseHeader() {
        int audioSamplesPerSyncframe;
        if (this.format == null) {
            this.headerScratchBits.skipBits(40);
            this.isEac3 = this.headerScratchBits.readBits(5) == 16;
            this.headerScratchBits.setPosition(this.headerScratchBits.getPosition() - 45);
            this.format = this.isEac3 ? Ac3Util.parseEac3SyncframeFormat(this.headerScratchBits, null, this.language, null) : Ac3Util.parseAc3SyncframeFormat(this.headerScratchBits, null, this.language, null);
            this.output.format(this.format);
        }
        this.sampleSize = this.isEac3 ? Ac3Util.parseEAc3SyncframeSize(this.headerScratchBits.data) : Ac3Util.parseAc3SyncframeSize(this.headerScratchBits.data);
        if (this.isEac3) {
            audioSamplesPerSyncframe = Ac3Util.parseEAc3SyncframeAudioSampleCount(this.headerScratchBits.data);
        } else {
            audioSamplesPerSyncframe = Ac3Util.getAc3SyncframeAudioSampleCount();
        }
        this.sampleDurationUs = (int) ((C.MICROS_PER_SECOND * audioSamplesPerSyncframe) / this.format.sampleRate);
    }
}
