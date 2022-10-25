package com.mp4parser.streaming.extensions;

import com.mp4parser.streaming.TrackExtension;
/* loaded from: classes2.dex */
public class NameTrackExtension implements TrackExtension {
    private String name;

    public static NameTrackExtension create(String name) {
        NameTrackExtension nameTrackExtension = new NameTrackExtension();
        nameTrackExtension.name = name;
        return nameTrackExtension;
    }

    public String getName() {
        return this.name;
    }
}
