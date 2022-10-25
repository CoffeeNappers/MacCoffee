package com.googlecode.mp4parser.authoring.builder;

import com.coremedia.iso.boxes.OriginalFormatBox;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.googlecode.mp4parser.AbstractContainerBox;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.util.Math;
import com.googlecode.mp4parser.util.Path;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;
/* loaded from: classes2.dex */
public class SyncSampleIntersectFinderImpl implements Fragmenter {
    private static Logger LOG = Logger.getLogger(SyncSampleIntersectFinderImpl.class.getName());
    private final int minFragmentDurationSeconds;
    private Movie movie;
    private Track referenceTrack;

    public SyncSampleIntersectFinderImpl(Movie movie, Track referenceTrack, int minFragmentDurationSeconds) {
        this.movie = movie;
        this.referenceTrack = referenceTrack;
        this.minFragmentDurationSeconds = minFragmentDurationSeconds;
    }

    static String getFormat(Track track) {
        SampleDescriptionBox stsd = track.getSampleDescriptionBox();
        OriginalFormatBox frma = (OriginalFormatBox) Path.getPath((AbstractContainerBox) stsd, "enc./sinf/frma");
        return frma != null ? frma.getDataFormat() : stsd.getSampleEntry().getType();
    }

    @Override // com.googlecode.mp4parser.authoring.builder.Fragmenter
    public long[] sampleNumbers(Track track) {
        if ("vide".equals(track.getHandler())) {
            if (track.getSyncSamples() != null && track.getSyncSamples().length > 0) {
                List<long[]> times = getSyncSamplesTimestamps(this.movie, track);
                return getCommonIndices(track.getSyncSamples(), getTimes(track, this.movie), track.getTrackMetaData().getTimescale(), (long[][]) times.toArray(new long[times.size()]));
            }
            throw new RuntimeException("Video Tracks need sync samples. Only tracks other than video may have no sync samples.");
        } else if ("soun".equals(track.getHandler())) {
            if (this.referenceTrack == null) {
                for (Track candidate : this.movie.getTracks()) {
                    if (candidate.getSyncSamples() != null && "vide".equals(candidate.getHandler()) && candidate.getSyncSamples().length > 0) {
                        this.referenceTrack = candidate;
                    }
                }
            }
            if (this.referenceTrack != null) {
                long[] refSyncSamples = sampleNumbers(this.referenceTrack);
                int refSampleCount = this.referenceTrack.getSamples().size();
                long[] syncSamples = new long[refSyncSamples.length];
                long minSampleRate = 192000;
                Iterator<Track> it = this.movie.getTracks().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Track testTrack = it.next();
                    if (getFormat(track).equals(getFormat(testTrack))) {
                        AudioSampleEntry ase = (AudioSampleEntry) testTrack.getSampleDescriptionBox().getSampleEntry();
                        if (ase.getSampleRate() < 192000) {
                            minSampleRate = ase.getSampleRate();
                            long sc = testTrack.getSamples().size();
                            double stretch = sc / refSampleCount;
                            long samplesPerFrame = testTrack.getSampleDurations()[0];
                            for (int i = 0; i < syncSamples.length; i++) {
                                long start = (long) Math.ceil((refSyncSamples[i] - 1) * stretch * samplesPerFrame);
                                syncSamples[i] = start;
                            }
                        }
                    }
                }
                long samplesPerFrame2 = track.getSampleDurations()[0];
                double factor = ((AudioSampleEntry) track.getSampleDescriptionBox().getSampleEntry()).getSampleRate() / minSampleRate;
                if (factor != Math.rint(factor)) {
                    throw new RuntimeException("Sample rates must be a multiple of the lowest sample rate to create a correct file!");
                }
                for (int i2 = 0; i2 < syncSamples.length; i2++) {
                    syncSamples[i2] = (long) (1.0d + ((syncSamples[i2] * factor) / samplesPerFrame2));
                }
                return syncSamples;
            }
            throw new RuntimeException("There was absolutely no Track with sync samples. I can't work with that!");
        } else {
            for (Track candidate2 : this.movie.getTracks()) {
                if (candidate2.getSyncSamples() != null && candidate2.getSyncSamples().length > 0) {
                    long[] refSyncSamples2 = sampleNumbers(candidate2);
                    int refSampleCount2 = candidate2.getSamples().size();
                    long[] syncSamples2 = new long[refSyncSamples2.length];
                    long sc2 = track.getSamples().size();
                    double stretch2 = sc2 / refSampleCount2;
                    for (int i3 = 0; i3 < syncSamples2.length; i3++) {
                        long start2 = ((long) Math.ceil((refSyncSamples2[i3] - 1) * stretch2)) + 1;
                        syncSamples2[i3] = start2;
                    }
                    return syncSamples2;
                }
            }
            throw new RuntimeException("There was absolutely no Track with sync samples. I can't work with that!");
        }
    }

    public static List<long[]> getSyncSamplesTimestamps(Movie movie, Track track) {
        long[] currentTrackSyncSamples;
        List<long[]> times = new LinkedList<>();
        for (Track currentTrack : movie.getTracks()) {
            if (currentTrack.getHandler().equals(track.getHandler()) && (currentTrackSyncSamples = currentTrack.getSyncSamples()) != null && currentTrackSyncSamples.length > 0) {
                long[] currentTrackTimes = getTimes(currentTrack, movie);
                times.add(currentTrackTimes);
            }
        }
        return times;
    }

    public long[] getCommonIndices(long[] syncSamples, long[] syncSampleTimes, long timeScale, long[]... otherTracksTimes) {
        List<Long> nuSyncSamples = new LinkedList<>();
        List<Long> nuSyncSampleTimes = new LinkedList<>();
        for (int i = 0; i < syncSampleTimes.length; i++) {
            boolean foundInEveryRef = true;
            int length = otherTracksTimes.length;
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 >= length) {
                    break;
                }
                long[] times = otherTracksTimes[i3];
                foundInEveryRef &= Arrays.binarySearch(times, syncSampleTimes[i]) >= 0;
                i2 = i3 + 1;
            }
            if (foundInEveryRef) {
                nuSyncSamples.add(Long.valueOf(syncSamples[i]));
                nuSyncSampleTimes.add(Long.valueOf(syncSampleTimes[i]));
            }
        }
        if (nuSyncSamples.size() < syncSamples.length * 0.25d) {
            String log = String.valueOf("") + String.format("%5d - Common:  [", Integer.valueOf(nuSyncSamples.size()));
            for (Long l : nuSyncSamples) {
                long l2 = l.longValue();
                log = String.valueOf(log) + String.format("%10d,", Long.valueOf(l2));
            }
            LOG.warning(String.valueOf(log) + "]");
            String log2 = String.valueOf("") + String.format("%5d - In    :  [", Integer.valueOf(syncSamples.length));
            for (long l3 : syncSamples) {
                log2 = String.valueOf(log2) + String.format("%10d,", Long.valueOf(l3));
            }
            LOG.warning(String.valueOf(log2) + "]");
            LOG.warning("There are less than 25% of common sync samples in the given track.");
            throw new RuntimeException("There are less than 25% of common sync samples in the given track.");
        }
        if (nuSyncSamples.size() < syncSamples.length * 0.5d) {
            LOG.fine("There are less than 50% of common sync samples in the given track. This is implausible but I'm ok to continue.");
        } else if (nuSyncSamples.size() < syncSamples.length) {
            LOG.finest("Common SyncSample positions vs. this tracks SyncSample positions: " + nuSyncSamples.size() + " vs. " + syncSamples.length);
        }
        List<Long> finalSampleList = new LinkedList<>();
        if (this.minFragmentDurationSeconds > 0) {
            long lastSyncSampleTime = -1;
            Iterator<Long> nuSyncSamplesIterator = nuSyncSamples.iterator();
            Iterator<Long> nuSyncSampleTimesIterator = nuSyncSampleTimes.iterator();
            while (nuSyncSamplesIterator.hasNext() && nuSyncSampleTimesIterator.hasNext()) {
                long curSyncSample = nuSyncSamplesIterator.next().longValue();
                long curSyncSampleTime = nuSyncSampleTimesIterator.next().longValue();
                if (lastSyncSampleTime == -1 || (curSyncSampleTime - lastSyncSampleTime) / timeScale >= this.minFragmentDurationSeconds) {
                    finalSampleList.add(Long.valueOf(curSyncSample));
                    lastSyncSampleTime = curSyncSampleTime;
                }
            }
        } else {
            finalSampleList = nuSyncSamples;
        }
        long[] finalSampleArray = new long[finalSampleList.size()];
        for (int i4 = 0; i4 < finalSampleArray.length; i4++) {
            finalSampleArray[i4] = finalSampleList.get(i4).longValue();
        }
        return finalSampleArray;
    }

    private static long[] getTimes(Track track, Movie m) {
        long[] syncSamples = track.getSyncSamples();
        long[] syncSampleTimes = new long[syncSamples.length];
        long currentDuration = 0;
        int currentSyncSampleIndex = 0;
        long scalingFactor = calculateTracktimesScalingFactor(m, track);
        for (int currentSample = 1; currentSample <= syncSamples[syncSamples.length - 1]; currentSample++) {
            if (currentSample == syncSamples[currentSyncSampleIndex]) {
                syncSampleTimes[currentSyncSampleIndex] = currentDuration * scalingFactor;
                currentSyncSampleIndex++;
            }
            currentDuration += track.getSampleDurations()[currentSample - 1];
        }
        return syncSampleTimes;
    }

    private static long calculateTracktimesScalingFactor(Movie m, Track track) {
        long timeScale = 1;
        for (Track track1 : m.getTracks()) {
            if (track1.getHandler().equals(track.getHandler()) && track1.getTrackMetaData().getTimescale() != track.getTrackMetaData().getTimescale()) {
                timeScale = Math.lcm(timeScale, track1.getTrackMetaData().getTimescale());
            }
        }
        return timeScale;
    }
}
