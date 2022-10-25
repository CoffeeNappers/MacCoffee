package io.sentry.connection;

import io.fabric.sdk.android.services.network.HttpRequest;
import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import io.sentry.marshaller.Marshaller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class HttpConnection extends AbstractConnection {
    private static final String SENTRY_AUTH = "X-Sentry-Auth";
    private static final String USER_AGENT = "User-Agent";
    private boolean bypassSecurity;
    private EventSampler eventSampler;
    private Marshaller marshaller;
    private final Proxy proxy;
    private final URL sentryUrl;
    private int timeout;
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private static final Logger logger = LoggerFactory.getLogger(HttpConnection.class);
    private static final int DEFAULT_TIMEOUT = (int) TimeUnit.SECONDS.toMillis(1);
    private static final HostnameVerifier NAIVE_VERIFIER = new HostnameVerifier() { // from class: io.sentry.connection.HttpConnection.1
        @Override // javax.net.ssl.HostnameVerifier
        public boolean verify(String hostname, SSLSession sslSession) {
            return true;
        }
    };

    public HttpConnection(URL sentryUrl, String publicKey, String secretKey, Proxy proxy, EventSampler eventSampler) {
        super(publicKey, secretKey);
        this.timeout = DEFAULT_TIMEOUT;
        this.bypassSecurity = false;
        this.sentryUrl = sentryUrl;
        this.proxy = proxy;
        this.eventSampler = eventSampler;
    }

    public static URL getSentryApiUrl(URI sentryUri, String projectId) {
        try {
            String url = sentryUri.toString() + "api/" + projectId + "/store/";
            return new URL(url);
        } catch (MalformedURLException e) {
            throw new IllegalArgumentException("Couldn't build a valid URL from the Sentry API.", e);
        }
    }

    protected HttpURLConnection getConnection() {
        HttpURLConnection connection;
        try {
            if (this.proxy != null) {
                connection = (HttpURLConnection) this.sentryUrl.openConnection(this.proxy);
            } else {
                connection = (HttpURLConnection) this.sentryUrl.openConnection();
            }
            if (this.bypassSecurity && (connection instanceof HttpsURLConnection)) {
                ((HttpsURLConnection) connection).setHostnameVerifier(NAIVE_VERIFIER);
            }
            connection.setRequestMethod(HttpRequest.METHOD_POST);
            connection.setDoOutput(true);
            connection.setConnectTimeout(this.timeout);
            connection.setRequestProperty("User-Agent", SentryEnvironment.getSentryName());
            connection.setRequestProperty(SENTRY_AUTH, getAuthHeader());
            if (this.marshaller.getContentType() != null) {
                connection.setRequestProperty("Content-Type", this.marshaller.getContentType());
            }
            if (this.marshaller.getContentEncoding() != null) {
                connection.setRequestProperty(HttpRequest.HEADER_CONTENT_ENCODING, this.marshaller.getContentEncoding());
            }
            return connection;
        } catch (IOException e) {
            throw new IllegalStateException("Couldn't set up a connection to the Sentry server.", e);
        }
    }

    @Override // io.sentry.connection.AbstractConnection
    protected void doSend(Event event) throws ConnectionException {
        if (this.eventSampler == null || this.eventSampler.shouldSendEvent(event)) {
            HttpURLConnection connection = getConnection();
            try {
                try {
                    connection.connect();
                    OutputStream outputStream = connection.getOutputStream();
                    this.marshaller.marshall(event, outputStream);
                    outputStream.close();
                    connection.getInputStream().close();
                } catch (IOException e) {
                    String errorMessage = null;
                    InputStream errorStream = connection.getErrorStream();
                    if (errorStream != null) {
                        errorMessage = getErrorMessageFromStream(errorStream);
                    }
                    if (errorMessage == null || errorMessage.isEmpty()) {
                        errorMessage = "An exception occurred while submitting the event to the Sentry server.";
                    }
                    Long retryAfterMs = null;
                    String retryAfterHeader = connection.getHeaderField("Retry-After");
                    if (retryAfterHeader != null) {
                        try {
                            retryAfterMs = Long.valueOf(Long.parseLong(retryAfterHeader) * 1000);
                        } catch (NumberFormatException e2) {
                        }
                    }
                    throw new ConnectionException(errorMessage, e, retryAfterMs);
                }
            } finally {
                connection.disconnect();
            }
        }
    }

    private String getErrorMessageFromStream(InputStream errorStream) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(errorStream, UTF_8));
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        while (true) {
            try {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                if (!first) {
                    sb.append("\n");
                }
                sb.append(line);
                first = false;
            } catch (Exception e2) {
                logger.error("Exception while reading the error message from the connection.", (Throwable) e2);
            }
        }
        return sb.toString();
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    public void setMarshaller(Marshaller marshaller) {
        this.marshaller = marshaller;
    }

    public void setBypassSecurity(boolean bypassSecurity) {
        this.bypassSecurity = bypassSecurity;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
