package com.google.android.gms.internal;

import com.facebook.common.util.UriUtil;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;
/* loaded from: classes2.dex */
public class zzz implements zzy {
    private final zza zzce;
    private final SSLSocketFactory zzcf;

    /* loaded from: classes2.dex */
    public interface zza {
        String zzh(String str);
    }

    public zzz() {
        this(null);
    }

    public zzz(zza zzaVar) {
        this(zzaVar, null);
    }

    public zzz(zza zzaVar, SSLSocketFactory sSLSocketFactory) {
        this.zzce = zzaVar;
        this.zzcf = sSLSocketFactory;
    }

    private HttpURLConnection zza(URL url, zzk<?> zzkVar) throws IOException {
        HttpURLConnection zza2 = zza(url);
        int zzr = zzkVar.zzr();
        zza2.setConnectTimeout(zzr);
        zza2.setReadTimeout(zzr);
        zza2.setUseCaches(false);
        zza2.setDoInput(true);
        if (UriUtil.HTTPS_SCHEME.equals(url.getProtocol()) && this.zzcf != null) {
            ((HttpsURLConnection) zza2).setSSLSocketFactory(this.zzcf);
        }
        return zza2;
    }

    private static HttpEntity zza(HttpURLConnection httpURLConnection) {
        InputStream errorStream;
        BasicHttpEntity basicHttpEntity = new BasicHttpEntity();
        try {
            errorStream = httpURLConnection.getInputStream();
        } catch (IOException e) {
            errorStream = httpURLConnection.getErrorStream();
        }
        basicHttpEntity.setContent(errorStream);
        basicHttpEntity.setContentLength(httpURLConnection.getContentLength());
        basicHttpEntity.setContentEncoding(httpURLConnection.getContentEncoding());
        basicHttpEntity.setContentType(httpURLConnection.getContentType());
        return basicHttpEntity;
    }

    static void zza(HttpURLConnection httpURLConnection, zzk<?> zzkVar) throws IOException, com.google.android.gms.internal.zza {
        switch (zzkVar.getMethod()) {
            case -1:
                byte[] zzl = zzkVar.zzl();
                if (zzl == null) {
                    return;
                }
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_POST);
                httpURLConnection.addRequestProperty("Content-Type", zzkVar.zzk());
                DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
                dataOutputStream.write(zzl);
                dataOutputStream.close();
                return;
            case 0:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_GET);
                return;
            case 1:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_POST);
                zzb(httpURLConnection, zzkVar);
                return;
            case 2:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_PUT);
                zzb(httpURLConnection, zzkVar);
                return;
            case 3:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_DELETE);
                return;
            case 4:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_HEAD);
                return;
            case 5:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_OPTIONS);
                return;
            case 6:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_TRACE);
                return;
            case 7:
                httpURLConnection.setRequestMethod("PATCH");
                zzb(httpURLConnection, zzkVar);
                return;
            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }

    private static void zzb(HttpURLConnection httpURLConnection, zzk<?> zzkVar) throws IOException, com.google.android.gms.internal.zza {
        byte[] zzo = zzkVar.zzo();
        if (zzo != null) {
            httpURLConnection.setDoOutput(true);
            httpURLConnection.addRequestProperty("Content-Type", zzkVar.zzn());
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            dataOutputStream.write(zzo);
            dataOutputStream.close();
        }
    }

    protected HttpURLConnection zza(URL url) throws IOException {
        return (HttpURLConnection) url.openConnection();
    }

    @Override // com.google.android.gms.internal.zzy
    public HttpResponse zza(zzk<?> zzkVar, Map<String, String> map) throws IOException, com.google.android.gms.internal.zza {
        String str;
        String url = zzkVar.getUrl();
        HashMap hashMap = new HashMap();
        hashMap.putAll(zzkVar.getHeaders());
        hashMap.putAll(map);
        if (this.zzce != null) {
            str = this.zzce.zzh(url);
            if (str == null) {
                String valueOf = String.valueOf(url);
                throw new IOException(valueOf.length() != 0 ? "URL blocked by rewriter: ".concat(valueOf) : new String("URL blocked by rewriter: "));
            }
        } else {
            str = url;
        }
        HttpURLConnection zza2 = zza(new URL(str), zzkVar);
        for (String str2 : hashMap.keySet()) {
            zza2.addRequestProperty(str2, (String) hashMap.get(str2));
        }
        zza(zza2, zzkVar);
        ProtocolVersion protocolVersion = new ProtocolVersion("HTTP", 1, 1);
        if (zza2.getResponseCode() == -1) {
            throw new IOException("Could not retrieve response code from HttpUrlConnection.");
        }
        BasicHttpResponse basicHttpResponse = new BasicHttpResponse(new BasicStatusLine(protocolVersion, zza2.getResponseCode(), zza2.getResponseMessage()));
        basicHttpResponse.setEntity(zza(zza2));
        for (Map.Entry<String, List<String>> entry : zza2.getHeaderFields().entrySet()) {
            if (entry.getKey() != null) {
                basicHttpResponse.addHeader(new BasicHeader(entry.getKey(), entry.getValue().get(0)));
            }
        }
        return basicHttpResponse;
    }
}
