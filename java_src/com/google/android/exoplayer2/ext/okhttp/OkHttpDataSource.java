package com.google.android.exoplayer2.ext.okhttp;

import android.net.Uri;
import com.google.android.exoplayer2.upstream.DataSourceException;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.upstream.TransferListener;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.Predicate;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import okhttp3.CacheControl;
import okhttp3.Call;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
/* loaded from: classes.dex */
public class OkHttpDataSource implements HttpDataSource {
    private static final AtomicReference<byte[]> skipBufferReference = new AtomicReference<>();
    private long bytesRead;
    private long bytesSkipped;
    private long bytesToRead;
    private long bytesToSkip;
    private final CacheControl cacheControl;
    private final Call.Factory callFactory;
    private final Predicate<String> contentTypePredicate;
    private DataSpec dataSpec;
    private final TransferListener<? super OkHttpDataSource> listener;
    private boolean opened;
    private final HashMap<String, String> requestProperties;
    private Response response;
    private InputStream responseByteStream;
    private final String userAgent;

    public OkHttpDataSource(Call.Factory callFactory, String userAgent, Predicate<String> contentTypePredicate) {
        this(callFactory, userAgent, contentTypePredicate, null);
    }

    public OkHttpDataSource(Call.Factory callFactory, String userAgent, Predicate<String> contentTypePredicate, TransferListener<? super OkHttpDataSource> listener) {
        this(callFactory, userAgent, contentTypePredicate, listener, null);
    }

    public OkHttpDataSource(Call.Factory callFactory, String userAgent, Predicate<String> contentTypePredicate, TransferListener<? super OkHttpDataSource> listener, CacheControl cacheControl) {
        this.callFactory = (Call.Factory) Assertions.checkNotNull(callFactory);
        this.userAgent = Assertions.checkNotEmpty(userAgent);
        this.contentTypePredicate = contentTypePredicate;
        this.listener = listener;
        this.cacheControl = cacheControl;
        this.requestProperties = new HashMap<>();
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public Uri getUri() {
        if (this.response == null) {
            return null;
        }
        return Uri.parse(this.response.request().url().toString());
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource
    public Map<String, List<String>> getResponseHeaders() {
        if (this.response == null) {
            return null;
        }
        return this.response.headers().toMultimap();
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource
    public void setRequestProperty(String name, String value) {
        Assertions.checkNotNull(name);
        Assertions.checkNotNull(value);
        synchronized (this.requestProperties) {
            this.requestProperties.put(name, value);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource
    public void clearRequestProperty(String name) {
        Assertions.checkNotNull(name);
        synchronized (this.requestProperties) {
            this.requestProperties.remove(name);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource
    public void clearAllRequestProperties() {
        synchronized (this.requestProperties) {
            this.requestProperties.clear();
        }
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource, com.google.android.exoplayer2.upstream.DataSource
    public long open(DataSpec dataSpec) throws HttpDataSource.HttpDataSourceException {
        this.dataSpec = dataSpec;
        this.bytesRead = 0L;
        this.bytesSkipped = 0L;
        Request request = makeRequest(dataSpec);
        try {
            this.response = this.callFactory.newCall(request).execute();
            this.responseByteStream = this.response.body().byteStream();
            int responseCode = this.response.code();
            if (!this.response.isSuccessful()) {
                Map<String, List<String>> headers = request.headers().toMultimap();
                closeConnectionQuietly();
                HttpDataSource.InvalidResponseCodeException exception = new HttpDataSource.InvalidResponseCodeException(responseCode, headers, dataSpec);
                if (responseCode == 416) {
                    exception.initCause(new DataSourceException(0));
                }
                throw exception;
            }
            MediaType mediaType = this.response.body().contentType();
            String contentType = mediaType != null ? mediaType.toString() : null;
            if (this.contentTypePredicate != null && !this.contentTypePredicate.evaluate(contentType)) {
                closeConnectionQuietly();
                throw new HttpDataSource.InvalidContentTypeException(contentType, dataSpec);
            }
            this.bytesToSkip = (responseCode != 200 || dataSpec.position == 0) ? 0L : dataSpec.position;
            if (dataSpec.length != -1) {
                this.bytesToRead = dataSpec.length;
            } else {
                long contentLength = this.response.body().contentLength();
                this.bytesToRead = contentLength != -1 ? contentLength - this.bytesToSkip : -1L;
            }
            this.opened = true;
            if (this.listener != null) {
                this.listener.onTransferStart(this, dataSpec);
            }
            return this.bytesToRead;
        } catch (IOException e) {
            throw new HttpDataSource.HttpDataSourceException("Unable to connect to " + dataSpec.uri.toString(), e, dataSpec, 1);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource, com.google.android.exoplayer2.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws HttpDataSource.HttpDataSourceException {
        try {
            skipInternal();
            return readInternal(buffer, offset, readLength);
        } catch (IOException e) {
            throw new HttpDataSource.HttpDataSourceException(e, this.dataSpec, 2);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource, com.google.android.exoplayer2.upstream.DataSource
    public void close() throws HttpDataSource.HttpDataSourceException {
        if (this.opened) {
            this.opened = false;
            if (this.listener != null) {
                this.listener.onTransferEnd(this);
            }
            closeConnectionQuietly();
        }
    }

    protected final long bytesSkipped() {
        return this.bytesSkipped;
    }

    protected final long bytesRead() {
        return this.bytesRead;
    }

    protected final long bytesRemaining() {
        return this.bytesToRead == -1 ? this.bytesToRead : this.bytesToRead - this.bytesRead;
    }

    private Request makeRequest(DataSpec dataSpec) {
        long position = dataSpec.position;
        long length = dataSpec.length;
        boolean allowGzip = dataSpec.isFlagSet(1);
        HttpUrl url = HttpUrl.parse(dataSpec.uri.toString());
        Request.Builder builder = new Request.Builder().url(url);
        if (this.cacheControl != null) {
            builder.cacheControl(this.cacheControl);
        }
        synchronized (this.requestProperties) {
            for (Map.Entry<String, String> property : this.requestProperties.entrySet()) {
                builder.addHeader(property.getKey(), property.getValue());
            }
        }
        if (position != 0 || length != -1) {
            String rangeRequest = "bytes=" + position + "-";
            if (length != -1) {
                rangeRequest = rangeRequest + ((position + length) - 1);
            }
            builder.addHeader("Range", rangeRequest);
        }
        builder.addHeader("User-Agent", this.userAgent);
        if (!allowGzip) {
            builder.addHeader(HttpRequest.HEADER_ACCEPT_ENCODING, "identity");
        }
        if (dataSpec.postBody != null) {
            builder.post(RequestBody.create((MediaType) null, dataSpec.postBody));
        }
        return builder.build();
    }

    private void skipInternal() throws IOException {
        if (this.bytesSkipped != this.bytesToSkip) {
            byte[] skipBuffer = skipBufferReference.getAndSet(null);
            if (skipBuffer == null) {
                skipBuffer = new byte[4096];
            }
            while (this.bytesSkipped != this.bytesToSkip) {
                int readLength = (int) Math.min(this.bytesToSkip - this.bytesSkipped, skipBuffer.length);
                int read = this.responseByteStream.read(skipBuffer, 0, readLength);
                if (Thread.interrupted()) {
                    throw new InterruptedIOException();
                }
                if (read == -1) {
                    throw new EOFException();
                }
                this.bytesSkipped += read;
                if (this.listener != null) {
                    this.listener.onBytesTransferred(this, read);
                }
            }
            skipBufferReference.set(skipBuffer);
        }
    }

    private int readInternal(byte[] buffer, int offset, int readLength) throws IOException {
        if (readLength == 0) {
            return 0;
        }
        if (this.bytesToRead != -1) {
            long bytesRemaining = this.bytesToRead - this.bytesRead;
            if (bytesRemaining == 0) {
                return -1;
            }
            readLength = (int) Math.min(readLength, bytesRemaining);
        }
        int read = this.responseByteStream.read(buffer, offset, readLength);
        if (read == -1) {
            if (this.bytesToRead == -1) {
                return -1;
            }
            throw new EOFException();
        }
        this.bytesRead += read;
        if (this.listener != null) {
            this.listener.onBytesTransferred(this, read);
            return read;
        }
        return read;
    }

    private void closeConnectionQuietly() {
        this.response.body().close();
        this.response = null;
        this.responseByteStream = null;
    }
}
