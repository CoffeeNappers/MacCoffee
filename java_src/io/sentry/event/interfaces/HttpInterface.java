package io.sentry.event.interfaces;

import io.sentry.event.helper.BasicRemoteAddressResolver;
import io.sentry.event.helper.RemoteAddressResolver;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
/* loaded from: classes3.dex */
public class HttpInterface implements SentryInterface {
    public static final String HTTP_INTERFACE = "sentry.interfaces.Http";
    private final boolean asyncStarted;
    private final String authType;
    private final String body;
    private final Map<String, String> cookies;
    private final Map<String, Collection<String>> headers;
    private final String localAddr;
    private final String localName;
    private final int localPort;
    private final String method;
    private final Map<String, Collection<String>> parameters;
    private final String protocol;
    private final String queryString;
    private final String remoteAddr;
    private final String remoteUser;
    private final String requestUrl;
    private final boolean secure;
    private final String serverName;
    private final int serverPort;

    public HttpInterface(HttpServletRequest request) {
        this(request, new BasicRemoteAddressResolver());
    }

    public HttpInterface(HttpServletRequest request, RemoteAddressResolver remoteAddressResolver) {
        this(request, remoteAddressResolver, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public HttpInterface(HttpServletRequest request, RemoteAddressResolver remoteAddressResolver, String body) {
        this.requestUrl = request.getRequestURL().toString();
        this.method = request.getMethod();
        this.parameters = new HashMap();
        for (Map.Entry<String, String[]> parameterMapEntry : request.getParameterMap().entrySet()) {
            this.parameters.put(parameterMapEntry.getKey(), Arrays.asList(parameterMapEntry.getValue()));
        }
        this.queryString = request.getQueryString();
        if (request.getCookies() != null) {
            this.cookies = new HashMap();
            Cookie[] arr$ = request.getCookies();
            for (Cookie cookie : arr$) {
                this.cookies.put(cookie.getName(), cookie.getValue());
            }
        } else {
            this.cookies = Collections.emptyMap();
        }
        this.remoteAddr = remoteAddressResolver.getRemoteAddress(request);
        this.serverName = request.getServerName();
        this.serverPort = request.getServerPort();
        this.localAddr = request.getLocalAddr();
        this.localName = request.getLocalName();
        this.localPort = request.getLocalPort();
        this.protocol = request.getProtocol();
        this.secure = request.isSecure();
        this.asyncStarted = request.isAsyncStarted();
        this.authType = request.getAuthType();
        this.remoteUser = request.getRemoteUser();
        this.headers = new HashMap();
        Iterator i$ = Collections.list(request.getHeaderNames()).iterator();
        while (i$.hasNext()) {
            String headerName = (String) i$.next();
            this.headers.put(headerName, Collections.list(request.getHeaders(headerName)));
        }
        this.body = body;
    }

    @Override // io.sentry.event.interfaces.SentryInterface
    public String getInterfaceName() {
        return HTTP_INTERFACE;
    }

    public String getRequestUrl() {
        return this.requestUrl;
    }

    public String getMethod() {
        return this.method;
    }

    public Map<String, Collection<String>> getParameters() {
        return Collections.unmodifiableMap(this.parameters);
    }

    public String getQueryString() {
        return this.queryString;
    }

    public Map<String, String> getCookies() {
        return this.cookies;
    }

    public String getRemoteAddr() {
        return this.remoteAddr;
    }

    public String getServerName() {
        return this.serverName;
    }

    public int getServerPort() {
        return this.serverPort;
    }

    public String getLocalAddr() {
        return this.localAddr;
    }

    public String getLocalName() {
        return this.localName;
    }

    public int getLocalPort() {
        return this.localPort;
    }

    public String getProtocol() {
        return this.protocol;
    }

    public boolean isSecure() {
        return this.secure;
    }

    public boolean isAsyncStarted() {
        return this.asyncStarted;
    }

    public String getAuthType() {
        return this.authType;
    }

    public String getRemoteUser() {
        return this.remoteUser;
    }

    public String getBody() {
        return this.body;
    }

    public Map<String, Collection<String>> getHeaders() {
        return Collections.unmodifiableMap(this.headers);
    }

    public String toString() {
        return "HttpInterface{requestUrl='" + this.requestUrl + "', method='" + this.method + "', queryString='" + this.queryString + "', parameters=" + this.parameters + '}';
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        HttpInterface that = (HttpInterface) o;
        if (this.asyncStarted == that.asyncStarted && this.localPort == that.localPort && this.secure == that.secure && this.serverPort == that.serverPort) {
            if (this.authType == null ? that.authType != null : !this.authType.equals(that.authType)) {
                return false;
            }
            if (this.cookies.equals(that.cookies) && this.headers.equals(that.headers)) {
                if (this.localAddr == null ? that.localAddr != null : !this.localAddr.equals(that.localAddr)) {
                    return false;
                }
                if (this.localName == null ? that.localName != null : !this.localName.equals(that.localName)) {
                    return false;
                }
                if (this.method == null ? that.method != null : !this.method.equals(that.method)) {
                    return false;
                }
                if (!this.parameters.equals(that.parameters)) {
                    return false;
                }
                if (this.protocol == null ? that.protocol != null : !this.protocol.equals(that.protocol)) {
                    return false;
                }
                if (this.queryString == null ? that.queryString != null : !this.queryString.equals(that.queryString)) {
                    return false;
                }
                if (this.remoteAddr == null ? that.remoteAddr != null : !this.remoteAddr.equals(that.remoteAddr)) {
                    return false;
                }
                if (this.remoteUser == null ? that.remoteUser != null : !this.remoteUser.equals(that.remoteUser)) {
                    return false;
                }
                if (!this.requestUrl.equals(that.requestUrl)) {
                    return false;
                }
                if (this.serverName == null ? that.serverName != null : !this.serverName.equals(that.serverName)) {
                    return false;
                }
                if (this.body != null) {
                    if (this.body.equals(that.body)) {
                        return true;
                    }
                } else if (that.body == null) {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int result = this.requestUrl.hashCode();
        return (((result * 31) + (this.method != null ? this.method.hashCode() : 0)) * 31) + this.parameters.hashCode();
    }
}
