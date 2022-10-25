package com.vk.core.network;

import android.content.Context;
import android.text.TextUtils;
import com.vk.analytics.Analytics;
import com.vk.core.R;
import com.vk.core.network.NetworkTrustManager;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.security.PublicKey;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
import javax.security.cert.X509Certificate;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.internal.http.HttpMethod;
import okhttp3.internal.http.UnrepeatableRequestBody;
import okhttp3.internal.tls.OkHostnameVerifier;
/* loaded from: classes2.dex */
public class NetworkProxyHost extends NetworkTrustManager {
    protected static final String CHECK_URL_PING = "https://vk.com/ping.txt";
    protected static final String CHECK_URL_PING_MOBILE = "https://m.vk.com";
    protected static final int MAX_FOLLOW_UP = 20;
    private static final ArrayList<String> TRUSTED_DOMAINS = new ArrayList<>(Arrays.asList("vk.com", "userapi.com", "vk-cdn.net", "vkuservideo.net", "vkuservideo.com", "vkuserlive.com", "vkuserlive.net", "vkuseraudio.com", "vkuseraudio.net"));
    protected ArrayList<String> proxies;
    protected String userAgent;
    protected String userAgentCheck;
    protected int proxyIndex = 0;
    protected Analytics.OnValueEventListener databaseListener = new Analytics.OnValueEventListener() { // from class: com.vk.core.network.NetworkProxyHost.1
        @Override // com.vk.analytics.Analytics.OnValueEventListener
        public void onDataChange(String value) {
            NetworkProxyHost.this.findNewProxy();
        }
    };
    protected boolean logging = false;
    protected boolean useHosts = false;
    private boolean useHostsTemporary = false;
    private PublicKey rsaKey = null;
    private HostnameVerifier hostNameVerifier = new HostnameVerifier() { // from class: com.vk.core.network.NetworkProxyHost.2
        @Override // javax.net.ssl.HostnameVerifier
        public boolean verify(String hostname, SSLSession session) {
            if (!NetworkProxyHost.this.useHosts && !NetworkProxyHost.this.useHostsTemporary) {
                return OkHostnameVerifier.INSTANCE.verify(hostname, session);
            }
            if (session == null || !session.isValid()) {
                return false;
            }
            if (NetworkProxyHost.this.logging) {
                return true;
            }
            try {
                X509Certificate[] certificates = session.getPeerCertificateChain();
                if (certificates != null) {
                    for (X509Certificate cert : certificates) {
                        Principal principal = cert.getSubjectDN();
                        if (NetworkProxyHost.this.isTrustedDn(principal.getName())) {
                            try {
                                cert.verify(NetworkProxyHost.this.rsaKey);
                                return true;
                            } catch (Exception e) {
                                NetworkProxyHost.this.log(e);
                            }
                        }
                    }
                }
            } catch (Exception e2) {
            }
            return OkHostnameVerifier.INSTANCE.verify(hostname, session);
        }
    };
    private Interceptor hostInterceptor = new Interceptor() { // from class: com.vk.core.network.NetworkProxyHost.3
        @Override // okhttp3.Interceptor
        public Response intercept(Interceptor.Chain chain) throws IOException {
            Request request = chain.request();
            Response response = chain.proceed(NetworkProxyHost.this.canUseRequestWithHost(request) ? NetworkProxyHost.this.getRequestWithHost(request) : NetworkProxyHost.this.getRequest(request));
            if (response != null && response.isRedirect()) {
                int redirects = 0;
                while (response != null && redirects < 20) {
                    Request r = NetworkProxyHost.this.followUpRequest(response);
                    if (r == null) {
                        break;
                    }
                    redirects++;
                    response = chain.proceed(NetworkProxyHost.this.canUseRequestWithHost(r) ? NetworkProxyHost.this.getRequestWithHost(r) : NetworkProxyHost.this.getRequest(r));
                }
            }
            if (response != null) {
            }
            return response;
        }
    };
    private Interceptor networkInterceptor = new Interceptor() { // from class: com.vk.core.network.NetworkProxyHost.4
        @Override // okhttp3.Interceptor
        public Response intercept(Interceptor.Chain chain) throws IOException {
            Request request = chain.request();
            Response response = chain.proceed(request);
            NetworkProxyHost.this.log("net: --> " + request.method() + ' ' + request.url());
            NetworkProxyHost.this.log("net: <-- " + response.code() + ' ' + response.message() + ' ' + response.request().url().url() + "\nheaders:" + response.headers().toString());
            return response;
        }
    };

    public boolean init(Context context) {
        if (this.rsaKey != null) {
            return true;
        }
        int error = 0;
        Exception exception = null;
        String cert = readPublicKey(context);
        if (cert != null) {
            try {
                X509Certificate certRSA = X509Certificate.getInstance(cert.getBytes());
                certRSA.checkValidity();
                error = 0 + 1 + 1;
                this.rsaKey = certRSA.getPublicKey();
            } catch (Exception e) {
                exception = e;
            }
        }
        if (this.rsaKey != null) {
            return true;
        }
        String msg = new String("error:" + error + ", ex:" + (exception != null ? exception.getMessage() : "") + ", cert:" + (cert != null ? "yes" : "no"));
        Analytics.logException(new NetworkTrustManager.NetworkException(msg));
        return false;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public HostnameVerifier getHostnameVerifier() {
        return this.hostNameVerifier;
    }

    public NetworkTrustManager getTrustManager() {
        return this;
    }

    public Interceptor getInterceptor() {
        return this.hostInterceptor;
    }

    public Interceptor getNetworkInterceptor() {
        return this.networkInterceptor;
    }

    public void setUseHosts(boolean useHosts) {
        log("use proxy " + useHosts);
        this.useHosts = this.rsaKey != null && useHosts;
        if (!useHosts) {
            this.useHostsTemporary = false;
        }
    }

    public void setUseHostsTemprary(boolean useHosts) {
        log("use proxy temporary " + useHosts);
        this.useHostsTemporary = this.rsaKey != null && useHosts;
    }

    public void setProxyIndex(int index) {
        if (this.proxies != null && index < this.proxies.size()) {
            this.proxyIndex = index;
        }
    }

    public boolean isEnable() {
        return this.useHosts;
    }

    public ArrayList<String> parse(String proxies) {
        if (TextUtils.isEmpty(proxies)) {
            log("parse: no proxies");
            return null;
        }
        try {
            List<String> p = Arrays.asList(proxies.split("\\s+"));
            if (p == null) {
                return null;
            }
            ArrayList<String> result = new ArrayList<>();
            result.addAll(p);
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean hasProxies() {
        return this.proxies != null && !this.proxies.isEmpty();
    }

    public String host() {
        if (this.proxies == null || this.proxyIndex >= this.proxies.size()) {
            return null;
        }
        return this.proxies.get(this.proxyIndex);
    }

    protected String getHost(String host) {
        String proxy = getProxyHost();
        if (TextUtils.isEmpty(proxy) || !isTrustedDn(host)) {
            return null;
        }
        return proxy;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getHost(String host, String proxyHost) {
        String proxy = !TextUtils.isEmpty(proxyHost) ? proxyHost : getProxyHost();
        if (TextUtils.isEmpty(proxy) || !isTrustedDn(host)) {
            return null;
        }
        return proxy;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getProxyHost() {
        if (this.proxies == null || this.proxyIndex >= this.proxies.size()) {
            return null;
        }
        return this.proxies.get(this.proxyIndex);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public Request followUpRequest(Response userResponse) throws IOException {
        HttpUrl url;
        RequestBody requestBody = null;
        if (userResponse == null) {
            throw new IllegalStateException();
        }
        int responseCode = userResponse.code();
        String method = userResponse.request().method();
        switch (responseCode) {
            case 300:
            case 301:
            case 302:
            case 303:
                break;
            case 307:
            case 308:
                if (!method.equals(HttpRequest.METHOD_GET) && !method.equals(HttpRequest.METHOD_HEAD)) {
                    return null;
                }
                break;
            case 408:
                if (userResponse.request().body() instanceof UnrepeatableRequestBody) {
                    return null;
                }
                return userResponse.request();
            default:
                return null;
        }
        String location = userResponse.header(HttpRequest.HEADER_LOCATION);
        if (location == null || (url = userResponse.request().url().resolve(location)) == null) {
            return null;
        }
        Request.Builder requestBuilder = userResponse.request().newBuilder();
        if (HttpMethod.permitsRequestBody(method)) {
            boolean maintainBody = HttpMethod.redirectsWithBody(method);
            if (HttpMethod.redirectsToGet(method)) {
                requestBuilder.method(HttpRequest.METHOD_GET, null);
            } else {
                if (maintainBody) {
                    requestBody = userResponse.request().body();
                }
                requestBuilder.method(method, requestBody);
            }
            if (!maintainBody) {
                requestBuilder.removeHeader("Transfer-Encoding");
                requestBuilder.removeHeader("Content-Length");
                requestBuilder.removeHeader("Content-Type");
            }
        }
        return requestBuilder.url(url).build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean canUseRequestWithHost(Request request) {
        if (this.useHosts) {
            return true;
        }
        if (!this.useHostsTemporary) {
            return false;
        }
        String url = request.url().toString();
        return url.contains(CHECK_URL_PING) || url.contains(CHECK_URL_PING_MOBILE) || url.contains("utils.getProxiesPreferences");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Request getRequestWithHost(Request request) {
        HttpUrl url = request.url();
        String host = getHost(url.host());
        if (TextUtils.isEmpty(host)) {
            log("!! no proxy: " + url.url() + " host: " + url.host() + " -> " + host);
            return getRequest(request);
        }
        return getRequestWithHostProxy(request, host);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Request getRequest(Request request) {
        return request.newBuilder().header("User-Agent", this.userAgentCheck != null ? this.userAgentCheck : this.userAgent).build();
    }

    private Request getRequestWithHostProxy(Request request, String host) {
        HttpUrl url = request.url();
        HttpUrl newUrl = request.url().newBuilder().host(host).build();
        log("proxy: " + url.host() + " -> " + newUrl.url() + " (" + newUrl.host() + ")");
        return request.newBuilder().header("User-Agent", this.userAgent).header("Host", url.host()).url(newUrl).build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isTrustedDn(String dn) {
        Iterator<String> it = TRUSTED_DOMAINS.iterator();
        while (it.hasNext()) {
            String domain = it.next();
            if (dn.contains(domain)) {
                return true;
            }
        }
        return false;
    }

    private String readPublicKey(Context context) {
        ByteArrayOutputStream byteArrayOutputStream;
        String cert = null;
        InputStream raw = null;
        ByteArrayOutputStream byteArrayOutputStream2 = null;
        try {
            raw = context.getResources().openRawResource(R.raw.cert);
            byteArrayOutputStream = new ByteArrayOutputStream();
        } catch (Exception e) {
        } catch (Throwable th) {
            th = th;
        }
        try {
            for (int bytes = raw.read(); bytes != -1; bytes = raw.read()) {
                byteArrayOutputStream.write(bytes);
            }
            cert = byteArrayOutputStream.toString();
        } catch (IOException e2) {
        } catch (Exception e3) {
            byteArrayOutputStream2 = byteArrayOutputStream;
            if (byteArrayOutputStream2 != null) {
                try {
                    byteArrayOutputStream2.close();
                } catch (Exception e4) {
                }
            }
            if (raw != null) {
                try {
                    raw.close();
                } catch (Exception e5) {
                }
            }
            return cert;
        } catch (Throwable th2) {
            th = th2;
            byteArrayOutputStream2 = byteArrayOutputStream;
            if (byteArrayOutputStream2 != null) {
                try {
                    byteArrayOutputStream2.close();
                } catch (Exception e6) {
                }
            }
            if (raw != null) {
                try {
                    raw.close();
                } catch (Exception e7) {
                }
            }
            throw th;
        }
        if (byteArrayOutputStream != null) {
            try {
                byteArrayOutputStream.close();
            } catch (Exception e8) {
            }
        }
        if (raw != null) {
            try {
                raw.close();
            } catch (Exception e9) {
            }
        }
        return cert;
    }

    protected void findNewProxy() {
    }

    protected void log(String msg) {
    }

    protected void log(Exception e) {
    }

    @Override // com.vk.core.network.NetworkTrustManager, javax.net.ssl.X509TrustManager
    public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType) throws CertificateException {
        if (!isCustomVerify()) {
            super.checkClientTrusted(chain, authType);
        }
    }

    @Override // com.vk.core.network.NetworkTrustManager, javax.net.ssl.X509TrustManager
    public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType) throws CertificateException {
        if (!isCustomVerify()) {
            super.checkServerTrusted(chain, authType);
        }
    }

    @Override // com.vk.core.network.NetworkTrustManager, javax.net.ssl.X509TrustManager
    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
        return isCustomVerify() ? new java.security.cert.X509Certificate[0] : super.getAcceptedIssuers();
    }

    private boolean isCustomVerify() {
        return isEnable() || this.useHostsTemporary;
    }
}
