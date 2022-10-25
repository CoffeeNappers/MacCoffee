package com.googlecode.mp4parser.authoring.tracks;

import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeReaderVariable;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.OriginalFormatBox;
import com.coremedia.iso.boxes.ProtectionSchemeInformationBox;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.SchemeInformationBox;
import com.coremedia.iso.boxes.SchemeTypeBox;
import com.coremedia.iso.boxes.SubSampleInformationBox;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.facebook.appevents.AppEventsConstants;
import com.googlecode.mp4parser.MemoryDataSourceImpl;
import com.googlecode.mp4parser.authoring.Edit;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.googlecode.mp4parser.authoring.tracks.h264.H264NalUnitHeader;
import com.googlecode.mp4parser.authoring.tracks.h264.H264TrackImpl;
import com.googlecode.mp4parser.authoring.tracks.h265.H265NalUnitHeader;
import com.googlecode.mp4parser.authoring.tracks.h265.H265TrackImpl;
import com.googlecode.mp4parser.boxes.cenc.CencEncryptingSampleList;
import com.googlecode.mp4parser.boxes.mp4.samplegrouping.CencSampleEncryptionInformationGroupEntry;
import com.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import com.googlecode.mp4parser.util.CastUtils;
import com.googlecode.mp4parser.util.RangeStartMap;
import com.mp4parser.iso14496.part15.AvcConfigurationBox;
import com.mp4parser.iso14496.part15.HevcConfigurationBox;
import com.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import com.mp4parser.iso23001.part7.TrackEncryptionBox;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import javax.crypto.SecretKey;
/* loaded from: classes2.dex */
public class CencEncryptingTrackImpl implements CencEncryptedTrack {
    List<CencSampleAuxiliaryDataFormat> cencSampleAuxiliaryData;
    Object configurationBox;
    UUID defaultKeyId;
    boolean dummyIvs;
    private final String encryptionAlgo;
    RangeStartMap<Integer, SecretKey> indexToKey;
    Map<UUID, SecretKey> keys;
    Map<GroupEntry, long[]> sampleGroups;
    List<Sample> samples;
    Track source;
    SampleDescriptionBox stsd;
    boolean subSampleEncryption;

    public CencEncryptingTrackImpl(Track source, UUID defaultKeyId, SecretKey key, boolean dummyIvs) {
        this(source, defaultKeyId, Collections.singletonMap(defaultKeyId, key), null, "cenc", dummyIvs);
    }

    public CencEncryptingTrackImpl(Track source, UUID defaultKeyId, Map<UUID, SecretKey> keys, Map<CencSampleEncryptionInformationGroupEntry, long[]> keyRotation, String encryptionAlgo, boolean dummyIvs) {
        this(source, defaultKeyId, keys, keyRotation, encryptionAlgo, dummyIvs, false);
    }

    public CencEncryptingTrackImpl(Track source, UUID defaultKeyId, Map<UUID, SecretKey> keys, Map<CencSampleEncryptionInformationGroupEntry, long[]> keyRotation, String encryptionAlgo, boolean dummyIvs, boolean encryptButAllClear) {
        int clearBytes;
        this.keys = new HashMap();
        this.dummyIvs = false;
        this.subSampleEncryption = false;
        this.stsd = null;
        this.source = source;
        this.keys = keys;
        this.defaultKeyId = defaultKeyId;
        this.dummyIvs = dummyIvs;
        this.encryptionAlgo = encryptionAlgo;
        this.sampleGroups = new HashMap();
        for (Map.Entry<GroupEntry, long[]> entry : source.getSampleGroups().entrySet()) {
            if (!(entry.getKey() instanceof CencSampleEncryptionInformationGroupEntry)) {
                this.sampleGroups.put(entry.getKey(), entry.getValue());
            }
        }
        if (keyRotation != null) {
            for (Map.Entry<CencSampleEncryptionInformationGroupEntry, long[]> entry2 : keyRotation.entrySet()) {
                this.sampleGroups.put(entry2.getKey(), entry2.getValue());
            }
        }
        this.sampleGroups = new HashMap<GroupEntry, long[]>(this.sampleGroups) { // from class: com.googlecode.mp4parser.authoring.tracks.CencEncryptingTrackImpl.1
            @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
            public long[] put(GroupEntry key, long[] value) {
                if (key instanceof CencSampleEncryptionInformationGroupEntry) {
                    throw new RuntimeException("Please supply CencSampleEncryptionInformationGroupEntries in the constructor");
                }
                return (long[]) super.put((AnonymousClass1) key, (GroupEntry) value);
            }
        };
        this.samples = source.getSamples();
        this.cencSampleAuxiliaryData = new ArrayList();
        BigInteger one = new BigInteger(AppEventsConstants.EVENT_PARAM_VALUE_YES);
        byte[] init = new byte[8];
        if (!dummyIvs) {
            Random random = new SecureRandom();
            random.nextBytes(init);
        }
        BigInteger ivInt = new BigInteger(1, init);
        List<CencSampleEncryptionInformationGroupEntry> groupEntries = new ArrayList<>();
        if (keyRotation != null) {
            groupEntries.addAll(keyRotation.keySet());
        }
        this.indexToKey = new RangeStartMap<>();
        int lastSampleGroupDescriptionIndex = -1;
        for (int i = 0; i < source.getSamples().size(); i++) {
            int index = 0;
            for (int j = 0; j < groupEntries.size(); j++) {
                CencSampleEncryptionInformationGroupEntry groupEntry = groupEntries.get(j);
                long[] sampleNums = getSampleGroups().get(groupEntry);
                if (Arrays.binarySearch(sampleNums, i) >= 0) {
                    index = j + 1;
                }
            }
            if (lastSampleGroupDescriptionIndex != index) {
                if (index == 0) {
                    this.indexToKey.put((RangeStartMap<Integer, SecretKey>) Integer.valueOf(i), (Integer) keys.get(defaultKeyId));
                } else if (groupEntries.get(index - 1).getKid() != null) {
                    SecretKey sk = keys.get(groupEntries.get(index - 1).getKid());
                    if (sk == null) {
                        throw new RuntimeException("Key " + groupEntries.get(index - 1).getKid() + " was not supplied for decryption");
                    }
                    this.indexToKey.put((RangeStartMap<Integer, SecretKey>) Integer.valueOf(i), (Integer) sk);
                } else {
                    this.indexToKey.put((RangeStartMap<Integer, SecretKey>) Integer.valueOf(i), (Integer) null);
                }
                lastSampleGroupDescriptionIndex = index;
            }
        }
        List<Box> boxes = source.getSampleDescriptionBox().getSampleEntry().getBoxes();
        int nalLengthSize = -1;
        for (Box box : boxes) {
            if (box instanceof AvcConfigurationBox) {
                this.configurationBox = box;
                AvcConfigurationBox avcC = (AvcConfigurationBox) box;
                this.subSampleEncryption = true;
                nalLengthSize = avcC.getLengthSizeMinusOne() + 1;
            }
            if (box instanceof HevcConfigurationBox) {
                this.configurationBox = box;
                HevcConfigurationBox hvcC = (HevcConfigurationBox) box;
                this.subSampleEncryption = true;
                nalLengthSize = hvcC.getLengthSizeMinusOne() + 1;
            }
        }
        for (int i2 = 0; i2 < this.samples.size(); i2++) {
            Sample origSample = this.samples.get(i2);
            CencSampleAuxiliaryDataFormat e = new CencSampleAuxiliaryDataFormat();
            this.cencSampleAuxiliaryData.add(e);
            if (this.indexToKey.get(Integer.valueOf(i2)) != null) {
                byte[] iv = ivInt.toByteArray();
                byte[] eightByteIv = new byte[8];
                System.arraycopy(iv, iv.length + (-8) > 0 ? iv.length - 8 : 0, eightByteIv, 8 - iv.length < 0 ? 0 : 8 - iv.length, iv.length > 8 ? 8 : iv.length);
                e.iv = eightByteIv;
                ByteBuffer sample = (ByteBuffer) origSample.asByteBuffer().rewind();
                if (this.subSampleEncryption) {
                    if (encryptButAllClear) {
                        e.pairs = new CencSampleAuxiliaryDataFormat.Pair[]{e.createPair(sample.remaining(), 0L)};
                    } else {
                        List<CencSampleAuxiliaryDataFormat.Pair> pairs = new ArrayList<>(5);
                        while (sample.remaining() > 0) {
                            int nalLength = CastUtils.l2i(IsoTypeReaderVariable.read(sample, nalLengthSize));
                            int nalGrossSize = nalLength + nalLengthSize;
                            if (nalGrossSize < 112 || isClearNal(sample.duplicate())) {
                                clearBytes = nalGrossSize;
                            } else {
                                clearBytes = (nalGrossSize % 16) + 96;
                            }
                            pairs.add(e.createPair(clearBytes, nalGrossSize - clearBytes));
                            sample.position(sample.position() + nalLength);
                        }
                        e.pairs = (CencSampleAuxiliaryDataFormat.Pair[]) pairs.toArray(new CencSampleAuxiliaryDataFormat.Pair[pairs.size()]);
                    }
                }
                ivInt = ivInt.add(one);
            }
        }
    }

    @Override // com.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack
    public UUID getDefaultKeyId() {
        return this.defaultKeyId;
    }

    @Override // com.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack
    public boolean hasSubSampleEncryption() {
        return this.subSampleEncryption;
    }

    @Override // com.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack
    public List<CencSampleAuxiliaryDataFormat> getSampleEncryptionEntries() {
        return this.cencSampleAuxiliaryData;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public synchronized SampleDescriptionBox getSampleDescriptionBox() {
        if (this.stsd == null) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try {
                this.source.getSampleDescriptionBox().getBox(Channels.newChannel(baos));
                this.stsd = (SampleDescriptionBox) new IsoFile(new MemoryDataSourceImpl(baos.toByteArray())).getBoxes().get(0);
                OriginalFormatBox originalFormatBox = new OriginalFormatBox();
                originalFormatBox.setDataFormat(this.stsd.getSampleEntry().getType());
                if (this.stsd.getSampleEntry() instanceof AudioSampleEntry) {
                    ((AudioSampleEntry) this.stsd.getSampleEntry()).setType(AudioSampleEntry.TYPE_ENCRYPTED);
                } else if (this.stsd.getSampleEntry() instanceof VisualSampleEntry) {
                    ((VisualSampleEntry) this.stsd.getSampleEntry()).setType(VisualSampleEntry.TYPE_ENCRYPTED);
                } else {
                    throw new RuntimeException("I don't know how to cenc " + this.stsd.getSampleEntry().getType());
                }
                ProtectionSchemeInformationBox sinf = new ProtectionSchemeInformationBox();
                sinf.addBox(originalFormatBox);
                SchemeTypeBox schm = new SchemeTypeBox();
                schm.setSchemeType(this.encryptionAlgo);
                schm.setSchemeVersion(65536);
                sinf.addBox(schm);
                SchemeInformationBox schi = new SchemeInformationBox();
                TrackEncryptionBox trackEncryptionBox = new TrackEncryptionBox();
                trackEncryptionBox.setDefaultIvSize(this.defaultKeyId == null ? 0 : 8);
                trackEncryptionBox.setDefaultAlgorithmId(this.defaultKeyId == null ? 0 : 1);
                trackEncryptionBox.setDefault_KID(this.defaultKeyId == null ? new UUID(0L, 0L) : this.defaultKeyId);
                schi.addBox(trackEncryptionBox);
                sinf.addBox(schi);
                this.stsd.getSampleEntry().addBox(sinf);
            } catch (IOException e) {
                throw new RuntimeException("Dumping stsd to memory failed");
            }
        }
        return this.stsd;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.source.getSampleDurations();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long getDuration() {
        return this.source.getDuration();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<CompositionTimeToSample.Entry> getCompositionTimeEntries() {
        return this.source.getCompositionTimeEntries();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSyncSamples() {
        return this.source.getSyncSamples();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<SampleDependencyTypeBox.Entry> getSampleDependencies() {
        return this.source.getSampleDependencies();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.source.getTrackMetaData();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return this.source.getHandler();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return new CencEncryptingSampleList(this.indexToKey, this.source.getSamples(), this.cencSampleAuxiliaryData, this.encryptionAlgo);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SubSampleInformationBox getSubsampleInformationBox() {
        return this.source.getSubsampleInformationBox();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.source.close();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getName() {
        return "enc(" + this.source.getName() + ")";
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Edit> getEdits() {
        return this.source.getEdits();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public Map<GroupEntry, long[]> getSampleGroups() {
        return this.sampleGroups;
    }

    public boolean isClearNal(ByteBuffer s) {
        if (this.configurationBox instanceof HevcConfigurationBox) {
            H265NalUnitHeader nuh = H265TrackImpl.getNalUnitHeader(s.slice());
            return (nuh.nalUnitType < 0 || nuh.nalUnitType > 9) && (nuh.nalUnitType < 16 || nuh.nalUnitType > 21) && (nuh.nalUnitType < 16 || nuh.nalUnitType > 21);
        } else if (this.configurationBox instanceof AvcConfigurationBox) {
            H264NalUnitHeader nuh2 = H264TrackImpl.getNalUnitHeader(s.slice());
            return (nuh2.nal_unit_type == 19 || nuh2.nal_unit_type == 2 || nuh2.nal_unit_type == 3 || nuh2.nal_unit_type == 4 || nuh2.nal_unit_type == 20 || nuh2.nal_unit_type == 5 || nuh2.nal_unit_type == 1) ? false : true;
        } else {
            throw new RuntimeException("Subsample encryption is activated but the CencEncryptingTrackImpl can't say if this sample is to be encrypted or not!");
        }
    }
}
