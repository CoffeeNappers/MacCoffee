package com.google.android.exoplayer2.source.dash.manifest;

import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.util.Util;
import java.util.List;
/* loaded from: classes.dex */
public abstract class SegmentBase {
    final RangedUri initialization;
    final long presentationTimeOffset;
    final long timescale;

    public SegmentBase(RangedUri initialization, long timescale, long presentationTimeOffset) {
        this.initialization = initialization;
        this.timescale = timescale;
        this.presentationTimeOffset = presentationTimeOffset;
    }

    public RangedUri getInitialization(Representation representation) {
        return this.initialization;
    }

    public long getPresentationTimeOffsetUs() {
        return Util.scaleLargeTimestamp(this.presentationTimeOffset, C.MICROS_PER_SECOND, this.timescale);
    }

    /* loaded from: classes.dex */
    public static class SingleSegmentBase extends SegmentBase {
        final long indexLength;
        final long indexStart;

        public SingleSegmentBase(RangedUri initialization, long timescale, long presentationTimeOffset, long indexStart, long indexLength) {
            super(initialization, timescale, presentationTimeOffset);
            this.indexStart = indexStart;
            this.indexLength = indexLength;
        }

        public SingleSegmentBase() {
            this(null, 1L, 0L, 0L, 0L);
        }

        public RangedUri getIndex() {
            if (this.indexLength <= 0) {
                return null;
            }
            return new RangedUri(null, this.indexStart, this.indexLength);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class MultiSegmentBase extends SegmentBase {
        final long duration;
        final List<SegmentTimelineElement> segmentTimeline;
        final int startNumber;

        public abstract int getLastSegmentNum(long j);

        public abstract RangedUri getSegmentUrl(Representation representation, int i);

        public MultiSegmentBase(RangedUri initialization, long timescale, long presentationTimeOffset, int startNumber, long duration, List<SegmentTimelineElement> segmentTimeline) {
            super(initialization, timescale, presentationTimeOffset);
            this.startNumber = startNumber;
            this.duration = duration;
            this.segmentTimeline = segmentTimeline;
        }

        public int getSegmentNum(long timeUs, long periodDurationUs) {
            int firstSegmentNum = getFirstSegmentNum();
            int lowIndex = firstSegmentNum;
            int highIndex = getLastSegmentNum(periodDurationUs);
            if (this.segmentTimeline == null) {
                long durationUs = (this.duration * C.MICROS_PER_SECOND) / this.timescale;
                int segmentNum = this.startNumber + ((int) (timeUs / durationUs));
                return segmentNum < lowIndex ? lowIndex : (highIndex == -1 || segmentNum <= highIndex) ? segmentNum : highIndex;
            }
            while (lowIndex <= highIndex) {
                int midIndex = lowIndex + ((highIndex - lowIndex) / 2);
                long midTimeUs = getSegmentTimeUs(midIndex);
                if (midTimeUs < timeUs) {
                    lowIndex = midIndex + 1;
                } else if (midTimeUs <= timeUs) {
                    return midIndex;
                } else {
                    highIndex = midIndex - 1;
                }
            }
            return lowIndex == firstSegmentNum ? lowIndex : highIndex;
        }

        public final long getSegmentDurationUs(int sequenceNumber, long periodDurationUs) {
            if (this.segmentTimeline == null) {
                return sequenceNumber == getLastSegmentNum(periodDurationUs) ? periodDurationUs - getSegmentTimeUs(sequenceNumber) : (this.duration * C.MICROS_PER_SECOND) / this.timescale;
            }
            long duration = this.segmentTimeline.get(sequenceNumber - this.startNumber).duration;
            return (duration * C.MICROS_PER_SECOND) / this.timescale;
        }

        public final long getSegmentTimeUs(int sequenceNumber) {
            long unscaledSegmentTime;
            if (this.segmentTimeline != null) {
                unscaledSegmentTime = this.segmentTimeline.get(sequenceNumber - this.startNumber).startTime - this.presentationTimeOffset;
            } else {
                unscaledSegmentTime = (sequenceNumber - this.startNumber) * this.duration;
            }
            return Util.scaleLargeTimestamp(unscaledSegmentTime, C.MICROS_PER_SECOND, this.timescale);
        }

        public int getFirstSegmentNum() {
            return this.startNumber;
        }

        public boolean isExplicit() {
            return this.segmentTimeline != null;
        }
    }

    /* loaded from: classes.dex */
    public static class SegmentList extends MultiSegmentBase {
        final List<RangedUri> mediaSegments;

        public SegmentList(RangedUri initialization, long timescale, long presentationTimeOffset, int startNumber, long duration, List<SegmentTimelineElement> segmentTimeline, List<RangedUri> mediaSegments) {
            super(initialization, timescale, presentationTimeOffset, startNumber, duration, segmentTimeline);
            this.mediaSegments = mediaSegments;
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase.MultiSegmentBase
        public RangedUri getSegmentUrl(Representation representation, int sequenceNumber) {
            return this.mediaSegments.get(sequenceNumber - this.startNumber);
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase.MultiSegmentBase
        public int getLastSegmentNum(long periodDurationUs) {
            return (this.startNumber + this.mediaSegments.size()) - 1;
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase.MultiSegmentBase
        public boolean isExplicit() {
            return true;
        }
    }

    /* loaded from: classes.dex */
    public static class SegmentTemplate extends MultiSegmentBase {
        final UrlTemplate initializationTemplate;
        final UrlTemplate mediaTemplate;

        public SegmentTemplate(RangedUri initialization, long timescale, long presentationTimeOffset, int startNumber, long duration, List<SegmentTimelineElement> segmentTimeline, UrlTemplate initializationTemplate, UrlTemplate mediaTemplate) {
            super(initialization, timescale, presentationTimeOffset, startNumber, duration, segmentTimeline);
            this.initializationTemplate = initializationTemplate;
            this.mediaTemplate = mediaTemplate;
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase
        public RangedUri getInitialization(Representation representation) {
            if (this.initializationTemplate != null) {
                String urlString = this.initializationTemplate.buildUri(representation.format.id, 0, representation.format.bitrate, 0L);
                return new RangedUri(urlString, 0L, -1L);
            }
            return super.getInitialization(representation);
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase.MultiSegmentBase
        public RangedUri getSegmentUrl(Representation representation, int sequenceNumber) {
            long time;
            if (this.segmentTimeline != null) {
                time = this.segmentTimeline.get(sequenceNumber - this.startNumber).startTime;
            } else {
                time = (sequenceNumber - this.startNumber) * this.duration;
            }
            String uriString = this.mediaTemplate.buildUri(representation.format.id, sequenceNumber, representation.format.bitrate, time);
            return new RangedUri(uriString, 0L, -1L);
        }

        @Override // com.google.android.exoplayer2.source.dash.manifest.SegmentBase.MultiSegmentBase
        public int getLastSegmentNum(long periodDurationUs) {
            if (this.segmentTimeline != null) {
                return (this.segmentTimeline.size() + this.startNumber) - 1;
            }
            if (periodDurationUs == C.TIME_UNSET) {
                return -1;
            }
            long durationUs = (this.duration * C.MICROS_PER_SECOND) / this.timescale;
            return (this.startNumber + ((int) Util.ceilDivide(periodDurationUs, durationUs))) - 1;
        }
    }

    /* loaded from: classes.dex */
    public static class SegmentTimelineElement {
        final long duration;
        final long startTime;

        public SegmentTimelineElement(long startTime, long duration) {
            this.startTime = startTime;
            this.duration = duration;
        }
    }
}
