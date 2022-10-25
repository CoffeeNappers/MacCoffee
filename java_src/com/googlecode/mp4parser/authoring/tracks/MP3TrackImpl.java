package com.googlecode.mp4parser.authoring.tracks;

import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.SampleImpl;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public class MP3TrackImpl extends AbstractTrack {
    private static final int ES_OBJECT_TYPE_INDICATION = 107;
    private static final int ES_STREAM_TYPE = 5;
    private static final int MPEG_L3 = 1;
    private static final int MPEG_V1 = 3;
    private static final int SAMPLES_PER_FRAME = 1152;
    long avgBitRate;
    private final DataSource dataSource;
    private long[] durations;
    MP3Header firstHeader;
    long maxBitRate;
    SampleDescriptionBox sampleDescriptionBox;
    private List<Sample> samples;
    TrackMetaData trackMetaData;
    private static final int[] SAMPLE_RATE = {44100, 48000, 32000};
    private static final int[] BIT_RATE = {0, 32000, 40000, 48000, 56000, SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000};

    public MP3TrackImpl(DataSource channel) throws IOException {
        this(channel, "eng");
    }

    public MP3TrackImpl(DataSource dataSource, String lang) throws IOException {
        super(dataSource.toString());
        this.trackMetaData = new TrackMetaData();
        this.dataSource = dataSource;
        this.samples = new LinkedList();
        this.firstHeader = readSamples(dataSource);
        double packetsPerSecond = this.firstHeader.sampleRate / 1152.0d;
        double duration = this.samples.size() / packetsPerSecond;
        long dataSize = 0;
        LinkedList<Integer> queue = new LinkedList<>();
        for (Sample sample : this.samples) {
            int size = (int) sample.getSize();
            dataSize += size;
            queue.add(Integer.valueOf(size));
            while (queue.size() > packetsPerSecond) {
                queue.pop();
            }
            if (queue.size() == ((int) packetsPerSecond)) {
                int currSize = 0;
                Iterator<Integer> it = queue.iterator();
                while (it.hasNext()) {
                    Integer aQueue = it.next();
                    currSize += aQueue.intValue();
                }
                double currBitRate = ((8.0d * currSize) / queue.size()) * packetsPerSecond;
                if (currBitRate > this.maxBitRate) {
                    this.maxBitRate = (int) currBitRate;
                }
            }
        }
        this.avgBitRate = (int) ((8 * dataSize) / duration);
        this.sampleDescriptionBox = new SampleDescriptionBox();
        AudioSampleEntry audioSampleEntry = new AudioSampleEntry(AudioSampleEntry.TYPE3);
        audioSampleEntry.setChannelCount(this.firstHeader.channelCount);
        audioSampleEntry.setSampleRate(this.firstHeader.sampleRate);
        audioSampleEntry.setDataReferenceIndex(1);
        audioSampleEntry.setSampleSize(16);
        ESDescriptorBox esds = new ESDescriptorBox();
        ESDescriptor descriptor = new ESDescriptor();
        descriptor.setEsId(0);
        SLConfigDescriptor slConfigDescriptor = new SLConfigDescriptor();
        slConfigDescriptor.setPredefined(2);
        descriptor.setSlConfigDescriptor(slConfigDescriptor);
        DecoderConfigDescriptor decoderConfigDescriptor = new DecoderConfigDescriptor();
        decoderConfigDescriptor.setObjectTypeIndication(107);
        decoderConfigDescriptor.setStreamType(5);
        decoderConfigDescriptor.setMaxBitRate(this.maxBitRate);
        decoderConfigDescriptor.setAvgBitRate(this.avgBitRate);
        descriptor.setDecoderConfigDescriptor(decoderConfigDescriptor);
        ByteBuffer data = descriptor.serialize();
        esds.setData(data);
        audioSampleEntry.addBox(esds);
        this.sampleDescriptionBox.addBox(audioSampleEntry);
        this.trackMetaData.setCreationTime(new Date());
        this.trackMetaData.setModificationTime(new Date());
        this.trackMetaData.setLanguage(lang);
        this.trackMetaData.setVolume(1.0f);
        this.trackMetaData.setTimescale(this.firstHeader.sampleRate);
        this.durations = new long[this.samples.size()];
        Arrays.fill(this.durations, 1152L);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.dataSource.close();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.sampleDescriptionBox;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.durations;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.trackMetaData;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return "soun";
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return this.samples;
    }

    private MP3Header readSamples(DataSource channel) throws IOException {
        MP3Header first = null;
        while (true) {
            long pos = channel.position();
            MP3Header hdr = readMP3Header(channel);
            if (hdr != null) {
                if (first == null) {
                    first = hdr;
                }
                channel.position(pos);
                ByteBuffer data = ByteBuffer.allocate(hdr.getFrameLength());
                channel.read(data);
                data.rewind();
                this.samples.add(new SampleImpl(data));
            } else {
                return first;
            }
        }
    }

    private MP3Header readMP3Header(DataSource channel) throws IOException {
        MP3Header hdr = new MP3Header();
        ByteBuffer bb = ByteBuffer.allocate(4);
        while (bb.position() < 4) {
            if (channel.read(bb) == -1) {
                return null;
            }
        }
        if (bb.get(0) == 84 && bb.get(1) == 65 && bb.get(2) == 71) {
            return null;
        }
        BitReaderBuffer brb = new BitReaderBuffer((ByteBuffer) bb.rewind());
        int sync = brb.readBits(11);
        if (sync != 2047) {
            throw new IOException("Expected Start Word 0x7ff");
        }
        hdr.mpegVersion = brb.readBits(2);
        if (hdr.mpegVersion != 3) {
            throw new IOException("Expected MPEG Version 1 (ISO/IEC 11172-3)");
        }
        hdr.layer = brb.readBits(2);
        if (hdr.layer != 1) {
            throw new IOException("Expected Layer III");
        }
        hdr.protectionAbsent = brb.readBits(1);
        hdr.bitRateIndex = brb.readBits(4);
        hdr.bitRate = BIT_RATE[hdr.bitRateIndex];
        if (hdr.bitRate == 0) {
            throw new IOException("Unexpected (free/bad) bit rate");
        }
        hdr.sampleFrequencyIndex = brb.readBits(2);
        hdr.sampleRate = SAMPLE_RATE[hdr.sampleFrequencyIndex];
        if (hdr.sampleRate == 0) {
            throw new IOException("Unexpected (reserved) sample rate frequency");
        }
        hdr.padding = brb.readBits(1);
        brb.readBits(1);
        hdr.channelMode = brb.readBits(2);
        hdr.channelCount = hdr.channelMode == 3 ? 1 : 2;
        return hdr;
    }

    public String toString() {
        return "MP3TrackImpl";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class MP3Header {
        int bitRate;
        int bitRateIndex;
        int channelCount;
        int channelMode;
        int layer;
        int mpegVersion;
        int padding;
        int protectionAbsent;
        int sampleFrequencyIndex;
        int sampleRate;

        MP3Header() {
        }

        int getFrameLength() {
            return ((this.bitRate * 144) / this.sampleRate) + this.padding;
        }
    }
}
