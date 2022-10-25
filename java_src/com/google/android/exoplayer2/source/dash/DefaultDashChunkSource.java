package com.google.android.exoplayer2.source.dash;

import android.os.SystemClock;
import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.extractor.ChunkIndex;
import com.google.android.exoplayer2.extractor.Extractor;
import com.google.android.exoplayer2.extractor.SeekMap;
import com.google.android.exoplayer2.extractor.mkv.MatroskaExtractor;
import com.google.android.exoplayer2.extractor.mp4.FragmentedMp4Extractor;
import com.google.android.exoplayer2.extractor.rawcc.RawCcExtractor;
import com.google.android.exoplayer2.source.BehindLiveWindowException;
import com.google.android.exoplayer2.source.chunk.Chunk;
import com.google.android.exoplayer2.source.chunk.ChunkExtractorWrapper;
import com.google.android.exoplayer2.source.chunk.ChunkHolder;
import com.google.android.exoplayer2.source.chunk.ChunkedTrackBlacklistUtil;
import com.google.android.exoplayer2.source.chunk.ContainerMediaChunk;
import com.google.android.exoplayer2.source.chunk.InitializationChunk;
import com.google.android.exoplayer2.source.chunk.MediaChunk;
import com.google.android.exoplayer2.source.chunk.SingleSampleMediaChunk;
import com.google.android.exoplayer2.source.dash.DashChunkSource;
import com.google.android.exoplayer2.source.dash.manifest.DashManifest;
import com.google.android.exoplayer2.source.dash.manifest.RangedUri;
import com.google.android.exoplayer2.source.dash.manifest.Representation;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.upstream.LoaderErrorThrower;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.exoplayer2.util.Util;
import java.io.IOException;
import java.util.List;
/* loaded from: classes.dex */
public class DefaultDashChunkSource implements DashChunkSource {
    private final int adaptationSetIndex;
    private final DataSource dataSource;
    private final long elapsedRealtimeOffsetMs;
    private IOException fatalError;
    private DashManifest manifest;
    private final LoaderErrorThrower manifestLoaderErrorThrower;
    private final int maxSegmentsPerLoad;
    private boolean missingLastSegment;
    private int periodIndex;
    private final RepresentationHolder[] representationHolders;
    private final TrackSelection trackSelection;

    /* loaded from: classes.dex */
    public static final class Factory implements DashChunkSource.Factory {
        private final DataSource.Factory dataSourceFactory;
        private final int maxSegmentsPerLoad;

        public Factory(DataSource.Factory dataSourceFactory) {
            this(dataSourceFactory, 1);
        }

        public Factory(DataSource.Factory dataSourceFactory, int maxSegmentsPerLoad) {
            this.dataSourceFactory = dataSourceFactory;
            this.maxSegmentsPerLoad = maxSegmentsPerLoad;
        }

        @Override // com.google.android.exoplayer2.source.dash.DashChunkSource.Factory
        public DashChunkSource createDashChunkSource(LoaderErrorThrower manifestLoaderErrorThrower, DashManifest manifest, int periodIndex, int adaptationSetIndex, TrackSelection trackSelection, long elapsedRealtimeOffsetMs) {
            DataSource dataSource = this.dataSourceFactory.mo949createDataSource();
            return new DefaultDashChunkSource(manifestLoaderErrorThrower, manifest, periodIndex, adaptationSetIndex, trackSelection, dataSource, elapsedRealtimeOffsetMs, this.maxSegmentsPerLoad);
        }
    }

    public DefaultDashChunkSource(LoaderErrorThrower manifestLoaderErrorThrower, DashManifest manifest, int periodIndex, int adaptationSetIndex, TrackSelection trackSelection, DataSource dataSource, long elapsedRealtimeOffsetMs, int maxSegmentsPerLoad) {
        this.manifestLoaderErrorThrower = manifestLoaderErrorThrower;
        this.manifest = manifest;
        this.adaptationSetIndex = adaptationSetIndex;
        this.trackSelection = trackSelection;
        this.dataSource = dataSource;
        this.periodIndex = periodIndex;
        this.elapsedRealtimeOffsetMs = elapsedRealtimeOffsetMs;
        this.maxSegmentsPerLoad = maxSegmentsPerLoad;
        long periodDurationUs = manifest.getPeriodDurationUs(periodIndex);
        List<Representation> representations = getRepresentations();
        this.representationHolders = new RepresentationHolder[trackSelection.length()];
        for (int i = 0; i < this.representationHolders.length; i++) {
            Representation representation = representations.get(trackSelection.getIndexInTrackGroup(i));
            this.representationHolders[i] = new RepresentationHolder(periodDurationUs, representation);
        }
    }

    @Override // com.google.android.exoplayer2.source.dash.DashChunkSource
    public void updateManifest(DashManifest newManifest, int newPeriodIndex) {
        try {
            this.manifest = newManifest;
            this.periodIndex = newPeriodIndex;
            long periodDurationUs = this.manifest.getPeriodDurationUs(this.periodIndex);
            List<Representation> representations = getRepresentations();
            for (int i = 0; i < this.representationHolders.length; i++) {
                Representation representation = representations.get(this.trackSelection.getIndexInTrackGroup(i));
                this.representationHolders[i].updateRepresentation(periodDurationUs, representation);
            }
        } catch (BehindLiveWindowException e) {
            this.fatalError = e;
        }
    }

    @Override // com.google.android.exoplayer2.source.chunk.ChunkSource
    public void maybeThrowError() throws IOException {
        if (this.fatalError != null) {
            throw this.fatalError;
        }
        this.manifestLoaderErrorThrower.maybeThrowError();
    }

    @Override // com.google.android.exoplayer2.source.chunk.ChunkSource
    public int getPreferredQueueSize(long playbackPositionUs, List<? extends MediaChunk> queue) {
        return (this.fatalError != null || this.trackSelection.length() < 2) ? queue.size() : this.trackSelection.evaluateQueueSize(playbackPositionUs, queue);
    }

    @Override // com.google.android.exoplayer2.source.chunk.ChunkSource
    public final void getNextChunk(MediaChunk previous, long playbackPositionUs, ChunkHolder out) {
        int segmentNum;
        if (this.fatalError == null) {
            long bufferedDurationUs = previous != null ? previous.endTimeUs - playbackPositionUs : 0L;
            this.trackSelection.updateSelectedTrack(bufferedDurationUs);
            RepresentationHolder representationHolder = this.representationHolders[this.trackSelection.getSelectedIndex()];
            Representation selectedRepresentation = representationHolder.representation;
            DashSegmentIndex segmentIndex = representationHolder.segmentIndex;
            RangedUri pendingInitializationUri = null;
            RangedUri pendingIndexUri = null;
            Format sampleFormat = representationHolder.sampleFormat;
            if (sampleFormat == null) {
                pendingInitializationUri = selectedRepresentation.getInitializationUri();
            }
            if (segmentIndex == null) {
                pendingIndexUri = selectedRepresentation.getIndexUri();
            }
            if (pendingInitializationUri != null || pendingIndexUri != null) {
                out.chunk = newInitializationChunk(representationHolder, this.dataSource, this.trackSelection.getSelectedFormat(), this.trackSelection.getSelectionReason(), this.trackSelection.getSelectionData(), pendingInitializationUri, pendingIndexUri);
                return;
            }
            long nowUs = getNowUnixTimeUs();
            int firstAvailableSegmentNum = representationHolder.getFirstSegmentNum();
            int lastAvailableSegmentNum = representationHolder.getLastSegmentNum();
            boolean indexUnbounded = lastAvailableSegmentNum == -1;
            if (indexUnbounded) {
                long liveEdgeTimeUs = nowUs - (this.manifest.availabilityStartTime * 1000);
                long periodStartUs = this.manifest.getPeriod(this.periodIndex).startMs * 1000;
                long liveEdgeTimeInPeriodUs = liveEdgeTimeUs - periodStartUs;
                if (this.manifest.timeShiftBufferDepth != C.TIME_UNSET) {
                    long bufferDepthUs = this.manifest.timeShiftBufferDepth * 1000;
                    firstAvailableSegmentNum = Math.max(firstAvailableSegmentNum, representationHolder.getSegmentNum(liveEdgeTimeInPeriodUs - bufferDepthUs));
                }
                lastAvailableSegmentNum = representationHolder.getSegmentNum(liveEdgeTimeInPeriodUs) - 1;
            }
            if (previous == null) {
                segmentNum = Util.constrainValue(representationHolder.getSegmentNum(playbackPositionUs), firstAvailableSegmentNum, lastAvailableSegmentNum);
            } else {
                segmentNum = previous.getNextChunkIndex();
                if (segmentNum < firstAvailableSegmentNum) {
                    this.fatalError = new BehindLiveWindowException();
                    return;
                }
            }
            if (segmentNum > lastAvailableSegmentNum || (this.missingLastSegment && segmentNum >= lastAvailableSegmentNum)) {
                out.endOfStream = !this.manifest.dynamic || this.periodIndex < this.manifest.getPeriodCount() + (-1);
                return;
            }
            int maxSegmentCount = Math.min(this.maxSegmentsPerLoad, (lastAvailableSegmentNum - segmentNum) + 1);
            out.chunk = newMediaChunk(representationHolder, this.dataSource, this.trackSelection.getSelectedFormat(), this.trackSelection.getSelectionReason(), this.trackSelection.getSelectionData(), sampleFormat, segmentNum, maxSegmentCount);
        }
    }

    @Override // com.google.android.exoplayer2.source.chunk.ChunkSource
    public void onChunkLoadCompleted(Chunk chunk) {
        SeekMap seekMap;
        if (chunk instanceof InitializationChunk) {
            InitializationChunk initializationChunk = (InitializationChunk) chunk;
            RepresentationHolder representationHolder = this.representationHolders[this.trackSelection.indexOf(initializationChunk.trackFormat)];
            Format sampleFormat = initializationChunk.getSampleFormat();
            if (sampleFormat != null) {
                representationHolder.setSampleFormat(sampleFormat);
            }
            if (representationHolder.segmentIndex == null && (seekMap = initializationChunk.getSeekMap()) != null) {
                representationHolder.segmentIndex = new DashWrappingSegmentIndex((ChunkIndex) seekMap);
            }
        }
    }

    @Override // com.google.android.exoplayer2.source.chunk.ChunkSource
    public boolean onChunkLoadError(Chunk chunk, boolean cancelable, Exception e) {
        if (!cancelable) {
            return false;
        }
        if (!this.manifest.dynamic && (chunk instanceof MediaChunk) && (e instanceof HttpDataSource.InvalidResponseCodeException) && ((HttpDataSource.InvalidResponseCodeException) e).responseCode == 404) {
            RepresentationHolder representationHolder = this.representationHolders[this.trackSelection.indexOf(chunk.trackFormat)];
            int lastAvailableSegmentNum = representationHolder.getLastSegmentNum();
            if (((MediaChunk) chunk).getNextChunkIndex() > lastAvailableSegmentNum) {
                this.missingLastSegment = true;
                return true;
            }
        }
        return ChunkedTrackBlacklistUtil.maybeBlacklistTrack(this.trackSelection, this.trackSelection.indexOf(chunk.trackFormat), e);
    }

    private List<Representation> getRepresentations() {
        return this.manifest.getPeriod(this.periodIndex).adaptationSets.get(this.adaptationSetIndex).representations;
    }

    private long getNowUnixTimeUs() {
        return this.elapsedRealtimeOffsetMs != 0 ? (SystemClock.elapsedRealtime() + this.elapsedRealtimeOffsetMs) * 1000 : System.currentTimeMillis() * 1000;
    }

    private static Chunk newInitializationChunk(RepresentationHolder representationHolder, DataSource dataSource, Format trackFormat, int trackSelectionReason, Object trackSelectionData, RangedUri initializationUri, RangedUri indexUri) {
        RangedUri requestUri;
        String baseUrl = representationHolder.representation.baseUrl;
        if (initializationUri != null) {
            requestUri = initializationUri.attemptMerge(indexUri, baseUrl);
            if (requestUri == null) {
                requestUri = initializationUri;
            }
        } else {
            requestUri = indexUri;
        }
        DataSpec dataSpec = new DataSpec(requestUri.resolveUri(baseUrl), requestUri.start, requestUri.length, representationHolder.representation.getCacheKey());
        return new InitializationChunk(dataSource, dataSpec, trackFormat, trackSelectionReason, trackSelectionData, representationHolder.extractorWrapper);
    }

    private static Chunk newMediaChunk(RepresentationHolder representationHolder, DataSource dataSource, Format trackFormat, int trackSelectionReason, Object trackSelectionData, Format sampleFormat, int firstSegmentNum, int maxSegmentCount) {
        Representation representation = representationHolder.representation;
        long startTimeUs = representationHolder.getSegmentStartTimeUs(firstSegmentNum);
        RangedUri segmentUri = representationHolder.getSegmentUrl(firstSegmentNum);
        String baseUrl = representation.baseUrl;
        if (representationHolder.extractorWrapper == null) {
            long endTimeUs = representationHolder.getSegmentEndTimeUs(firstSegmentNum);
            DataSpec dataSpec = new DataSpec(segmentUri.resolveUri(baseUrl), segmentUri.start, segmentUri.length, representation.getCacheKey());
            return new SingleSampleMediaChunk(dataSource, dataSpec, trackFormat, trackSelectionReason, trackSelectionData, startTimeUs, endTimeUs, firstSegmentNum, trackFormat);
        }
        int segmentCount = 1;
        for (int i = 1; i < maxSegmentCount; i++) {
            RangedUri nextSegmentUri = representationHolder.getSegmentUrl(firstSegmentNum + i);
            RangedUri mergedSegmentUri = segmentUri.attemptMerge(nextSegmentUri, baseUrl);
            if (mergedSegmentUri == null) {
                break;
            }
            segmentUri = mergedSegmentUri;
            segmentCount++;
        }
        long endTimeUs2 = representationHolder.getSegmentEndTimeUs((firstSegmentNum + segmentCount) - 1);
        DataSpec dataSpec2 = new DataSpec(segmentUri.resolveUri(baseUrl), segmentUri.start, segmentUri.length, representation.getCacheKey());
        long sampleOffsetUs = -representation.presentationTimeOffsetUs;
        return new ContainerMediaChunk(dataSource, dataSpec2, trackFormat, trackSelectionReason, trackSelectionData, startTimeUs, endTimeUs2, firstSegmentNum, segmentCount, sampleOffsetUs, representationHolder.extractorWrapper, sampleFormat);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static final class RepresentationHolder {
        public final ChunkExtractorWrapper extractorWrapper;
        private long periodDurationUs;
        public Representation representation;
        public Format sampleFormat;
        public DashSegmentIndex segmentIndex;
        private int segmentNumShift;

        public RepresentationHolder(long periodDurationUs, Representation representation) {
            Extractor extractor;
            this.periodDurationUs = periodDurationUs;
            this.representation = representation;
            String containerMimeType = representation.format.containerMimeType;
            if (mimeTypeIsRawText(containerMimeType)) {
                this.extractorWrapper = null;
            } else {
                boolean resendFormatOnInit = false;
                if (MimeTypes.APPLICATION_RAWCC.equals(containerMimeType)) {
                    extractor = new RawCcExtractor(representation.format);
                    resendFormatOnInit = true;
                } else if (mimeTypeIsWebm(containerMimeType)) {
                    extractor = new MatroskaExtractor();
                } else {
                    extractor = new FragmentedMp4Extractor();
                }
                this.extractorWrapper = new ChunkExtractorWrapper(extractor, representation.format, true, resendFormatOnInit);
            }
            this.segmentIndex = representation.getIndex();
        }

        public void setSampleFormat(Format sampleFormat) {
            this.sampleFormat = sampleFormat;
        }

        public void updateRepresentation(long newPeriodDurationUs, Representation newRepresentation) throws BehindLiveWindowException {
            DashSegmentIndex oldIndex = this.representation.getIndex();
            DashSegmentIndex newIndex = newRepresentation.getIndex();
            this.periodDurationUs = newPeriodDurationUs;
            this.representation = newRepresentation;
            if (oldIndex != null) {
                this.segmentIndex = newIndex;
                if (oldIndex.isExplicit()) {
                    int oldIndexLastSegmentNum = oldIndex.getLastSegmentNum(this.periodDurationUs);
                    long oldIndexEndTimeUs = oldIndex.getTimeUs(oldIndexLastSegmentNum) + oldIndex.getDurationUs(oldIndexLastSegmentNum, this.periodDurationUs);
                    int newIndexFirstSegmentNum = newIndex.getFirstSegmentNum();
                    long newIndexStartTimeUs = newIndex.getTimeUs(newIndexFirstSegmentNum);
                    if (oldIndexEndTimeUs == newIndexStartTimeUs) {
                        this.segmentNumShift += (oldIndex.getLastSegmentNum(this.periodDurationUs) + 1) - newIndexFirstSegmentNum;
                    } else if (oldIndexEndTimeUs < newIndexStartTimeUs) {
                        throw new BehindLiveWindowException();
                    } else {
                        this.segmentNumShift += oldIndex.getSegmentNum(newIndexStartTimeUs, this.periodDurationUs) - newIndexFirstSegmentNum;
                    }
                }
            }
        }

        public int getFirstSegmentNum() {
            return this.segmentIndex.getFirstSegmentNum() + this.segmentNumShift;
        }

        public int getLastSegmentNum() {
            int lastSegmentNum = this.segmentIndex.getLastSegmentNum(this.periodDurationUs);
            if (lastSegmentNum == -1) {
                return -1;
            }
            return this.segmentNumShift + lastSegmentNum;
        }

        public long getSegmentStartTimeUs(int segmentNum) {
            return this.segmentIndex.getTimeUs(segmentNum - this.segmentNumShift);
        }

        public long getSegmentEndTimeUs(int segmentNum) {
            return getSegmentStartTimeUs(segmentNum) + this.segmentIndex.getDurationUs(segmentNum - this.segmentNumShift, this.periodDurationUs);
        }

        public int getSegmentNum(long positionUs) {
            return this.segmentIndex.getSegmentNum(positionUs, this.periodDurationUs) + this.segmentNumShift;
        }

        public RangedUri getSegmentUrl(int segmentNum) {
            return this.segmentIndex.getSegmentUrl(segmentNum - this.segmentNumShift);
        }

        private static boolean mimeTypeIsWebm(String mimeType) {
            return mimeType.startsWith(MimeTypes.VIDEO_WEBM) || mimeType.startsWith(MimeTypes.AUDIO_WEBM) || mimeType.startsWith(MimeTypes.APPLICATION_WEBM);
        }

        private static boolean mimeTypeIsRawText(String mimeType) {
            return MimeTypes.isText(mimeType) || MimeTypes.APPLICATION_TTML.equals(mimeType);
        }
    }
}
