package okhttp3.internal.cache;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.GCMBroadcastReceiver;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.cache.CacheStrategy;
import okhttp3.internal.http.HttpHeaders;
import okhttp3.internal.http.HttpMethod;
import okhttp3.internal.http.RealResponseBody;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;
/* loaded from: classes3.dex */
public final class CacheInterceptor implements Interceptor {
    final InternalCache cache;

    public CacheInterceptor(InternalCache cache) {
        this.cache = cache;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        Response cacheCandidate = this.cache != null ? this.cache.get(chain.request()) : null;
        long now = System.currentTimeMillis();
        CacheStrategy strategy = new CacheStrategy.Factory(now, chain.request(), cacheCandidate).get();
        Request networkRequest = strategy.networkRequest;
        Response cacheResponse = strategy.cacheResponse;
        if (this.cache != null) {
            this.cache.trackResponse(strategy);
        }
        if (cacheCandidate != null && cacheResponse == null) {
            Util.closeQuietly(cacheCandidate.body());
        }
        if (networkRequest == null && cacheResponse == null) {
            return new Response.Builder().request(chain.request()).protocol(Protocol.HTTP_1_1).code(GCMBroadcastReceiver.ID_GAME_NOTIFICATION).message("Unsatisfiable Request (only-if-cached)").body(Util.EMPTY_RESPONSE).sentRequestAtMillis(-1L).receivedResponseAtMillis(System.currentTimeMillis()).build();
        }
        if (networkRequest == null) {
            return cacheResponse.newBuilder().cacheResponse(stripBody(cacheResponse)).build();
        }
        Response networkResponse = null;
        try {
            networkResponse = chain.proceed(networkRequest);
            if (cacheResponse != null) {
                if (networkResponse.code() == 304) {
                    Response response = cacheResponse.newBuilder().headers(combine(cacheResponse.headers(), networkResponse.headers())).sentRequestAtMillis(networkResponse.sentRequestAtMillis()).receivedResponseAtMillis(networkResponse.receivedResponseAtMillis()).cacheResponse(stripBody(cacheResponse)).networkResponse(stripBody(networkResponse)).build();
                    networkResponse.body().close();
                    this.cache.trackConditionalCacheHit();
                    this.cache.update(cacheResponse, response);
                    return response;
                }
                Util.closeQuietly(cacheResponse.body());
            }
            Response response2 = networkResponse.newBuilder().cacheResponse(stripBody(cacheResponse)).networkResponse(stripBody(networkResponse)).build();
            if (HttpHeaders.hasBody(response2)) {
                CacheRequest cacheRequest = maybeCache(response2, networkResponse.request(), this.cache);
                return cacheWritingResponse(cacheRequest, response2);
            }
            return response2;
        } finally {
            if (networkResponse == null && cacheCandidate != null) {
                Util.closeQuietly(cacheCandidate.body());
            }
        }
    }

    private static Response stripBody(Response response) {
        if (response == null || response.body() == null) {
            return response;
        }
        return response.newBuilder().body(null).build();
    }

    private CacheRequest maybeCache(Response userResponse, Request networkRequest, InternalCache responseCache) throws IOException {
        if (responseCache == null) {
            return null;
        }
        if (!CacheStrategy.isCacheable(userResponse, networkRequest)) {
            if (!HttpMethod.invalidatesCache(networkRequest.method())) {
                return null;
            }
            try {
                responseCache.remove(networkRequest);
                return null;
            } catch (IOException e) {
                return null;
            }
        }
        return responseCache.put(userResponse);
    }

    private Response cacheWritingResponse(final CacheRequest cacheRequest, Response response) throws IOException {
        Sink cacheBodyUnbuffered;
        if (cacheRequest != null && (cacheBodyUnbuffered = cacheRequest.body()) != null) {
            final BufferedSource source = response.body().source();
            final BufferedSink cacheBody = Okio.buffer(cacheBodyUnbuffered);
            Source cacheWritingSource = new Source() { // from class: okhttp3.internal.cache.CacheInterceptor.1
                boolean cacheRequestClosed;

                @Override // okio.Source
                public long read(Buffer sink, long byteCount) throws IOException {
                    try {
                        long bytesRead = source.read(sink, byteCount);
                        if (bytesRead == -1) {
                            if (!this.cacheRequestClosed) {
                                this.cacheRequestClosed = true;
                                cacheBody.close();
                            }
                            return -1L;
                        }
                        sink.copyTo(cacheBody.buffer(), sink.size() - bytesRead, bytesRead);
                        cacheBody.mo1211emitCompleteSegments();
                        return bytesRead;
                    } catch (IOException e) {
                        if (!this.cacheRequestClosed) {
                            this.cacheRequestClosed = true;
                            cacheRequest.abort();
                        }
                        throw e;
                    }
                }

                @Override // okio.Source
                public Timeout timeout() {
                    return source.timeout();
                }

                @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    if (!this.cacheRequestClosed && !Util.discard(this, 100, TimeUnit.MILLISECONDS)) {
                        this.cacheRequestClosed = true;
                        cacheRequest.abort();
                    }
                    source.close();
                }
            };
            return response.newBuilder().body(new RealResponseBody(response.headers(), Okio.buffer(cacheWritingSource))).build();
        }
        return response;
    }

    private static Headers combine(Headers cachedHeaders, Headers networkHeaders) {
        Headers.Builder result = new Headers.Builder();
        int size = cachedHeaders.size();
        for (int i = 0; i < size; i++) {
            String fieldName = cachedHeaders.name(i);
            String value = cachedHeaders.value(i);
            if ((!"Warning".equalsIgnoreCase(fieldName) || !value.startsWith(AppEventsConstants.EVENT_PARAM_VALUE_YES)) && (!isEndToEnd(fieldName) || networkHeaders.get(fieldName) == null)) {
                Internal.instance.addLenient(result, fieldName, value);
            }
        }
        int size2 = networkHeaders.size();
        for (int i2 = 0; i2 < size2; i2++) {
            String fieldName2 = networkHeaders.name(i2);
            if (!"Content-Length".equalsIgnoreCase(fieldName2) && isEndToEnd(fieldName2)) {
                Internal.instance.addLenient(result, fieldName2, networkHeaders.value(i2));
            }
        }
        return result.build();
    }

    static boolean isEndToEnd(String fieldName) {
        return !"Connection".equalsIgnoreCase(fieldName) && !"Keep-Alive".equalsIgnoreCase(fieldName) && !"Proxy-Authenticate".equalsIgnoreCase(fieldName) && !HttpRequest.HEADER_PROXY_AUTHORIZATION.equalsIgnoreCase(fieldName) && !"TE".equalsIgnoreCase(fieldName) && !"Trailers".equalsIgnoreCase(fieldName) && !"Transfer-Encoding".equalsIgnoreCase(fieldName) && !"Upgrade".equalsIgnoreCase(fieldName);
    }
}
