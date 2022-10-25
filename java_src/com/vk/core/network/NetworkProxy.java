package com.vk.core.network;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebView;
import com.vk.analytics.Analytics;
import com.vk.analytics.Firebase;
import com.vk.core.util.Preference;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
/* loaded from: classes2.dex */
public class NetworkProxy extends NetworkProxyHost {
    private static final String CHECK_UA_GOOGLE = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
    private static final String CHECK_URL_GOOGLE = "https://google.com";
    private static final String CHECK_URL_GOOGLE_REDIRECT = "google.com.ua";
    private static final int CLIENT_TIMEOUT_SEC = 10;
    private static final long PROXY_CACHE_LIVE_SEC = 86400;
    private static final String TAG = NetworkProxy.class.getSimpleName();
    private ProxyCallback callback;
    public Preference.PreferenceString preferenceLastProxy;
    public Preference.PreferenceBoolean preferenceState;
    public Preference.PreferenceLong preferenceTime;
    public Preference.PreferenceBoolean preferenceUserState;
    private ExecutorService executor = Executors.newSingleThreadExecutor();
    private boolean forceUseProxy = false;
    private boolean canUseProxy = false;
    private Handler handler = new Handler(Looper.getMainLooper());
    private OkHttpClient proxyClient = null;
    private int getProxiesAttempts = 0;
    private boolean running = false;

    /* loaded from: classes.dex */
    public interface ProxyCallback {
        void onProxyHostConnected();

        void onProxyHostDisconnected();
    }

    public void init(Context context, boolean logging) {
        SharedPreferences preferences = context.getSharedPreferences("NetworkProxy", 0);
        this.preferenceTime = new Preference.PreferenceLong(preferences, "proxy_time", new Long(0L));
        this.preferenceUserState = new Preference.PreferenceBoolean(preferences, "proxy_user_state", new Boolean(true));
        this.preferenceState = new Preference.PreferenceBoolean(preferences, "proxy_state", new Boolean(false));
        this.preferenceLastProxy = new Preference.PreferenceString(preferences, "proxy_last", null);
        setUserAgent(Network.getInstance().getUserAgent().userAgent());
        this.logging = logging;
        if (!init(context)) {
            notifyOnProxyHostDisconnected();
            return;
        }
        this.forceUseProxy = PreferenceManager.getDefaultSharedPreferences(context).getBoolean("__dbg_proxy_enable", false);
        if (!this.forceUseProxy && wasEnabled() && !isDisabledByUser()) {
            this.proxies = parse(getProxiesList());
            if (hasProxies()) {
                Network.getInstance().enableProxy(true);
            }
        }
    }

    public void verify(ProxyCallback callback) {
        if (!Analytics.getInstance().database().isEnableProxies() || isDisabledByUser()) {
            notifyOnProxyHostDisconnected();
            return;
        }
        log("check: begin");
        this.callback = callback;
        this.running = true;
        this.useHosts = false;
        clearProxiesIfNeeded();
        verify();
    }

    public void enableProxyByUser(boolean enable) {
        log("enable by user " + enable);
        this.preferenceUserState.set(Boolean.valueOf(enable));
        if (!enable) {
            setUseHosts(false);
        }
    }

    public boolean canUseProxy() {
        return this.forceUseProxy || isEnable() || isProxyMenuEnable();
    }

    public void storeTime() {
        this.preferenceTime.set(Long.valueOf(System.currentTimeMillis()));
        this.preferenceState.set((Boolean) true);
    }

    public void resetTime() {
        log("reset time");
        this.preferenceTime.set(new Long(0L));
    }

    public void reset() {
        this.canUseProxy = false;
        setUseHosts(false);
        this.preferenceState.set((Boolean) false);
    }

    public boolean loadUrl(WebView view, String url) {
        try {
            if (isEnable() || wasEnabled()) {
                URL uri = new URL(url);
                String host = getHost(uri.getHost(), this.preferenceLastProxy.mo473get());
                if (!TextUtils.isEmpty(host)) {
                    URL newUri = new URL(uri.getProtocol(), host, uri.getFile());
                    Map<String, String> headers = new HashMap<>();
                    headers.put("Host", uri.getHost());
                    view.loadUrl(newUri.toString(), headers);
                    return true;
                }
            }
        } catch (Exception e) {
        }
        view.loadUrl(url);
        return false;
    }

    private static String getProxiesList() {
        return Analytics.getInstance().getProxies();
    }

    private void verify() {
        this.executor.execute(new Runnable() { // from class: com.vk.core.network.NetworkProxy.1
            @Override // java.lang.Runnable
            public void run() {
                boolean status = false;
                try {
                    NetworkProxy.this.proxyClient = NetworkProxy.this.makeClient(NetworkProxy.this.forceUseProxy);
                    if (NetworkProxy.this.forceUseProxy || (!NetworkProxy.this.verifyPing() && NetworkProxy.this.verifyUrls())) {
                        NetworkProxy.this.canUseProxy = true;
                        NetworkProxy.this.proxyClient = NetworkProxy.this.makeClient(true);
                        status = NetworkProxy.this.verifyHost();
                    }
                    if (!status) {
                        NetworkProxy.this.log("check: no proxy!");
                        NetworkProxy.this.proxyClient = null;
                        NetworkProxy.this.disableProxy();
                    }
                } catch (Exception e) {
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public OkHttpClient makeClient(boolean useHosts) {
        OkHttpClient.Builder client = new OkHttpClient.Builder();
        client.connectTimeout(10L, TimeUnit.SECONDS);
        client.readTimeout(15L, TimeUnit.SECONDS);
        if (!useHosts) {
            NetworkTrustManager.sslDefaultSocketFactory(client);
        } else {
            NetworkTrustManager.sslSocketFactory(client, getTrustManager());
        }
        client.addInterceptor(getInterceptor());
        if (useHosts) {
            client.hostnameVerifier(getHostnameVerifier());
        }
        return client.build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean verifyHost() {
        int i = 0;
        if (!this.canUseProxy) {
            return false;
        }
        this.proxies = parse(getProxiesList());
        StringBuilder append = new StringBuilder().append("check: verifyHost proxies: ");
        if (this.proxies != null) {
            i = this.proxies.size();
        }
        log(append.append(i).toString());
        if (hasProxies() && findProxy()) {
            if (!this.forceUseProxy) {
                return true;
            }
            return Network.getInstance().enableProxy(true);
        }
        return subscribe();
    }

    private void enableProxy() {
        if (isDisabledByUser()) {
            setUseHosts(false);
        } else if (Network.getInstance().enableProxy(false)) {
            notifyOnProxyHostConnected();
        }
    }

    private boolean isDisabledByUser() {
        Boolean state = this.preferenceUserState.mo473get();
        if (state == null || state.booleanValue()) {
            return false;
        }
        log("proxy disabled by user");
        return true;
    }

    private boolean wasEnabled() {
        Boolean state = this.preferenceState.mo473get();
        if (state == null || !state.booleanValue()) {
            return false;
        }
        log("proxy was enabled");
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void disableProxy() {
        this.getProxiesAttempts = 0;
        setUseHostsTemprary(false);
        if (isEnable()) {
            Network.getInstance().disableProxy(true);
        }
        notifyOnProxyHostDisconnected();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean verifyPing() {
        return verifyPing("https://vk.com/ping.txt") && verifyPing("https://m.vk.com");
    }

    private boolean verifyPing(String url) {
        if (hasProxies() && isEnable()) {
            log("check: ping proxy: " + this.proxies.get(this.proxyIndex));
        }
        this.userAgentCheck = CHECK_UA_GOOGLE;
        log("check: ping begin " + url);
        Response result = executeResponse(url);
        this.userAgentCheck = null;
        boolean status = result != null && result.isSuccessful();
        log("check: ping end " + url + " result: " + (result != null ? result.toString() : "empty"));
        return status;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean verifyUrls() {
        this.userAgentCheck = CHECK_UA_GOOGLE;
        log("check: site begin");
        Response response = null;
        for (int i = 0; i < 2 && (response = executeResponse(CHECK_URL_GOOGLE)) == null; i++) {
        }
        log("check: site end result: " + (response != null ? response.toString() : "empty"));
        this.userAgentCheck = null;
        if (response != null && response.isSuccessful()) {
            if (!isRedirectCheckEnable()) {
                return true;
            }
            return isRedirect(response, CHECK_URL_GOOGLE_REDIRECT);
        }
        return false;
    }

    private Response executeResponse(String url) {
        if (this.proxyClient == null) {
            return null;
        }
        try {
            Request request = new Request.Builder().url(url).build();
            return this.proxyClient.newCall(request).execute();
        } catch (Exception e) {
            log(e);
            return null;
        }
    }

    private boolean isRedirect(Response response, String redirect) {
        try {
            String url = response.request().url().url().getHost();
            if (url != null && TextUtils.indexOf(url, redirect) > 0) {
                log("check: has redirect!");
                return true;
            }
        } catch (Exception e) {
            log(e);
        }
        return false;
    }

    private boolean findProxy() {
        if (!hasProxies()) {
            return false;
        }
        log("check: findProxy");
        setUseHostsTemprary(true);
        ArrayList<String> proxies = this.proxies;
        if (isShuffleEnable()) {
            proxies = new ArrayList<>();
            proxies.addAll(this.proxies);
            Collections.shuffle(proxies);
        }
        for (int i = 0; i < proxies.size(); i++) {
            int index = this.proxies.indexOf(proxies.get(i));
            setProxyIndex(index);
            if (verifyPing("https://vk.com/ping.txt")) {
                log("check: founded new host " + host());
                enableProxy();
                return true;
            }
            log("check: failed on host " + host());
        }
        setProxyIndex(0);
        setUseHostsTemprary(false);
        return false;
    }

    @Override // com.vk.core.network.NetworkProxyHost
    protected void findNewProxy() {
        log("findNewProxy");
        if (this.proxyClient == null) {
            verify();
            return;
        }
        ArrayList<String> p = parse(getProxiesList());
        log("proxies size=" + (p != null ? p.size() : 0));
        if (p == null) {
            this.proxies = null;
            disableProxy();
        } else if (this.proxies != null && p.equals(this.proxies) && isEnable()) {
            log("proxies same");
            if (isEnable()) {
                notifyOnProxyHostConnected();
            } else {
                notifyOnProxyHostDisconnected();
            }
        } else {
            this.executor.execute(new Runnable() { // from class: com.vk.core.network.NetworkProxy.2
                @Override // java.lang.Runnable
                public void run() {
                    NetworkProxy.this.verifyHost();
                }
            });
        }
    }

    @Override // com.vk.core.network.NetworkProxyHost
    protected void log(String msg) {
        if (this.logging) {
            Log.d(TAG, msg);
        }
    }

    @Override // com.vk.core.network.NetworkProxyHost
    protected void log(Exception e) {
        if (this.logging && e != null) {
            Log.w(TAG, e.toString() + " msg: " + e.getMessage() + " cause: " + (e.getCause() != null ? e.getCause().toString() : null));
        }
    }

    private boolean subscribe() {
        if (this.getProxiesAttempts >= 2) {
            log("can't use proxy");
            return false;
        }
        Firebase db = Analytics.getInstance().database();
        if (db != null) {
            log("subscribe for proxies attempt " + this.getProxiesAttempts);
            db.subscribe(Firebase.CONFIG_PROXIES_LIST, this.databaseListener);
            this.getProxiesAttempts++;
        }
        return true;
    }

    private void clearProxiesIfNeeded() {
        long time = this.preferenceTime.mo473get().longValue();
        long now = System.currentTimeMillis();
        if (time != 0) {
            if (time <= 0 || (now - time) / 1000 >= PROXY_CACHE_LIVE_SEC) {
                clearProxies();
            }
        }
    }

    private void clearProxies() {
        log("clear proxies");
        resetTime();
        Firebase db = Analytics.getInstance().database();
        if (db != null) {
            db.clearProxies();
        }
    }

    private void notifyOnProxyHostConnected() {
        log("notifyOnProxyHostConnected");
        this.running = false;
        this.preferenceLastProxy.set(getProxyHost());
        this.handler.post(new Runnable() { // from class: com.vk.core.network.NetworkProxy.3
            @Override // java.lang.Runnable
            public void run() {
                if (NetworkProxy.this.callback != null) {
                    NetworkProxy.this.callback.onProxyHostConnected();
                }
            }
        });
    }

    private void notifyOnProxyHostDisconnected() {
        log("notifyOnProxyHostDisconnected");
        this.running = false;
        if (this.preferenceLastProxy != null) {
            this.preferenceLastProxy.set((String) null);
        }
        this.handler.post(new Runnable() { // from class: com.vk.core.network.NetworkProxy.4
            @Override // java.lang.Runnable
            public void run() {
                if (NetworkProxy.this.callback != null) {
                    NetworkProxy.this.callback.onProxyHostDisconnected();
                }
            }
        });
    }

    private boolean isRedirectCheckEnable() {
        HashMap<String, String> settings = Analytics.getInstance().database().getSettings();
        if (!settings.isEmpty()) {
            String enable = settings.get(Firebase.CONFIG_SETTINGS_PROXY_CHECK);
            if (!TextUtils.isEmpty(enable) && "false".equals(enable)) {
                return false;
            }
        }
        return true;
    }

    private boolean isShuffleEnable() {
        HashMap<String, String> settings = Analytics.getInstance().database().getSettings();
        if (!settings.isEmpty()) {
            String enable = settings.get(Firebase.CONFIG_SETTINGS_PROXY_SHUFFLE);
            return !TextUtils.isEmpty(enable) && "true".equals(enable);
        }
        return false;
    }

    private boolean isProxyMenuEnable() {
        HashMap<String, String> settings = Analytics.getInstance().database().getSettings();
        if (!settings.isEmpty()) {
            String enable = settings.get(Firebase.CONFIG_SETTINGS_PROXY_MENU);
            return !TextUtils.isEmpty(enable) && "true".equals(enable);
        }
        return false;
    }
}
