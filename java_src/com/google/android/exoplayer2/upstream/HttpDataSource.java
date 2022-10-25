package com.google.android.exoplayer2.upstream;

import android.text.TextUtils;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.exoplayer2.util.Predicate;
import com.google.android.exoplayer2.util.Util;
import java.io.IOException;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public interface HttpDataSource extends DataSource {
    public static final Predicate<String> REJECT_PAYWALL_TYPES = new Predicate<String>() { // from class: com.google.android.exoplayer2.upstream.HttpDataSource.1
        @Override // com.google.android.exoplayer2.util.Predicate
        public boolean evaluate(String contentType) {
            String contentType2 = Util.toLowerInvariant(contentType);
            return !TextUtils.isEmpty(contentType2) && (!contentType2.contains("text") || contentType2.contains(MimeTypes.TEXT_VTT)) && !contentType2.contains("html") && !contentType2.contains("xml");
        }
    };

    /* loaded from: classes.dex */
    public interface Factory extends DataSource.Factory {
        void clearAllDefaultRequestProperties();

        void clearDefaultRequestProperty(String str);

        @Override // com.google.android.exoplayer2.upstream.DataSource.Factory
        /* renamed from: createDataSource */
        HttpDataSource mo949createDataSource();

        void setDefaultRequestProperty(String str, String str2);
    }

    void clearAllRequestProperties();

    void clearRequestProperty(String str);

    @Override // com.google.android.exoplayer2.upstream.DataSource
    void close() throws HttpDataSourceException;

    Map<String, List<String>> getResponseHeaders();

    @Override // com.google.android.exoplayer2.upstream.DataSource
    long open(DataSpec dataSpec) throws HttpDataSourceException;

    @Override // com.google.android.exoplayer2.upstream.DataSource
    int read(byte[] bArr, int i, int i2) throws HttpDataSourceException;

    void setRequestProperty(String str, String str2);

    /* loaded from: classes.dex */
    public static abstract class BaseFactory implements Factory {
        private final HashMap<String, String> requestProperties = new HashMap<>();

        /* renamed from: createDataSourceInternal */
        protected abstract HttpDataSource mo379createDataSourceInternal();

        @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory, com.google.android.exoplayer2.upstream.DataSource.Factory
        /* renamed from: createDataSource  reason: collision with other method in class */
        public final HttpDataSource mo949createDataSource() {
            HttpDataSource dataSource = mo379createDataSourceInternal();
            synchronized (this.requestProperties) {
                for (Map.Entry<String, String> property : this.requestProperties.entrySet()) {
                    dataSource.setRequestProperty(property.getKey(), property.getValue());
                }
            }
            return dataSource;
        }

        @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
        public final void setDefaultRequestProperty(String name, String value) {
            Assertions.checkNotNull(name);
            Assertions.checkNotNull(value);
            synchronized (this.requestProperties) {
                this.requestProperties.put(name, value);
            }
        }

        @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
        public final void clearDefaultRequestProperty(String name) {
            Assertions.checkNotNull(name);
            synchronized (this.requestProperties) {
                this.requestProperties.remove(name);
            }
        }

        @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
        public final void clearAllDefaultRequestProperties() {
            synchronized (this.requestProperties) {
                this.requestProperties.clear();
            }
        }
    }

    /* loaded from: classes.dex */
    public static class HttpDataSourceException extends IOException {
        public static final int TYPE_CLOSE = 3;
        public static final int TYPE_OPEN = 1;
        public static final int TYPE_READ = 2;
        public final DataSpec dataSpec;
        public final int type;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface Type {
        }

        public HttpDataSourceException(DataSpec dataSpec, int type) {
            this.dataSpec = dataSpec;
            this.type = type;
        }

        public HttpDataSourceException(String message, DataSpec dataSpec, int type) {
            super(message);
            this.dataSpec = dataSpec;
            this.type = type;
        }

        public HttpDataSourceException(IOException cause, DataSpec dataSpec, int type) {
            super(cause);
            this.dataSpec = dataSpec;
            this.type = type;
        }

        public HttpDataSourceException(String message, IOException cause, DataSpec dataSpec, int type) {
            super(message, cause);
            this.dataSpec = dataSpec;
            this.type = type;
        }
    }

    /* loaded from: classes.dex */
    public static final class InvalidContentTypeException extends HttpDataSourceException {
        public final String contentType;

        public InvalidContentTypeException(String contentType, DataSpec dataSpec) {
            super("Invalid content type: " + contentType, dataSpec, 1);
            this.contentType = contentType;
        }
    }

    /* loaded from: classes.dex */
    public static final class InvalidResponseCodeException extends HttpDataSourceException {
        public final Map<String, List<String>> headerFields;
        public final int responseCode;

        public InvalidResponseCodeException(int responseCode, Map<String, List<String>> headerFields, DataSpec dataSpec) {
            super("Response code: " + responseCode, dataSpec, 1);
            this.responseCode = responseCode;
            this.headerFields = headerFields;
        }
    }
}
