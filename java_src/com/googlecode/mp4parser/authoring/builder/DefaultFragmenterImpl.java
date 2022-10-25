package com.googlecode.mp4parser.authoring.builder;

import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.util.Mp4Arrays;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class DefaultFragmenterImpl implements Fragmenter {
    private double fragmentLength;

    public DefaultFragmenterImpl(double fragmentLength) {
        this.fragmentLength = 2.0d;
        this.fragmentLength = fragmentLength;
    }

    @Override // com.googlecode.mp4parser.authoring.builder.Fragmenter
    public long[] sampleNumbers(Track track) {
        long[] segmentStartSamples = {1};
        long[] sampleDurations = track.getSampleDurations();
        long[] syncSamples = track.getSyncSamples();
        long timescale = track.getTrackMetaData().getTimescale();
        double time = 0.0d;
        for (int i = 0; i < sampleDurations.length; i++) {
            time += sampleDurations[i] / timescale;
            if (time >= this.fragmentLength && (syncSamples == null || Arrays.binarySearch(syncSamples, i + 1) >= 0)) {
                if (i > 0) {
                    segmentStartSamples = Mp4Arrays.copyOfAndAppend(segmentStartSamples, i + 1);
                }
                time = 0.0d;
            }
        }
        if (time < this.fragmentLength && segmentStartSamples.length > 1) {
            long[] nuSegmentStartSamples = new long[segmentStartSamples.length - 1];
            System.arraycopy(segmentStartSamples, 0, nuSegmentStartSamples, 0, segmentStartSamples.length - 1);
            return nuSegmentStartSamples;
        }
        return segmentStartSamples;
    }
}
