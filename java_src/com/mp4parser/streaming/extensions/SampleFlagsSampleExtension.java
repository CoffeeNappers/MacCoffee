package com.mp4parser.streaming.extensions;

import com.mp4parser.streaming.SampleExtension;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class SampleFlagsSampleExtension implements SampleExtension {
    public static Map<Long, SampleFlagsSampleExtension> pool = Collections.synchronizedMap(new HashMap());
    private byte isLeading;
    private int sampleDegradationPriority;
    private byte sampleDependsOn;
    private byte sampleHasRedundancy;
    private byte sampleIsDependedOn;
    private boolean sampleIsNonSyncSample;
    private byte samplePaddingValue;

    public static SampleFlagsSampleExtension create(byte isLeading, byte sampleDependsOn, byte sampleIsDependedOn, byte sampleHasRedundancy, byte samplePaddingValue, boolean sampleIsNonSyncSample, int sampleDegradationPriority) {
        long key = (sampleDependsOn << 2) + isLeading + (sampleIsDependedOn << 4) + (sampleHasRedundancy << 6) + (samplePaddingValue << 8) + (sampleDegradationPriority << 11) + ((sampleIsNonSyncSample ? 1 : 0) << 27);
        SampleFlagsSampleExtension c = pool.get(Long.valueOf(key));
        if (c == null) {
            SampleFlagsSampleExtension c2 = new SampleFlagsSampleExtension();
            c2.isLeading = isLeading;
            c2.sampleDependsOn = sampleDependsOn;
            c2.sampleIsDependedOn = sampleIsDependedOn;
            c2.sampleHasRedundancy = sampleHasRedundancy;
            c2.samplePaddingValue = samplePaddingValue;
            c2.sampleIsNonSyncSample = sampleIsNonSyncSample;
            c2.sampleDegradationPriority = sampleDegradationPriority;
            pool.put(Long.valueOf(key), c2);
            return c2;
        }
        return c;
    }

    public byte getIsLeading() {
        return this.isLeading;
    }

    public void setIsLeading(byte isLeading) {
        this.isLeading = isLeading;
    }

    public byte getSampleDependsOn() {
        return this.sampleDependsOn;
    }

    public void setSampleDependsOn(byte sampleDependsOn) {
        this.sampleDependsOn = sampleDependsOn;
    }

    public byte getSampleIsDependedOn() {
        return this.sampleIsDependedOn;
    }

    public void setSampleIsDependedOn(byte sampleIsDependedOn) {
        this.sampleIsDependedOn = sampleIsDependedOn;
    }

    public byte getSampleHasRedundancy() {
        return this.sampleHasRedundancy;
    }

    public void setSampleHasRedundancy(byte sampleHasRedundancy) {
        this.sampleHasRedundancy = sampleHasRedundancy;
    }

    public byte getSamplePaddingValue() {
        return this.samplePaddingValue;
    }

    public void setSamplePaddingValue(byte samplePaddingValue) {
        this.samplePaddingValue = samplePaddingValue;
    }

    public boolean isSampleIsNonSyncSample() {
        return this.sampleIsNonSyncSample;
    }

    public boolean isSyncSample() {
        return !this.sampleIsNonSyncSample;
    }

    public void setSampleIsNonSyncSample(boolean sampleIsNonSyncSample) {
        this.sampleIsNonSyncSample = sampleIsNonSyncSample;
    }

    public int getSampleDegradationPriority() {
        return this.sampleDegradationPriority;
    }

    public void setSampleDegradationPriority(int sampleDegradationPriority) {
        this.sampleDegradationPriority = sampleDegradationPriority;
    }
}
