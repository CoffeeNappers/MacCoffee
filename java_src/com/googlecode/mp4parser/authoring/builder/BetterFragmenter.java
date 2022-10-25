package com.googlecode.mp4parser.authoring.builder;

import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.util.Mp4Arrays;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class BetterFragmenter implements Fragmenter {
    private double targetDuration;

    public BetterFragmenter(double targetDuration) {
        this.targetDuration = targetDuration;
    }

    @Override // com.googlecode.mp4parser.authoring.builder.Fragmenter
    public long[] sampleNumbers(Track track) {
        long ts = track.getTrackMetaData().getTimescale();
        long targetTicks = (long) (this.targetDuration * ts);
        long[] fragments = new long[0];
        long[] syncSamples = track.getSyncSamples();
        long[] durations = track.getSampleDurations();
        if (syncSamples != null) {
            long[] syncSampleTicks = new long[syncSamples.length];
            long ticks = 0;
            long duration = track.getDuration();
            for (int i = 0; i < durations.length; i++) {
                int pos = Arrays.binarySearch(syncSamples, i + 1);
                if (pos >= 0) {
                    syncSampleTicks[pos] = ticks;
                }
                ticks += durations[i];
            }
            long nextTargetTick = 0;
            for (int currentSyncSampleIndex = 0; currentSyncSampleIndex < syncSampleTicks.length - 1; currentSyncSampleIndex++) {
                long tickN1 = syncSampleTicks[currentSyncSampleIndex];
                long tickN2 = syncSampleTicks[currentSyncSampleIndex + 1];
                if (nextTargetTick <= tickN2 && Math.abs(tickN1 - nextTargetTick) < Math.abs(tickN2 - nextTargetTick)) {
                    fragments = Mp4Arrays.copyOfAndAppend(fragments, syncSamples[currentSyncSampleIndex]);
                    nextTargetTick = syncSampleTicks[currentSyncSampleIndex] + targetTicks;
                }
            }
            return duration - syncSampleTicks[syncSampleTicks.length + (-1)] > targetTicks / 2 ? Mp4Arrays.copyOfAndAppend(fragments, syncSamples[syncSampleTicks.length - 1]) : fragments;
        }
        double time = 0.0d;
        long[] fragments2 = {1};
        for (int i2 = 0; i2 < durations.length; i2++) {
            time += durations[i2] / ts;
            if (time >= this.targetDuration) {
                if (i2 > 0) {
                    fragments2 = Mp4Arrays.copyOfAndAppend(fragments2, i2 + 1);
                }
                time = 0.0d;
            }
        }
        if (time < this.targetDuration && fragments2.length > 1) {
            long[] nuSegmentStartSamples = new long[fragments2.length - 1];
            System.arraycopy(fragments2, 0, nuSegmentStartSamples, 0, fragments2.length - 1);
            return nuSegmentStartSamples;
        }
        return fragments2;
    }
}
