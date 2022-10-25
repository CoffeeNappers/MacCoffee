package com.googlecode.mp4parser.authoring.tracks;

import android.support.v4.media.session.PlaybackStateCompat;
import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.facebook.imagepipeline.memory.BitmapCounterProvider;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.googlecode.mp4parser.boxes.DTSSpecificBox;
import com.vk.media.camera.CameraUtils;
import io.reactivex.annotations.SchedulerSupport;
import java.io.EOFException;
import java.io.IOException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/* loaded from: classes2.dex */
public class DTSTrackImpl extends AbstractTrack {
    private static final int BUFFER = 67108864;
    int bcCoreBitRate;
    int bcCoreChannelMask;
    int bcCoreMaxSampleRate;
    int bitrate;
    int channelCount;
    int channelMask;
    int codecDelayAtMaxFs;
    int coreBitRate;
    int coreChannelMask;
    int coreFramePayloadInBytes;
    int coreMaxSampleRate;
    boolean coreSubStreamPresent;
    private int dataOffset;
    private DataSource dataSource;
    DTSSpecificBox ddts;
    int extAvgBitrate;
    int extFramePayloadInBytes;
    int extPeakBitrate;
    int extSmoothBuffSize;
    boolean extensionSubStreamPresent;
    int frameSize;
    boolean isVBR;
    private String lang;
    int lbrCodingPresent;
    int lsbTrimPercent;
    int maxSampleRate;
    int numExtSubStreams;
    int numFramesTotal;
    int numSamplesOrigAudioAtMaxFs;
    SampleDescriptionBox sampleDescriptionBox;
    private long[] sampleDurations;
    int sampleSize;
    int samplerate;
    private List<Sample> samples;
    int samplesPerFrame;
    int samplesPerFrameAtMaxFs;
    TrackMetaData trackMetaData;
    String type;

    public DTSTrackImpl(DataSource dataSource, String lang) throws IOException {
        super(dataSource.toString());
        this.trackMetaData = new TrackMetaData();
        this.frameSize = 0;
        this.dataOffset = 0;
        this.ddts = new DTSSpecificBox();
        this.isVBR = false;
        this.coreSubStreamPresent = false;
        this.extensionSubStreamPresent = false;
        this.numExtSubStreams = 0;
        this.coreMaxSampleRate = 0;
        this.coreBitRate = 0;
        this.coreChannelMask = 0;
        this.coreFramePayloadInBytes = 0;
        this.extAvgBitrate = 0;
        this.extPeakBitrate = 0;
        this.extSmoothBuffSize = 0;
        this.extFramePayloadInBytes = 0;
        this.maxSampleRate = 0;
        this.lbrCodingPresent = 0;
        this.numFramesTotal = 0;
        this.samplesPerFrameAtMaxFs = 0;
        this.numSamplesOrigAudioAtMaxFs = 0;
        this.channelMask = 0;
        this.codecDelayAtMaxFs = 0;
        this.bcCoreMaxSampleRate = 0;
        this.bcCoreBitRate = 0;
        this.bcCoreChannelMask = 0;
        this.lsbTrimPercent = 0;
        this.type = SchedulerSupport.NONE;
        this.lang = "eng";
        this.lang = lang;
        this.dataSource = dataSource;
        parse();
    }

    public DTSTrackImpl(DataSource dataSource) throws IOException {
        super(dataSource.toString());
        this.trackMetaData = new TrackMetaData();
        this.frameSize = 0;
        this.dataOffset = 0;
        this.ddts = new DTSSpecificBox();
        this.isVBR = false;
        this.coreSubStreamPresent = false;
        this.extensionSubStreamPresent = false;
        this.numExtSubStreams = 0;
        this.coreMaxSampleRate = 0;
        this.coreBitRate = 0;
        this.coreChannelMask = 0;
        this.coreFramePayloadInBytes = 0;
        this.extAvgBitrate = 0;
        this.extPeakBitrate = 0;
        this.extSmoothBuffSize = 0;
        this.extFramePayloadInBytes = 0;
        this.maxSampleRate = 0;
        this.lbrCodingPresent = 0;
        this.numFramesTotal = 0;
        this.samplesPerFrameAtMaxFs = 0;
        this.numSamplesOrigAudioAtMaxFs = 0;
        this.channelMask = 0;
        this.codecDelayAtMaxFs = 0;
        this.bcCoreMaxSampleRate = 0;
        this.bcCoreBitRate = 0;
        this.bcCoreChannelMask = 0;
        this.lsbTrimPercent = 0;
        this.type = SchedulerSupport.NONE;
        this.lang = "eng";
        this.dataSource = dataSource;
        parse();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.dataSource.close();
    }

    private void parse() throws IOException {
        if (!readVariables()) {
            throw new IOException();
        }
        this.sampleDescriptionBox = new SampleDescriptionBox();
        AudioSampleEntry audioSampleEntry = new AudioSampleEntry(this.type);
        audioSampleEntry.setChannelCount(this.channelCount);
        audioSampleEntry.setSampleRate(this.samplerate);
        audioSampleEntry.setDataReferenceIndex(1);
        audioSampleEntry.setSampleSize(16);
        audioSampleEntry.addBox(this.ddts);
        this.sampleDescriptionBox.addBox(audioSampleEntry);
        this.trackMetaData.setCreationTime(new Date());
        this.trackMetaData.setModificationTime(new Date());
        this.trackMetaData.setLanguage(this.lang);
        this.trackMetaData.setTimescale(this.samplerate);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return this.samples;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.sampleDescriptionBox;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.sampleDurations;
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

    private void parseDtshdhdr(int size, ByteBuffer bb) {
        bb.getInt();
        bb.get();
        bb.getInt();
        bb.get();
        int bitwStreamMetadata = bb.getShort();
        bb.get();
        this.numExtSubStreams = bb.get();
        if ((bitwStreamMetadata & 1) == 1) {
            this.isVBR = true;
        }
        if ((bitwStreamMetadata & 8) == 8) {
            this.coreSubStreamPresent = true;
        }
        if ((bitwStreamMetadata & 16) == 16) {
            this.extensionSubStreamPresent = true;
            this.numExtSubStreams++;
        } else {
            this.numExtSubStreams = 0;
        }
        for (int i = 14; i < size; i++) {
            bb.get();
        }
    }

    private boolean parseCoressmd(int size, ByteBuffer bb) {
        int cmsr_1 = bb.get();
        int cmsr_2 = bb.getShort();
        this.coreMaxSampleRate = (cmsr_1 << 16) | (65535 & cmsr_2);
        this.coreBitRate = bb.getShort();
        this.coreChannelMask = bb.getShort();
        this.coreFramePayloadInBytes = bb.getInt();
        for (int i = 11; i < size; i++) {
            bb.get();
        }
        return true;
    }

    private boolean parseAuprhdr(int size, ByteBuffer bb) {
        bb.get();
        int bitwAupresData = bb.getShort();
        int a = bb.get();
        int b = bb.getShort();
        this.maxSampleRate = (a << 16) | (b & 65535);
        this.numFramesTotal = bb.getInt();
        this.samplesPerFrameAtMaxFs = bb.getShort();
        int a2 = bb.get();
        int b2 = bb.getInt();
        this.numSamplesOrigAudioAtMaxFs = (a2 << 32) | (b2 & 65535);
        this.channelMask = bb.getShort();
        this.codecDelayAtMaxFs = bb.getShort();
        int c = 21;
        if ((bitwAupresData & 3) == 3) {
            int a3 = bb.get();
            int b3 = bb.getShort();
            this.bcCoreMaxSampleRate = (a3 << 16) | (b3 & 65535);
            this.bcCoreBitRate = bb.getShort();
            this.bcCoreChannelMask = bb.getShort();
            c = 21 + 7;
        }
        if ((bitwAupresData & 4) > 0) {
            this.lsbTrimPercent = bb.get();
            c++;
        }
        if ((bitwAupresData & 8) > 0) {
            this.lbrCodingPresent = 1;
        }
        while (c < size) {
            bb.get();
            c++;
        }
        return true;
    }

    private boolean parseExtssmd(int size, ByteBuffer bb) {
        int i;
        int a = bb.get();
        int b = bb.getShort();
        this.extAvgBitrate = (a << 16) | (b & 65535);
        if (this.isVBR) {
            int a2 = bb.get();
            int b2 = bb.getShort();
            this.extPeakBitrate = (a2 << 16) | (b2 & 65535);
            this.extSmoothBuffSize = bb.getShort();
            i = 3 + 5;
        } else {
            this.extFramePayloadInBytes = bb.getInt();
            i = 3 + 4;
        }
        while (i < size) {
            bb.get();
            i++;
        }
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x0276, code lost:
        if (r21 != 1191201283) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x027b, code lost:
        if (r23 != 1) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x027d, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x027e, code lost:
        r23 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0286, code lost:
        if (r21 != 496366178) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x028b, code lost:
        if (r22 != 1) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x028d, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x028e, code lost:
        r22 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0296, code lost:
        if (r21 != 1700671838) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x029b, code lost:
        if (r24 != 1) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x029d, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x029e, code lost:
        r24 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x02a6, code lost:
        if (r21 != 176167201) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x02ab, code lost:
        if (r19 != 1) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x02ad, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x02ae, code lost:
        r19 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x02b6, code lost:
        if (r21 != 1101174087) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x02bb, code lost:
        if (r26 != 1) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x02bd, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x02be, code lost:
        r26 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x02c6, code lost:
        if (r21 != 45126241) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x02cb, code lost:
        if (r18 != 1) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x02cd, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x02ce, code lost:
        r18 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x02ea, code lost:
        throw new java.io.IOException("No DTS_SYNCWORD_* found at " + r9.position());
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x02eb, code lost:
        r27 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x02ef, code lost:
        r27 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x02f3, code lost:
        r27 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x02f7, code lost:
        r27 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x02fb, code lost:
        r12 = 31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x02fd, code lost:
        switch(r2) {
            case 0: goto L293;
            case 1: goto L119;
            case 2: goto L293;
            case 3: goto L119;
            case 4: goto L293;
            case 5: goto L293;
            case 6: goto L293;
            case 7: goto L293;
            case 8: goto L293;
            case 9: goto L293;
            default: goto L119;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x0300, code lost:
        r44 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0302, code lost:
        if (r8 != 0) goto L175;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x0307, code lost:
        if (r26 != 1) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x0309, code lost:
        if (r18 != 0) goto L157;
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x030b, code lost:
        r44 = 17;
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x0314, code lost:
        r52.samplerate = r52.maxSampleRate;
        r52.sampleSize = 24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x0322, code lost:
        r52.ddts.setDTSSamplingFrequency(r52.maxSampleRate);
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x0332, code lost:
        if (r52.isVBR == false) goto L156;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x0334, code lost:
        r52.ddts.setMaxBitRate((r52.coreBitRate + r52.extPeakBitrate) * 1000);
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0347, code lost:
        r52.ddts.setAvgBitRate((r52.coreBitRate + r52.extAvgBitrate) * 1000);
        r52.ddts.setPcmSampleDepth(r52.sampleSize);
        r52.ddts.setFrameDuration(r27);
        r52.ddts.setStreamConstruction(r44);
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x037d, code lost:
        if ((r52.coreChannelMask & 8) > 0) goto L155;
     */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x0385, code lost:
        if ((r52.coreChannelMask & 4096) <= 0) goto L133;
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x0387, code lost:
        r52.ddts.setCoreLFEPresent(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:0x038f, code lost:
        r52.ddts.setCoreLayout(r12);
        r52.ddts.setCoreSize(r52.coreFramePayloadInBytes);
        r52.ddts.setStereoDownmix(0);
        r52.ddts.setRepresentationType(4);
        r52.ddts.setChannelLayout(r52.channelMask);
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x03c0, code lost:
        if (r52.coreMaxSampleRate <= 0) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x03c6, code lost:
        if (r52.extAvgBitrate <= 0) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x03c8, code lost:
        r52.ddts.setMultiAssetFlag(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x03d0, code lost:
        r52.ddts.setLBRDurationMod(r52.lbrCodingPresent);
        r52.ddts.setReservedBoxPresent(0);
        r52.channelCount = 0;
        r10 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x03eb, code lost:
        if (r10 < 16) goto L142;
     */
    /* JADX WARN: Code restructure failed: missing block: B:166:0x03ed, code lost:
        r52.samples = generateSamples(r52.dataSource, r52.dataOffset, r6, r8);
        r52.sampleDurations = new long[r52.samples.size()];
        java.util.Arrays.fill(r52.sampleDurations, r52.samplesPerFrame);
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x041c, code lost:
        r12 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:168:0x041f, code lost:
        r44 = 21;
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:170:0x042d, code lost:
        if (r19 != 1) goto L161;
     */
    /* JADX WARN: Code restructure failed: missing block: B:171:0x042f, code lost:
        r44 = 18;
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x043d, code lost:
        if (r18 != 1) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:174:0x043f, code lost:
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:175:0x0446, code lost:
        if (r23 != 0) goto L167;
     */
    /* JADX WARN: Code restructure failed: missing block: B:176:0x0448, code lost:
        if (r26 != 0) goto L167;
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x044a, code lost:
        r44 = 19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:179:0x0451, code lost:
        if (r23 != 1) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:180:0x0453, code lost:
        if (r26 != 0) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:181:0x0455, code lost:
        r44 = 20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:182:0x0459, code lost:
        if (r23 != 0) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:184:0x045e, code lost:
        if (r26 != 1) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:185:0x0460, code lost:
        r44 = 21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:187:0x0467, code lost:
        if (r20 >= 1) goto L184;
     */
    /* JADX WARN: Code restructure failed: missing block: B:188:0x0469, code lost:
        if (r16 <= 0) goto L183;
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x046b, code lost:
        switch(r17) {
            case 0: goto L180;
            case 2: goto L181;
            case 6: goto L182;
            default: goto L179;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:0x046e, code lost:
        r44 = 0;
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:191:0x0479, code lost:
        r44 = 2;
        r52.type = "dtsc";
     */
    /* JADX WARN: Code restructure failed: missing block: B:192:0x0484, code lost:
        r44 = 4;
        r52.type = "dtsc";
     */
    /* JADX WARN: Code restructure failed: missing block: B:193:0x048f, code lost:
        r44 = 3;
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x049a, code lost:
        r44 = 1;
        r52.type = "dtsc";
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x04a5, code lost:
        r52.type = com.coremedia.iso.boxes.sampleentry.AudioSampleEntry.TYPE12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x04ac, code lost:
        if (r16 != 0) goto L236;
     */
    /* JADX WARN: Code restructure failed: missing block: B:197:0x04ae, code lost:
        if (r18 != 0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x04b3, code lost:
        if (r23 != 1) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:200:0x04b5, code lost:
        if (r22 != 0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:201:0x04b7, code lost:
        if (r24 != 0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:202:0x04b9, code lost:
        if (r26 != 0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x04bb, code lost:
        if (r19 != 0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x04bd, code lost:
        r44 = 5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:205:0x04c1, code lost:
        if (r18 != 0) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:206:0x04c3, code lost:
        if (r23 != 0) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:207:0x04c5, code lost:
        if (r22 != 0) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:209:0x04ca, code lost:
        if (r24 != 1) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0067, code lost:
        r6 = r9.getLong();
        r52.dataOffset = r9.position();
        r2 = -1;
        r17 = 0;
        r16 = 0;
        r8 = -1;
        r20 = -1;
        r25 = 0;
        r23 = 0;
        r22 = 0;
        r24 = 0;
        r19 = 0;
        r26 = 0;
        r18 = 0;
        r15 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:210:0x04cc, code lost:
        if (r26 != 0) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:211:0x04ce, code lost:
        if (r19 != 0) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:212:0x04d0, code lost:
        r44 = 6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:213:0x04d4, code lost:
        if (r18 != 0) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x04d9, code lost:
        if (r23 != 1) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x04db, code lost:
        if (r22 != 0) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x04e0, code lost:
        if (r24 != 1) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x04e2, code lost:
        if (r26 != 0) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x008a, code lost:
        if (r15 == false) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:220:0x04e4, code lost:
        if (r19 != 0) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:221:0x04e6, code lost:
        r44 = 9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:222:0x04ea, code lost:
        if (r18 != 0) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:223:0x04ec, code lost:
        if (r23 != 0) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:225:0x04f1, code lost:
        if (r22 != 1) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:226:0x04f3, code lost:
        if (r24 != 0) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:227:0x04f5, code lost:
        if (r26 != 0) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:228:0x04f7, code lost:
        if (r19 != 0) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:229:0x04f9, code lost:
        r44 = 10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x008c, code lost:
        r27 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:230:0x04fd, code lost:
        if (r18 != 0) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:232:0x0502, code lost:
        if (r23 != 1) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:234:0x0507, code lost:
        if (r22 != 1) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x0509, code lost:
        if (r24 != 0) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:236:0x050b, code lost:
        if (r26 != 0) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:237:0x050d, code lost:
        if (r19 != 0) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:238:0x050f, code lost:
        r44 = 13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:239:0x0513, code lost:
        if (r18 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0092, code lost:
        switch(r52.samplesPerFrame) {
            case 512: goto L294;
            case 1024: goto L295;
            case 2048: goto L296;
            case 4096: goto L297;
            default: goto L114;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:240:0x0515, code lost:
        if (r23 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:241:0x0517, code lost:
        if (r22 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:242:0x0519, code lost:
        if (r24 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:244:0x051e, code lost:
        if (r26 != 1) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:245:0x0520, code lost:
        if (r19 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:246:0x0522, code lost:
        r44 = 14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:247:0x0526, code lost:
        if (r17 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:248:0x0528, code lost:
        if (r18 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:249:0x052a, code lost:
        if (r23 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:250:0x052c, code lost:
        if (r22 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:252:0x0531, code lost:
        if (r24 != 1) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:253:0x0533, code lost:
        if (r26 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:254:0x0535, code lost:
        if (r19 != 0) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:255:0x0537, code lost:
        r44 = 7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:257:0x053e, code lost:
        if (r17 != 6) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:258:0x0540, code lost:
        if (r18 != 0) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:259:0x0542, code lost:
        if (r23 != 0) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0098, code lost:
        if (r27 != (-1)) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:260:0x0544, code lost:
        if (r22 != 0) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:262:0x0549, code lost:
        if (r24 != 1) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:263:0x054b, code lost:
        if (r26 != 0) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:264:0x054d, code lost:
        if (r19 != 0) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:265:0x054f, code lost:
        r44 = 8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:266:0x0553, code lost:
        if (r17 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:267:0x0555, code lost:
        if (r18 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:268:0x0557, code lost:
        if (r23 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x009a, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:270:0x055c, code lost:
        if (r22 != 1) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:271:0x055e, code lost:
        if (r24 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:272:0x0560, code lost:
        if (r26 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:273:0x0562, code lost:
        if (r19 != 0) goto L264;
     */
    /* JADX WARN: Code restructure failed: missing block: B:274:0x0564, code lost:
        r44 = 11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:276:0x056b, code lost:
        if (r17 != 6) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:277:0x056d, code lost:
        if (r18 != 0) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:278:0x056f, code lost:
        if (r23 != 0) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:280:0x0574, code lost:
        if (r22 != 1) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:281:0x0576, code lost:
        if (r24 != 0) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:282:0x0578, code lost:
        if (r26 != 0) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:283:0x057a, code lost:
        if (r19 != 0) goto L274;
     */
    /* JADX WARN: Code restructure failed: missing block: B:284:0x057c, code lost:
        r44 = 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:285:0x0580, code lost:
        if (r17 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:286:0x0582, code lost:
        if (r18 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:287:0x0584, code lost:
        if (r23 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:288:0x0586, code lost:
        if (r22 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:289:0x0588, code lost:
        if (r24 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:291:0x058d, code lost:
        if (r26 != 1) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:292:0x058f, code lost:
        if (r19 != 0) goto L283;
     */
    /* JADX WARN: Code restructure failed: missing block: B:293:0x0591, code lost:
        r44 = 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:295:0x0598, code lost:
        if (r17 != 2) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:296:0x059a, code lost:
        if (r18 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:297:0x059c, code lost:
        if (r23 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:298:0x059e, code lost:
        if (r22 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:299:0x05a0, code lost:
        if (r24 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:301:0x05a5, code lost:
        if (r26 != 1) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:302:0x05a7, code lost:
        if (r19 != 0) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:303:0x05a9, code lost:
        r44 = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:304:0x05ad, code lost:
        r52.ddts.setMaxBitRate((r52.coreBitRate + r52.extAvgBitrate) * 1000);
     */
    /* JADX WARN: Code restructure failed: missing block: B:305:0x05c2, code lost:
        r52.ddts.setCoreLFEPresent(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:306:0x05cc, code lost:
        r52.ddts.setMultiAssetFlag(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:308:0x05de, code lost:
        if (((r52.channelMask >> r10) & 1) != 1) goto L150;
     */
    /* JADX WARN: Code restructure failed: missing block: B:309:0x05e0, code lost:
        switch(r10) {
            case 0: goto L148;
            case 1: goto L145;
            case 2: goto L145;
            case 3: goto L148;
            case 4: goto L148;
            case 5: goto L145;
            case 6: goto L145;
            case 7: goto L148;
            case 8: goto L148;
            case 9: goto L145;
            case 10: goto L145;
            case 11: goto L145;
            case 12: goto L148;
            case 13: goto L145;
            case 14: goto L148;
            default: goto L145;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:310:0x05e3, code lost:
        r52.channelCount += 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:311:0x05ed, code lost:
        r10 = r10 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:312:0x05f1, code lost:
        r52.channelCount++;
     */
    /* JADX WARN: Code restructure failed: missing block: B:348:?, code lost:
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00f8, code lost:
        r38 = r9.position();
        r45 = r9.getInt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0105, code lost:
        if (r45 != 2147385345) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0108, code lost:
        if (r8 != 1) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x010a, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x010d, code lost:
        r8 = 1;
        r11 = new com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer(r9);
        r30 = r11.readBits(1);
        r42 = r11.readBits(5);
        r13 = r11.readBits(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0125, code lost:
        if (r30 != 1) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x012b, code lost:
        if (r42 != 31) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x012d, code lost:
        if (r13 == 0) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x012f, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0132, code lost:
        r33 = r11.readBits(7);
        r52.samplesPerFrame = (r33 + 1) * 32;
        r29 = r11.readBits(14);
        r52.frameSize += r29 + 1;
        r2 = r11.readBits(6);
        r41 = r11.readBits(4);
        r52.samplerate = getSampleRate(r41);
        r40 = r11.readBits(5);
        r52.bitrate = getBitRate(r40);
        r28 = r11.readBits(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x017c, code lost:
        if (r28 == 0) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x017e, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0181, code lost:
        r11.readBits(1);
        r11.readBits(1);
        r11.readBits(1);
        r11.readBits(1);
        r17 = r11.readBits(3);
        r16 = r11.readBits(1);
        r11.readBits(1);
        r11.readBits(2);
        r11.readBits(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01a8, code lost:
        if (r13 != 1) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01aa, code lost:
        r11.readBits(16);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x01af, code lost:
        r11.readBits(1);
        r48 = r11.readBits(4);
        r11.readBits(2);
        r39 = r11.readBits(3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x01c1, code lost:
        switch(r39) {
            case 0: goto L90;
            case 1: goto L90;
            case 2: goto L98;
            case 3: goto L98;
            case 4: goto L100;
            case 5: goto L99;
            case 6: goto L99;
            default: goto L100;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x01c4, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01c7, code lost:
        r52.sampleSize = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01cd, code lost:
        r11.readBits(1);
        r11.readBits(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01d6, code lost:
        switch(r48) {
            case 6: goto L96;
            case 7: goto L97;
            default: goto L93;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01d9, code lost:
        r11.readBits(4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01dd, code lost:
        r9.position((r38 + r29) + 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01e6, code lost:
        r52.sampleSize = 20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01ed, code lost:
        r52.sampleSize = 24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01f4, code lost:
        r14 = r11.readBits(4);
        r3 = -(r14 + 16);
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01fd, code lost:
        r14 = r11.readBits(4);
        r3 = -r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0209, code lost:
        if (r45 != 1683496997) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x020c, code lost:
        if (r8 != (-1)) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x020e, code lost:
        r8 = 0;
        r52.samplesPerFrame = r52.samplesPerFrameAtMaxFs;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0217, code lost:
        r20 = 1;
        r11 = new com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer(r9);
        r11.readBits(8);
        r11.readBits(2);
        r31 = r11.readBits(1);
        r35 = 12;
        r34 = 20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0230, code lost:
        if (r31 != 0) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0232, code lost:
        r35 = 8;
        r34 = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0236, code lost:
        r37 = r11.readBits(r35) + 1;
        r36 = r11.readBits(r34) + 1;
        r9.position(r38 + r37);
        r21 = r9.getInt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0254, code lost:
        if (r21 != 1515870810) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0259, code lost:
        if (r25 != 1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x025b, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x025c, code lost:
        r25 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x025e, code lost:
        if (r15 != false) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0260, code lost:
        r52.frameSize += r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x026a, code lost:
        r9.position(r38 + r36);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean readVariables() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1648
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.googlecode.mp4parser.authoring.tracks.DTSTrackImpl.readVariables():boolean");
    }

    private List<Sample> generateSamples(DataSource dataSource, int dataOffset, long dataSize, int corePresent) throws IOException {
        LookAhead la = new LookAhead(dataSource, dataOffset, dataSize, corePresent);
        List<Sample> mySamples = new ArrayList<>();
        while (true) {
            final ByteBuffer sample = la.findNextStart();
            if (sample != null) {
                mySamples.add(new Sample() { // from class: com.googlecode.mp4parser.authoring.tracks.DTSTrackImpl.1
                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public void writeTo(WritableByteChannel channel) throws IOException {
                        channel.write((ByteBuffer) sample.rewind());
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public long getSize() {
                        return sample.rewind().remaining();
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public ByteBuffer asByteBuffer() {
                        return sample;
                    }
                });
            } else {
                System.err.println("all samples found");
                return mySamples;
            }
        }
    }

    private int getBitRate(int rate) throws IOException {
        switch (rate) {
            case 0:
                return 32;
            case 1:
                return 56;
            case 2:
                return 64;
            case 3:
                return 96;
            case 4:
                return 112;
            case 5:
                return 128;
            case 6:
                return 192;
            case 7:
                return 224;
            case 8:
                return 256;
            case 9:
                return 320;
            case 10:
                return BitmapCounterProvider.MAX_BITMAP_COUNT;
            case 11:
                return 448;
            case 12:
                return 512;
            case 13:
                return 576;
            case 14:
                return CameraUtils.Settings.LOW_WIDTH;
            case 15:
                return 768;
            case 16:
                return 960;
            case 17:
                return 1024;
            case 18:
                return 1152;
            case 19:
                return 1280;
            case 20:
                return 1344;
            case 21:
                return 1408;
            case 22:
                return 1411;
            case 23:
                return 1472;
            case 24:
                return 1536;
            case 25:
                return -1;
            default:
                throw new IOException("Unknown bitrate value");
        }
    }

    private int getSampleRate(int sfreq) throws IOException {
        switch (sfreq) {
            case 1:
                return 8000;
            case 2:
                return 16000;
            case 3:
                return 32000;
            case 4:
            case 5:
            case 9:
            case 10:
            default:
                throw new IOException("Unknown Sample Rate");
            case 6:
                return 11025;
            case 7:
                return 22050;
            case 8:
                return 44100;
            case 11:
                return SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES;
            case 12:
                return 24000;
            case 13:
                return 48000;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class LookAhead {
        ByteBuffer buffer;
        long bufferStartPos;
        private final int corePresent;
        long dataEnd;
        DataSource dataSource;
        int inBufferPos = 0;
        long start;

        LookAhead(DataSource dataSource, long bufferStartPos, long dataSize, int corePresent) throws IOException {
            this.dataSource = dataSource;
            this.bufferStartPos = bufferStartPos;
            this.dataEnd = dataSize + bufferStartPos;
            this.corePresent = corePresent;
            fillBuffer();
        }

        public ByteBuffer findNextStart() throws IOException {
            while (true) {
                try {
                    if (this.corePresent == 1) {
                        if (nextFourEquals0x7FFE8001()) {
                            break;
                        }
                        discardByte();
                    } else if (nextFourEquals0x64582025()) {
                        break;
                    } else {
                        discardByte();
                    }
                } catch (EOFException e) {
                    return null;
                }
                return null;
            }
            discardNext4AndMarkStart();
            while (true) {
                if (this.corePresent == 1) {
                    if (nextFourEquals0x7FFE8001orEof()) {
                        break;
                    }
                    discardQWord();
                } else if (nextFourEquals0x64582025orEof()) {
                    break;
                } else {
                    discardQWord();
                }
                return null;
            }
            return getSample();
        }

        private void fillBuffer() throws IOException {
            System.err.println("Fill Buffer");
            this.buffer = this.dataSource.map(this.bufferStartPos, Math.min(this.dataEnd - this.bufferStartPos, 67108864L));
        }

        private boolean nextFourEquals0x64582025() throws IOException {
            return nextFourEquals((byte) 100, (byte) 88, (byte) 32, (byte) 37);
        }

        private boolean nextFourEquals0x7FFE8001() throws IOException {
            return nextFourEquals(Byte.MAX_VALUE, (byte) -2, Byte.MIN_VALUE, (byte) 1);
        }

        private boolean nextFourEquals(byte a, byte b, byte c, byte d) throws IOException {
            if (this.buffer.limit() - this.inBufferPos >= 4) {
                return this.buffer.get(this.inBufferPos) == a && this.buffer.get(this.inBufferPos + 1) == b && this.buffer.get(this.inBufferPos + 2) == c && this.buffer.get(this.inBufferPos + 3) == d;
            } else if (this.bufferStartPos + this.inBufferPos + 4 < this.dataSource.size()) {
                return false;
            } else {
                throw new EOFException();
            }
        }

        private boolean nextFourEquals0x64582025orEof() throws IOException {
            return nextFourEqualsOrEof((byte) 100, (byte) 88, (byte) 32, (byte) 37);
        }

        private boolean nextFourEquals0x7FFE8001orEof() throws IOException {
            return nextFourEqualsOrEof(Byte.MAX_VALUE, (byte) -2, Byte.MIN_VALUE, (byte) 1);
        }

        private boolean nextFourEqualsOrEof(byte a, byte b, byte c, byte d) throws IOException {
            if (this.buffer.limit() - this.inBufferPos >= 4) {
                if ((this.bufferStartPos + this.inBufferPos) % 1048576 == 0) {
                    System.err.println(new StringBuilder().append(((this.bufferStartPos + this.inBufferPos) / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID) / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID).toString());
                }
                return this.buffer.get(this.inBufferPos) == a && this.buffer.get(this.inBufferPos + 1) == b && this.buffer.get(this.inBufferPos + 2) == c && this.buffer.get(this.inBufferPos + 3) == d;
            } else if (this.bufferStartPos + this.inBufferPos + 4 > this.dataEnd) {
                return this.bufferStartPos + ((long) this.inBufferPos) == this.dataEnd;
            } else {
                this.bufferStartPos = this.start;
                this.inBufferPos = 0;
                fillBuffer();
                return nextFourEquals0x7FFE8001();
            }
        }

        private void discardByte() {
            this.inBufferPos++;
        }

        private void discardQWord() {
            this.inBufferPos += 4;
        }

        private void discardNext4AndMarkStart() {
            this.start = this.bufferStartPos + this.inBufferPos;
            this.inBufferPos += 4;
        }

        private ByteBuffer getSample() {
            if (this.start >= this.bufferStartPos) {
                this.buffer.position((int) (this.start - this.bufferStartPos));
                Buffer sample = this.buffer.slice();
                sample.limit((int) (this.inBufferPos - (this.start - this.bufferStartPos)));
                return (ByteBuffer) sample;
            }
            throw new RuntimeException("damn! NAL exceeds buffer");
        }
    }
}
