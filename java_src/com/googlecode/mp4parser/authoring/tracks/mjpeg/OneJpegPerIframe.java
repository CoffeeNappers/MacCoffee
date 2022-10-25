package com.googlecode.mp4parser.authoring.tracks.mjpeg;

import com.coremedia.iso.Hex;
import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Edit;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.ObjectDescriptorFactory;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.List;
import javax.imageio.ImageIO;
/* loaded from: classes2.dex */
public class OneJpegPerIframe extends AbstractTrack {
    File[] jpegs;
    long[] sampleDurations;
    SampleDescriptionBox stsd;
    long[] syncSamples;
    TrackMetaData trackMetaData;

    public OneJpegPerIframe(String name, File[] jpegs, Track alignTo) throws IOException {
        super(name);
        this.trackMetaData = new TrackMetaData();
        this.jpegs = jpegs;
        if (alignTo.getSyncSamples().length != jpegs.length) {
            throw new RuntimeException("Number of sync samples doesn't match the number of stills (" + alignTo.getSyncSamples().length + " vs. " + jpegs.length + ")");
        }
        BufferedImage a = ImageIO.read(jpegs[0]);
        this.trackMetaData.setWidth(a.getWidth());
        this.trackMetaData.setHeight(a.getHeight());
        this.trackMetaData.setTimescale(alignTo.getTrackMetaData().getTimescale());
        long[] sampleDurationsToiAlignTo = alignTo.getSampleDurations();
        long[] syncSamples = alignTo.getSyncSamples();
        int currentSyncSample = 1;
        long duration = 0;
        this.sampleDurations = new long[syncSamples.length];
        for (int i = 1; i < sampleDurationsToiAlignTo.length; i++) {
            if (currentSyncSample < syncSamples.length && i == syncSamples[currentSyncSample]) {
                this.sampleDurations[currentSyncSample - 1] = duration;
                duration = 0;
                currentSyncSample++;
            }
            duration += sampleDurationsToiAlignTo[i];
        }
        this.sampleDurations[this.sampleDurations.length - 1] = duration;
        this.stsd = new SampleDescriptionBox();
        VisualSampleEntry mp4v = new VisualSampleEntry(VisualSampleEntry.TYPE1);
        this.stsd.addBox(mp4v);
        ESDescriptorBox esds = new ESDescriptorBox();
        esds.setData(ByteBuffer.wrap(Hex.decodeHex("038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102")));
        esds.setEsDescriptor((ESDescriptor) ObjectDescriptorFactory.createFrom(-1, ByteBuffer.wrap(Hex.decodeHex("038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102"))));
        mp4v.addBox(esds);
        this.syncSamples = new long[jpegs.length];
        for (int i2 = 0; i2 < this.syncSamples.length; i2++) {
            this.syncSamples[i2] = i2 + 1;
        }
        double earliestTrackPresentationTime = 0.0d;
        boolean acceptDwell = true;
        boolean acceptEdit = true;
        for (Edit edit : alignTo.getEdits()) {
            if (edit.getMediaTime() == -1 && !acceptDwell) {
                throw new RuntimeException("Cannot accept edit list for processing (1)");
            }
            if (edit.getMediaTime() >= 0 && !acceptEdit) {
                throw new RuntimeException("Cannot accept edit list for processing (2)");
            }
            if (edit.getMediaTime() == -1) {
                earliestTrackPresentationTime += edit.getSegmentDuration();
            } else {
                earliestTrackPresentationTime -= edit.getMediaTime() / edit.getTimeScale();
                acceptEdit = false;
                acceptDwell = false;
            }
        }
        if (alignTo.getCompositionTimeEntries() != null && alignTo.getCompositionTimeEntries().size() > 0) {
            long currentTime = 0;
            int[] ptss = CompositionTimeToSample.blowupCompositionTimes(alignTo.getCompositionTimeEntries());
            for (int j = 0; j < ptss.length && j < 50; j++) {
                ptss[j] = (int) (ptss[j] + currentTime);
                currentTime += alignTo.getSampleDurations()[j];
            }
            Arrays.sort(ptss);
            earliestTrackPresentationTime += ptss[0] / alignTo.getTrackMetaData().getTimescale();
        }
        if (earliestTrackPresentationTime < 0.0d) {
            List<Edit> edits = getEdits();
            long timescale = getTrackMetaData().getTimescale();
            double earliestTrackPresentationTime2 = getDuration() / getTrackMetaData().getTimescale();
            edits.add(new Edit((long) ((-earliestTrackPresentationTime) * getTrackMetaData().getTimescale()), timescale, 1.0d, earliestTrackPresentationTime2));
        } else if (earliestTrackPresentationTime > 0.0d) {
            getEdits().add(new Edit(-1L, getTrackMetaData().getTimescale(), 1.0d, earliestTrackPresentationTime));
            getEdits().add(new Edit(0L, getTrackMetaData().getTimescale(), 1.0d, getDuration() / getTrackMetaData().getTimescale()));
        }
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.stsd;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.sampleDurations;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.trackMetaData;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return "vide";
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public long[] getSyncSamples() {
        return this.syncSamples;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return new AbstractList<Sample>() { // from class: com.googlecode.mp4parser.authoring.tracks.mjpeg.OneJpegPerIframe.1
            @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
            public int size() {
                return OneJpegPerIframe.this.jpegs.length;
            }

            @Override // java.util.AbstractList, java.util.List
            /* renamed from: get */
            public Sample mo438get(final int index) {
                return new Sample() { // from class: com.googlecode.mp4parser.authoring.tracks.mjpeg.OneJpegPerIframe.1.1
                    ByteBuffer sample = null;

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public void writeTo(WritableByteChannel channel) throws IOException {
                        RandomAccessFile raf = new RandomAccessFile(OneJpegPerIframe.this.jpegs[index], "r");
                        raf.getChannel().transferTo(0L, raf.length(), channel);
                        raf.close();
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public long getSize() {
                        return OneJpegPerIframe.this.jpegs[index].length();
                    }

                    @Override // com.googlecode.mp4parser.authoring.Sample
                    public ByteBuffer asByteBuffer() {
                        if (this.sample == null) {
                            try {
                                RandomAccessFile raf = new RandomAccessFile(OneJpegPerIframe.this.jpegs[index], "r");
                                this.sample = raf.getChannel().map(FileChannel.MapMode.READ_ONLY, 0L, raf.length());
                            } catch (IOException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        return this.sample;
                    }
                };
            }
        };
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
