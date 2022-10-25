package com.googlecode.mp4parser.authoring.tracks;

import android.support.v4.media.session.PlaybackStateCompat;
import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.SubSampleInformationBox;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class AACTrackImpl extends AbstractTrack {
    static Map<Integer, String> audioObjectTypes = new HashMap();
    public static Map<Integer, Integer> samplingFrequencyIndexMap;
    long avgBitRate;
    int bufferSizeDB;
    private DataSource dataSource;
    long[] decTimes;
    AdtsHeader firstHeader;
    private String lang;
    long maxBitRate;
    SampleDescriptionBox sampleDescriptionBox;
    private List<Sample> samples;
    TrackMetaData trackMetaData;

    static {
        audioObjectTypes.put(1, "AAC Main");
        audioObjectTypes.put(2, "AAC LC (Low Complexity)");
        audioObjectTypes.put(3, "AAC SSR (Scalable Sample Rate)");
        audioObjectTypes.put(4, "AAC LTP (Long Term Prediction)");
        audioObjectTypes.put(5, "SBR (Spectral Band Replication)");
        audioObjectTypes.put(6, "AAC Scalable");
        audioObjectTypes.put(7, "TwinVQ");
        audioObjectTypes.put(8, "CELP (Code Excited Linear Prediction)");
        audioObjectTypes.put(9, "HXVC (Harmonic Vector eXcitation Coding)");
        audioObjectTypes.put(10, "Reserved");
        audioObjectTypes.put(11, "Reserved");
        audioObjectTypes.put(12, "TTSI (Text-To-Speech Interface)");
        audioObjectTypes.put(13, "Main Synthesis");
        audioObjectTypes.put(14, "Wavetable Synthesis");
        audioObjectTypes.put(15, "General MIDI");
        audioObjectTypes.put(16, "Algorithmic Synthesis and Audio Effects");
        audioObjectTypes.put(17, "ER (Error Resilient) AAC LC");
        audioObjectTypes.put(18, "Reserved");
        audioObjectTypes.put(19, "ER AAC LTP");
        audioObjectTypes.put(20, "ER AAC Scalable");
        audioObjectTypes.put(21, "ER TwinVQ");
        audioObjectTypes.put(22, "ER BSAC (Bit-Sliced Arithmetic Coding)");
        audioObjectTypes.put(23, "ER AAC LD (Low Delay)");
        audioObjectTypes.put(24, "ER CELP");
        audioObjectTypes.put(25, "ER HVXC");
        audioObjectTypes.put(26, "ER HILN (Harmonic and Individual Lines plus Noise)");
        audioObjectTypes.put(27, "ER Parametric");
        audioObjectTypes.put(28, "SSC (SinuSoidal Coding)");
        audioObjectTypes.put(29, "PS (Parametric Stereo)");
        audioObjectTypes.put(30, "MPEG Surround");
        audioObjectTypes.put(31, "(Escape value)");
        audioObjectTypes.put(32, "Layer-1");
        audioObjectTypes.put(33, "Layer-2");
        audioObjectTypes.put(34, "Layer-3");
        audioObjectTypes.put(35, "DST (Direct Stream Transfer)");
        audioObjectTypes.put(36, "ALS (Audio Lossless)");
        audioObjectTypes.put(37, "SLS (Scalable LosslesS)");
        audioObjectTypes.put(38, "SLS non-core");
        audioObjectTypes.put(39, "ER AAC ELD (Enhanced Low Delay)");
        audioObjectTypes.put(40, "SMR (Symbolic Music Representation) Simple");
        audioObjectTypes.put(41, "SMR Main");
        audioObjectTypes.put(42, "USAC (Unified Speech and Audio Coding) (no SBR)");
        audioObjectTypes.put(43, "SAOC (Spatial Audio Object Coding)");
        audioObjectTypes.put(44, "LD MPEG Surround");
        audioObjectTypes.put(45, "USAC");
        samplingFrequencyIndexMap = new HashMap();
        samplingFrequencyIndexMap.put(96000, 0);
        samplingFrequencyIndexMap.put(88200, 1);
        samplingFrequencyIndexMap.put(Integer.valueOf((int) SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT), 2);
        samplingFrequencyIndexMap.put(48000, 3);
        samplingFrequencyIndexMap.put(44100, 4);
        samplingFrequencyIndexMap.put(32000, 5);
        samplingFrequencyIndexMap.put(24000, 6);
        samplingFrequencyIndexMap.put(22050, 7);
        samplingFrequencyIndexMap.put(16000, 8);
        samplingFrequencyIndexMap.put(Integer.valueOf((int) SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES), 9);
        samplingFrequencyIndexMap.put(11025, 10);
        samplingFrequencyIndexMap.put(8000, 11);
        samplingFrequencyIndexMap.put(0, 96000);
        samplingFrequencyIndexMap.put(1, 88200);
        samplingFrequencyIndexMap.put(2, Integer.valueOf((int) SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT));
        samplingFrequencyIndexMap.put(3, 48000);
        samplingFrequencyIndexMap.put(4, 44100);
        samplingFrequencyIndexMap.put(5, 32000);
        samplingFrequencyIndexMap.put(6, 24000);
        samplingFrequencyIndexMap.put(7, 22050);
        samplingFrequencyIndexMap.put(8, 16000);
        samplingFrequencyIndexMap.put(9, Integer.valueOf((int) SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES));
        samplingFrequencyIndexMap.put(10, 11025);
        samplingFrequencyIndexMap.put(11, 8000);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.dataSource.close();
    }

    public AACTrackImpl(DataSource dataSource) throws IOException {
        this(dataSource, "eng");
    }

    public AACTrackImpl(DataSource dataSource, String lang) throws IOException {
        super(dataSource.toString());
        this.trackMetaData = new TrackMetaData();
        this.lang = "eng";
        this.lang = lang;
        this.dataSource = dataSource;
        this.samples = new ArrayList();
        this.firstHeader = readSamples(dataSource);
        double packetsPerSecond = this.firstHeader.sampleRate / 1024.0d;
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
                double currBitrate = ((8.0d * currSize) / queue.size()) * packetsPerSecond;
                if (currBitrate > this.maxBitRate) {
                    this.maxBitRate = (int) currBitrate;
                }
            }
        }
        this.avgBitRate = (int) ((8 * dataSize) / duration);
        this.bufferSizeDB = 1536;
        this.sampleDescriptionBox = new SampleDescriptionBox();
        AudioSampleEntry audioSampleEntry = new AudioSampleEntry(AudioSampleEntry.TYPE3);
        if (this.firstHeader.channelconfig == 7) {
            audioSampleEntry.setChannelCount(8);
        } else {
            audioSampleEntry.setChannelCount(this.firstHeader.channelconfig);
        }
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
        decoderConfigDescriptor.setObjectTypeIndication(64);
        decoderConfigDescriptor.setStreamType(5);
        decoderConfigDescriptor.setBufferSizeDB(this.bufferSizeDB);
        decoderConfigDescriptor.setMaxBitRate(this.maxBitRate);
        decoderConfigDescriptor.setAvgBitRate(this.avgBitRate);
        AudioSpecificConfig audioSpecificConfig = new AudioSpecificConfig();
        audioSpecificConfig.setOriginalAudioObjectType(2);
        audioSpecificConfig.setSamplingFrequencyIndex(this.firstHeader.sampleFrequencyIndex);
        audioSpecificConfig.setChannelConfiguration(this.firstHeader.channelconfig);
        decoderConfigDescriptor.setAudioSpecificInfo(audioSpecificConfig);
        descriptor.setDecoderConfigDescriptor(decoderConfigDescriptor);
        esds.setEsDescriptor(descriptor);
        audioSampleEntry.addBox(esds);
        this.sampleDescriptionBox.addBox(audioSampleEntry);
        this.trackMetaData.setCreationTime(new Date());
        this.trackMetaData.setModificationTime(new Date());
        this.trackMetaData.setLanguage(lang);
        this.trackMetaData.setVolume(1.0f);
        this.trackMetaData.setTimescale(this.firstHeader.sampleRate);
        this.decTimes = new long[this.samples.size()];
        Arrays.fill(this.decTimes, (long) PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.sampleDescriptionBox;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.decTimes;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<CompositionTimeToSample.Entry> getCompositionTimeEntries() {
        return null;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public long[] getSyncSamples() {
        return null;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<SampleDependencyTypeBox.Entry> getSampleDependencies() {
        return null;
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

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public SubSampleInformationBox getSubsampleInformationBox() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class AdtsHeader {
        int bufferFullness;
        int channelconfig;
        int copyrightStart;
        int copyrightedStream;
        int frameLength;
        int home;
        int layer;
        int mpegVersion;
        int numAacFramesPerAdtsFrame;
        int original;
        int profile;
        int protectionAbsent;
        int sampleFrequencyIndex;
        int sampleRate;

        AdtsHeader() {
        }

        int getSize() {
            return (this.protectionAbsent == 0 ? 2 : 0) + 7;
        }
    }

    private AdtsHeader readADTSHeader(DataSource channel) throws IOException {
        AdtsHeader hdr = new AdtsHeader();
        ByteBuffer bb = ByteBuffer.allocate(7);
        while (bb.position() < 7) {
            if (channel.read(bb) == -1) {
                return null;
            }
        }
        BitReaderBuffer brb = new BitReaderBuffer((ByteBuffer) bb.rewind());
        int syncword = brb.readBits(12);
        if (syncword != 4095) {
            throw new IOException("Expected Start Word 0xfff");
        }
        hdr.mpegVersion = brb.readBits(1);
        hdr.layer = brb.readBits(2);
        hdr.protectionAbsent = brb.readBits(1);
        hdr.profile = brb.readBits(2) + 1;
        hdr.sampleFrequencyIndex = brb.readBits(4);
        hdr.sampleRate = samplingFrequencyIndexMap.get(Integer.valueOf(hdr.sampleFrequencyIndex)).intValue();
        brb.readBits(1);
        hdr.channelconfig = brb.readBits(3);
        hdr.original = brb.readBits(1);
        hdr.home = brb.readBits(1);
        hdr.copyrightedStream = brb.readBits(1);
        hdr.copyrightStart = brb.readBits(1);
        hdr.frameLength = brb.readBits(13);
        hdr.bufferFullness = brb.readBits(11);
        hdr.numAacFramesPerAdtsFrame = brb.readBits(2) + 1;
        if (hdr.numAacFramesPerAdtsFrame != 1) {
            throw new IOException("This muxer can only work with 1 AAC frame per ADTS frame");
        }
        if (hdr.protectionAbsent == 0) {
            channel.read(ByteBuffer.allocate(2));
            return hdr;
        }
        return hdr;
    }

    private AdtsHeader readSamples(DataSource channel) throws IOException {
        AdtsHeader first = null;
        while (true) {
            AdtsHeader hdr = readADTSHeader(channel);
            if (hdr != null) {
                if (first == null) {
                    first = hdr;
                }
                final long currentPosition = channel.position();
                final long frameSize = hdr.frameLength - hdr.getSize();
                this.samples.add(new Sample() { // from class: com.googlecode.mp4parser.authoring.tracks.AACTrackImpl.1
                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public void writeTo(WritableByteChannel channel2) throws IOException {
                        AACTrackImpl.this.dataSource.transferTo(currentPosition, frameSize, channel2);
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public long getSize() {
                        return frameSize;
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public ByteBuffer asByteBuffer() {
                        try {
                            return AACTrackImpl.this.dataSource.map(currentPosition, frameSize);
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    }
                });
                channel.position((channel.position() + hdr.frameLength) - hdr.getSize());
            } else {
                return first;
            }
        }
    }

    public String toString() {
        return "AACTrackImpl{sampleRate=" + this.firstHeader.sampleRate + ", channelconfig=" + this.firstHeader.channelconfig + '}';
    }
}
