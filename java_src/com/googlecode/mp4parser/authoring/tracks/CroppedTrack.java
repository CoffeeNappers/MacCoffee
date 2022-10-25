package com.googlecode.mp4parser.authoring.tracks;

import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.SubSampleInformationBox;
import com.coremedia.iso.boxes.TimeToSampleBox;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
/* loaded from: classes2.dex */
public class CroppedTrack extends AbstractTrack {
    static final /* synthetic */ boolean $assertionsDisabled;
    private int fromSample;
    Track origTrack;
    private int toSample;

    static {
        $assertionsDisabled = !CroppedTrack.class.desiredAssertionStatus();
    }

    public CroppedTrack(Track origTrack, long fromSample, long toSample) {
        super("crop(" + origTrack.getName() + ")");
        this.origTrack = origTrack;
        if ($assertionsDisabled || fromSample <= 2147483647L) {
            if (!$assertionsDisabled && toSample > 2147483647L) {
                throw new AssertionError();
            }
            this.fromSample = (int) fromSample;
            this.toSample = (int) toSample;
            return;
        }
        throw new AssertionError();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.origTrack.close();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return this.origTrack.getSamples().subList(this.fromSample, this.toSample);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.origTrack.getSampleDescriptionBox();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public synchronized long[] getSampleDurations() {
        long[] decodingTimes;
        decodingTimes = new long[this.toSample - this.fromSample];
        System.arraycopy(this.origTrack.getSampleDurations(), this.fromSample, decodingTimes, 0, decodingTimes.length);
        return decodingTimes;
    }

    static List<TimeToSampleBox.Entry> getDecodingTimeEntries(List<TimeToSampleBox.Entry> origSamples, long fromSample, long toSample) {
        TimeToSampleBox.Entry currentEntry;
        if (origSamples != null && !origSamples.isEmpty()) {
            long current = 0;
            ListIterator<TimeToSampleBox.Entry> e = origSamples.listIterator();
            LinkedList<TimeToSampleBox.Entry> nuList = new LinkedList<>();
            while (true) {
                currentEntry = e.next();
                if (currentEntry.getCount() + current > fromSample) {
                    break;
                }
                current += currentEntry.getCount();
            }
            if (currentEntry.getCount() + current >= toSample) {
                nuList.add(new TimeToSampleBox.Entry(toSample - fromSample, currentEntry.getDelta()));
                return nuList;
            }
            nuList.add(new TimeToSampleBox.Entry((currentEntry.getCount() + current) - fromSample, currentEntry.getDelta()));
            long count = currentEntry.getCount();
            while (true) {
                current += count;
                if (!e.hasNext()) {
                    break;
                }
                currentEntry = e.next();
                if (currentEntry.getCount() + current >= toSample) {
                    break;
                }
                nuList.add(currentEntry);
                count = currentEntry.getCount();
            }
            nuList.add(new TimeToSampleBox.Entry(toSample - current, currentEntry.getDelta()));
            return nuList;
        }
        return null;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<CompositionTimeToSample.Entry> getCompositionTimeEntries() {
        return getCompositionTimeEntries(this.origTrack.getCompositionTimeEntries(), this.fromSample, this.toSample);
    }

    static List<CompositionTimeToSample.Entry> getCompositionTimeEntries(List<CompositionTimeToSample.Entry> origSamples, long fromSample, long toSample) {
        CompositionTimeToSample.Entry currentEntry;
        if (origSamples != null && !origSamples.isEmpty()) {
            long current = 0;
            ListIterator<CompositionTimeToSample.Entry> e = origSamples.listIterator();
            ArrayList<CompositionTimeToSample.Entry> nuList = new ArrayList<>();
            while (true) {
                currentEntry = e.next();
                if (currentEntry.getCount() + current > fromSample) {
                    break;
                }
                current += currentEntry.getCount();
            }
            if (currentEntry.getCount() + current >= toSample) {
                nuList.add(new CompositionTimeToSample.Entry((int) (toSample - fromSample), currentEntry.getOffset()));
                return nuList;
            }
            nuList.add(new CompositionTimeToSample.Entry((int) ((currentEntry.getCount() + current) - fromSample), currentEntry.getOffset()));
            int count = currentEntry.getCount();
            while (true) {
                current += count;
                if (!e.hasNext()) {
                    break;
                }
                currentEntry = e.next();
                if (currentEntry.getCount() + current >= toSample) {
                    break;
                }
                nuList.add(currentEntry);
                count = currentEntry.getCount();
            }
            nuList.add(new CompositionTimeToSample.Entry((int) (toSample - current), currentEntry.getOffset()));
            return nuList;
        }
        return null;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public synchronized long[] getSyncSamples() {
        long[] syncSampleArray;
        if (this.origTrack.getSyncSamples() != null) {
            long[] origSyncSamples = this.origTrack.getSyncSamples();
            int i = 0;
            int j = origSyncSamples.length;
            while (i < origSyncSamples.length && origSyncSamples[i] < this.fromSample) {
                i++;
            }
            while (j > 0 && this.toSample < origSyncSamples[j - 1]) {
                j--;
            }
            syncSampleArray = new long[j - i];
            System.arraycopy(this.origTrack.getSyncSamples(), i, syncSampleArray, 0, j - i);
            for (int k = 0; k < syncSampleArray.length; k++) {
                syncSampleArray[k] = syncSampleArray[k] - this.fromSample;
            }
        } else {
            syncSampleArray = null;
        }
        return syncSampleArray;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<SampleDependencyTypeBox.Entry> getSampleDependencies() {
        if (this.origTrack.getSampleDependencies() == null || this.origTrack.getSampleDependencies().isEmpty()) {
            return null;
        }
        return this.origTrack.getSampleDependencies().subList(this.fromSample, this.toSample);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.origTrack.getTrackMetaData();
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return this.origTrack.getHandler();
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public SubSampleInformationBox getSubsampleInformationBox() {
        return this.origTrack.getSubsampleInformationBox();
    }
}
