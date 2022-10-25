package com.mp4parser.streaming.extensions;

import com.mp4parser.streaming.TrackExtension;
/* loaded from: classes2.dex */
public class TrackIdTrackExtension implements TrackExtension {
    private long trackId;

    public TrackIdTrackExtension(long trackId) {
        this.trackId = 1L;
        this.trackId = trackId;
    }

    public long getTrackId() {
        return this.trackId;
    }
}
