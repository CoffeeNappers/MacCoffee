package com.google.android.exoplayer2.drm;

import android.net.Uri;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Pair;
import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.drm.DefaultDrmSessionManager;
import com.google.android.exoplayer2.drm.DrmSession;
import com.google.android.exoplayer2.drm.ExoMediaCrypto;
import com.google.android.exoplayer2.extractor.Extractor;
import com.google.android.exoplayer2.extractor.mkv.MatroskaExtractor;
import com.google.android.exoplayer2.extractor.mp4.FragmentedMp4Extractor;
import com.google.android.exoplayer2.source.chunk.ChunkExtractorWrapper;
import com.google.android.exoplayer2.source.chunk.InitializationChunk;
import com.google.android.exoplayer2.source.dash.manifest.AdaptationSet;
import com.google.android.exoplayer2.source.dash.manifest.DashManifest;
import com.google.android.exoplayer2.source.dash.manifest.DashManifestParser;
import com.google.android.exoplayer2.source.dash.manifest.Period;
import com.google.android.exoplayer2.source.dash.manifest.RangedUri;
import com.google.android.exoplayer2.source.dash.manifest.Representation;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSourceInputStream;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.MimeTypes;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class OfflineLicenseHelper<T extends ExoMediaCrypto> {
    private final ConditionVariable conditionVariable;
    private final DefaultDrmSessionManager<T> drmSessionManager;
    private final HandlerThread handlerThread = new HandlerThread("OfflineLicenseHelper");

    public static DashManifest downloadManifest(HttpDataSource dataSource, String manifestUriString) throws IOException {
        DataSourceInputStream inputStream = new DataSourceInputStream(dataSource, new DataSpec(Uri.parse(manifestUriString)));
        try {
            inputStream.open();
            DashManifestParser parser = new DashManifestParser();
            return parser.mo368parse(dataSource.getUri(), (InputStream) inputStream);
        } finally {
            inputStream.close();
        }
    }

    public static OfflineLicenseHelper<FrameworkMediaCrypto> newWidevineInstance(String licenseUrl, HttpDataSource.Factory httpDataSourceFactory) throws UnsupportedDrmException {
        return newWidevineInstance(new HttpMediaDrmCallback(licenseUrl, httpDataSourceFactory, null), (HashMap<String, String>) null);
    }

    public static OfflineLicenseHelper<FrameworkMediaCrypto> newWidevineInstance(MediaDrmCallback callback, HashMap<String, String> optionalKeyRequestParameters) throws UnsupportedDrmException {
        return new OfflineLicenseHelper<>(FrameworkMediaDrm.newInstance(C.WIDEVINE_UUID), callback, optionalKeyRequestParameters);
    }

    public OfflineLicenseHelper(ExoMediaDrm<T> mediaDrm, MediaDrmCallback callback, HashMap<String, String> optionalKeyRequestParameters) {
        this.handlerThread.start();
        this.conditionVariable = new ConditionVariable();
        DefaultDrmSessionManager.EventListener eventListener = new DefaultDrmSessionManager.EventListener() { // from class: com.google.android.exoplayer2.drm.OfflineLicenseHelper.1
            @Override // com.google.android.exoplayer2.drm.DefaultDrmSessionManager.EventListener
            public void onDrmKeysLoaded() {
                OfflineLicenseHelper.this.conditionVariable.open();
            }

            @Override // com.google.android.exoplayer2.drm.DefaultDrmSessionManager.EventListener
            public void onDrmSessionManagerError(Exception e) {
                OfflineLicenseHelper.this.conditionVariable.open();
            }

            @Override // com.google.android.exoplayer2.drm.DefaultDrmSessionManager.EventListener
            public void onDrmKeysRestored() {
                OfflineLicenseHelper.this.conditionVariable.open();
            }

            @Override // com.google.android.exoplayer2.drm.DefaultDrmSessionManager.EventListener
            public void onDrmKeysRemoved() {
                OfflineLicenseHelper.this.conditionVariable.open();
            }
        };
        this.drmSessionManager = new DefaultDrmSessionManager<>(C.WIDEVINE_UUID, mediaDrm, callback, optionalKeyRequestParameters, new Handler(this.handlerThread.getLooper()), eventListener);
    }

    public void releaseResources() {
        this.handlerThread.quit();
    }

    public byte[] download(HttpDataSource dataSource, String manifestUriString) throws IOException, InterruptedException, DrmSession.DrmSessionException {
        return download(dataSource, downloadManifest(dataSource, manifestUriString));
    }

    public byte[] download(HttpDataSource dataSource, DashManifest dashManifest) throws IOException, InterruptedException, DrmSession.DrmSessionException {
        if (dashManifest.getPeriodCount() < 1) {
            return null;
        }
        Period period = dashManifest.getPeriod(0);
        int adaptationSetIndex = period.getAdaptationSetIndex(2);
        if (adaptationSetIndex == -1 && (adaptationSetIndex = period.getAdaptationSetIndex(1)) == -1) {
            return null;
        }
        AdaptationSet adaptationSet = period.adaptationSets.get(adaptationSetIndex);
        if (adaptationSet.representations.isEmpty()) {
            return null;
        }
        Representation representation = adaptationSet.representations.get(0);
        DrmInitData drmInitData = representation.format.drmInitData;
        if (drmInitData == null) {
            InitializationChunk initializationChunk = loadInitializationChunk(dataSource, representation);
            if (initializationChunk == null) {
                return null;
            }
            Format sampleFormat = initializationChunk.getSampleFormat();
            if (sampleFormat != null) {
                drmInitData = sampleFormat.drmInitData;
            }
            if (drmInitData == null) {
                return null;
            }
        }
        blockingKeyRequest(2, null, drmInitData);
        return this.drmSessionManager.getOfflineLicenseKeySetId();
    }

    public byte[] renew(byte[] offlineLicenseKeySetId) throws DrmSession.DrmSessionException {
        Assertions.checkNotNull(offlineLicenseKeySetId);
        blockingKeyRequest(2, offlineLicenseKeySetId, null);
        return this.drmSessionManager.getOfflineLicenseKeySetId();
    }

    public void release(byte[] offlineLicenseKeySetId) throws DrmSession.DrmSessionException {
        Assertions.checkNotNull(offlineLicenseKeySetId);
        blockingKeyRequest(3, offlineLicenseKeySetId, null);
    }

    public Pair<Long, Long> getLicenseDurationRemainingSec(byte[] offlineLicenseKeySetId) throws DrmSession.DrmSessionException {
        Assertions.checkNotNull(offlineLicenseKeySetId);
        DrmSession<T> session = openBlockingKeyRequest(1, offlineLicenseKeySetId, null);
        Pair<Long, Long> licenseDurationRemainingSec = WidevineUtil.getLicenseDurationRemainingSec(this.drmSessionManager);
        this.drmSessionManager.releaseSession(session);
        return licenseDurationRemainingSec;
    }

    private void blockingKeyRequest(int licenseMode, byte[] offlineLicenseKeySetId, DrmInitData drmInitData) throws DrmSession.DrmSessionException {
        DrmSession<T> session = openBlockingKeyRequest(licenseMode, offlineLicenseKeySetId, drmInitData);
        DrmSession.DrmSessionException error = session.getError();
        if (error != null) {
            throw error;
        }
        this.drmSessionManager.releaseSession(session);
    }

    private DrmSession<T> openBlockingKeyRequest(int licenseMode, byte[] offlineLicenseKeySetId, DrmInitData drmInitData) {
        this.drmSessionManager.setMode(licenseMode, offlineLicenseKeySetId);
        this.conditionVariable.close();
        DrmSession<T> session = this.drmSessionManager.acquireSession(this.handlerThread.getLooper(), drmInitData);
        this.conditionVariable.block();
        return session;
    }

    private static InitializationChunk loadInitializationChunk(DataSource dataSource, Representation representation) throws IOException, InterruptedException {
        RangedUri rangedUri = representation.getInitializationUri();
        if (rangedUri == null) {
            return null;
        }
        DataSpec dataSpec = new DataSpec(rangedUri.resolveUri(representation.baseUrl), rangedUri.start, rangedUri.length, representation.getCacheKey());
        InitializationChunk initializationChunk = new InitializationChunk(dataSource, dataSpec, representation.format, 0, null, newWrappedExtractor(representation.format));
        initializationChunk.load();
        return initializationChunk;
    }

    private static ChunkExtractorWrapper newWrappedExtractor(Format format) {
        String mimeType = format.containerMimeType;
        boolean isWebm = mimeType.startsWith(MimeTypes.VIDEO_WEBM) || mimeType.startsWith(MimeTypes.AUDIO_WEBM);
        Extractor extractor = isWebm ? new MatroskaExtractor() : new FragmentedMp4Extractor();
        return new ChunkExtractorWrapper(extractor, format, false, false);
    }
}
