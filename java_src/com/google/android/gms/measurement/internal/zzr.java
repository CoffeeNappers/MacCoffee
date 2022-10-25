package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.WorkerThread;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzr extends zzaa {

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    /* loaded from: classes2.dex */
    public interface zza {
        void zza(String str, int i, Throwable th, byte[] bArr, Map<String, List<String>> map);
    }

    @WorkerThread
    /* loaded from: classes2.dex */
    private static class zzb implements Runnable {
        private final zza asO;
        private final byte[] asP;
        private final Map<String, List<String>> asQ;
        private final int zzbtt;
        private final String zzcjc;
        private final Throwable zzcye;

        private zzb(String str, zza zzaVar, int i, Throwable th, byte[] bArr, Map<String, List<String>> map) {
            com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
            this.asO = zzaVar;
            this.zzbtt = i;
            this.zzcye = th;
            this.asP = bArr;
            this.zzcjc = str;
            this.asQ = map;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.asO.zza(this.zzcjc, this.zzbtt, this.zzcye, this.asP, this.asQ);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    /* loaded from: classes2.dex */
    public class zzc implements Runnable {
        private final byte[] asR;
        private final zza asS;
        private final Map<String, String> asT;
        private final URL zzbqj;
        private final String zzcjc;

        public zzc(String str, URL url, byte[] bArr, Map<String, String> map, zza zzaVar) {
            com.google.android.gms.common.internal.zzaa.zzib(str);
            com.google.android.gms.common.internal.zzaa.zzy(url);
            com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
            this.zzbqj = url;
            this.asR = bArr;
            this.asS = zzaVar;
            this.zzcjc = str;
            this.asT = map;
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x004c  */
        /* JADX WARN: Removed duplicated region for block: B:35:0x00f7  */
        /* JADX WARN: Removed duplicated region for block: B:52:0x0047 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:54:0x00f2 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            /*
                Method dump skipped, instructions count: 327
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzr.zzc.run():void");
        }
    }

    public zzr(zzx zzxVar) {
        super(zzxVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public byte[] zzc(HttpURLConnection httpURLConnection) throws IOException {
        InputStream inputStream = null;
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            inputStream = httpURLConnection.getInputStream();
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read <= 0) {
                    break;
                }
                byteArrayOutputStream.write(bArr, 0, read);
            }
            return byteArrayOutputStream.toByteArray();
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @WorkerThread
    public void zza(String str, URL url, Map<String, String> map, zza zzaVar) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(url);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
        zzbwa().zzn(new zzc(str, url, null, map, zzaVar));
    }

    @WorkerThread
    public void zza(String str, URL url, byte[] bArr, Map<String, String> map, zza zzaVar) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(url);
        com.google.android.gms.common.internal.zzaa.zzy(bArr);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
        zzbwa().zzn(new zzc(str, url, bArr, map, zzaVar));
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    public boolean zzagk() {
        NetworkInfo networkInfo;
        zzacj();
        try {
            networkInfo = ((ConnectivityManager) getContext().getSystemService("connectivity")).getActiveNetworkInfo();
        } catch (SecurityException e) {
            networkInfo = null;
        }
        return networkInfo != null && networkInfo.isConnected();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.measurement.internal.zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    @WorkerThread
    protected HttpURLConnection zzc(URL url) throws IOException {
        URLConnection openConnection = url.openConnection();
        if (!(openConnection instanceof HttpURLConnection)) {
            throw new IOException("Failed to obtain HTTP connection");
        }
        HttpURLConnection httpURLConnection = (HttpURLConnection) openConnection;
        httpURLConnection.setDefaultUseCaches(false);
        zzbwd().zzbuq();
        httpURLConnection.setConnectTimeout(60000);
        zzbwd().zzbur();
        httpURLConnection.setReadTimeout(61000);
        httpURLConnection.setInstanceFollowRedirects(false);
        httpURLConnection.setDoInput(true);
        return httpURLConnection;
    }

    protected void zzfe(String str) {
    }

    protected void zztt() {
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
