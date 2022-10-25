package com.google.android.exoplayer2.source.dash.manifest;

import android.net.Uri;
import com.google.android.exoplayer2.C;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class DashManifest {
    public final long availabilityStartTime;
    public final long duration;
    public final boolean dynamic;
    public final Uri location;
    public final long minBufferTime;
    public final long minUpdatePeriod;
    private final List<Period> periods;
    public final long suggestedPresentationDelay;
    public final long timeShiftBufferDepth;
    public final UtcTimingElement utcTiming;

    public DashManifest(long availabilityStartTime, long duration, long minBufferTime, boolean dynamic, long minUpdatePeriod, long timeShiftBufferDepth, long suggestedPresentationDelay, UtcTimingElement utcTiming, Uri location, List<Period> periods) {
        this.availabilityStartTime = availabilityStartTime;
        this.duration = duration;
        this.minBufferTime = minBufferTime;
        this.dynamic = dynamic;
        this.minUpdatePeriod = minUpdatePeriod;
        this.timeShiftBufferDepth = timeShiftBufferDepth;
        this.suggestedPresentationDelay = suggestedPresentationDelay;
        this.utcTiming = utcTiming;
        this.location = location;
        this.periods = periods == null ? Collections.emptyList() : periods;
    }

    public final int getPeriodCount() {
        return this.periods.size();
    }

    public final Period getPeriod(int index) {
        return this.periods.get(index);
    }

    public final long getPeriodDurationMs(int index) {
        if (index == this.periods.size() - 1) {
            return this.duration == C.TIME_UNSET ? C.TIME_UNSET : this.duration - this.periods.get(index).startMs;
        }
        return this.periods.get(index + 1).startMs - this.periods.get(index).startMs;
    }

    public final long getPeriodDurationUs(int index) {
        return C.msToUs(getPeriodDurationMs(index));
    }
}
