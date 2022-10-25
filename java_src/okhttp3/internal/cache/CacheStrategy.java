package okhttp3.internal.cache;

import com.vkontakte.android.GCMBroadcastReceiver;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.VKAPIRequest;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import okhttp3.CacheControl;
import okhttp3.Headers;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.Internal;
import okhttp3.internal.http.HttpDate;
import okhttp3.internal.http.HttpHeaders;
/* loaded from: classes3.dex */
public final class CacheStrategy {
    public final Response cacheResponse;
    public final Request networkRequest;

    CacheStrategy(Request networkRequest, Response cacheResponse) {
        this.networkRequest = networkRequest;
        this.cacheResponse = cacheResponse;
    }

    public static boolean isCacheable(Response response, Request request) {
        switch (response.code()) {
            case 200:
            case VKAPIRequest.ERROR_GROUP_ACCESS /* 203 */:
            case 204:
            case 300:
            case 301:
            case 308:
            case 404:
            case 405:
            case 410:
            case 414:
            case GCMBroadcastReceiver.ID_FRIEND_NOTIFICATION /* 501 */:
                break;
            default:
                return false;
            case 302:
            case 307:
                if (response.header(HttpRequest.HEADER_EXPIRES) == null && response.cacheControl().maxAgeSeconds() == -1 && !response.cacheControl().isPublic() && !response.cacheControl().isPrivate()) {
                    return false;
                }
                break;
        }
        return !response.cacheControl().noStore() && !request.cacheControl().noStore();
    }

    /* loaded from: classes3.dex */
    public static class Factory {
        private int ageSeconds;
        final Response cacheResponse;
        private String etag;
        private Date expires;
        private Date lastModified;
        private String lastModifiedString;
        final long nowMillis;
        private long receivedResponseMillis;
        final Request request;
        private long sentRequestMillis;
        private Date servedDate;
        private String servedDateString;

        public Factory(long nowMillis, Request request, Response cacheResponse) {
            this.ageSeconds = -1;
            this.nowMillis = nowMillis;
            this.request = request;
            this.cacheResponse = cacheResponse;
            if (cacheResponse != null) {
                this.sentRequestMillis = cacheResponse.sentRequestAtMillis();
                this.receivedResponseMillis = cacheResponse.receivedResponseAtMillis();
                Headers headers = cacheResponse.headers();
                int size = headers.size();
                for (int i = 0; i < size; i++) {
                    String fieldName = headers.name(i);
                    String value = headers.value(i);
                    if (HttpRequest.HEADER_DATE.equalsIgnoreCase(fieldName)) {
                        this.servedDate = HttpDate.parse(value);
                        this.servedDateString = value;
                    } else if (HttpRequest.HEADER_EXPIRES.equalsIgnoreCase(fieldName)) {
                        this.expires = HttpDate.parse(value);
                    } else if ("Last-Modified".equalsIgnoreCase(fieldName)) {
                        this.lastModified = HttpDate.parse(value);
                        this.lastModifiedString = value;
                    } else if (HttpRequest.HEADER_ETAG.equalsIgnoreCase(fieldName)) {
                        this.etag = value;
                    } else if ("Age".equalsIgnoreCase(fieldName)) {
                        this.ageSeconds = HttpHeaders.parseSeconds(value, -1);
                    }
                }
            }
        }

        public CacheStrategy get() {
            CacheStrategy candidate = getCandidate();
            if (candidate.networkRequest != null && this.request.cacheControl().onlyIfCached()) {
                return new CacheStrategy(null, null);
            }
            return candidate;
        }

        private CacheStrategy getCandidate() {
            String conditionName;
            String conditionValue;
            if (this.cacheResponse == null) {
                return new CacheStrategy(this.request, null);
            }
            if (this.request.isHttps() && this.cacheResponse.handshake() == null) {
                return new CacheStrategy(this.request, null);
            }
            if (!CacheStrategy.isCacheable(this.cacheResponse, this.request)) {
                return new CacheStrategy(this.request, null);
            }
            CacheControl requestCaching = this.request.cacheControl();
            if (requestCaching.noCache() || hasConditions(this.request)) {
                return new CacheStrategy(this.request, null);
            }
            long ageMillis = cacheResponseAge();
            long freshMillis = computeFreshnessLifetime();
            if (requestCaching.maxAgeSeconds() != -1) {
                freshMillis = Math.min(freshMillis, TimeUnit.SECONDS.toMillis(requestCaching.maxAgeSeconds()));
            }
            long minFreshMillis = 0;
            if (requestCaching.minFreshSeconds() != -1) {
                minFreshMillis = TimeUnit.SECONDS.toMillis(requestCaching.minFreshSeconds());
            }
            long maxStaleMillis = 0;
            CacheControl responseCaching = this.cacheResponse.cacheControl();
            if (!responseCaching.mustRevalidate() && requestCaching.maxStaleSeconds() != -1) {
                maxStaleMillis = TimeUnit.SECONDS.toMillis(requestCaching.maxStaleSeconds());
            }
            if (!responseCaching.noCache() && ageMillis + minFreshMillis < freshMillis + maxStaleMillis) {
                Response.Builder builder = this.cacheResponse.newBuilder();
                if (ageMillis + minFreshMillis >= freshMillis) {
                    builder.addHeader("Warning", "110 HttpURLConnection \"Response is stale\"");
                }
                if (ageMillis > TimeUtils.DAY && isFreshnessLifetimeHeuristic()) {
                    builder.addHeader("Warning", "113 HttpURLConnection \"Heuristic expiration\"");
                }
                return new CacheStrategy(null, builder.build());
            }
            if (this.etag != null) {
                conditionName = HttpRequest.HEADER_IF_NONE_MATCH;
                conditionValue = this.etag;
            } else if (this.lastModified != null) {
                conditionName = "If-Modified-Since";
                conditionValue = this.lastModifiedString;
            } else if (this.servedDate != null) {
                conditionName = "If-Modified-Since";
                conditionValue = this.servedDateString;
            } else {
                return new CacheStrategy(this.request, null);
            }
            Headers.Builder conditionalRequestHeaders = this.request.headers().newBuilder();
            Internal.instance.addLenient(conditionalRequestHeaders, conditionName, conditionValue);
            Request conditionalRequest = this.request.newBuilder().headers(conditionalRequestHeaders.build()).build();
            return new CacheStrategy(conditionalRequest, this.cacheResponse);
        }

        private long computeFreshnessLifetime() {
            CacheControl responseCaching = this.cacheResponse.cacheControl();
            if (responseCaching.maxAgeSeconds() != -1) {
                return TimeUnit.SECONDS.toMillis(responseCaching.maxAgeSeconds());
            }
            if (this.expires != null) {
                long servedMillis = this.servedDate != null ? this.servedDate.getTime() : this.receivedResponseMillis;
                long delta = this.expires.getTime() - servedMillis;
                if (delta <= 0) {
                    delta = 0;
                }
                return delta;
            } else if (this.lastModified == null || this.cacheResponse.request().url().query() != null) {
                return 0L;
            } else {
                long servedMillis2 = this.servedDate != null ? this.servedDate.getTime() : this.sentRequestMillis;
                long delta2 = servedMillis2 - this.lastModified.getTime();
                if (delta2 <= 0) {
                    return 0L;
                }
                return delta2 / 10;
            }
        }

        private long cacheResponseAge() {
            long apparentReceivedAge = 0;
            if (this.servedDate != null) {
                apparentReceivedAge = Math.max(0L, this.receivedResponseMillis - this.servedDate.getTime());
            }
            long receivedAge = this.ageSeconds != -1 ? Math.max(apparentReceivedAge, TimeUnit.SECONDS.toMillis(this.ageSeconds)) : apparentReceivedAge;
            long responseDuration = this.receivedResponseMillis - this.sentRequestMillis;
            long residentDuration = this.nowMillis - this.receivedResponseMillis;
            return receivedAge + responseDuration + residentDuration;
        }

        private boolean isFreshnessLifetimeHeuristic() {
            return this.cacheResponse.cacheControl().maxAgeSeconds() == -1 && this.expires == null;
        }

        private static boolean hasConditions(Request request) {
            return (request.header("If-Modified-Since") == null && request.header(HttpRequest.HEADER_IF_NONE_MATCH) == null) ? false : true;
        }
    }
}
