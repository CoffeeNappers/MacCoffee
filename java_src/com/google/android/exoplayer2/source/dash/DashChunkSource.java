package com.google.android.exoplayer2.source.dash;

import com.google.android.exoplayer2.source.chunk.ChunkSource;
import com.google.android.exoplayer2.source.dash.manifest.DashManifest;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.upstream.LoaderErrorThrower;
/* loaded from: classes.dex */
public interface DashChunkSource extends ChunkSource {

    /* loaded from: classes.dex */
    public interface Factory {
        DashChunkSource createDashChunkSource(LoaderErrorThrower loaderErrorThrower, DashManifest dashManifest, int i, int i2, TrackSelection trackSelection, long j);
    }

    void updateManifest(DashManifest dashManifest, int i);
}
