package com.danikula.videocache;

import android.text.TextUtils;
import com.danikula.videocache.sourcestorage.SourceInfoStorage;
import com.danikula.videocache.sourcestorage.SourceInfoStorageFactory;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.HttpURLConnection;
import java.net.URL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes.dex */
public class HttpUrlSource implements Source {
    private static final Logger LOG = LoggerFactory.getLogger("HttpUrlSource");
    private static final int MAX_REDIRECTS = 5;
    private HttpURLConnection connection;
    private InputStream inputStream;
    private SourceInfo sourceInfo;
    private final SourceInfoStorage sourceInfoStorage;

    public HttpUrlSource(String url) {
        this(url, SourceInfoStorageFactory.newEmptySourceInfoStorage());
    }

    public HttpUrlSource(String url, SourceInfoStorage sourceInfoStorage) {
        this.sourceInfoStorage = (SourceInfoStorage) Preconditions.checkNotNull(sourceInfoStorage);
        SourceInfo sourceInfo = sourceInfoStorage.get(url);
        this.sourceInfo = sourceInfo == null ? new SourceInfo(url, Integer.MIN_VALUE, ProxyCacheUtils.getSupposablyMime(url)) : sourceInfo;
    }

    public HttpUrlSource(HttpUrlSource source) {
        this.sourceInfo = source.sourceInfo;
        this.sourceInfoStorage = source.sourceInfoStorage;
    }

    @Override // com.danikula.videocache.Source
    public synchronized int length() throws ProxyCacheException {
        if (this.sourceInfo.length == Integer.MIN_VALUE) {
            fetchContentInfo();
        }
        return this.sourceInfo.length;
    }

    @Override // com.danikula.videocache.Source
    public void open(int offset) throws ProxyCacheException {
        try {
            this.connection = openConnection(offset, -1);
            String mime = this.connection.getContentType();
            this.inputStream = new BufferedInputStream(this.connection.getInputStream(), 8192);
            int length = readSourceAvailableBytes(this.connection, offset, this.connection.getResponseCode());
            this.sourceInfo = new SourceInfo(this.sourceInfo.url, length, mime);
            this.sourceInfoStorage.put(this.sourceInfo.url, this.sourceInfo);
        } catch (IOException e) {
            throw new ProxyCacheException("Error opening connection for " + this.sourceInfo.url + " with offset " + offset, e);
        }
    }

    private int readSourceAvailableBytes(HttpURLConnection connection, int offset, int responseCode) throws IOException {
        int contentLength = connection.getContentLength();
        return responseCode == 200 ? contentLength : responseCode == 206 ? contentLength + offset : this.sourceInfo.length;
    }

    @Override // com.danikula.videocache.Source
    public void close() throws ProxyCacheException {
        if (this.connection != null) {
            try {
                this.connection.disconnect();
            } catch (IllegalArgumentException | NullPointerException e) {
                throw new RuntimeException("Wait... but why? WTF!? Really shouldn't happen any more after fixing https://github.com/danikula/AndroidVideoCache/issues/43. If you read it on your device log, please, notify me danikula@gmail.com or create issue here https://github.com/danikula/AndroidVideoCache/issues.", e);
            }
        }
    }

    @Override // com.danikula.videocache.Source
    public int read(byte[] buffer) throws ProxyCacheException {
        if (this.inputStream == null) {
            throw new ProxyCacheException("Error reading data from " + this.sourceInfo.url + ": connection is absent!");
        }
        try {
            return this.inputStream.read(buffer, 0, buffer.length);
        } catch (InterruptedIOException e) {
            throw new InterruptedProxyCacheException("Reading source " + this.sourceInfo.url + " is interrupted", e);
        } catch (IOException e2) {
            throw new ProxyCacheException("Error reading data from " + this.sourceInfo.url, e2);
        }
    }

    private void fetchContentInfo() throws ProxyCacheException {
        LOG.debug("Read content info from " + this.sourceInfo.url);
        HttpURLConnection urlConnection = null;
        InputStream inputStream = null;
        try {
            try {
                urlConnection = openConnection(0, 10000);
                int length = urlConnection.getContentLength();
                String mime = urlConnection.getContentType();
                inputStream = urlConnection.getInputStream();
                this.sourceInfo = new SourceInfo(this.sourceInfo.url, length, mime);
                this.sourceInfoStorage.put(this.sourceInfo.url, this.sourceInfo);
                LOG.debug("Source info fetched: " + this.sourceInfo);
                ProxyCacheUtils.close(inputStream);
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
            } catch (IOException e) {
                LOG.error("Error fetching info from " + this.sourceInfo.url, (Throwable) e);
                ProxyCacheUtils.close(inputStream);
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
            }
        } catch (Throwable th) {
            ProxyCacheUtils.close(inputStream);
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            throw th;
        }
    }

    private HttpURLConnection openConnection(int offset, int timeout) throws IOException, ProxyCacheException {
        HttpURLConnection connection;
        boolean redirected;
        int redirectCount = 0;
        String url = this.sourceInfo.url;
        do {
            LOG.debug("Open connection " + (offset > 0 ? " with offset " + offset : "") + " to " + url);
            connection = (HttpURLConnection) new URL(url).openConnection();
            if (offset > 0) {
                connection.setRequestProperty("Range", "bytes=" + offset + "-");
            }
            if (timeout > 0) {
                connection.setConnectTimeout(timeout);
                connection.setReadTimeout(timeout);
            }
            int code = connection.getResponseCode();
            redirected = code == 301 || code == 302 || code == 303;
            if (redirected) {
                url = connection.getHeaderField(HttpRequest.HEADER_LOCATION);
                redirectCount++;
                connection.disconnect();
            }
            if (redirectCount > 5) {
                throw new ProxyCacheException("Too many redirects: " + redirectCount);
            }
        } while (redirected);
        return connection;
    }

    public synchronized String getMime() throws ProxyCacheException {
        if (TextUtils.isEmpty(this.sourceInfo.mime)) {
            fetchContentInfo();
        }
        return this.sourceInfo.mime;
    }

    public String getUrl() {
        return this.sourceInfo.url;
    }

    public String toString() {
        return "HttpUrlSource{sourceInfo='" + this.sourceInfo + "}";
    }
}
