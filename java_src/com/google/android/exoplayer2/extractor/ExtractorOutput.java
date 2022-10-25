package com.google.android.exoplayer2.extractor;
/* loaded from: classes.dex */
public interface ExtractorOutput {
    void endTracks();

    void seekMap(SeekMap seekMap);

    /* renamed from: track */
    TrackOutput mo366track(int i);
}
