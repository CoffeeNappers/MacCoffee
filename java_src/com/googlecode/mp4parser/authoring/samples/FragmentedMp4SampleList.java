package com.googlecode.mp4parser.authoring.samples;

import com.coremedia.iso.IsoFile;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.Container;
import com.coremedia.iso.boxes.TrackBox;
import com.coremedia.iso.boxes.fragment.MovieFragmentBox;
import com.coremedia.iso.boxes.fragment.TrackExtendsBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentBox;
import com.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import com.coremedia.iso.boxes.fragment.TrackRunBox;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.util.CastUtils;
import com.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.lang.ref.SoftReference;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class FragmentedMp4SampleList extends AbstractList<Sample> {
    private List<TrackFragmentBox> allTrafs;
    private int[] firstSamples;
    IsoFile[] fragments;
    private SoftReference<Sample>[] sampleCache;
    Container topLevel;
    TrackBox trackBox;
    TrackExtendsBox trex;
    private Map<TrackRunBox, SoftReference<ByteBuffer>> trunDataCache = new HashMap();
    private int size_ = -1;

    public FragmentedMp4SampleList(long track, Container topLevel, IsoFile... fragments) {
        this.trackBox = null;
        this.trex = null;
        this.topLevel = topLevel;
        this.fragments = fragments;
        List<TrackBox> tbs = Path.getPaths(topLevel, "moov[0]/trak");
        for (TrackBox tb : tbs) {
            if (tb.getTrackHeaderBox().getTrackId() == track) {
                this.trackBox = tb;
            }
        }
        if (this.trackBox == null) {
            throw new RuntimeException("This MP4 does not contain track " + track);
        }
        List<TrackExtendsBox> trexs = Path.getPaths(topLevel, "moov[0]/mvex[0]/trex");
        for (TrackExtendsBox box : trexs) {
            if (box.getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId()) {
                this.trex = box;
            }
        }
        this.sampleCache = (SoftReference[]) Array.newInstance(SoftReference.class, size());
        initAllFragments();
    }

    private List<TrackFragmentBox> initAllFragments() {
        IsoFile[] isoFileArr;
        if (this.allTrafs != null) {
            return this.allTrafs;
        }
        List<TrackFragmentBox> trafs = new ArrayList<>();
        for (MovieFragmentBox moof : this.topLevel.getBoxes(MovieFragmentBox.class)) {
            for (TrackFragmentBox trackFragmentBox : moof.getBoxes(TrackFragmentBox.class)) {
                if (trackFragmentBox.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId()) {
                    trafs.add(trackFragmentBox);
                }
            }
        }
        if (this.fragments != null) {
            for (IsoFile fragment : this.fragments) {
                for (MovieFragmentBox moof2 : fragment.getBoxes(MovieFragmentBox.class)) {
                    for (TrackFragmentBox trackFragmentBox2 : moof2.getBoxes(TrackFragmentBox.class)) {
                        if (trackFragmentBox2.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId()) {
                            trafs.add(trackFragmentBox2);
                        }
                    }
                }
            }
        }
        this.allTrafs = trafs;
        int firstSample = 1;
        this.firstSamples = new int[this.allTrafs.size()];
        for (int i = 0; i < this.allTrafs.size(); i++) {
            this.firstSamples[i] = firstSample;
            firstSample += getTrafSize(this.allTrafs.get(i));
        }
        return trafs;
    }

    private int getTrafSize(TrackFragmentBox traf) {
        List<Box> boxes = traf.getBoxes();
        int size = 0;
        for (int i = 0; i < boxes.size(); i++) {
            Box b = boxes.get(i);
            if (b instanceof TrackRunBox) {
                size += CastUtils.l2i(((TrackRunBox) b).getSampleCount());
            }
        }
        return size;
    }

    @Override // java.util.AbstractList, java.util.List
    /* renamed from: get */
    public Sample mo435get(int index) {
        final long sampleSize;
        long j;
        Container base;
        Sample cachedSample;
        if (this.sampleCache[index] == null || (cachedSample = this.sampleCache[index].get()) == null) {
            int targetIndex = index + 1;
            int j2 = this.firstSamples.length - 1;
            while (targetIndex - this.firstSamples[j2] < 0) {
                j2--;
            }
            TrackFragmentBox trackFragmentBox = this.allTrafs.get(j2);
            int sampleIndexWithInTraf = targetIndex - this.firstSamples[j2];
            int previousTrunsSize = 0;
            MovieFragmentBox moof = (MovieFragmentBox) trackFragmentBox.getParent();
            for (Box box : trackFragmentBox.getBoxes()) {
                if (box instanceof TrackRunBox) {
                    TrackRunBox trun = (TrackRunBox) box;
                    if (trun.getEntries().size() <= sampleIndexWithInTraf - previousTrunsSize) {
                        previousTrunsSize += trun.getEntries().size();
                    } else {
                        List<TrackRunBox.Entry> trackRunEntries = trun.getEntries();
                        TrackFragmentHeaderBox tfhd = trackFragmentBox.getTrackFragmentHeaderBox();
                        boolean sampleSizePresent = trun.isSampleSizePresent();
                        boolean hasDefaultSampleSize = tfhd.hasDefaultSampleSize();
                        long defaultSampleSize = 0;
                        if (!sampleSizePresent) {
                            if (hasDefaultSampleSize) {
                                defaultSampleSize = tfhd.getDefaultSampleSize();
                            } else if (this.trex == null) {
                                throw new RuntimeException("File doesn't contain trex box but track fragments aren't fully self contained. Cannot determine sample size.");
                            } else {
                                defaultSampleSize = this.trex.getDefaultSampleSize();
                            }
                        }
                        SoftReference<ByteBuffer> trunDataRef = this.trunDataCache.get(trun);
                        ByteBuffer trunData = trunDataRef != null ? trunDataRef.get() : null;
                        if (trunData == null) {
                            long offset = 0;
                            if (tfhd.hasBaseDataOffset()) {
                                offset = 0 + tfhd.getBaseDataOffset();
                                base = moof.getParent();
                            } else {
                                base = moof;
                            }
                            if (trun.isDataOffsetPresent()) {
                                offset += trun.getDataOffset();
                            }
                            int size = 0;
                            for (TrackRunBox.Entry e : trackRunEntries) {
                                if (sampleSizePresent) {
                                    size = (int) (size + e.getSampleSize());
                                } else {
                                    size = (int) (size + defaultSampleSize);
                                }
                            }
                            try {
                                trunData = base.getByteBuffer(offset, size);
                                this.trunDataCache.put(trun, new SoftReference<>(trunData));
                            } catch (IOException e2) {
                                throw new RuntimeException(e2);
                            }
                        }
                        int offset2 = 0;
                        for (int i = 0; i < sampleIndexWithInTraf - previousTrunsSize; i++) {
                            if (sampleSizePresent) {
                                j = offset2 + trackRunEntries.get(i).getSampleSize();
                            } else {
                                j = offset2 + defaultSampleSize;
                            }
                            offset2 = (int) j;
                        }
                        if (sampleSizePresent) {
                            sampleSize = trackRunEntries.get(sampleIndexWithInTraf - previousTrunsSize).getSampleSize();
                        } else {
                            sampleSize = defaultSampleSize;
                        }
                        final ByteBuffer finalTrunData = trunData;
                        final int finalOffset = offset2;
                        Sample sample = new Sample() { // from class: com.googlecode.mp4parser.authoring.samples.FragmentedMp4SampleList.1
                            @Override // com.googlecode.mp4parser.authoring.Sample
                            public void writeTo(WritableByteChannel channel) throws IOException {
                                channel.write(asByteBuffer());
                            }

                            @Override // com.googlecode.mp4parser.authoring.Sample
                            public long getSize() {
                                return sampleSize;
                            }

                            @Override // com.googlecode.mp4parser.authoring.Sample
                            public ByteBuffer asByteBuffer() {
                                return (ByteBuffer) ((ByteBuffer) finalTrunData.position(finalOffset)).slice().limit(CastUtils.l2i(sampleSize));
                            }
                        };
                        this.sampleCache[index] = new SoftReference<>(sample);
                        return sample;
                    }
                }
            }
            throw new RuntimeException("Couldn't find sample in the traf I was looking");
        }
        return cachedSample;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public int size() {
        IsoFile[] isoFileArr;
        if (this.size_ != -1) {
            return this.size_;
        }
        int i = 0;
        for (MovieFragmentBox moof : this.topLevel.getBoxes(MovieFragmentBox.class)) {
            for (TrackFragmentBox trackFragmentBox : moof.getBoxes(TrackFragmentBox.class)) {
                if (trackFragmentBox.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId()) {
                    for (TrackRunBox trackRunBox : trackFragmentBox.getBoxes(TrackRunBox.class)) {
                        i = (int) (i + trackRunBox.getSampleCount());
                    }
                }
            }
        }
        for (IsoFile fragment : this.fragments) {
            for (MovieFragmentBox moof2 : fragment.getBoxes(MovieFragmentBox.class)) {
                for (TrackFragmentBox trackFragmentBox2 : moof2.getBoxes(TrackFragmentBox.class)) {
                    if (trackFragmentBox2.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId()) {
                        for (TrackRunBox trackRunBox2 : trackFragmentBox2.getBoxes(TrackRunBox.class)) {
                            i = (int) (i + trackRunBox2.getSampleCount());
                        }
                    }
                }
            }
        }
        this.size_ = i;
        return i;
    }
}
