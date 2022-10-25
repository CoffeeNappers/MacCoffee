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
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class SingleTrackFragmentedMp4Writer implements StreamingMp4Writer {
    static final /* synthetic */ boolean $assertionsDisabled;
    CompositionTimeTrackExtension compositionTimeTrackExtension;
    private final OutputStream outputStream;
    SampleFlagsTrackExtension sampleDependencyTrackExtension;
    private long sequenceNumber;
    StreamingTrack source;
    List<StreamingSample> fragment = new ArrayList();
    private long currentFragmentStartTime = 0;
    private long currentTime = 0;
    Date creationTime = new Date();

    static {
        $assertionsDisabled = !SingleTrackFragmentedMp4Writer.class.desiredAssertionStatus();
    }

    public SingleTrackFragmentedMp4Writer(StreamingTrack source, OutputStream outputStream) {
        this.source = source;
        this.outputStream = outputStream;
        this.compositionTimeTrackExtension = (CompositionTimeTrackExtension) source.getTrackExtension(CompositionTimeTrackExtension.class);
        this.sampleDependencyTrackExtension = (SampleFlagsTrackExtension) source.getTrackExtension(SampleFlagsTrackExtension.class);
    }

    @Override // com.mp4parser.streaming.StreamingMp4Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    protected Box createMvhd() {
        MovieHeaderBox mvhd = new MovieHeaderBox();
        mvhd.setVersion(1);
        mvhd.setCreationTime(this.creationTime);
        mvhd.setModificationTime(this.creationTime);
        mvhd.setDuration(0L);
        long movieTimeScale = this.source.getTimescale();
        mvhd.setTimescale(movieTimeScale);
        mvhd.setNextTrackId(2L);
        return mvhd;
    }

    protected Box createMdiaHdlr() {
        HandlerBox hdlr = new HandlerBox();
        hdlr.setHandlerType(this.source.getHandler());
        return hdlr;
    }

    protected Box createMdhd() {
        MediaHeaderBox mdhd = new MediaHeaderBox();
        mdhd.setCreationTime(this.creationTime);
        mdhd.setModificationTime(this.creationTime);
        mdhd.setDuration(0L);
        mdhd.setTimescale(this.source.getTimescale());
        mdhd.setLanguage(this.source.getLanguage());
        return mdhd;
    }

    protected Box createMdia() {
        MediaBox mdia = new MediaBox();
        mdia.addBox(createMdhd());
        mdia.addBox(createMdiaHdlr());
        mdia.addBox(createMinf());
        return mdia;
    }

    protected Box createMinf() {
        MediaInformationBox minf = new MediaInformationBox();
        if (this.source.getHandler().equals("vide")) {
            minf.addBox(new VideoMediaHeaderBox());
        } else if (this.source.getHandler().equals("soun")) {
            minf.addBox(new SoundMediaHeaderBox());
        } else if (this.source.getHandler().equals("text")) {
            minf.addBox(new NullMediaHeaderBox());
        } else if (this.source.getHandler().equals("subt")) {
            minf.addBox(new SubtitleMediaHeaderBox());
        } else if (this.source.getHandler().equals("hint")) {
            minf.addBox(new HintMediaHeaderBox());
        } else if (this.source.getHandler().equals("sbtl")) {
            minf.addBox(new NullMediaHeaderBox());
        }
        minf.addBox(createDinf());
        minf.addBox(createStbl());
        return minf;
    }

    protected Box createStbl() {
        SampleTableBox stbl = new SampleTableBox();
        stbl.addBox(this.source.getSampleDescriptionBox());
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

    protected Box createTrak() {
        TrackBox trackBox = new TrackBox();
        trackBox.addBox(this.source.getTrackHeaderBox());
        trackBox.addBox(createMdia());
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
        MovieExtendsBox mvex = new MovieExtendsBox();
        MovieExtendsHeaderBox mved = new MovieExtendsHeaderBox();
        mved.setVersion(1);
        mved.setFragmentDuration(0L);
        mvex.addBox(mved);
        mvex.addBox(createTrex());
        return mvex;
    }

    protected Box createTrex() {
        TrackExtendsBox trex = new TrackExtendsBox();
        trex.setTrackId(this.source.getTrackHeaderBox().getTrackId());
        trex.setDefaultSampleDescriptionIndex(1L);
        trex.setDefaultSampleDuration(0L);
        trex.setDefaultSampleSize(0L);
        SampleFlags sf = new SampleFlags();
        if ("soun".equals(this.source.getHandler()) || "subt".equals(this.source.getHandler())) {
            sf.setSampleDependsOn(2);
            sf.setSampleIsDependedOn(2);
        }
        trex.setDefaultSampleFlags(sf);
        return trex;
    }

    protected Box createMoov() {
        MovieBox movieBox = new MovieBox();
        movieBox.addBox(createMvhd());
        movieBox.addBox(createTrak());
        movieBox.addBox(createMvex());
        return movieBox;
    }

    @Override // com.mp4parser.streaming.StreamingMp4Writer
    public void write() throws IOException {
        StreamingSample ss;
        WritableByteChannel out = Channels.newChannel(this.outputStream);
        createFtyp().getBox(out);
        createMoov().getBox(out);
        while (true) {
            try {
                ss = this.source.getSamples().poll(100L, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (ss != null) {
                consumeSample(ss, out);
            } else if (!this.source.hasMoreSamples()) {
                return;
            }
        }
    }

    private void consumeSample(StreamingSample ss, WritableByteChannel out) throws IOException {
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
        this.fragment.add(ss);
        if (this.currentTime > this.currentFragmentStartTime + (3 * this.source.getTimescale()) && this.fragment.size() > 0) {
            if (this.sampleDependencyTrackExtension == null || sampleDependencySampleExtension == null || sampleDependencySampleExtension.isSyncSample()) {
                createMoof().getBox(out);
                createMdat().getBox(out);
                this.currentFragmentStartTime = this.currentTime;
                this.fragment.clear();
            }
        }
    }

    private Box createMoof() {
        MovieFragmentBox moof = new MovieFragmentBox();
        createMfhd(this.sequenceNumber, moof);
        createTraf(this.sequenceNumber, moof);
        TrackRunBox firstTrun = moof.getTrackRunBoxes().get(0);
        firstTrun.setDataOffset(1);
        firstTrun.setDataOffset((int) (8 + moof.getSize()));
        return moof;
    }

    protected void createTfhd(TrackFragmentBox parent) {
        TrackFragmentHeaderBox tfhd = new TrackFragmentHeaderBox();
        SampleFlags sf = new SampleFlags();
        tfhd.setDefaultSampleFlags(sf);
        tfhd.setBaseDataOffset(-1L);
        TrackIdTrackExtension trackIdTrackExtension = (TrackIdTrackExtension) this.source.getTrackExtension(TrackIdTrackExtension.class);
        if (trackIdTrackExtension != null) {
            tfhd.setTrackId(trackIdTrackExtension.getTrackId());
        } else {
            tfhd.setTrackId(1L);
        }
        tfhd.setDefaultBaseIsMoof(true);
        parent.addBox(tfhd);
    }

    protected void createTfdt(TrackFragmentBox parent) {
        TrackFragmentBaseMediaDecodeTimeBox tfdt = new TrackFragmentBaseMediaDecodeTimeBox();
        tfdt.setVersion(1);
        tfdt.setBaseMediaDecodeTime(this.currentFragmentStartTime);
        parent.addBox(tfdt);
    }

    protected void createTrun(TrackFragmentBox parent) {
        TrackRunBox trun = new TrackRunBox();
        trun.setVersion(1);
        trun.setSampleDurationPresent(true);
        trun.setSampleSizePresent(true);
        List<TrackRunBox.Entry> entries = new ArrayList<>(this.fragment.size());
        trun.setSampleCompositionTimeOffsetPresent(this.source.getTrackExtension(CompositionTimeTrackExtension.class) != null);
        boolean sampleFlagsRequired = this.source.getTrackExtension(SampleFlagsTrackExtension.class) != null;
        trun.setSampleFlagsPresent(sampleFlagsRequired);
        for (StreamingSample streamingSample : this.fragment) {
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

    private void createTraf(long sequenceNumber, MovieFragmentBox moof) {
        TrackFragmentBox traf = new TrackFragmentBox();
        moof.addBox(traf);
        createTfhd(traf);
        createTfdt(traf);
        createTrun(traf);
        this.source.getTrackExtension(CencEncryptTrackExtension.class);
    }

    private void createMfhd(long sequenceNumber, MovieFragmentBox moof) {
        MovieFragmentHeaderBox mfhd = new MovieFragmentHeaderBox();
        mfhd.setSequenceNumber(sequenceNumber);
        moof.addBox(mfhd);
    }

    private Box createMdat() {
        return new WriteOnlyBox(MediaDataBox.TYPE) { // from class: com.mp4parser.streaming.SingleTrackFragmentedMp4Writer.1
            @Override // com.coremedia.iso.boxes.Box
            public long getSize() {
                long l = 8;
                for (StreamingSample streamingSample : SingleTrackFragmentedMp4Writer.this.fragment) {
                    l += streamingSample.getContent().remaining();
                }
                return l;
            }

            @Override // com.coremedia.iso.boxes.Box
            public void getBox(WritableByteChannel writableByteChannel) throws IOException {
                ArrayList<ByteBuffer> sampleContents = new ArrayList<>();
                long l = 8;
                for (StreamingSample streamingSample : SingleTrackFragmentedMp4Writer.this.fragment) {
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
