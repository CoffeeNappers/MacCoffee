package com.googlecode.mp4parser.authoring.builder;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.ChunkOffsetBox;
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
import com.coremedia.iso.boxes.SampleSizeBox;
import com.coremedia.iso.boxes.SampleTableBox;
import com.coremedia.iso.boxes.SampleToChunkBox;
import com.coremedia.iso.boxes.SoundMediaHeaderBox;
import com.coremedia.iso.boxes.StaticChunkOffsetBox;
import com.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import com.coremedia.iso.boxes.SyncSampleBox;
import com.coremedia.iso.boxes.TimeToSampleBox;
import com.coremedia.iso.boxes.TrackBox;
import com.coremedia.iso.boxes.TrackHeaderBox;
import com.coremedia.iso.boxes.VideoMediaHeaderBox;
import com.coremedia.iso.boxes.mdat.MediaDataBox;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
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
import com.googlecode.mp4parser.util.Logger;
import com.googlecode.mp4parser.util.Math;
import com.googlecode.mp4parser.util.Mp4Arrays;
import com.googlecode.mp4parser.util.Path;
import com.mp4parser.iso14496.part12.SampleAuxiliaryInformationOffsetsBox;
import com.mp4parser.iso14496.part12.SampleAuxiliaryInformationSizesBox;
import com.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class DefaultMp4Builder implements Mp4Builder {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static Logger LOG;
    private Fragmenter fragmenter;
    Map<Track, StaticChunkOffsetBox> chunkOffsetBoxes = new HashMap();
    Set<SampleAuxiliaryInformationOffsetsBox> sampleAuxiliaryInformationOffsetsBoxes = new HashSet();
    HashMap<Track, List<Sample>> track2Sample = new HashMap<>();
    HashMap<Track, long[]> track2SampleSizes = new HashMap<>();

    static {
        $assertionsDisabled = !DefaultMp4Builder.class.desiredAssertionStatus();
        LOG = Logger.getLogger(DefaultMp4Builder.class);
    }

    private static long sum(int[] ls) {
        long rc = 0;
        for (long l : ls) {
            rc += l;
        }
        return rc;
    }

    private static long sum(long[] ls) {
        long rc = 0;
        for (long l : ls) {
            rc += l;
        }
        return rc;
    }

    public static long gcd(long a, long b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    public void setFragmenter(Fragmenter fragmenter) {
        this.fragmenter = fragmenter;
    }

    @Override // com.googlecode.mp4parser.authoring.builder.Mp4Builder
    public Container build(Movie movie) {
        Box box;
        if (this.fragmenter == null) {
            this.fragmenter = new BetterFragmenter(2.0d);
        }
        LOG.logDebug("Creating movie " + movie);
        for (Track track : movie.getTracks()) {
            List<Sample> samples = track.getSamples();
            putSamples(track, samples);
            long[] sizes = new long[samples.size()];
            for (int i = 0; i < sizes.length; i++) {
                sizes[i] = samples.get(i).getSize();
            }
            this.track2SampleSizes.put(track, sizes);
        }
        BasicContainer isoFile = new BasicContainer();
        isoFile.addBox(createFileTypeBox(movie));
        Map<Track, int[]> chunks = new HashMap<>();
        for (Track track2 : movie.getTracks()) {
            chunks.put(track2, getChunkSizes(track2));
        }
        Box moov = createMovieBox(movie, chunks);
        isoFile.addBox(moov);
        List<SampleSizeBox> stszs = Path.getPaths(moov, "trak/mdia/minf/stbl/stsz");
        long contentSize = 0;
        for (SampleSizeBox stsz : stszs) {
            contentSize += sum(stsz.getSampleSizes());
        }
        LOG.logDebug("About to create mdat");
        InterleaveChunkMdat mdat = new InterleaveChunkMdat(this, movie, chunks, contentSize, null);
        isoFile.addBox(mdat);
        LOG.logDebug("mdat crated");
        long dataOffset = mdat.getDataOffset();
        for (StaticChunkOffsetBox chunkOffsetBox : this.chunkOffsetBoxes.values()) {
            long[] offsets = chunkOffsetBox.getChunkOffsets();
            for (int i2 = 0; i2 < offsets.length; i2++) {
                offsets[i2] = offsets[i2] + dataOffset;
            }
        }
        for (SampleAuxiliaryInformationOffsetsBox saio : this.sampleAuxiliaryInformationOffsetsBoxes) {
            long offset = saio.getSize();
            long offset2 = offset + 44;
            Object current = saio;
            while (true) {
                Object b = ((Box) current).getParent();
                Iterator<Box> it = ((Container) b).getBoxes().iterator();
                while (it.hasNext() && (box = it.next()) != current) {
                    offset2 += box.getSize();
                }
                if (!(b instanceof Box)) {
                    break;
                }
                current = b;
            }
            long[] saioOffsets = saio.getOffsets();
            for (int i3 = 0; i3 < saioOffsets.length; i3++) {
                saioOffsets[i3] = saioOffsets[i3] + offset2;
            }
            saio.setOffsets(saioOffsets);
        }
        return isoFile;
    }

    protected List<Sample> putSamples(Track track, List<Sample> samples) {
        return this.track2Sample.put(track, samples);
    }

    protected FileTypeBox createFileTypeBox(Movie movie) {
        List<String> minorBrands = new LinkedList<>();
        minorBrands.add("mp42");
        minorBrands.add("iso6");
        minorBrands.add(VisualSampleEntry.TYPE3);
        minorBrands.add("isom");
        return new FileTypeBox("iso6", 1L, minorBrands);
    }

    protected MovieBox createMovieBox(Movie movie, Map<Track, int[]> chunks) {
        long tracksDuration;
        MovieBox movieBox = new MovieBox();
        MovieHeaderBox mvhd = new MovieHeaderBox();
        mvhd.setCreationTime(new Date());
        mvhd.setModificationTime(new Date());
        mvhd.setMatrix(movie.getMatrix());
        long movieTimeScale = getTimescale(movie);
        long duration = 0;
        for (Track track : movie.getTracks()) {
            if (track.getEdits() == null || track.getEdits().isEmpty()) {
                tracksDuration = (track.getDuration() * movieTimeScale) / track.getTrackMetaData().getTimescale();
            } else {
                double d = 0.0d;
                for (Edit edit : track.getEdits()) {
                    d += (long) edit.getSegmentDuration();
                }
                tracksDuration = (long) (movieTimeScale * d);
            }
            if (tracksDuration > duration) {
                duration = tracksDuration;
            }
        }
        mvhd.setDuration(duration);
        mvhd.setTimescale(movieTimeScale);
        long nextTrackId = 0;
        for (Track track2 : movie.getTracks()) {
            Track track3 = track2;
            if (nextTrackId < track3.getTrackMetaData().getTrackId()) {
                nextTrackId = track3.getTrackMetaData().getTrackId();
            }
        }
        mvhd.setNextTrackId(nextTrackId + 1);
        movieBox.addBox(mvhd);
        for (Track track4 : movie.getTracks()) {
            movieBox.addBox(createTrackBox(track4, movie, chunks));
        }
        Box udta = createUdta(movie);
        if (udta != null) {
            movieBox.addBox(udta);
        }
        return movieBox;
    }

    protected Box createUdta(Movie movie) {
        return null;
    }

    protected TrackBox createTrackBox(Track track, Movie movie, Map<Track, int[]> chunks) {
        TrackBox trackBox = new TrackBox();
        TrackHeaderBox tkhd = new TrackHeaderBox();
        tkhd.setEnabled(true);
        tkhd.setInMovie(true);
        tkhd.setMatrix(track.getTrackMetaData().getMatrix());
        tkhd.setAlternateGroup(track.getTrackMetaData().getGroup());
        tkhd.setCreationTime(track.getTrackMetaData().getCreationTime());
        if (track.getEdits() == null || track.getEdits().isEmpty()) {
            tkhd.setDuration((track.getDuration() * getTimescale(movie)) / track.getTrackMetaData().getTimescale());
        } else {
            long d = 0;
            for (Edit edit : track.getEdits()) {
                d += (long) edit.getSegmentDuration();
            }
            tkhd.setDuration(track.getTrackMetaData().getTimescale() * d);
        }
        tkhd.setHeight(track.getTrackMetaData().getHeight());
        tkhd.setWidth(track.getTrackMetaData().getWidth());
        tkhd.setLayer(track.getTrackMetaData().getLayer());
        tkhd.setModificationTime(new Date());
        tkhd.setTrackId(track.getTrackMetaData().getTrackId());
        tkhd.setVolume(track.getTrackMetaData().getVolume());
        trackBox.addBox(tkhd);
        trackBox.addBox(createEdts(track, movie));
        MediaBox mdia = new MediaBox();
        trackBox.addBox(mdia);
        MediaHeaderBox mdhd = new MediaHeaderBox();
        mdhd.setCreationTime(track.getTrackMetaData().getCreationTime());
        mdhd.setDuration(track.getDuration());
        mdhd.setTimescale(track.getTrackMetaData().getTimescale());
        mdhd.setLanguage(track.getTrackMetaData().getLanguage());
        mdia.addBox(mdhd);
        HandlerBox hdlr = new HandlerBox();
        mdia.addBox(hdlr);
        hdlr.setHandlerType(track.getHandler());
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
        DataInformationBox dinf = new DataInformationBox();
        DataReferenceBox dref = new DataReferenceBox();
        dinf.addBox(dref);
        DataEntryUrlBox url = new DataEntryUrlBox();
        url.setFlags(1);
        dref.addBox(url);
        minf.addBox(dinf);
        Box stbl = createStbl(track, movie, chunks);
        minf.addBox(stbl);
        mdia.addBox(minf);
        LOG.logDebug("done with trak for track_" + track.getTrackMetaData().getTrackId());
        return trackBox;
    }

    protected Box createEdts(Track track, Movie movie) {
        if (track.getEdits() != null && track.getEdits().size() > 0) {
            EditListBox elst = new EditListBox();
            elst.setVersion(0);
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

    protected Box createStbl(Track track, Movie movie, Map<Track, int[]> chunks) {
        SampleTableBox stbl = new SampleTableBox();
        createStsd(track, stbl);
        createStts(track, stbl);
        createCtts(track, stbl);
        createStss(track, stbl);
        createSdtp(track, stbl);
        createStsc(track, chunks, stbl);
        createStsz(track, stbl);
        createStco(track, movie, chunks, stbl);
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
            SampleGroupDescriptionBox sgdb = new SampleGroupDescriptionBox();
            String type2 = sg2.getKey();
            sgdb.setGroupingType(type2);
            sgdb.setGroupEntries(sg2.getValue());
            SampleToGroupBox sbgp = new SampleToGroupBox();
            sbgp.setGroupingType(type2);
            SampleToGroupBox.Entry last = null;
            for (int i = 0; i < track.getSamples().size(); i++) {
                int index = 0;
                for (int j = 0; j < sg2.getValue().size(); j++) {
                    GroupEntry groupEntry = sg2.getValue().get(j);
                    long[] sampleNums = track.getSampleGroups().get(groupEntry);
                    if (Arrays.binarySearch(sampleNums, i) >= 0) {
                        index = j + 1;
                    }
                }
                if (last == null || last.getGroupDescriptionIndex() != index) {
                    last = new SampleToGroupBox.Entry(1L, index);
                    sbgp.getEntries().add(last);
                } else {
                    last.setSampleCount(last.getSampleCount() + 1);
                }
            }
            stbl.addBox(sgdb);
            stbl.addBox(sbgp);
        }
        if (track instanceof CencEncryptedTrack) {
            createCencBoxes((CencEncryptedTrack) track, stbl, chunks.get(track));
        }
        createSubs(track, stbl);
        LOG.logDebug("done with stbl for track_" + track.getTrackMetaData().getTrackId());
        return stbl;
    }

    protected void createSubs(Track track, SampleTableBox stbl) {
        if (track.getSubsampleInformationBox() != null) {
            stbl.addBox(track.getSubsampleInformationBox());
        }
    }

    protected void createCencBoxes(CencEncryptedTrack track, SampleTableBox stbl, int[] chunkSizes) {
        SampleAuxiliaryInformationSizesBox saiz = new SampleAuxiliaryInformationSizesBox();
        saiz.setAuxInfoType("cenc");
        saiz.setFlags(1);
        List<CencSampleAuxiliaryDataFormat> sampleEncryptionEntries = track.getSampleEncryptionEntries();
        if (track.hasSubSampleEncryption()) {
            short[] sizes = new short[sampleEncryptionEntries.size()];
            for (int i = 0; i < sizes.length; i++) {
                sizes[i] = (short) sampleEncryptionEntries.get(i).getSize();
            }
            saiz.setSampleInfoSizes(sizes);
        } else {
            saiz.setDefaultSampleInfoSize(8);
            saiz.setSampleCount(track.getSamples().size());
        }
        SampleAuxiliaryInformationOffsetsBox saio = new SampleAuxiliaryInformationOffsetsBox();
        SampleEncryptionBox senc = new SampleEncryptionBox();
        senc.setSubSampleEncryption(track.hasSubSampleEncryption());
        senc.setEntries(sampleEncryptionEntries);
        long offset = senc.getOffsetToFirstIV();
        int index = 0;
        long[] offsets = new long[chunkSizes.length];
        for (int i2 = 0; i2 < chunkSizes.length; i2++) {
            offsets[i2] = offset;
            int j = 0;
            while (j < chunkSizes[i2]) {
                offset += sampleEncryptionEntries.get(index).getSize();
                j++;
                index++;
            }
        }
        saio.setOffsets(offsets);
        stbl.addBox(saiz);
        stbl.addBox(saio);
        stbl.addBox(senc);
        this.sampleAuxiliaryInformationOffsetsBoxes.add(saio);
    }

    protected void createStsd(Track track, SampleTableBox stbl) {
        stbl.addBox(track.getSampleDescriptionBox());
    }

    protected void createStco(Track targetTrack, Movie movie, Map<Track, int[]> chunks, SampleTableBox stbl) {
        if (this.chunkOffsetBoxes.get(targetTrack) == null) {
            long offset = 0;
            LOG.logDebug("Calculating chunk offsets for track_" + targetTrack.getTrackMetaData().getTrackId());
            List<Track> tracks = new ArrayList<>(chunks.keySet());
            Collections.sort(tracks, new Comparator<Track>() { // from class: com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder.1
                @Override // java.util.Comparator
                public int compare(Track o1, Track o2) {
                    return CastUtils.l2i(o1.getTrackMetaData().getTrackId() - o2.getTrackMetaData().getTrackId());
                }
            });
            Map<Track, Integer> trackToChunk = new HashMap<>();
            Map<Track, Integer> trackToSample = new HashMap<>();
            Map<Track, Double> trackToTime = new HashMap<>();
            for (Track track : tracks) {
                trackToChunk.put(track, 0);
                trackToSample.put(track, 0);
                trackToTime.put(track, Double.valueOf(0.0d));
                this.chunkOffsetBoxes.put(track, new StaticChunkOffsetBox());
            }
            while (true) {
                Track nextChunksTrack = null;
                for (Track track2 : tracks) {
                    if (nextChunksTrack == null || trackToTime.get(track2).doubleValue() < trackToTime.get(nextChunksTrack).doubleValue()) {
                        if (trackToChunk.get(track2).intValue() < chunks.get(track2).length) {
                            nextChunksTrack = track2;
                        }
                    }
                }
                if (nextChunksTrack == null) {
                    break;
                }
                ChunkOffsetBox chunkOffsetBox = this.chunkOffsetBoxes.get(nextChunksTrack);
                chunkOffsetBox.setChunkOffsets(Mp4Arrays.copyOfAndAppend(chunkOffsetBox.getChunkOffsets(), offset));
                int nextChunksIndex = trackToChunk.get(nextChunksTrack).intValue();
                int numberOfSampleInNextChunk = chunks.get(nextChunksTrack)[nextChunksIndex];
                int startSample = trackToSample.get(nextChunksTrack).intValue();
                double time = trackToTime.get(nextChunksTrack).doubleValue();
                long[] durs = nextChunksTrack.getSampleDurations();
                for (int j = startSample; j < startSample + numberOfSampleInNextChunk; j++) {
                    offset += this.track2SampleSizes.get(nextChunksTrack)[j];
                    time += durs[j] / nextChunksTrack.getTrackMetaData().getTimescale();
                }
                trackToChunk.put(nextChunksTrack, Integer.valueOf(nextChunksIndex + 1));
                trackToSample.put(nextChunksTrack, Integer.valueOf(startSample + numberOfSampleInNextChunk));
                trackToTime.put(nextChunksTrack, Double.valueOf(time));
            }
        }
        stbl.addBox(this.chunkOffsetBoxes.get(targetTrack));
    }

    protected void createStsz(Track track, SampleTableBox stbl) {
        SampleSizeBox stsz = new SampleSizeBox();
        stsz.setSampleSizes(this.track2SampleSizes.get(track));
        stbl.addBox(stsz);
    }

    protected void createStsc(Track track, Map<Track, int[]> chunks, SampleTableBox stbl) {
        int[] tracksChunkSizes = chunks.get(track);
        SampleToChunkBox stsc = new SampleToChunkBox();
        stsc.setEntries(new LinkedList());
        long lastChunkSize = -2147483648L;
        for (int i = 0; i < tracksChunkSizes.length; i++) {
            if (lastChunkSize != tracksChunkSizes[i]) {
                stsc.getEntries().add(new SampleToChunkBox.Entry(i + 1, tracksChunkSizes[i], 1L));
                lastChunkSize = tracksChunkSizes[i];
            }
        }
        stbl.addBox(stsc);
    }

    protected void createSdtp(Track track, SampleTableBox stbl) {
        if (track.getSampleDependencies() != null && !track.getSampleDependencies().isEmpty()) {
            SampleDependencyTypeBox sdtp = new SampleDependencyTypeBox();
            sdtp.setEntries(track.getSampleDependencies());
            stbl.addBox(sdtp);
        }
    }

    protected void createStss(Track track, SampleTableBox stbl) {
        long[] syncSamples = track.getSyncSamples();
        if (syncSamples != null && syncSamples.length > 0) {
            SyncSampleBox stss = new SyncSampleBox();
            stss.setSampleNumber(syncSamples);
            stbl.addBox(stss);
        }
    }

    protected void createCtts(Track track, SampleTableBox stbl) {
        List<CompositionTimeToSample.Entry> compositionTimeToSampleEntries = track.getCompositionTimeEntries();
        if (compositionTimeToSampleEntries != null && !compositionTimeToSampleEntries.isEmpty()) {
            CompositionTimeToSample ctts = new CompositionTimeToSample();
            ctts.setEntries(compositionTimeToSampleEntries);
            stbl.addBox(ctts);
        }
    }

    protected void createStts(Track track, SampleTableBox stbl) {
        long[] sampleDurations;
        TimeToSampleBox.Entry lastEntry = null;
        List<TimeToSampleBox.Entry> entries = new ArrayList<>();
        for (long delta : track.getSampleDurations()) {
            if (lastEntry != null && lastEntry.getDelta() == delta) {
                lastEntry.setCount(lastEntry.getCount() + 1);
            } else {
                lastEntry = new TimeToSampleBox.Entry(1L, delta);
                entries.add(lastEntry);
            }
        }
        TimeToSampleBox stts = new TimeToSampleBox();
        stts.setEntries(entries);
        stbl.addBox(stts);
    }

    int[] getChunkSizes(Track track) {
        long end;
        long[] referenceChunkStarts = this.fragmenter.sampleNumbers(track);
        int[] chunkSizes = new int[referenceChunkStarts.length];
        for (int i = 0; i < referenceChunkStarts.length; i++) {
            long start = referenceChunkStarts[i] - 1;
            if (referenceChunkStarts.length == i + 1) {
                end = track.getSamples().size();
            } else {
                end = referenceChunkStarts[i + 1] - 1;
            }
            chunkSizes[i] = CastUtils.l2i(end - start);
        }
        if ($assertionsDisabled || this.track2Sample.get(track).size() == sum(chunkSizes)) {
            return chunkSizes;
        }
        throw new AssertionError("The number of samples and the sum of all chunk lengths must be equal");
    }

    public long getTimescale(Movie movie) {
        long timescale = movie.getTracks().iterator().next().getTrackMetaData().getTimescale();
        for (Track track : movie.getTracks()) {
            timescale = Math.lcm(timescale, track.getTrackMetaData().getTimescale());
        }
        return timescale;
    }

    /* loaded from: classes2.dex */
    private class InterleaveChunkMdat implements Box {
        List<List<Sample>> chunkList;
        long contentSize;
        Container parent;
        List<Track> tracks;

        private InterleaveChunkMdat(Movie movie, Map<Track, int[]> chunks, long contentSize) {
            this.chunkList = new ArrayList();
            this.contentSize = contentSize;
            this.tracks = movie.getTracks();
            List<Track> tracks = new ArrayList<>(chunks.keySet());
            Collections.sort(tracks, new Comparator<Track>() { // from class: com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder.InterleaveChunkMdat.1
                @Override // java.util.Comparator
                public int compare(Track o1, Track o2) {
                    return CastUtils.l2i(o1.getTrackMetaData().getTrackId() - o2.getTrackMetaData().getTrackId());
                }
            });
            Map<Track, Integer> trackToChunk = new HashMap<>();
            Map<Track, Integer> trackToSample = new HashMap<>();
            Map<Track, Double> trackToTime = new HashMap<>();
            for (Track track : tracks) {
                trackToChunk.put(track, 0);
                trackToSample.put(track, 0);
                trackToTime.put(track, Double.valueOf(0.0d));
            }
            while (true) {
                Track nextChunksTrack = null;
                for (Track track2 : tracks) {
                    if (nextChunksTrack == null || trackToTime.get(track2).doubleValue() < trackToTime.get(nextChunksTrack).doubleValue()) {
                        if (trackToChunk.get(track2).intValue() < chunks.get(track2).length) {
                            nextChunksTrack = track2;
                        }
                    }
                }
                if (nextChunksTrack != null) {
                    int nextChunksIndex = trackToChunk.get(nextChunksTrack).intValue();
                    int numberOfSampleInNextChunk = chunks.get(nextChunksTrack)[nextChunksIndex];
                    int startSample = trackToSample.get(nextChunksTrack).intValue();
                    double time = trackToTime.get(nextChunksTrack).doubleValue();
                    for (int j = startSample; j < startSample + numberOfSampleInNextChunk; j++) {
                        time += nextChunksTrack.getSampleDurations()[j] / nextChunksTrack.getTrackMetaData().getTimescale();
                    }
                    this.chunkList.add(nextChunksTrack.getSamples().subList(startSample, startSample + numberOfSampleInNextChunk));
                    trackToChunk.put(nextChunksTrack, Integer.valueOf(nextChunksIndex + 1));
                    trackToSample.put(nextChunksTrack, Integer.valueOf(startSample + numberOfSampleInNextChunk));
                    trackToTime.put(nextChunksTrack, Double.valueOf(time));
                } else {
                    return;
                }
            }
        }

        /* synthetic */ InterleaveChunkMdat(DefaultMp4Builder defaultMp4Builder, Movie movie, Map map, long j, InterleaveChunkMdat interleaveChunkMdat) {
            this(movie, map, j);
        }

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
        public void parse(DataSource dataSource, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
        }

        public long getDataOffset() {
            Box box;
            long offset = 16;
            for (Container b = this; b instanceof Box; b = b.getParent()) {
                Iterator<Box> it = b.getParent().getBoxes().iterator();
                while (it.hasNext() && b != (box = it.next())) {
                    offset += box.getSize();
                }
            }
            return offset;
        }

        @Override // com.coremedia.iso.boxes.Box
        public String getType() {
            return MediaDataBox.TYPE;
        }

        @Override // com.coremedia.iso.boxes.Box
        public long getSize() {
            return 16 + this.contentSize;
        }

        private boolean isSmallBox(long contentSize) {
            return 8 + contentSize < 4294967296L;
        }

        @Override // com.coremedia.iso.boxes.Box
        public void getBox(WritableByteChannel writableByteChannel) throws IOException {
            ByteBuffer bb = ByteBuffer.allocate(16);
            long size = getSize();
            if (isSmallBox(size)) {
                IsoTypeWriter.writeUInt32(bb, size);
            } else {
                IsoTypeWriter.writeUInt32(bb, 1L);
            }
            bb.put(IsoFile.fourCCtoBytes(MediaDataBox.TYPE));
            if (isSmallBox(size)) {
                bb.put(new byte[8]);
            } else {
                IsoTypeWriter.writeUInt64(bb, size);
            }
            bb.rewind();
            writableByteChannel.write(bb);
            long writtenBytes = 0;
            long writtenMegaBytes = 0;
            DefaultMp4Builder.LOG.logDebug("About to write " + this.contentSize);
            for (List<Sample> samples : this.chunkList) {
                for (Sample sample : samples) {
                    sample.writeTo(writableByteChannel);
                    writtenBytes += sample.getSize();
                    if (writtenBytes > 1048576) {
                        writtenBytes -= 1048576;
                        writtenMegaBytes++;
                        DefaultMp4Builder.LOG.logDebug("Written " + writtenMegaBytes + "MB");
                    }
                }
            }
        }
    }
}
