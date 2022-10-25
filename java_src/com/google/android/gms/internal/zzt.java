package com.google.android.gms.internal;

import android.os.SystemClock;
import com.coremedia.iso.boxes.AuthorBox;
import com.google.android.gms.auth.api.proxy.AuthApiStatusCodes;
import com.google.android.gms.internal.zzb;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.impl.cookie.DateUtils;
/* loaded from: classes2.dex */
public class zzt implements zzf {
    protected static final boolean DEBUG = zzs.DEBUG;
    private static int zzbn = AuthApiStatusCodes.AUTH_API_INVALID_CREDENTIALS;
    private static int zzbo = 4096;
    protected final zzy zzbp;
    protected final zzu zzbq;

    public zzt(zzy zzyVar) {
        this(zzyVar, new zzu(zzbo));
    }

    public zzt(zzy zzyVar, zzu zzuVar) {
        this.zzbp = zzyVar;
        this.zzbq = zzuVar;
    }

    protected static Map<String, String> zza(Header[] headerArr) {
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (int i = 0; i < headerArr.length; i++) {
            treeMap.put(headerArr[i].getName(), headerArr[i].getValue());
        }
        return treeMap;
    }

    private void zza(long j, zzk<?> zzkVar, byte[] bArr, StatusLine statusLine) {
        if (DEBUG || j > zzbn) {
            Object[] objArr = new Object[5];
            objArr[0] = zzkVar;
            objArr[1] = Long.valueOf(j);
            objArr[2] = bArr != null ? Integer.valueOf(bArr.length) : "null";
            objArr[3] = Integer.valueOf(statusLine.getStatusCode());
            objArr[4] = Integer.valueOf(zzkVar.zzs().zzd());
            zzs.zzb("HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]", objArr);
        }
    }

    private static void zza(String str, zzk<?> zzkVar, zzr zzrVar) throws zzr {
        zzo zzs = zzkVar.zzs();
        int zzr = zzkVar.zzr();
        try {
            zzs.zza(zzrVar);
            zzkVar.zzc(String.format("%s-retry [timeout=%s]", str, Integer.valueOf(zzr)));
        } catch (zzr e) {
            zzkVar.zzc(String.format("%s-timeout-giveup [timeout=%s]", str, Integer.valueOf(zzr)));
            throw e;
        }
    }

    private void zza(Map<String, String> map, zzb.zza zzaVar) {
        if (zzaVar == null) {
            return;
        }
        if (zzaVar.zza != null) {
            map.put(HttpRequest.HEADER_IF_NONE_MATCH, zzaVar.zza);
        }
        if (zzaVar.zzc <= 0) {
            return;
        }
        map.put("If-Modified-Since", DateUtils.formatDate(new Date(zzaVar.zzc)));
    }

    private byte[] zza(HttpEntity httpEntity) throws IOException, zzp {
        zzaa zzaaVar = new zzaa(this.zzbq, (int) httpEntity.getContentLength());
        try {
            InputStream content = httpEntity.getContent();
            if (content == null) {
                throw new zzp();
            }
            byte[] zzb = this.zzbq.zzb(1024);
            while (true) {
                int read = content.read(zzb);
                if (read == -1) {
                    break;
                }
                zzaaVar.write(zzb, 0, read);
            }
            byte[] byteArray = zzaaVar.toByteArray();
            try {
                httpEntity.consumeContent();
            } catch (IOException e) {
                zzs.zza("Error occured when calling consumingContent", new Object[0]);
            }
            this.zzbq.zza(zzb);
            zzaaVar.close();
            return byteArray;
        } catch (Throwable th) {
            try {
                httpEntity.consumeContent();
            } catch (IOException e2) {
                zzs.zza("Error occured when calling consumingContent", new Object[0]);
            }
            this.zzbq.zza(null);
            zzaaVar.close();
            throw th;
        }
    }

    @Override // com.google.android.gms.internal.zzf
    public zzi zza(zzk<?> zzkVar) throws zzr {
        byte[] bArr;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            HttpResponse httpResponse = null;
            Map<String, String> emptyMap = Collections.emptyMap();
            try {
                try {
                    HashMap hashMap = new HashMap();
                    zza(hashMap, zzkVar.zzh());
                    HttpResponse zza = this.zzbp.zza(zzkVar, hashMap);
                    try {
                        StatusLine statusLine = zza.getStatusLine();
                        int statusCode = statusLine.getStatusCode();
                        emptyMap = zza(zza.getAllHeaders());
                        if (statusCode == 304) {
                            zzb.zza zzh = zzkVar.zzh();
                            if (zzh == null) {
                                return new zzi(304, null, emptyMap, true, SystemClock.elapsedRealtime() - elapsedRealtime);
                            }
                            zzh.zzf.putAll(emptyMap);
                            return new zzi(304, zzh.data, zzh.zzf, true, SystemClock.elapsedRealtime() - elapsedRealtime);
                        }
                        byte[] zza2 = zza.getEntity() != null ? zza(zza.getEntity()) : new byte[0];
                        try {
                            zza(SystemClock.elapsedRealtime() - elapsedRealtime, zzkVar, zza2, statusLine);
                            if (statusCode >= 200 && statusCode <= 299) {
                                return new zzi(statusCode, zza2, emptyMap, false, SystemClock.elapsedRealtime() - elapsedRealtime);
                            }
                            throw new IOException();
                        } catch (IOException e) {
                            e = e;
                            bArr = zza2;
                            httpResponse = zza;
                            if (httpResponse == null) {
                                throw new zzj(e);
                            }
                            int statusCode2 = httpResponse.getStatusLine().getStatusCode();
                            zzs.zzc("Unexpected response code %d for %s", Integer.valueOf(statusCode2), zzkVar.getUrl());
                            if (bArr == null) {
                                throw new zzh((zzi) null);
                            }
                            zzi zziVar = new zzi(statusCode2, bArr, emptyMap, false, SystemClock.elapsedRealtime() - elapsedRealtime);
                            if (statusCode2 != 401 && statusCode2 != 403) {
                                throw new zzp(zziVar);
                            }
                            zza(AuthorBox.TYPE, zzkVar, new zza(zziVar));
                        }
                    } catch (IOException e2) {
                        e = e2;
                        bArr = null;
                        httpResponse = zza;
                    }
                } catch (IOException e3) {
                    e = e3;
                    bArr = null;
                }
            } catch (MalformedURLException e4) {
                String valueOf = String.valueOf(zzkVar.getUrl());
                throw new RuntimeException(valueOf.length() != 0 ? "Bad URL ".concat(valueOf) : new String("Bad URL "), e4);
            } catch (SocketTimeoutException e5) {
                zza("socket", zzkVar, new zzq());
            } catch (ConnectTimeoutException e6) {
                zza("connection", zzkVar, new zzq());
            }
        }
    }
}
