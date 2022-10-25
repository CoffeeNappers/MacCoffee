package com.vk.core.network;

import android.content.Context;
import android.util.Log;
import com.vk.core.network.cookies.PersistentCookieJar;
import com.vk.core.network.cookies.cache.SetCookieCache;
import com.vk.core.network.cookies.persistence.SharedPrefsCookiePersistor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.tls.OkHostnameVerifier;
/* loaded from: classes.dex */
public class Network {
    private static final String TAG = Network.class.getSimpleName();
    private static Network sInstance = null;
    private Context context;
    private boolean debug;
    private ArrayList<ClientHolder> clients = new ArrayList<>();
    private NetworkUserAgent userAgent = new NetworkUserAgent();
    private NetworkProxy proxy = new NetworkProxy();

    /* loaded from: classes.dex */
    public enum ClientType {
        CLIENT_DEFAULT,
        CLIENT_LONGPOLL,
        CLIENT_IMAGE_LOADER,
        CLIENT_PLAYER,
        CLIENT_VIGO,
        CLIENT_EMOJI
    }

    public static Network getInstance() {
        if (sInstance == null) {
            sInstance = new Network();
        }
        return sInstance;
    }

    public static OkHttpClient getDefaultClient() {
        return getInstance().getClient(ClientType.CLIENT_DEFAULT);
    }

    public static byte[] getURL(String url) {
        try {
            Request req = new Request.Builder().url(url).build();
            Response resp = getDefaultClient().newCall(req).execute();
            return resp.body().bytes();
        } catch (IOException x) {
            Log.e(TAG, "", x);
            return null;
        } catch (Exception e) {
            Log.e(TAG, "", e);
            return null;
        }
    }

    public void init(Context context, boolean debug) {
        this.context = context;
        this.debug = debug;
        this.userAgent.init(context);
        for (int i = 0; i < ClientType.values().length; i++) {
            this.clients.add(i, new ClientHolder(ClientType.values()[i]));
        }
        this.proxy.init(context, debug);
    }

    public NetworkProxy proxy() {
        return this.proxy;
    }

    public NetworkUserAgent getUserAgent() {
        return this.userAgent;
    }

    public OkHttpClient getClient(ClientType id) {
        return this.clients.get(id.ordinal()).client();
    }

    public OkHttpClient.Builder getBuilder(ClientType id) {
        return this.clients.get(id.ordinal()).builder();
    }

    public OkHttpClient.Builder makeBuilder() {
        OkHttpClient.Builder builder = createBuilder();
        if (proxy().isEnable()) {
            addHost(builder);
        }
        return builder;
    }

    public OkHttpClient setBuilder(ClientType id, OkHttpClient.Builder builder) {
        return this.clients.get(id.ordinal()).setBuilder(builder);
    }

    public boolean enableProxy(boolean force) {
        if (!this.proxy.hasProxies()) {
            return false;
        }
        Log.v(TAG, "enableProxy force=" + force);
        if (force) {
            this.proxy.setUseHosts(true);
            this.proxy.storeTime();
        } else {
            this.proxy.setUseHostsTemprary(true);
        }
        this.proxy.setUserAgent(this.userAgent.userAgent());
        Iterator<ClientHolder> it = this.clients.iterator();
        while (it.hasNext()) {
            ClientHolder c = it.next();
            c.addHost();
        }
        return true;
    }

    public boolean disableProxy(boolean force) {
        Log.v(TAG, "disableProxy force=" + force);
        if (force) {
            this.proxy.resetTime();
            this.proxy.reset();
        }
        Iterator<ClientHolder> it = this.clients.iterator();
        while (it.hasNext()) {
            ClientHolder c = it.next();
            c.removeHost();
        }
        return true;
    }

    private OkHttpClient.Builder createBuilder() {
        OkHttpClient.Builder builder = new OkHttpClient.Builder();
        builder.connectTimeout(20L, TimeUnit.SECONDS);
        builder.readTimeout(30L, TimeUnit.SECONDS);
        builder.writeTimeout(20L, TimeUnit.SECONDS);
        builder.addInterceptor(new UserAgentInterceptor());
        builder.cookieJar(new PersistentCookieJar(new SetCookieCache(), new SharedPrefsCookiePersistor(this.context), this.debug));
        NetworkTrustManager.sslDefaultSocketFactory(builder);
        builder.followRedirects(true);
        builder.followSslRedirects(true);
        return builder;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeHost(OkHttpClient.Builder builder) {
        List<Interceptor> interceptors = builder.interceptors();
        boolean found = false;
        for (Interceptor i : interceptors) {
            if (i == this.proxy.getInterceptor()) {
                interceptors.remove(i);
                found = true;
            }
        }
        if (found) {
            builder.addInterceptor(new UserAgentInterceptor());
            builder.hostnameVerifier(OkHostnameVerifier.INSTANCE);
            NetworkTrustManager.sslDefaultSocketFactory(builder);
        }
        builder.followRedirects(true);
        builder.followSslRedirects(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addHost(OkHttpClient.Builder builder) {
        builder.interceptors().clear();
        if (!builder.interceptors().contains(this.proxy.getInterceptor())) {
            builder.addInterceptor(this.proxy.getInterceptor());
        }
        if (!builder.networkInterceptors().contains(this.proxy.getNetworkInterceptor())) {
        }
        builder.hostnameVerifier(this.proxy.getHostnameVerifier());
        NetworkTrustManager.sslSocketFactory(builder, this.proxy.getTrustManager());
        builder.followRedirects(false);
        builder.followSslRedirects(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class UserAgentInterceptor implements Interceptor {
        private final String ua = Network.getInstance().userAgent.userAgent();

        @Override // okhttp3.Interceptor
        public Response intercept(Interceptor.Chain chain) throws IOException {
            Request originalRequest = chain.request();
            Request requestWithUserAgent = originalRequest.newBuilder().header("User-Agent", this.ua).build();
            return chain.proceed(requestWithUserAgent);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ClientHolder {
        private final ClientType id;
        private final Object lock = new Object();
        private OkHttpClient.Builder builder = null;
        private OkHttpClient client = null;

        public ClientHolder(ClientType id) {
            this.id = id;
        }

        public OkHttpClient client() {
            if (empty()) {
                synchronized (this.lock) {
                    if (empty()) {
                        this.builder = Network.getInstance().makeBuilder();
                        this.client = this.builder.build();
                    }
                }
            }
            return this.client;
        }

        public OkHttpClient.Builder builder() {
            client();
            return this.builder;
        }

        public OkHttpClient setBuilder(OkHttpClient.Builder builder) {
            synchronized (this.lock) {
                this.builder = builder;
                this.client = builder.build();
            }
            return this.client;
        }

        public void addHost() {
            synchronized (this.lock) {
                if (empty()) {
                    this.builder = Network.getInstance().makeBuilder();
                }
                Network.getInstance().addHost(this.builder);
                this.client = this.builder.build();
            }
        }

        public void removeHost() {
            synchronized (this.lock) {
                if (!empty()) {
                    Network.getInstance().removeHost(this.builder);
                    this.client = this.builder.build();
                }
            }
        }

        private boolean empty() {
            return this.client == null;
        }
    }
}
