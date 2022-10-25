package com.vk.core.network;

import android.util.Log;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import okhttp3.OkHttpClient;
/* loaded from: classes2.dex */
public class NetworkTrustManager implements X509TrustManager {
    private static final String TAG = NetworkTrustManager.class.getSimpleName();
    private X509TrustManager systemTrustManager = systemDefaultTrustManager();
    private SSLSocketFactory factory = createSslSocketFactory(this);

    /* loaded from: classes2.dex */
    protected class NetworkException extends Exception {
        /* JADX INFO: Access modifiers changed from: package-private */
        public NetworkException(String reason) {
            super(reason);
        }
    }

    public static void sslDefaultSocketFactory(OkHttpClient.Builder client) {
        try {
            NetworkTrustManager manager = new NetworkTrustManager();
            client.sslSocketFactory(manager.getFactory(), manager);
        } catch (Exception e) {
            Log.w(TAG, e);
        }
    }

    public static void sslSocketFactory(OkHttpClient.Builder client, NetworkTrustManager manager) {
        try {
            client.sslSocketFactory(manager.getFactory(), manager);
        } catch (Exception e) {
            Log.w(TAG, e);
        }
    }

    public SSLSocketFactory getFactory() {
        return this.factory;
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        this.systemTrustManager.checkClientTrusted(chain, authType);
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        this.systemTrustManager.checkServerTrusted(chain, authType);
    }

    @Override // javax.net.ssl.X509TrustManager
    public X509Certificate[] getAcceptedIssuers() {
        return this.systemTrustManager.getAcceptedIssuers();
    }

    private X509TrustManager systemDefaultTrustManager() {
        try {
            TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
            trustManagerFactory.init((KeyStore) null);
            TrustManager[] trustManagers = trustManagerFactory.getTrustManagers();
            if (trustManagers.length != 1 || !(trustManagers[0] instanceof X509TrustManager)) {
                throw new IllegalStateException("Unexpected default trust managers:" + Arrays.toString(trustManagers));
            }
            return (X509TrustManager) trustManagers[0];
        } catch (GeneralSecurityException e) {
            throw new AssertionError();
        }
    }

    private SSLSocketFactory createSslSocketFactory(TrustManager trustManager) {
        try {
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, new TrustManager[]{trustManager}, null);
            context.getClientSessionContext().setSessionCacheSize(0);
            context.getClientSessionContext().setSessionTimeout(900);
            return context.getSocketFactory();
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }
}
