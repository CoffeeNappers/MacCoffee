package com.coremedia.iso.boxes.fragment;

import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.googlecode.mp4parser.AbstractContainerBox;
import com.googlecode.mp4parser.DataSource;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class MovieFragmentBox extends AbstractContainerBox {
    public static final String TYPE = "moof";

    public MovieFragmentBox() {
        super(TYPE);
    }

    public List<Long> getSyncSamples(SampleDependencyTypeBox sdtp) {
        List<Long> result = new ArrayList<>();
        List<SampleDependencyTypeBox.Entry> sampleEntries = sdtp.getEntries();
        long i = 1;
        for (SampleDependencyTypeBox.Entry sampleEntry : sampleEntries) {
            if (sampleEntry.getSampleDependsOn() == 2) {
                result.add(Long.valueOf(i));
            }
            i++;
        }
        return result;
    }

    public int getTrackCount() {
        return getBoxes(TrackFragmentBox.class, false).size();
    }

    public long[] getTrackNumbers() {
        List<TrackFragmentBox> trackBoxes = getBoxes(TrackFragmentBox.class, false);
        long[] trackNumbers = new long[trackBoxes.size()];
        for (int trackCounter = 0; trackCounter < trackBoxes.size(); trackCounter++) {
            TrackFragmentBox trackBoxe = trackBoxes.get(trackCounter);
            trackNumbers[trackCounter] = trackBoxe.getTrackFragmentHeaderBox().getTrackId();
        }
        return trackNumbers;
    }

    public List<TrackFragmentHeaderBox> getTrackFragmentHeaderBoxes() {
        return getBoxes(TrackFragmentHeaderBox.class, true);
    }

    public List<TrackRunBox> getTrackRunBoxes() {
        return getBoxes(TrackRunBox.class, true);
    }

    public DataSource getFileChannel() {
        return this.dataSource;
    }
}
