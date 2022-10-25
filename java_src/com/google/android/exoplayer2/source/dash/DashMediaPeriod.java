package com.google.android.exoplayer2.source.dash;

import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener;
import com.google.android.exoplayer2.source.CompositeSequenceableLoader;
import com.google.android.exoplayer2.source.MediaPeriod;
import com.google.android.exoplayer2.source.SampleStream;
import com.google.android.exoplayer2.source.SequenceableLoader;
import com.google.android.exoplayer2.source.TrackGroup;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.source.chunk.ChunkSampleStream;
import com.google.android.exoplayer2.source.dash.DashChunkSource;
import com.google.android.exoplayer2.source.dash.manifest.AdaptationSet;
import com.google.android.exoplayer2.source.dash.manifest.DashManifest;
import com.google.android.exoplayer2.source.dash.manifest.Period;
import com.google.android.exoplayer2.source.dash.manifest.Representation;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.upstream.Allocator;
import com.google.android.exoplayer2.upstream.LoaderErrorThrower;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
final class DashMediaPeriod implements MediaPeriod, SequenceableLoader.Callback<ChunkSampleStream<DashChunkSource>> {
    private final Allocator allocator;
    private MediaPeriod.Callback callback;
    private final DashChunkSource.Factory chunkSourceFactory;
    private final long elapsedRealtimeOffset;
    private final AdaptiveMediaSourceEventListener.EventDispatcher eventDispatcher;
    final int id;
    private int index;
    private DashManifest manifest;
    private final LoaderErrorThrower manifestLoaderErrorThrower;
    private final int minLoadableRetryCount;
    private Period period;
    private ChunkSampleStream<DashChunkSource>[] sampleStreams = newSampleStreamArray(0);
    private CompositeSequenceableLoader sequenceableLoader = new CompositeSequenceableLoader(this.sampleStreams);
    private final TrackGroupArray trackGroups;

    public DashMediaPeriod(int id, DashManifest manifest, int index, DashChunkSource.Factory chunkSourceFactory, int minLoadableRetryCount, AdaptiveMediaSourceEventListener.EventDispatcher eventDispatcher, long elapsedRealtimeOffset, LoaderErrorThrower manifestLoaderErrorThrower, Allocator allocator) {
        this.id = id;
        this.manifest = manifest;
        this.index = index;
        this.chunkSourceFactory = chunkSourceFactory;
        this.minLoadableRetryCount = minLoadableRetryCount;
        this.eventDispatcher = eventDispatcher;
        this.elapsedRealtimeOffset = elapsedRealtimeOffset;
        this.manifestLoaderErrorThrower = manifestLoaderErrorThrower;
        this.allocator = allocator;
        this.period = manifest.getPeriod(index);
        this.trackGroups = buildTrackGroups(this.period);
    }

    public void updateManifest(DashManifest manifest, int index) {
        ChunkSampleStream<DashChunkSource>[] chunkSampleStreamArr;
        this.manifest = manifest;
        this.index = index;
        this.period = manifest.getPeriod(index);
        if (this.sampleStreams != null) {
            for (ChunkSampleStream<DashChunkSource> sampleStream : this.sampleStreams) {
                sampleStream.getChunkSource().updateManifest(manifest, index);
            }
            this.callback.onContinueLoadingRequested(this);
        }
    }

    public void release() {
        ChunkSampleStream<DashChunkSource>[] chunkSampleStreamArr;
        for (ChunkSampleStream<DashChunkSource> sampleStream : this.sampleStreams) {
            sampleStream.release();
        }
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public void prepare(MediaPeriod.Callback callback) {
        this.callback = callback;
        callback.onPrepared(this);
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public void maybeThrowPrepareError() throws IOException {
        this.manifestLoaderErrorThrower.maybeThrowError();
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public TrackGroupArray getTrackGroups() {
        return this.trackGroups;
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public long selectTracks(TrackSelection[] selections, boolean[] mayRetainStreamFlags, SampleStream[] streams, boolean[] streamResetFlags, long positionUs) {
        ArrayList<ChunkSampleStream<DashChunkSource>> sampleStreamsList = new ArrayList<>();
        for (int i = 0; i < selections.length; i++) {
            if (streams[i] != null) {
                ChunkSampleStream<DashChunkSource> stream = (ChunkSampleStream) streams[i];
                if (selections[i] == null || !mayRetainStreamFlags[i]) {
                    stream.release();
                    streams[i] = null;
                } else {
                    sampleStreamsList.add(stream);
                }
            }
            if (streams[i] == null && selections[i] != null) {
                ChunkSampleStream<DashChunkSource> stream2 = buildSampleStream(selections[i], positionUs);
                sampleStreamsList.add(stream2);
                streams[i] = stream2;
                streamResetFlags[i] = true;
            }
        }
        this.sampleStreams = newSampleStreamArray(sampleStreamsList.size());
        sampleStreamsList.toArray(this.sampleStreams);
        this.sequenceableLoader = new CompositeSequenceableLoader(this.sampleStreams);
        return positionUs;
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod, com.google.android.exoplayer2.source.SequenceableLoader
    public boolean continueLoading(long positionUs) {
        return this.sequenceableLoader.continueLoading(positionUs);
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod, com.google.android.exoplayer2.source.SequenceableLoader
    public long getNextLoadPositionUs() {
        return this.sequenceableLoader.getNextLoadPositionUs();
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public long readDiscontinuity() {
        return C.TIME_UNSET;
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public long getBufferedPositionUs() {
        ChunkSampleStream<DashChunkSource>[] chunkSampleStreamArr;
        long bufferedPositionUs = Long.MAX_VALUE;
        for (ChunkSampleStream<DashChunkSource> sampleStream : this.sampleStreams) {
            long rendererBufferedPositionUs = sampleStream.getBufferedPositionUs();
            if (rendererBufferedPositionUs != Long.MIN_VALUE) {
                bufferedPositionUs = Math.min(bufferedPositionUs, rendererBufferedPositionUs);
            }
        }
        if (bufferedPositionUs == Long.MAX_VALUE) {
            return Long.MIN_VALUE;
        }
        return bufferedPositionUs;
    }

    @Override // com.google.android.exoplayer2.source.MediaPeriod
    public long seekToUs(long positionUs) {
        ChunkSampleStream<DashChunkSource>[] chunkSampleStreamArr;
        for (ChunkSampleStream<DashChunkSource> sampleStream : this.sampleStreams) {
            sampleStream.seekToUs(positionUs);
        }
        return positionUs;
    }

    @Override // com.google.android.exoplayer2.source.SequenceableLoader.Callback
    public void onContinueLoadingRequested(ChunkSampleStream<DashChunkSource> sampleStream) {
        this.callback.onContinueLoadingRequested(this);
    }

    private static TrackGroupArray buildTrackGroups(Period period) {
        TrackGroup[] trackGroupArray = new TrackGroup[period.adaptationSets.size()];
        for (int i = 0; i < period.adaptationSets.size(); i++) {
            AdaptationSet adaptationSet = period.adaptationSets.get(i);
            List<Representation> representations = adaptationSet.representations;
            Format[] formats = new Format[representations.size()];
            for (int j = 0; j < formats.length; j++) {
                formats[j] = representations.get(j).format;
            }
            trackGroupArray[i] = new TrackGroup(formats);
        }
        return new TrackGroupArray(trackGroupArray);
    }

    private ChunkSampleStream<DashChunkSource> buildSampleStream(TrackSelection selection, long positionUs) {
        int adaptationSetIndex = this.trackGroups.indexOf(selection.getTrackGroup());
        AdaptationSet adaptationSet = this.period.adaptationSets.get(adaptationSetIndex);
        DashChunkSource chunkSource = this.chunkSourceFactory.createDashChunkSource(this.manifestLoaderErrorThrower, this.manifest, this.index, adaptationSetIndex, selection, this.elapsedRealtimeOffset);
        return new ChunkSampleStream<>(adaptationSet.type, chunkSource, this, this.allocator, positionUs, this.minLoadableRetryCount, this.eventDispatcher);
    }

    private static ChunkSampleStream<DashChunkSource>[] newSampleStreamArray(int length) {
        return new ChunkSampleStream[length];
    }
}
