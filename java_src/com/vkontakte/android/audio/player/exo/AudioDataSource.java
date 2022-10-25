package com.vkontakte.android.audio.player.exo;

import android.content.Context;
import android.net.Uri;
import com.google.android.exoplayer2.upstream.AssetDataSource;
import com.google.android.exoplayer2.upstream.ContentDataSource;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.FileDataSource;
import com.google.android.exoplayer2.upstream.TransferListener;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.Util;
import com.vkontakte.android.data.BenchmarkTracker;
import java.io.IOException;
/* loaded from: classes2.dex */
final class AudioDataSource implements DataSource {
    private static final String SCHEME_ASSET = "asset";
    private static final String SCHEME_CONTENT = "content";
    static final String SCHEME_VK_AUDIO_FILE = "afile";
    static final String SCHEME_VK_AUDIO_HTTP = "ahttp";
    private final DataSource assetDataSource;
    private final DataSource baseDataSource;
    private final DataSource contentDataSource;
    private DataSource dataSource;
    private final DataSource fileDataSource;
    private final DataSource vkAFileDataSource;
    private String lastUri = null;
    private boolean needSendStats = false;
    private long startLoadTime = 0;
    private long loadTime = 0;
    private long bytesLoaded = 0;
    private boolean wasError = false;

    private void initStatsValues() {
        this.lastUri = null;
        this.needSendStats = false;
        this.startLoadTime = 0L;
        this.loadTime = 0L;
        this.bytesLoaded = 0L;
        this.wasError = false;
    }

    private void startLoad() {
        this.startLoadTime = System.currentTimeMillis();
    }

    private void endLoad(int bytesCount) {
        this.bytesLoaded += bytesCount;
        this.loadTime += System.currentTimeMillis() - this.startLoadTime;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AudioDataSource(Context context, TransferListener<? super DataSource> listener, DataSource baseDataSource) {
        this.baseDataSource = (DataSource) Assertions.checkNotNull(baseDataSource);
        this.fileDataSource = new FileDataSource(listener);
        this.vkAFileDataSource = new AudioFileDataSource(listener);
        this.assetDataSource = new AssetDataSource(context, listener);
        this.contentDataSource = new ContentDataSource(context, listener);
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        initStatsValues();
        Assertions.checkState(this.dataSource == null);
        String scheme = dataSpec.uri.getScheme();
        if (SCHEME_VK_AUDIO_FILE.equals(scheme)) {
            this.dataSource = this.vkAFileDataSource;
        } else if (Util.isLocalFileUri(dataSpec.uri)) {
            if (dataSpec.uri.getPath().startsWith("/android_asset/")) {
                this.dataSource = this.assetDataSource;
            } else {
                this.dataSource = this.fileDataSource;
            }
        } else if ("asset".equals(scheme)) {
            this.dataSource = this.assetDataSource;
        } else if ("content".equals(scheme)) {
            this.dataSource = this.contentDataSource;
        } else {
            this.needSendStats = true;
            this.dataSource = this.baseDataSource;
        }
        this.lastUri = String.valueOf(dataSpec.uri);
        startLoad();
        try {
            long ret = this.dataSource.open(dataSpec);
            endLoad(0);
            return ret;
        } catch (Exception e) {
            endLoad(0);
            this.wasError = true;
            if (this.needSendStats) {
                BenchmarkTracker.getInstance().trackContentDownload(this.lastUri, this.bytesLoaded, this.loadTime, 0, e);
            }
            throw e;
        }
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws IOException {
        startLoad();
        try {
            int ret = this.dataSource.read(buffer, offset, readLength);
            endLoad(readLength);
            return ret;
        } catch (Exception e) {
            endLoad(0);
            this.wasError = true;
            if (this.needSendStats) {
                BenchmarkTracker.getInstance().trackContentDownload(this.lastUri, this.bytesLoaded, this.loadTime, 0, e);
            }
            throw e;
        }
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public Uri getUri() {
        if (this.dataSource == null) {
            return null;
        }
        return this.dataSource.getUri();
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public void close() throws IOException {
        if (this.dataSource != null) {
            try {
                this.dataSource.close();
            } finally {
                this.dataSource = null;
            }
        }
        if (this.needSendStats && !this.wasError) {
            BenchmarkTracker.getInstance().trackContentDownload(this.lastUri, this.bytesLoaded, this.loadTime, 0, null);
        }
    }
}
