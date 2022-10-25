package com.google.android.exoplayer2.source.chunk;

import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.FormatHolder;
import com.google.android.exoplayer2.decoder.DecoderInputBuffer;
import com.google.android.exoplayer2.extractor.DefaultTrackOutput;
import com.google.android.exoplayer2.source.AdaptiveMediaSourceEventListener;
import com.google.android.exoplayer2.source.SampleStream;
import com.google.android.exoplayer2.source.SequenceableLoader;
import com.google.android.exoplayer2.source.chunk.ChunkSource;
import com.google.android.exoplayer2.upstream.Allocator;
import com.google.android.exoplayer2.upstream.Loader;
import com.google.android.exoplayer2.util.Assertions;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes.dex */
public class ChunkSampleStream<T extends ChunkSource> implements SampleStream, SequenceableLoader, Loader.Callback<Chunk> {
    private final SequenceableLoader.Callback<ChunkSampleStream<T>> callback;
    private final T chunkSource;
    private Format downstreamTrackFormat;
    private final AdaptiveMediaSourceEventListener.EventDispatcher eventDispatcher;
    private long lastSeekPositionUs;
    private boolean loadingFinished;
    private final int minLoadableRetryCount;
    private long pendingResetPositionUs;
    private final DefaultTrackOutput sampleQueue;
    private final int trackType;
    private final Loader loader = new Loader("Loader:ChunkSampleStream");
    private final ChunkHolder nextChunkHolder = new ChunkHolder();
    private final LinkedList<BaseMediaChunk> mediaChunks = new LinkedList<>();
    private final List<BaseMediaChunk> readOnlyMediaChunks = Collections.unmodifiableList(this.mediaChunks);

    public ChunkSampleStream(int trackType, T chunkSource, SequenceableLoader.Callback<ChunkSampleStream<T>> callback, Allocator allocator, long positionUs, int minLoadableRetryCount, AdaptiveMediaSourceEventListener.EventDispatcher eventDispatcher) {
        this.trackType = trackType;
        this.chunkSource = chunkSource;
        this.callback = callback;
        this.eventDispatcher = eventDispatcher;
        this.minLoadableRetryCount = minLoadableRetryCount;
        this.sampleQueue = new DefaultTrackOutput(allocator);
        this.lastSeekPositionUs = positionUs;
        this.pendingResetPositionUs = positionUs;
    }

    public T getChunkSource() {
        return this.chunkSource;
    }

    public long getBufferedPositionUs() {
        BaseMediaChunk lastCompletedMediaChunk;
        if (this.loadingFinished) {
            return Long.MIN_VALUE;
        }
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        long bufferedPositionUs = this.lastSeekPositionUs;
        BaseMediaChunk lastMediaChunk = this.mediaChunks.getLast();
        if (lastMediaChunk.isLoadCompleted()) {
            lastCompletedMediaChunk = lastMediaChunk;
        } else {
            lastCompletedMediaChunk = this.mediaChunks.size() > 1 ? this.mediaChunks.get(this.mediaChunks.size() - 2) : null;
        }
        if (lastCompletedMediaChunk != null) {
            bufferedPositionUs = Math.max(bufferedPositionUs, lastCompletedMediaChunk.endTimeUs);
        }
        return Math.max(bufferedPositionUs, this.sampleQueue.getLargestQueuedTimestampUs());
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001e A[LOOP:0: B:11:0x001e->B:15:0x003a, LOOP_START] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void seekToUs(long r10) {
        /*
            r9 = this;
            r3 = 0
            r2 = 1
            r9.lastSeekPositionUs = r10
            boolean r1 = r9.isPendingReset()
            if (r1 != 0) goto L42
            com.google.android.exoplayer2.extractor.DefaultTrackOutput r4 = r9.sampleQueue
            long r6 = r9.getNextLoadPositionUs()
            int r1 = (r10 > r6 ? 1 : (r10 == r6 ? 0 : -1))
            if (r1 >= 0) goto L40
            r1 = r2
        L15:
            boolean r1 = r4.skipToKeyframeBefore(r10, r1)
            if (r1 == 0) goto L42
            r0 = r2
        L1c:
            if (r0 == 0) goto L44
        L1e:
            java.util.LinkedList<com.google.android.exoplayer2.source.chunk.BaseMediaChunk> r1 = r9.mediaChunks
            int r1 = r1.size()
            if (r1 <= r2) goto L5a
            java.util.LinkedList<com.google.android.exoplayer2.source.chunk.BaseMediaChunk> r1 = r9.mediaChunks
            java.lang.Object r1 = r1.get(r2)
            com.google.android.exoplayer2.source.chunk.BaseMediaChunk r1 = (com.google.android.exoplayer2.source.chunk.BaseMediaChunk) r1
            int r1 = r1.getFirstSampleIndex()
            com.google.android.exoplayer2.extractor.DefaultTrackOutput r3 = r9.sampleQueue
            int r3 = r3.getReadIndex()
            if (r1 > r3) goto L5a
            java.util.LinkedList<com.google.android.exoplayer2.source.chunk.BaseMediaChunk> r1 = r9.mediaChunks
            r1.removeFirst()
            goto L1e
        L40:
            r1 = r3
            goto L15
        L42:
            r0 = r3
            goto L1c
        L44:
            r9.pendingResetPositionUs = r10
            r9.loadingFinished = r3
            java.util.LinkedList<com.google.android.exoplayer2.source.chunk.BaseMediaChunk> r1 = r9.mediaChunks
            r1.clear()
            com.google.android.exoplayer2.upstream.Loader r1 = r9.loader
            boolean r1 = r1.isLoading()
            if (r1 == 0) goto L5b
            com.google.android.exoplayer2.upstream.Loader r1 = r9.loader
            r1.cancelLoading()
        L5a:
            return
        L5b:
            com.google.android.exoplayer2.extractor.DefaultTrackOutput r1 = r9.sampleQueue
            r1.reset(r2)
            goto L5a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.exoplayer2.source.chunk.ChunkSampleStream.seekToUs(long):void");
    }

    public void release() {
        this.sampleQueue.disable();
        this.loader.release();
    }

    @Override // com.google.android.exoplayer2.source.SampleStream
    public boolean isReady() {
        return this.loadingFinished || (!isPendingReset() && !this.sampleQueue.isEmpty());
    }

    @Override // com.google.android.exoplayer2.source.SampleStream
    public void maybeThrowError() throws IOException {
        this.loader.maybeThrowError();
        if (!this.loader.isLoading()) {
            this.chunkSource.maybeThrowError();
        }
    }

    @Override // com.google.android.exoplayer2.source.SampleStream
    public int readData(FormatHolder formatHolder, DecoderInputBuffer buffer) {
        if (isPendingReset()) {
            return -3;
        }
        while (this.mediaChunks.size() > 1 && this.mediaChunks.get(1).getFirstSampleIndex() <= this.sampleQueue.getReadIndex()) {
            this.mediaChunks.removeFirst();
        }
        BaseMediaChunk currentChunk = this.mediaChunks.getFirst();
        Format trackFormat = currentChunk.trackFormat;
        if (!trackFormat.equals(this.downstreamTrackFormat)) {
            this.eventDispatcher.downstreamFormatChanged(this.trackType, trackFormat, currentChunk.trackSelectionReason, currentChunk.trackSelectionData, currentChunk.startTimeUs);
        }
        this.downstreamTrackFormat = trackFormat;
        return this.sampleQueue.readData(formatHolder, buffer, this.loadingFinished, this.lastSeekPositionUs);
    }

    @Override // com.google.android.exoplayer2.source.SampleStream
    public void skipToKeyframeBefore(long timeUs) {
        this.sampleQueue.skipToKeyframeBefore(timeUs);
    }

    @Override // com.google.android.exoplayer2.upstream.Loader.Callback
    public void onLoadCompleted(Chunk loadable, long elapsedRealtimeMs, long loadDurationMs) {
        this.chunkSource.onChunkLoadCompleted(loadable);
        this.eventDispatcher.loadCompleted(loadable.dataSpec, loadable.type, this.trackType, loadable.trackFormat, loadable.trackSelectionReason, loadable.trackSelectionData, loadable.startTimeUs, loadable.endTimeUs, elapsedRealtimeMs, loadDurationMs, loadable.bytesLoaded());
        this.callback.onContinueLoadingRequested(this);
    }

    @Override // com.google.android.exoplayer2.upstream.Loader.Callback
    public void onLoadCanceled(Chunk loadable, long elapsedRealtimeMs, long loadDurationMs, boolean released) {
        this.eventDispatcher.loadCanceled(loadable.dataSpec, loadable.type, this.trackType, loadable.trackFormat, loadable.trackSelectionReason, loadable.trackSelectionData, loadable.startTimeUs, loadable.endTimeUs, elapsedRealtimeMs, loadDurationMs, loadable.bytesLoaded());
        if (!released) {
            this.sampleQueue.reset(true);
            this.callback.onContinueLoadingRequested(this);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.Loader.Callback
    public int onLoadError(Chunk loadable, long elapsedRealtimeMs, long loadDurationMs, IOException error) {
        long bytesLoaded = loadable.bytesLoaded();
        boolean isMediaChunk = isMediaChunk(loadable);
        boolean cancelable = !isMediaChunk || bytesLoaded == 0 || this.mediaChunks.size() > 1;
        boolean canceled = false;
        if (this.chunkSource.onChunkLoadError(loadable, cancelable, error)) {
            canceled = true;
            if (isMediaChunk) {
                BaseMediaChunk removed = this.mediaChunks.removeLast();
                Assertions.checkState(removed == loadable);
                this.sampleQueue.discardUpstreamSamples(removed.getFirstSampleIndex());
                if (this.mediaChunks.isEmpty()) {
                    this.pendingResetPositionUs = this.lastSeekPositionUs;
                }
            }
        }
        this.eventDispatcher.loadError(loadable.dataSpec, loadable.type, this.trackType, loadable.trackFormat, loadable.trackSelectionReason, loadable.trackSelectionData, loadable.startTimeUs, loadable.endTimeUs, elapsedRealtimeMs, loadDurationMs, bytesLoaded, error, canceled);
        if (canceled) {
            this.callback.onContinueLoadingRequested(this);
            return 2;
        }
        return 0;
    }

    @Override // com.google.android.exoplayer2.source.SequenceableLoader
    public boolean continueLoading(long positionUs) {
        if (this.loadingFinished || this.loader.isLoading()) {
            return false;
        }
        T t = this.chunkSource;
        BaseMediaChunk last = this.mediaChunks.isEmpty() ? null : this.mediaChunks.getLast();
        if (this.pendingResetPositionUs != C.TIME_UNSET) {
            positionUs = this.pendingResetPositionUs;
        }
        t.getNextChunk(last, positionUs, this.nextChunkHolder);
        boolean endOfStream = this.nextChunkHolder.endOfStream;
        Chunk loadable = this.nextChunkHolder.chunk;
        this.nextChunkHolder.clear();
        if (endOfStream) {
            this.loadingFinished = true;
            return true;
        } else if (loadable == null) {
            return false;
        } else {
            if (isMediaChunk(loadable)) {
                this.pendingResetPositionUs = C.TIME_UNSET;
                BaseMediaChunk mediaChunk = (BaseMediaChunk) loadable;
                mediaChunk.init(this.sampleQueue);
                this.mediaChunks.add(mediaChunk);
            }
            long elapsedRealtimeMs = this.loader.startLoading(loadable, this, this.minLoadableRetryCount);
            this.eventDispatcher.loadStarted(loadable.dataSpec, loadable.type, this.trackType, loadable.trackFormat, loadable.trackSelectionReason, loadable.trackSelectionData, loadable.startTimeUs, loadable.endTimeUs, elapsedRealtimeMs);
            return true;
        }
    }

    @Override // com.google.android.exoplayer2.source.SequenceableLoader
    public long getNextLoadPositionUs() {
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        if (!this.loadingFinished) {
            return this.mediaChunks.getLast().endTimeUs;
        }
        return Long.MIN_VALUE;
    }

    private void maybeDiscardUpstream(long positionUs) {
        int queueSize = this.chunkSource.getPreferredQueueSize(positionUs, this.readOnlyMediaChunks);
        discardUpstreamMediaChunks(Math.max(1, queueSize));
    }

    private boolean isMediaChunk(Chunk chunk) {
        return chunk instanceof BaseMediaChunk;
    }

    private boolean isPendingReset() {
        return this.pendingResetPositionUs != C.TIME_UNSET;
    }

    private boolean discardUpstreamMediaChunks(int queueLength) {
        if (this.mediaChunks.size() <= queueLength) {
            return false;
        }
        long startTimeUs = 0;
        long endTimeUs = this.mediaChunks.getLast().endTimeUs;
        BaseMediaChunk removed = null;
        while (this.mediaChunks.size() > queueLength) {
            BaseMediaChunk removed2 = this.mediaChunks.removeLast();
            removed = removed2;
            startTimeUs = removed.startTimeUs;
            this.loadingFinished = false;
        }
        this.sampleQueue.discardUpstreamSamples(removed.getFirstSampleIndex());
        this.eventDispatcher.upstreamDiscarded(this.trackType, startTimeUs, endTimeUs);
        return true;
    }
}
