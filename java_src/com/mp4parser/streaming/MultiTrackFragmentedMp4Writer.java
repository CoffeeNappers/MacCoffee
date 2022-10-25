package com.mp4parser.streaming;

import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.DataEntryUrlBox;
import com.coremedia.iso.boxes.DataInformationBox;
import com.coremedia.iso.boxes.DataReferenceBox;
import com.coremedia.iso.boxes.FileTypeBox;
import com.coremedia.iso.boxes.HandlerBox;
import com.coremedia.iso.boxes.HintMediaHeaderBox;
import com.coremedia.iso.boxes.MediaBox;
import com.coremedia.iso.boxes.MediaHeaderBox;
import com.coremedia.iso.boxes.MediaInformationBox;
import com.coremedia.iso.boxes.MovieBox;
import com.coremedia.iso.boxes.MovieHeaderBox;
import com.coremedia.iso.boxes.NullMediaHeaderBox;
import com.coremedia.iso.boxes.SampleSizeBox;
import com.coremedia.iso.boxes.SampleTableBox;
import com.coremedia.iso.boxes.SampleToChunkBox;
import com.coremedia.iso.boxes.SoundMediaHeaderBox;
import com.coremedia.iso.boxes.StaticChunkOffsetBox;
import com.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import com.coremedia.iso.boxes.TimeToSampleBox;
import com.coremedia.iso.boxes.TrackBox;
import com.coremedia.iso.boxes.VideoMediaHeaderBox;
import com.coremedia.iso.boxes.fragment.MovieExtendsBox;
import com.coremedia.iso.boxes.fragment.MovieExtendsHeaderBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentHeaderBox;
import com.coremedia.iso.boxes.fragment.SampleFlags;
import com.coremedia.iso.boxes.fragment.TrackExtendsBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentBaseMediaDecodeTimeBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import com.coremedia.iso.boxes.fragment.TrackRunBox;
import com.coremedia.iso.boxes.mdat.MediaDataBox;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.googlecode.mp4parser.util.Math;
import com.googlecode.mp4parser.util.Mp4Arrays;
import com.mp4parser.streaming.extensions.CencEncryptTrackExtension;
import com.mp4parser.streaming.extensions.CompositionTimeSampleExtension;
import com.mp4parser.streaming.extensions.CompositionTimeTrackExtension;
import com.mp4parser.streaming.extensions.SampleFlagsSampleExtension;
import com.mp4parser.streaming.extensions.SampleFlagsTrackExtension;
import com.mp4parser.streaming.extensions.TrackIdTrackExtension;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class MultiTrackFragmentedMp4Writer implements StreamingMp4Writer {
    static final /* synthetic */ boolean $assertionsDisabled;
    CompositionTimeTrackExtension compositionTimeTrackExtension;
    private final OutputStream outputStream;
    SampleFlagsTrackExtension sampleDependencyTrackExtension;
    StreamingTrack[] source;
    Map<StreamingTrack, List<StreamingSample>> fragmentBuffers = new HashMap();
    private long sequenceNumber = 1;
    private long currentFragmentStartTime = 0;
    private long currentTime = 0;
    Date creationTime = new Date();

    static {
        $assertionsDisabled = !MultiTrackFragmentedMp4Writer.class.desiredAssertionStatus();
    }

    public MultiTrackFragmentedMp4Writer(StreamingTrack[] source, OutputStream outputStream) {
        this.source = source;
        this.outputStream = outputStream;
        HashSet<Long> trackIds = new HashSet<>();
        for (StreamingTrack streamingTrack : source) {
            if (streamingTrack.getTrackExtension(TrackIdTrackExtension.class) != null) {
                TrackIdTrackExtension trackIdTrackExtension = (TrackIdTrackExtension) streamingTrack.getTrackExtension(TrackIdTrackExtension.class);
                if (!$assertionsDisabled && trackIdTrackExtension == null) {
                    throw new AssertionError();
                }
                if (trackIds.contains(Long.valueOf(trackIdTrackExtension.getTrackId()))) {
                    throw new RuntimeException("There may not be two tracks with the same trackID within one file");
                }
            }
        }
        for (StreamingTrack streamingTrack2 : source) {
            if (streamingTrack2.getTrackExtension(TrackIdTrackExtension.class) != null) {
                ArrayList<Long> ts = new ArrayList<>(trackIds);
                Collections.sort(ts);
                streamingTrack2.addTrackExtension(new TrackIdTrackExtension(ts.size() > 0 ? ts.get(ts.size() - 1).longValue() + 1 : 1L));
            }
        }
    }

    @Override // com.mp4parser.streaming.StreamingMp4Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    protected Box createMvhd() {
        StreamingTrack[] streamingTrackArr;
        MovieHeaderBox mvhd = new MovieHeaderBox();
        mvhd.setVersion(1);
        mvhd.setCreationTime(this.creationTime);
        mvhd.setModificationTime(this.creationTime);
        mvhd.setDuration(0L);
        long[] timescales = new long[0];
        for (StreamingTrack streamingTrack : this.source) {
            Mp4Arrays.copyOfAndAppend(timescales, streamingTrack.getTimescale());
        }
        mvhd.setTimescale(Math.lcm(timescales));
        mvhd.setNextTrackId(2L);
        return mvhd;
    }

    protected Box createMdiaHdlr(StreamingTrack streamingTrack) {
        HandlerBox hdlr = new HandlerBox();
        hdlr.setHandlerType(streamingTrack.getHandler());
        return hdlr;
    }

    protected Box createMdhd(StreamingTrack streamingTrack) {
        MediaHeaderBox mdhd = new MediaHeaderBox();
        mdhd.setCreationTime(this.creationTime);
        mdhd.setModificationTime(this.creationTime);
        mdhd.setDuration(0L);
        mdhd.setTimescale(streamingTrack.getTimescale());
        mdhd.setLanguage(streamingTrack.getLanguage());
        return mdhd;
    }

    protected Box createMdia(StreamingTrack streamingTrack) {
        MediaBox mdia = new MediaBox();
        mdia.addBox(createMdhd(streamingTrack));
        mdia.addBox(createMdiaHdlr(streamingTrack));
        mdia.addBox(createMinf(streamingTrack));
        return mdia;
    }

    protected Box createMinf(StreamingTrack streamingTrack) {
        MediaInformationBox minf = new MediaInformationBox();
        if (streamingTrack.getHandler().equals("vide")) {
            minf.addBox(new VideoMediaHeaderBox());
        } else if (streamingTrack.getHandler().equals("soun")) {
            minf.addBox(new SoundMediaHeaderBox());
        } else if (streamingTrack.getHandler().equals("text")) {
            minf.addBox(new NullMediaHeaderBox());
        } else if (streamingTrack.getHandler().equals("subt")) {
            minf.addBox(new SubtitleMediaHeaderBox());
        } else if (streamingTrack.getHandler().equals("hint")) {
            minf.addBox(new HintMediaHeaderBox());
        } else if (streamingTrack.getHandler().equals("sbtl")) {
            minf.addBox(new NullMediaHeaderBox());
        }
        minf.addBox(createDinf());
        minf.addBox(createStbl(streamingTrack));
        return minf;
    }

    protected Box createStbl(StreamingTrack streamingTrack) {
        SampleTableBox stbl = new SampleTableBox();
        stbl.addBox(streamingTrack.getSampleDescriptionBox());
        stbl.addBox(new TimeToSampleBox());
        stbl.addBox(new SampleToChunkBox());
        stbl.addBox(new SampleSizeBox());
        stbl.addBox(new StaticChunkOffsetBox());
        return stbl;
    }

    protected DataInformationBox createDinf() {
        DataInformationBox dinf = new DataInformationBox();
        DataReferenceBox dref = new DataReferenceBox();
        dinf.addBox(dref);
        DataEntryUrlBox url = new DataEntryUrlBox();
        url.setFlags(1);
        dref.addBox(url);
        return dinf;
    }

    protected Box createTrak(StreamingTrack streamingTrack) {
        TrackBox trackBox = new TrackBox();
        trackBox.addBox(streamingTrack.getTrackHeaderBox());
        trackBox.addBox(streamingTrack.getTrackHeaderBox());
        trackBox.addBox(createMdia(streamingTrack));
        return trackBox;
    }

    public Box createFtyp() {
        List<String> minorBrands = new LinkedList<>();
        minorBrands.add("isom");
        minorBrands.add("iso6");
        minorBrands.add(VisualSampleEntry.TYPE3);
        return new FileTypeBox("isom", 0L, minorBrands);
    }

    protected Box createMvex() {
        StreamingTrack[] streamingTrackArr;
        MovieExtendsBox mvex = new MovieExtendsBox();
        MovieExtendsHeaderBox mved = new MovieExtendsHeaderBox();
        mved.setVersion(1);
        mved.setFragmentDuration(0L);
        mvex.addBox(mved);
        for (StreamingTrack streamingTrack : this.source) {
            mvex.addBox(createTrex(streamingTrack));
        }
        return mvex;
    }

    protected Box createTrex(StreamingTrack streamingTrack) {
        TrackExtendsBox trex = new TrackExtendsBox();
        trex.setTrackId(streamingTrack.getTrackHeaderBox().getTrackId());
        trex.setDefaultSampleDescriptionIndex(1L);
        trex.setDefaultSampleDuration(0L);
        trex.setDefaultSampleSize(0L);
        SampleFlags sf = new SampleFlags();
        if ("soun".equals(streamingTrack.getHandler()) || "subt".equals(streamingTrack.getHandler())) {
            sf.setSampleDependsOn(2);
            sf.setSampleIsDependedOn(2);
        }
        trex.setDefaultSampleFlags(sf);
        return trex;
    }

    protected Box createMoov() {
        StreamingTrack[] streamingTrackArr;
        MovieBox movieBox = new MovieBox();
        movieBox.addBox(createMvhd());
        for (StreamingTrack streamingTrack : this.source) {
            movieBox.addBox(createTrak(streamingTrack));
        }
        movieBox.addBox(createMvex());
        return movieBox;
    }

    /* loaded from: classes2.dex */
    class ConsumeSamplesCallable implements Callable {
        private StreamingTrack streamingTrack;

        public ConsumeSamplesCallable(StreamingTrack streamingTrack) {
            this.streamingTrack = streamingTrack;
        }

        @Override // java.util.concurrent.Callable
        public Object call() throws Exception {
            StreamingSample ss;
            while (true) {
                try {
                    ss = this.streamingTrack.getSamples().poll(100L, TimeUnit.MILLISECONDS);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (ss == null) {
                    if (!this.streamingTrack.hasMoreSamples()) {
                        return null;
                    }
                } else {
                    MultiTrackFragmentedMp4Writer.this.consumeSample(this.streamingTrack, ss);
                }
            }
        }
    }

    @Override // com.mp4parser.streaming.StreamingMp4Writer
    public void write() throws IOException {
        StreamingTrack[] streamingTrackArr;
        WritableByteChannel out = Channels.newChannel(this.outputStream);
        createFtyp().getBox(out);
        createMoov().getBox(out);
        ExecutorService es = Executors.newFixedThreadPool(this.source.length);
        for (StreamingTrack streamingTrack : this.source) {
            es.submit(new ConsumeSamplesCallable(streamingTrack));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void consumeSample(StreamingTrack streamingTrack, StreamingSample ss) throws IOException {
        SampleExtension[] extensions;
        SampleFlagsSampleExtension sampleDependencySampleExtension = null;
        for (SampleExtension sampleExtension : ss.getExtensions()) {
            if (sampleExtension instanceof SampleFlagsSampleExtension) {
                sampleDependencySampleExtension = (SampleFlagsSampleExtension) sampleExtension;
            } else if (sampleExtension instanceof CompositionTimeSampleExtension) {
                CompositionTimeSampleExtension compositionTimeSampleExtension = (CompositionTimeSampleExtension) sampleExtension;
            }
        }
        this.currentTime += ss.getDuration();
        this.fragmentBuffers.get(streamingTrack).add(ss);
        if (this.currentTime > this.currentFragmentStartTime + (3 * streamingTrack.getTimescale()) && this.fragmentBuffers.size() > 0 && (this.sampleDependencyTrackExtension == null || sampleDependencySampleExtension == null || sampleDependencySampleExtension.isSyncSample())) {
            WritableByteChannel out = Channels.newChannel(this.outputStream);
            createMoof(streamingTrack).getBox(out);
            createMdat(streamingTrack).getBox(out);
            this.currentFragmentStartTime = this.currentTime;
            this.fragmentBuffers.clear();
        }
    }

    private Box createMoof(StreamingTrack streamingTrack) {
        MovieFragmentBox moof = new MovieFragmentBox();
        createMfhd(this.sequenceNumber, moof);
        createTraf(streamingTrack, moof);
        TrackRunBox firstTrun = moof.getTrackRunBoxes().get(0);
        firstTrun.setDataOffset(1);
        firstTrun.setDataOffset((int) (8 + moof.getSize()));
        this.sequenceNumber++;
        return moof;
    }

    protected void createTfhd(StreamingTrack streamingTrack, TrackFragmentBox parent) {
        TrackFragmentHeaderBox tfhd = new TrackFragmentHeaderBox();
        SampleFlags sf = new SampleFlags();
        tfhd.setDefaultSampleFlags(sf);
        tfhd.setBaseDataOffset(-1L);
        tfhd.setTrackId(((TrackIdTrackExtension) streamingTrack.getTrackExtension(TrackIdTrackExtension.class)).getTrackId());
        tfhd.setDefaultBaseIsMoof(true);
        parent.addBox(tfhd);
    }

    protected void createTfdt(TrackFragmentBox parent) {
        TrackFragmentBaseMediaDecodeTimeBox tfdt = new TrackFragmentBaseMediaDecodeTimeBox();
        tfdt.setVersion(1);
        tfdt.setBaseMediaDecodeTime(this.currentFragmentStartTime);
        parent.addBox(tfdt);
    }

    protected void createTrun(StreamingTrack streamingTrack, TrackFragmentBox parent) {
        TrackRunBox trun = new TrackRunBox();
        trun.setVersion(1);
        trun.setSampleDurationPresent(true);
        trun.setSampleSizePresent(true);
        List<TrackRunBox.Entry> entries = new ArrayList<>(this.fragmentBuffers.size());
        trun.setSampleCompositionTimeOffsetPresent(streamingTrack.getTrackExtension(CompositionTimeTrackExtension.class) != null);
        boolean sampleFlagsRequired = streamingTrack.getTrackExtension(SampleFlagsTrackExtension.class) != null;
        trun.setSampleFlagsPresent(sampleFlagsRequired);
        for (StreamingSample streamingSample : this.fragmentBuffers.get(streamingTrack)) {
            TrackRunBox.Entry entry = new TrackRunBox.Entry();
            entry.setSampleSize(streamingSample.getContent().remaining());
            if (sampleFlagsRequired) {
                SampleFlagsSampleExtension sampleFlagsSampleExtension = (SampleFlagsSampleExtension) StreamingSampleHelper.getSampleExtension(streamingSample, SampleFlagsSampleExtension.class);
                if (!$assertionsDisabled && sampleFlagsSampleExtension == null) {
                    throw new AssertionError("SampleDependencySampleExtension missing even though SampleDependencyTrackExtension was present");
                }
                SampleFlags sflags = new SampleFlags();
                sflags.setIsLeading(sampleFlagsSampleExtension.getIsLeading());
                sflags.setSampleIsDependedOn(sampleFlagsSampleExtension.getSampleIsDependedOn());
                sflags.setSampleDependsOn(sampleFlagsSampleExtension.getSampleDependsOn());
                sflags.setSampleHasRedundancy(sampleFlagsSampleExtension.getSampleHasRedundancy());
                sflags.setSampleIsDifferenceSample(sampleFlagsSampleExtension.isSampleIsNonSyncSample());
                sflags.setSamplePaddingValue(sampleFlagsSampleExtension.getSamplePaddingValue());
                sflags.setSampleDegradationPriority(sampleFlagsSampleExtension.getSampleDegradationPriority());
                entry.setSampleFlags(sflags);
            }
            entry.setSampleDuration(streamingSample.getDuration());
            if (trun.isSampleCompositionTimeOffsetPresent()) {
                CompositionTimeSampleExtension compositionTimeSampleExtension = (CompositionTimeSampleExtension) StreamingSampleHelper.getSampleExtension(streamingSample, CompositionTimeSampleExtension.class);
                if (!$assertionsDisabled && compositionTimeSampleExtension == null) {
                    throw new AssertionError("CompositionTimeSampleExtension missing even though CompositionTimeTrackExtension was present");
                }
                entry.setSampleCompositionTimeOffset(compositionTimeSampleExtension.getCompositionTimeOffset());
            }
            entries.add(entry);
        }
        trun.setEntries(entries);
        parent.addBox(trun);
    }

    private void createTraf(StreamingTrack streamingTrack, MovieFragmentBox moof) {
        TrackFragmentBox traf = new TrackFragmentBox();
        moof.addBox(traf);
        createTfhd(streamingTrack, traf);
        createTfdt(traf);
        createTrun(streamingTrack, traf);
        streamingTrack.getTrackExtension(CencEncryptTrackExtension.class);
    }

    private void createMfhd(long sequenceNumber, MovieFragmentBox moof) {
        MovieFragmentHeaderBox mfhd = new MovieFragmentHeaderBox();
        mfhd.setSequenceNumber(sequenceNumber);
        moof.addBox(mfhd);
    }

    private Box createMdat(final StreamingTrack streamingTrack) {
        return new WriteOnlyBox(MediaDataBox.TYPE) { // from class: com.mp4parser.streaming.MultiTrackFragmentedMp4Writer.1
            @Override // com.coremedia.iso.boxes.Box
            public long getSize() {
                long l = 8;
                for (StreamingSample streamingSample : MultiTrackFragmentedMp4Writer.this.fragmentBuffers.get(streamingTrack)) {
                    l += streamingSample.getContent().remaining();
                }
                return l;
            }

            @Override // com.coremedia.iso.boxes.Box
            public void getBox(WritableByteChannel writableByteChannel) throws IOException {
                ArrayList<ByteBuffer> sampleContents = new ArrayList<>();
                long l = 8;
                for (StreamingSample streamingSample : MultiTrackFragmentedMp4Writer.this.fragmentBuffers.get(streamingTrack)) {
                    ByteBuffer sampleContent = streamingSample.getContent();
                    sampleContents.add(sampleContent);
                    l += sampleContent.remaining();
                }
                ByteBuffer bb = ByteBuffer.allocate(8);
                IsoTypeWriter.writeUInt32(bb, l);
                bb.put(IsoFile.fourCCtoBytes(getType()));
                writableByteChannel.write((ByteBuffer) bb.rewind());
                Iterator<ByteBuffer> it = sampleContents.iterator();
                while (it.hasNext()) {
                    writableByteChannel.write(it.next());
                }
            }
        };
    }
}
