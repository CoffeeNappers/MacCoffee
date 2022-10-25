package com.googlecode.mp4parser.authoring.builder;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.Container;
import com.coremedia.iso.boxes.DataEntryUrlBox;
import com.coremedia.iso.boxes.DataInformationBox;
import com.coremedia.iso.boxes.DataReferenceBox;
import com.coremedia.iso.boxes.EditBox;
import com.coremedia.iso.boxes.EditListBox;
import com.coremedia.iso.boxes.FileTypeBox;
import com.coremedia.iso.boxes.HandlerBox;
import com.coremedia.iso.boxes.HintMediaHeaderBox;
import com.coremedia.iso.boxes.MediaBox;
import com.coremedia.iso.boxes.MediaHeaderBox;
import com.coremedia.iso.boxes.MediaInformationBox;
import com.coremedia.iso.boxes.MovieBox;
import com.coremedia.iso.boxes.MovieHeaderBox;
import com.coremedia.iso.boxes.NullMediaHeaderBox;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.SampleSizeBox;
import com.coremedia.iso.boxes.SampleTableBox;
import com.coremedia.iso.boxes.SampleToChunkBox;
import com.coremedia.iso.boxes.SchemeTypeBox;
import com.coremedia.iso.boxes.SoundMediaHeaderBox;
import com.coremedia.iso.boxes.StaticChunkOffsetBox;
import com.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import com.coremedia.iso.boxes.TimeToSampleBox;
import com.coremedia.iso.boxes.TrackBox;
import com.coremedia.iso.boxes.TrackHeaderBox;
import com.coremedia.iso.boxes.VideoMediaHeaderBox;
import com.coremedia.iso.boxes.fragment.MovieExtendsBox;
import com.coremedia.iso.boxes.fragment.MovieExtendsHeaderBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentHeaderBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentRandomAccessBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentRandomAccessOffsetBox;
import com.coremedia.iso.boxes.fragment.SampleFlags;
import com.coremedia.iso.boxes.fragment.TrackExtendsBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentBaseMediaDecodeTimeBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentRandomAccessBox;
import com.coremedia.iso.boxes.fragment.TrackRunBox;
import com.coremedia.iso.boxes.mdat.MediaDataBox;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.facebook.internal.NativeProtocol;
import com.googlecode.mp4parser.AbstractContainerBox;
import com.googlecode.mp4parser.BasicContainer;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.authoring.Edit;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack;
import com.googlecode.mp4parser.boxes.dece.SampleEncryptionBox;
import com.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import com.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleGroupDescriptionBox;
import com.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleToGroupBox;
import com.googlecode.mp4parser.util.CastUtils;
import com.googlecode.mp4parser.util.Path;
import com.mp4parser.iso14496.part12.SampleAuxiliaryInformationOffsetsBox;
import com.mp4parser.iso14496.part12.SampleAuxiliaryInformationSizesBox;
import com.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import com.mp4parser.iso23001.part7.TrackEncryptionBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
/* loaded from: classes2.dex */
public class FragmentedMp4Builder implements Mp4Builder {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final Logger LOG;
    protected Fragmenter fragmenter;

    static {
        $assertionsDisabled = !FragmentedMp4Builder.class.desiredAssertionStatus();
        LOG = Logger.getLogger(FragmentedMp4Builder.class.getName());
    }

    public Date getDate() {
        return new Date();
    }

    public Box createFtyp(Movie movie) {
        List<String> minorBrands = new LinkedList<>();
        minorBrands.add("mp42");
        minorBrands.add("iso6");
        minorBrands.add(VisualSampleEntry.TYPE3);
        minorBrands.add("isom");
        return new FileTypeBox("iso6", 1L, minorBrands);
    }

    protected List<Track> sortTracksInSequence(List<Track> tracks, final int cycle, final Map<Track, long[]> intersectionMap) {
        List<Track> tracks2 = new LinkedList<>(tracks);
        Collections.sort(tracks2, new Comparator<Track>() { // from class: com.googlecode.mp4parser.authoring.builder.FragmentedMp4Builder.1
            @Override // java.util.Comparator
            public int compare(Track o1, Track o2) {
                long startSample1 = ((long[]) intersectionMap.get(o1))[cycle];
                long startSample2 = ((long[]) intersectionMap.get(o2))[cycle];
                long[] decTimes1 = o1.getSampleDurations();
                long[] decTimes2 = o2.getSampleDurations();
                long startTime1 = 0;
                long startTime2 = 0;
                for (int i = 1; i < startSample1; i++) {
                    startTime1 += decTimes1[i - 1];
                }
                for (int i2 = 1; i2 < startSample2; i2++) {
                    startTime2 += decTimes2[i2 - 1];
                }
                return (int) (((startTime1 / o1.getTrackMetaData().getTimescale()) - (startTime2 / o2.getTrackMetaData().getTimescale())) * 100.0d);
            }
        });
        return tracks2;
    }

    protected List<Box> createMoofMdat(Movie movie) {
        List<Box> moofsMdats = new LinkedList<>();
        HashMap<Track, long[]> intersectionMap = new HashMap<>();
        HashMap<Track, Double> track2currentTime = new HashMap<>();
        for (Track track : movie.getTracks()) {
            long[] intersects = this.fragmenter.sampleNumbers(track);
            intersectionMap.put(track, intersects);
            track2currentTime.put(track, Double.valueOf(0.0d));
        }
        int sequence = 1;
        while (!intersectionMap.isEmpty()) {
            Track earliestTrack = null;
            double earliestTime = Double.MAX_VALUE;
            for (Map.Entry<Track, Double> trackEntry : track2currentTime.entrySet()) {
                if (trackEntry.getValue().doubleValue() < earliestTime) {
                    earliestTime = trackEntry.getValue().doubleValue();
                    Track earliestTrack2 = trackEntry.getKey();
                    earliestTrack = earliestTrack2;
                }
            }
            if (!$assertionsDisabled && earliestTrack == null) {
                throw new AssertionError();
            }
            long[] startSamples = intersectionMap.get(earliestTrack);
            long startSample = startSamples[0];
            long endSample = startSamples.length > 1 ? startSamples[1] : earliestTrack.getSamples().size() + 1;
            long[] times = earliestTrack.getSampleDurations();
            long timscale = earliestTrack.getTrackMetaData().getTimescale();
            for (long i = startSample; i < endSample; i++) {
                earliestTime += times[CastUtils.l2i(i - 1)] / timscale;
            }
            createFragment(moofsMdats, earliestTrack, startSample, endSample, sequence);
            if (startSamples.length == 1) {
                intersectionMap.remove(earliestTrack);
                track2currentTime.remove(earliestTrack);
            } else {
                long[] nuStartSamples = new long[startSamples.length - 1];
                System.arraycopy(startSamples, 1, nuStartSamples, 0, nuStartSamples.length);
                intersectionMap.put(earliestTrack, nuStartSamples);
                track2currentTime.put(earliestTrack, Double.valueOf(earliestTime));
            }
            sequence++;
        }
        return moofsMdats;
    }

    protected int createFragment(List<Box> moofsMdats, Track track, long startSample, long endSample, int sequence) {
        if (startSample != endSample) {
            moofsMdats.add(createMoof(startSample, endSample, track, sequence));
            moofsMdats.add(createMdat(startSample, endSample, track, sequence));
        }
        return sequence;
    }

    @Override // com.googlecode.mp4parser.authoring.builder.Mp4Builder
    public Container build(Movie movie) {
        LOG.fine("Creating movie " + movie);
        if (this.fragmenter == null) {
            this.fragmenter = new BetterFragmenter(2.0d);
        }
        BasicContainer isoFile = new BasicContainer();
        isoFile.addBox(createFtyp(movie));
        isoFile.addBox(createMoov(movie));
        for (Box box : createMoofMdat(movie)) {
            isoFile.addBox(box);
        }
        isoFile.addBox(createMfra(movie, isoFile));
        return isoFile;
    }

    protected Box createMdat(final long startSample, final long endSample, final Track track, int i) {
        return new Box() { // from class: com.googlecode.mp4parser.authoring.builder.FragmentedMp4Builder.1Mdat
            Container parent;
            long size_ = -1;

            @Override // com.coremedia.iso.boxes.Box
            public Container getParent() {
                return this.parent;
            }

            @Override // com.coremedia.iso.boxes.Box
            public void setParent(Container parent) {
                this.parent = parent;
            }

            @Override // com.coremedia.iso.boxes.Box
            public long getOffset() {
                throw new RuntimeException("Doesn't have any meaning for programmatically created boxes");
            }

            @Override // com.coremedia.iso.boxes.Box
            public long getSize() {
                if (this.size_ != -1) {
                    return this.size_;
                }
                long size = 8;
                for (Sample sample : FragmentedMp4Builder.this.getSamples(startSample, endSample, track)) {
                    size += sample.getSize();
                }
                this.size_ = size;
                return size;
            }

            @Override // com.coremedia.iso.boxes.Box
            public String getType() {
                return MediaDataBox.TYPE;
            }

            @Override // com.coremedia.iso.boxes.Box
            public void getBox(WritableByteChannel writableByteChannel) throws IOException {
                ByteBuffer header = ByteBuffer.allocate(8);
                IsoTypeWriter.writeUInt32(header, CastUtils.l2i(getSize()));
                header.put(IsoFile.fourCCtoBytes(getType()));
                header.rewind();
                writableByteChannel.write(header);
                List<Sample> samples = FragmentedMp4Builder.this.getSamples(startSample, endSample, track);
                for (Sample sample : samples) {
                    sample.writeTo(writableByteChannel);
                }
            }

            @Override // com.coremedia.iso.boxes.Box
            public void parse(DataSource fileChannel, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
            }
        };
    }

    protected void createTfhd(long startSample, long endSample, Track track, int sequenceNumber, TrackFragmentBox parent) {
        TrackFragmentHeaderBox tfhd = new TrackFragmentHeaderBox();
        SampleFlags sf = new SampleFlags();
        tfhd.setDefaultSampleFlags(sf);
        tfhd.setBaseDataOffset(-1L);
        tfhd.setTrackId(track.getTrackMetaData().getTrackId());
        tfhd.setDefaultBaseIsMoof(true);
        parent.addBox(tfhd);
    }

    protected void createMfhd(long startSample, long endSample, Track track, int sequenceNumber, MovieFragmentBox parent) {
        MovieFragmentHeaderBox mfhd = new MovieFragmentHeaderBox();
        mfhd.setSequenceNumber(sequenceNumber);
        parent.addBox(mfhd);
    }

    protected void createTraf(long startSample, long endSample, Track track, int sequenceNumber, MovieFragmentBox parent) {
        TrackFragmentBox traf = new TrackFragmentBox();
        parent.addBox(traf);
        createTfhd(startSample, endSample, track, sequenceNumber, traf);
        createTfdt(startSample, track, traf);
        createTrun(startSample, endSample, track, sequenceNumber, traf);
        if (track instanceof CencEncryptedTrack) {
            createSaiz(startSample, endSample, (CencEncryptedTrack) track, sequenceNumber, traf);
            createSenc(startSample, endSample, (CencEncryptedTrack) track, sequenceNumber, traf);
            createSaio(startSample, endSample, (CencEncryptedTrack) track, sequenceNumber, traf);
        }
        Map<String, List<GroupEntry>> groupEntryFamilies = new HashMap<>();
        for (Map.Entry<GroupEntry, long[]> sg : track.getSampleGroups().entrySet()) {
            String type = sg.getKey().getType();
            List<GroupEntry> groupEntries = groupEntryFamilies.get(type);
            if (groupEntries == null) {
                groupEntries = new ArrayList<>();
                groupEntryFamilies.put(type, groupEntries);
            }
            groupEntries.add(sg.getKey());
        }
        for (Map.Entry<String, List<GroupEntry>> sg2 : groupEntryFamilies.entrySet()) {
            SampleGroupDescriptionBox sgpd = new SampleGroupDescriptionBox();
            String type2 = sg2.getKey();
            sgpd.setGroupEntries(sg2.getValue());
            sgpd.setGroupingType(type2);
            SampleToGroupBox sbgp = new SampleToGroupBox();
            sbgp.setGroupingType(type2);
            SampleToGroupBox.Entry last = null;
            for (int i = CastUtils.l2i(startSample - 1); i < CastUtils.l2i(endSample - 1); i++) {
                int index = 0;
                for (int j = 0; j < sg2.getValue().size(); j++) {
                    GroupEntry groupEntry = sg2.getValue().get(j);
                    long[] sampleNums = track.getSampleGroups().get(groupEntry);
                    if (Arrays.binarySearch(sampleNums, i) >= 0) {
                        index = j + NativeProtocol.MESSAGE_GET_ACCESS_TOKEN_REPLY;
                    }
                }
                if (last == null || last.getGroupDescriptionIndex() != index) {
                    last = new SampleToGroupBox.Entry(1L, index);
                    sbgp.getEntries().add(last);
                } else {
                    last.setSampleCount(last.getSampleCount() + 1);
                }
            }
            traf.addBox(sgpd);
            traf.addBox(sbgp);
        }
    }

    protected void createSenc(long startSample, long endSample, CencEncryptedTrack track, int sequenceNumber, TrackFragmentBox parent) {
        SampleEncryptionBox senc = new SampleEncryptionBox();
        senc.setSubSampleEncryption(track.hasSubSampleEncryption());
        senc.setEntries(track.getSampleEncryptionEntries().subList(CastUtils.l2i(startSample - 1), CastUtils.l2i(endSample - 1)));
        parent.addBox(senc);
    }

    protected void createSaio(long startSample, long endSample, CencEncryptedTrack track, int sequenceNumber, TrackFragmentBox parent) {
        Box box;
        SchemeTypeBox schemeTypeBox = (SchemeTypeBox) Path.getPath((AbstractContainerBox) track.getSampleDescriptionBox(), "enc.[0]/sinf[0]/schm[0]");
        SampleAuxiliaryInformationOffsetsBox saio = new SampleAuxiliaryInformationOffsetsBox();
        parent.addBox(saio);
        if ($assertionsDisabled || parent.getBoxes(TrackRunBox.class).size() == 1) {
            saio.setAuxInfoType("cenc");
            saio.setFlags(1);
            long offset = 0 + 8;
            Iterator<Box> it = parent.getBoxes().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Box box2 = it.next();
                if (box2 instanceof SampleEncryptionBox) {
                    offset += ((SampleEncryptionBox) box2).getOffsetToFirstIV();
                    break;
                }
                offset += box2.getSize();
            }
            MovieFragmentBox moof = (MovieFragmentBox) parent.getParent();
            long offset2 = offset + 16;
            Iterator<Box> it2 = moof.getBoxes().iterator();
            while (it2.hasNext() && (box = it2.next()) != parent) {
                offset2 += box.getSize();
            }
            saio.setOffsets(new long[]{offset2});
            return;
        }
        throw new AssertionError("Don't know how to deal with multiple Track Run Boxes when encrypting");
    }

    protected void createSaiz(long startSample, long endSample, CencEncryptedTrack track, int sequenceNumber, TrackFragmentBox parent) {
        SampleDescriptionBox sampleDescriptionBox = track.getSampleDescriptionBox();
        SchemeTypeBox schemeTypeBox = (SchemeTypeBox) Path.getPath((AbstractContainerBox) sampleDescriptionBox, "enc.[0]/sinf[0]/schm[0]");
        TrackEncryptionBox tenc = (TrackEncryptionBox) Path.getPath((AbstractContainerBox) sampleDescriptionBox, "enc.[0]/sinf[0]/schi[0]/tenc[0]");
        SampleAuxiliaryInformationSizesBox saiz = new SampleAuxiliaryInformationSizesBox();
        saiz.setAuxInfoType("cenc");
        saiz.setFlags(1);
        if (track.hasSubSampleEncryption()) {
            short[] sizes = new short[CastUtils.l2i(endSample - startSample)];
            List<CencSampleAuxiliaryDataFormat> auxs = track.getSampleEncryptionEntries().subList(CastUtils.l2i(startSample - 1), CastUtils.l2i(endSample - 1));
            for (int i = 0; i < sizes.length; i++) {
                sizes[i] = (short) auxs.get(i).getSize();
            }
            saiz.setSampleInfoSizes(sizes);
        } else {
            saiz.setDefaultSampleInfoSize(tenc.getDefaultIvSize());
            saiz.setSampleCount(CastUtils.l2i(endSample - startSample));
        }
        parent.addBox(saiz);
    }

    protected List<Sample> getSamples(long startSample, long endSample, Track track) {
        return track.getSamples().subList(CastUtils.l2i(startSample) - 1, CastUtils.l2i(endSample) - 1);
    }

    protected long[] getSampleSizes(long startSample, long endSample, Track track, int sequenceNumber) {
        List<Sample> samples = getSamples(startSample, endSample, track);
        long[] sampleSizes = new long[samples.size()];
        for (int i = 0; i < sampleSizes.length; i++) {
            sampleSizes[i] = samples.get(i).getSize();
        }
        return sampleSizes;
    }

    protected void createTfdt(long startSample, Track track, TrackFragmentBox parent) {
        TrackFragmentBaseMediaDecodeTimeBox tfdt = new TrackFragmentBaseMediaDecodeTimeBox();
        tfdt.setVersion(1);
        long startTime = 0;
        long[] times = track.getSampleDurations();
        for (int i = 1; i < startSample; i++) {
            startTime += times[i - 1];
        }
        tfdt.setBaseMediaDecodeTime(startTime);
        parent.addBox(tfdt);
    }

    protected void createTrun(long startSample, long endSample, Track track, int sequenceNumber, TrackFragmentBox parent) {
        int i;
        TrackRunBox trun = new TrackRunBox();
        trun.setVersion(1);
        long[] sampleSizes = getSampleSizes(startSample, endSample, track, sequenceNumber);
        trun.setSampleDurationPresent(true);
        trun.setSampleSizePresent(true);
        List<TrackRunBox.Entry> entries = new ArrayList<>(CastUtils.l2i(endSample - startSample));
        List<CompositionTimeToSample.Entry> compositionTimeEntries = track.getCompositionTimeEntries();
        int compositionTimeQueueIndex = 0;
        CompositionTimeToSample.Entry[] compositionTimeQueue = (compositionTimeEntries == null || compositionTimeEntries.size() <= 0) ? null : (CompositionTimeToSample.Entry[]) compositionTimeEntries.toArray(new CompositionTimeToSample.Entry[compositionTimeEntries.size()]);
        if (compositionTimeQueue != null) {
            i = compositionTimeQueue[0].getCount();
        } else {
            i = -1;
        }
        long compositionTimeEntriesLeft = i;
        trun.setSampleCompositionTimeOffsetPresent(compositionTimeEntriesLeft > 0);
        for (long i2 = 1; i2 < startSample; i2++) {
            if (compositionTimeQueue != null) {
                compositionTimeEntriesLeft--;
                if (compositionTimeEntriesLeft == 0 && compositionTimeQueue.length - compositionTimeQueueIndex > 1) {
                    compositionTimeQueueIndex++;
                    compositionTimeEntriesLeft = compositionTimeQueue[compositionTimeQueueIndex].getCount();
                }
            }
        }
        boolean sampleFlagsRequired = (track.getSampleDependencies() != null && !track.getSampleDependencies().isEmpty()) || !(track.getSyncSamples() == null || track.getSyncSamples().length == 0);
        trun.setSampleFlagsPresent(sampleFlagsRequired);
        for (int i3 = 0; i3 < sampleSizes.length; i3++) {
            TrackRunBox.Entry entry = new TrackRunBox.Entry();
            entry.setSampleSize(sampleSizes[i3]);
            if (sampleFlagsRequired) {
                SampleFlags sflags = new SampleFlags();
                if (track.getSampleDependencies() != null && !track.getSampleDependencies().isEmpty()) {
                    SampleDependencyTypeBox.Entry e = track.getSampleDependencies().get(i3);
                    sflags.setSampleDependsOn(e.getSampleDependsOn());
                    sflags.setSampleIsDependedOn(e.getSampleIsDependentOn());
                    sflags.setSampleHasRedundancy(e.getSampleHasRedundancy());
                }
                if (track.getSyncSamples() != null && track.getSyncSamples().length > 0) {
                    if (Arrays.binarySearch(track.getSyncSamples(), i3 + startSample) >= 0) {
                        sflags.setSampleIsDifferenceSample(false);
                        sflags.setSampleDependsOn(2);
                    } else {
                        sflags.setSampleIsDifferenceSample(true);
                        sflags.setSampleDependsOn(1);
                    }
                }
                entry.setSampleFlags(sflags);
            }
            entry.setSampleDuration(track.getSampleDurations()[CastUtils.l2i((i3 + startSample) - 1)]);
            if (compositionTimeQueue != null) {
                entry.setSampleCompositionTimeOffset(compositionTimeQueue[compositionTimeQueueIndex].getOffset());
                compositionTimeEntriesLeft--;
                if (compositionTimeEntriesLeft == 0 && compositionTimeQueue.length - compositionTimeQueueIndex > 1) {
                    compositionTimeQueueIndex++;
                    compositionTimeEntriesLeft = compositionTimeQueue[compositionTimeQueueIndex].getCount();
                }
            }
            entries.add(entry);
        }
        trun.setEntries(entries);
        parent.addBox(trun);
    }

    protected Box createMoof(long startSample, long endSample, Track track, int sequenceNumber) {
        MovieFragmentBox moof = new MovieFragmentBox();
        createMfhd(startSample, endSample, track, sequenceNumber, moof);
        createTraf(startSample, endSample, track, sequenceNumber, moof);
        TrackRunBox firstTrun = moof.getTrackRunBoxes().get(0);
        firstTrun.setDataOffset(1);
        firstTrun.setDataOffset((int) (8 + moof.getSize()));
        return moof;
    }

    protected Box createMvhd(Movie movie) {
        MovieHeaderBox mvhd = new MovieHeaderBox();
        mvhd.setVersion(1);
        mvhd.setCreationTime(getDate());
        mvhd.setModificationTime(getDate());
        mvhd.setDuration(0L);
        long movieTimeScale = movie.getTimescale();
        mvhd.setTimescale(movieTimeScale);
        long nextTrackId = 0;
        for (Track track : movie.getTracks()) {
            if (nextTrackId < track.getTrackMetaData().getTrackId()) {
                nextTrackId = track.getTrackMetaData().getTrackId();
            }
        }
        mvhd.setNextTrackId(nextTrackId + 1);
        return mvhd;
    }

    protected Box createMoov(Movie movie) {
        MovieBox movieBox = new MovieBox();
        movieBox.addBox(createMvhd(movie));
        for (Track track : movie.getTracks()) {
            movieBox.addBox(createTrak(track, movie));
        }
        movieBox.addBox(createMvex(movie));
        return movieBox;
    }

    protected Box createTfra(Track track, Container isoFile) {
        SampleFlags sf;
        TrackFragmentRandomAccessBox tfra = new TrackFragmentRandomAccessBox();
        tfra.setVersion(1);
        List<TrackFragmentRandomAccessBox.Entry> offset2timeEntries = new LinkedList<>();
        TrackExtendsBox trex = null;
        List<TrackExtendsBox> trexs = Path.getPaths(isoFile, "moov/mvex/trex");
        for (TrackExtendsBox innerTrex : trexs) {
            if (innerTrex.getTrackId() == track.getTrackMetaData().getTrackId()) {
                trex = innerTrex;
            }
        }
        long offset = 0;
        long duration = 0;
        for (Box box : isoFile.getBoxes()) {
            if (box instanceof MovieFragmentBox) {
                List<TrackFragmentBox> trafs = ((MovieFragmentBox) box).getBoxes(TrackFragmentBox.class);
                for (int i = 0; i < trafs.size(); i++) {
                    TrackFragmentBox traf = trafs.get(i);
                    if (traf.getTrackFragmentHeaderBox().getTrackId() == track.getTrackMetaData().getTrackId()) {
                        List<TrackRunBox> truns = traf.getBoxes(TrackRunBox.class);
                        for (int j = 0; j < truns.size(); j++) {
                            List<TrackFragmentRandomAccessBox.Entry> offset2timeEntriesThisTrun = new LinkedList<>();
                            TrackRunBox trun = truns.get(j);
                            for (int k = 0; k < trun.getEntries().size(); k++) {
                                TrackRunBox.Entry trunEntry = trun.getEntries().get(k);
                                if (k == 0 && trun.isFirstSampleFlagsPresent()) {
                                    sf = trun.getFirstSampleFlags();
                                } else if (trun.isSampleFlagsPresent()) {
                                    sf = trunEntry.getSampleFlags();
                                } else {
                                    sf = trex.getDefaultSampleFlags();
                                }
                                if (sf == null && track.getHandler().equals("vide")) {
                                    throw new RuntimeException("Cannot find SampleFlags for video track but it's required to build tfra");
                                }
                                if (sf == null || sf.getSampleDependsOn() == 2) {
                                    offset2timeEntriesThisTrun.add(new TrackFragmentRandomAccessBox.Entry(duration, offset, i + 1, j + 1, k + 1));
                                }
                                duration += trunEntry.getSampleDuration();
                            }
                            if (offset2timeEntriesThisTrun.size() == trun.getEntries().size() && trun.getEntries().size() > 0) {
                                offset2timeEntries.add(offset2timeEntriesThisTrun.get(0));
                            } else {
                                offset2timeEntries.addAll(offset2timeEntriesThisTrun);
                            }
                        }
                        continue;
                    }
                }
                continue;
            }
            offset += box.getSize();
        }
        tfra.setEntries(offset2timeEntries);
        tfra.setTrackId(track.getTrackMetaData().getTrackId());
        return tfra;
    }

    protected Box createMfra(Movie movie, Container isoFile) {
        MovieFragmentRandomAccessBox mfra = new MovieFragmentRandomAccessBox();
        for (Track track : movie.getTracks()) {
            mfra.addBox(createTfra(track, isoFile));
        }
        MovieFragmentRandomAccessOffsetBox mfro = new MovieFragmentRandomAccessOffsetBox();
        mfra.addBox(mfro);
        mfro.setMfraSize(mfra.getSize());
        return mfra;
    }

    protected Box createTrex(Movie movie, Track track) {
        TrackExtendsBox trex = new TrackExtendsBox();
        trex.setTrackId(track.getTrackMetaData().getTrackId());
        trex.setDefaultSampleDescriptionIndex(1L);
        trex.setDefaultSampleDuration(0L);
        trex.setDefaultSampleSize(0L);
        SampleFlags sf = new SampleFlags();
        if ("soun".equals(track.getHandler()) || "subt".equals(track.getHandler())) {
            sf.setSampleDependsOn(2);
            sf.setSampleIsDependedOn(2);
        }
        trex.setDefaultSampleFlags(sf);
        return trex;
    }

    protected Box createMvex(Movie movie) {
        MovieExtendsBox mvex = new MovieExtendsBox();
        MovieExtendsHeaderBox mved = new MovieExtendsHeaderBox();
        mved.setVersion(1);
        for (Track track : movie.getTracks()) {
            long trackDuration = getTrackDuration(movie, track);
            if (mved.getFragmentDuration() < trackDuration) {
                mved.setFragmentDuration(trackDuration);
            }
        }
        mvex.addBox(mved);
        for (Track track2 : movie.getTracks()) {
            mvex.addBox(createTrex(movie, track2));
        }
        return mvex;
    }

    protected Box createTkhd(Movie movie, Track track) {
        TrackHeaderBox tkhd = new TrackHeaderBox();
        tkhd.setVersion(1);
        tkhd.setFlags(7);
        tkhd.setAlternateGroup(track.getTrackMetaData().getGroup());
        tkhd.setCreationTime(track.getTrackMetaData().getCreationTime());
        tkhd.setDuration(0L);
        tkhd.setHeight(track.getTrackMetaData().getHeight());
        tkhd.setWidth(track.getTrackMetaData().getWidth());
        tkhd.setLayer(track.getTrackMetaData().getLayer());
        tkhd.setModificationTime(getDate());
        tkhd.setTrackId(track.getTrackMetaData().getTrackId());
        tkhd.setVolume(track.getTrackMetaData().getVolume());
        return tkhd;
    }

    private long getTrackDuration(Movie movie, Track track) {
        return (track.getDuration() * movie.getTimescale()) / track.getTrackMetaData().getTimescale();
    }

    protected Box createMdhd(Movie movie, Track track) {
        MediaHeaderBox mdhd = new MediaHeaderBox();
        mdhd.setCreationTime(track.getTrackMetaData().getCreationTime());
        mdhd.setModificationTime(getDate());
        mdhd.setDuration(0L);
        mdhd.setTimescale(track.getTrackMetaData().getTimescale());
        mdhd.setLanguage(track.getTrackMetaData().getLanguage());
        return mdhd;
    }

    protected Box createStbl(Movie movie, Track track) {
        SampleTableBox stbl = new SampleTableBox();
        createStsd(track, stbl);
        stbl.addBox(new TimeToSampleBox());
        stbl.addBox(new SampleToChunkBox());
        stbl.addBox(new SampleSizeBox());
        stbl.addBox(new StaticChunkOffsetBox());
        return stbl;
    }

    protected void createStsd(Track track, SampleTableBox stbl) {
        stbl.addBox(track.getSampleDescriptionBox());
    }

    protected Box createMinf(Track track, Movie movie) {
        MediaInformationBox minf = new MediaInformationBox();
        if (track.getHandler().equals("vide")) {
            minf.addBox(new VideoMediaHeaderBox());
        } else if (track.getHandler().equals("soun")) {
            minf.addBox(new SoundMediaHeaderBox());
        } else if (track.getHandler().equals("text")) {
            minf.addBox(new NullMediaHeaderBox());
        } else if (track.getHandler().equals("subt")) {
            minf.addBox(new SubtitleMediaHeaderBox());
        } else if (track.getHandler().equals("hint")) {
            minf.addBox(new HintMediaHeaderBox());
        } else if (track.getHandler().equals("sbtl")) {
            minf.addBox(new NullMediaHeaderBox());
        }
        minf.addBox(createDinf(movie, track));
        minf.addBox(createStbl(movie, track));
        return minf;
    }

    protected Box createMdiaHdlr(Track track, Movie movie) {
        HandlerBox hdlr = new HandlerBox();
        hdlr.setHandlerType(track.getHandler());
        return hdlr;
    }

    protected Box createMdia(Track track, Movie movie) {
        MediaBox mdia = new MediaBox();
        mdia.addBox(createMdhd(movie, track));
        mdia.addBox(createMdiaHdlr(track, movie));
        mdia.addBox(createMinf(track, movie));
        return mdia;
    }

    protected Box createTrak(Track track, Movie movie) {
        LOG.fine("Creating Track " + track);
        TrackBox trackBox = new TrackBox();
        trackBox.addBox(createTkhd(movie, track));
        Box edts = createEdts(track, movie);
        if (edts != null) {
            trackBox.addBox(edts);
        }
        trackBox.addBox(createMdia(track, movie));
        return trackBox;
    }

    protected Box createEdts(Track track, Movie movie) {
        if (track.getEdits() != null && track.getEdits().size() > 0) {
            EditListBox elst = new EditListBox();
            elst.setVersion(1);
            List<EditListBox.Entry> entries = new ArrayList<>();
            for (Edit edit : track.getEdits()) {
                entries.add(new EditListBox.Entry(elst, Math.round(edit.getSegmentDuration() * movie.getTimescale()), (edit.getMediaTime() * track.getTrackMetaData().getTimescale()) / edit.getTimeScale(), edit.getMediaRate()));
            }
            elst.setEntries(entries);
            EditBox edts = new EditBox();
            edts.addBox(elst);
            return edts;
        }
        return null;
    }

    protected DataInformationBox createDinf(Movie movie, Track track) {
        DataInformationBox dinf = new DataInformationBox();
        DataReferenceBox dref = new DataReferenceBox();
        dinf.addBox(dref);
        DataEntryUrlBox url = new DataEntryUrlBox();
        url.setFlags(1);
        dref.addBox(url);
        return dinf;
    }

    public Fragmenter getFragmenter() {
        return this.fragmenter;
    }

    public void setFragmenter(Fragmenter fragmenter) {
        this.fragmenter = fragmenter;
    }
}
