package com.google.android.gms.analytics.internal;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.GZIPOutputStream;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class zzah extends zzd {
    private static final byte[] fB = "\n".getBytes();
    private final zzal fA;
    private final String zzbre;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class zza {
        private int fC;
        private ByteArrayOutputStream fD = new ByteArrayOutputStream();

        public zza() {
        }

        public byte[] getPayload() {
            return this.fD.toByteArray();
        }

        public int zzagn() {
            return this.fC;
        }

        public boolean zzj(zzab zzabVar) {
            com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
            if (this.fC + 1 > zzah.this.zzacb().zzaeq()) {
                return false;
            }
            String zza = zzah.this.zza(zzabVar, false);
            if (zza == null) {
                zzah.this.zzaca().zza(zzabVar, "Error formatting hit");
                return true;
            }
            byte[] bytes = zza.getBytes();
            int length = bytes.length;
            if (length > zzah.this.zzacb().zzaei()) {
                zzah.this.zzaca().zza(zzabVar, "Hit size exceeds the maximum size limit");
                return true;
            }
            if (this.fD.size() > 0) {
                length++;
            }
            if (length + this.fD.size() > zzah.this.zzacb().zzaek()) {
                return false;
            }
            try {
                if (this.fD.size() > 0) {
                    this.fD.write(zzah.fB);
                }
                this.fD.write(bytes);
                this.fC++;
                return true;
            } catch (IOException e) {
                zzah.this.zze("Failed to write payload when batching hits", e);
                return true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzah(zzf zzfVar) {
        super(zzfVar);
        this.zzbre = zza("GoogleAnalytics", zze.VERSION, Build.VERSION.RELEASE, zzao.zza(Locale.getDefault()), Build.MODEL, Build.ID);
        this.fA = new zzal(zzfVar.zzabz());
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0099 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int zza(java.net.URL r6, byte[] r7) {
        /*
            r5 = this;
            r1 = 0
            com.google.android.gms.common.internal.zzaa.zzy(r6)
            com.google.android.gms.common.internal.zzaa.zzy(r7)
            java.lang.String r0 = "POST bytes, url"
            int r2 = r7.length
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)
            r5.zzb(r0, r2, r6)
            boolean r0 = r5.zzvo()
            if (r0 == 0) goto L23
            java.lang.String r0 = "Post payload\n"
            java.lang.String r2 = new java.lang.String
            r2.<init>(r7)
            r5.zza(r0, r2)
        L23:
            android.content.Context r0 = r5.getContext()     // Catch: java.io.IOException -> L76 java.lang.Throwable -> L95
            java.lang.String r0 = r0.getPackageName()     // Catch: java.io.IOException -> L76 java.lang.Throwable -> L95
            r5.zzfe(r0)     // Catch: java.io.IOException -> L76 java.lang.Throwable -> L95
            java.net.HttpURLConnection r2 = r5.zzc(r6)     // Catch: java.io.IOException -> L76 java.lang.Throwable -> L95
            r0 = 1
            r2.setDoOutput(r0)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            int r0 = r7.length     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r2.setFixedLengthStreamingMode(r0)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r2.connect()     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            java.io.OutputStream r1 = r2.getOutputStream()     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r1.write(r7)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r5.zzb(r2)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            int r0 = r2.getResponseCode()     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r3 = 200(0xc8, float:2.8E-43)
            if (r0 != r3) goto L56
            com.google.android.gms.analytics.internal.zzb r3 = r5.zzzg()     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r3.zzabw()     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
        L56:
            java.lang.String r3 = "POST status"
            java.lang.Integer r4 = java.lang.Integer.valueOf(r0)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            r5.zzb(r3, r4)     // Catch: java.lang.Throwable -> Lad java.io.IOException -> Laf
            if (r1 == 0) goto L65
            r1.close()     // Catch: java.io.IOException -> L6e
        L65:
            if (r2 == 0) goto L6a
            r2.disconnect()
        L6a:
            r5.zztt()
        L6d:
            return r0
        L6e:
            r1 = move-exception
            java.lang.String r3 = "Error closing http post connection output stream"
            r5.zze(r3, r1)
            goto L65
        L76:
            r0 = move-exception
            r2 = r1
        L78:
            java.lang.String r3 = "Network POST connection error"
            r5.zzd(r3, r0)     // Catch: java.lang.Throwable -> Lad
            if (r1 == 0) goto L83
            r1.close()     // Catch: java.io.IOException -> L8d
        L83:
            if (r2 == 0) goto L88
            r2.disconnect()
        L88:
            r5.zztt()
            r0 = 0
            goto L6d
        L8d:
            r0 = move-exception
            java.lang.String r1 = "Error closing http post connection output stream"
            r5.zze(r1, r0)
            goto L83
        L95:
            r0 = move-exception
            r2 = r1
        L97:
            if (r1 == 0) goto L9c
            r1.close()     // Catch: java.io.IOException -> La5
        L9c:
            if (r2 == 0) goto La1
            r2.disconnect()
        La1:
            r5.zztt()
            throw r0
        La5:
            r1 = move-exception
            java.lang.String r3 = "Error closing http post connection output stream"
            r5.zze(r3, r1)
            goto L9c
        Lad:
            r0 = move-exception
            goto L97
        Laf:
            r0 = move-exception
            goto L78
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzah.zza(java.net.URL, byte[]):int");
    }

    private static String zza(String str, String str2, String str3, String str4, String str5, String str6) {
        return String.format("%s/%s (Linux; U; Android %s; %s; %s Build/%s)", str, str2, str3, str4, str5, str6);
    }

    private void zza(StringBuilder sb, String str, String str2) throws UnsupportedEncodingException {
        if (sb.length() != 0) {
            sb.append('&');
        }
        sb.append(URLEncoder.encode(str, "UTF-8"));
        sb.append('=');
        sb.append(URLEncoder.encode(str2, "UTF-8"));
    }

    private URL zzagl() {
        String valueOf = String.valueOf(zzacb().zzaes());
        String valueOf2 = String.valueOf(zzacb().zzaev());
        try {
            return new URL(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        } catch (MalformedURLException e) {
            zze("Error trying to parse the hardcoded host url", e);
            return null;
        }
    }

    private int zzb(URL url) {
        com.google.android.gms.common.internal.zzaa.zzy(url);
        zzb("GET request", url);
        HttpURLConnection httpURLConnection = null;
        try {
            try {
                httpURLConnection = zzc(url);
                httpURLConnection.connect();
                zzb(httpURLConnection);
                int responseCode = httpURLConnection.getResponseCode();
                if (responseCode == 200) {
                    zzzg().zzabw();
                }
                zzb("GET status", Integer.valueOf(responseCode));
                if (httpURLConnection == null) {
                    return responseCode;
                }
                httpURLConnection.disconnect();
                return responseCode;
            } catch (IOException e) {
                zzd("Network GET connection error", e);
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                return 0;
            }
        } catch (Throwable th) {
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00d3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int zzb(java.net.URL r11, byte[] r12) {
        /*
            Method dump skipped, instructions count: 246
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzah.zzb(java.net.URL, byte[]):int");
    }

    private URL zzb(zzab zzabVar, String str) {
        String sb;
        if (zzabVar.zzagc()) {
            String valueOf = String.valueOf(zzacb().zzaes());
            String valueOf2 = String.valueOf(zzacb().zzaeu());
            sb = new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length() + String.valueOf(str).length()).append(valueOf).append(valueOf2).append("?").append(str).toString();
        } else {
            String valueOf3 = String.valueOf(zzacb().zzaet());
            String valueOf4 = String.valueOf(zzacb().zzaeu());
            sb = new StringBuilder(String.valueOf(valueOf3).length() + 1 + String.valueOf(valueOf4).length() + String.valueOf(str).length()).append(valueOf3).append(valueOf4).append("?").append(str).toString();
        }
        try {
            return new URL(sb);
        } catch (MalformedURLException e) {
            zze("Error trying to parse the hardcoded host url", e);
            return null;
        }
    }

    private void zzb(HttpURLConnection httpURLConnection) throws IOException {
        InputStream inputStream = null;
        try {
            inputStream = httpURLConnection.getInputStream();
            do {
            } while (inputStream.read(new byte[1024]) > 0);
            if (inputStream == null) {
                return;
            }
            try {
                inputStream.close();
            } catch (IOException e) {
                zze("Error closing http connection input stream", e);
            }
        } catch (Throwable th) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e2) {
                    zze("Error closing http connection input stream", e2);
                }
            }
            throw th;
        }
    }

    private boolean zzg(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        String zza2 = zza(zzabVar, !zzabVar.zzagc());
        if (zza2 == null) {
            zzaca().zza(zzabVar, "Error formatting hit for upload");
            return true;
        } else if (zza2.length() <= zzacb().zzaeh()) {
            URL zzb = zzb(zzabVar, zza2);
            if (zzb != null) {
                return zzb(zzb) == 200;
            }
            zzew("Failed to build collect GET endpoint url");
            return false;
        } else {
            String zza3 = zza(zzabVar, false);
            if (zza3 == null) {
                zzaca().zza(zzabVar, "Error formatting hit for POST upload");
                return true;
            }
            byte[] bytes = zza3.getBytes();
            if (bytes.length > zzacb().zzaej()) {
                zzaca().zza(zzabVar, "Hit payload exceeds size limit");
                return true;
            }
            URL zzh = zzh(zzabVar);
            if (zzh != null) {
                return zza(zzh, bytes) == 200;
            }
            zzew("Failed to build collect POST endpoint url");
            return false;
        }
    }

    private URL zzh(zzab zzabVar) {
        String concat;
        if (zzabVar.zzagc()) {
            String valueOf = String.valueOf(zzacb().zzaes());
            String valueOf2 = String.valueOf(zzacb().zzaeu());
            concat = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        } else {
            String valueOf3 = String.valueOf(zzacb().zzaet());
            String valueOf4 = String.valueOf(zzacb().zzaeu());
            concat = valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3);
        }
        try {
            return new URL(concat);
        } catch (MalformedURLException e) {
            zze("Error trying to parse the hardcoded host url", e);
            return null;
        }
    }

    private String zzi(zzab zzabVar) {
        return String.valueOf(zzabVar.zzafz());
    }

    private static byte[] zzk(byte[] bArr) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
        gZIPOutputStream.write(bArr);
        gZIPOutputStream.close();
        byteArrayOutputStream.close();
        return byteArrayOutputStream.toByteArray();
    }

    String zza(zzab zzabVar, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        StringBuilder sb = new StringBuilder();
        try {
            for (Map.Entry<String, String> entry : zzabVar.zzmc().entrySet()) {
                String key = entry.getKey();
                if (!"ht".equals(key) && !"qt".equals(key) && !"AppUID".equals(key) && !"z".equals(key) && !"_gmsv".equals(key)) {
                    zza(sb, key, entry.getValue());
                }
            }
            zza(sb, "ht", String.valueOf(zzabVar.zzaga()));
            zza(sb, "qt", String.valueOf(zzabz().currentTimeMillis() - zzabVar.zzaga()));
            zzacb();
            if (z) {
                long zzagd = zzabVar.zzagd();
                zza(sb, "z", zzagd != 0 ? String.valueOf(zzagd) : zzi(zzabVar));
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            zze("Failed to encode name or value", e);
            return null;
        }
    }

    List<Long> zza(List<zzab> list, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzbt(!list.isEmpty());
        zza("Uploading batched hits. compression, count", Boolean.valueOf(z), Integer.valueOf(list.size()));
        zza zzaVar = new zza();
        ArrayList arrayList = new ArrayList();
        for (zzab zzabVar : list) {
            if (!zzaVar.zzj(zzabVar)) {
                break;
            }
            arrayList.add(Long.valueOf(zzabVar.zzafz()));
        }
        if (zzaVar.zzagn() == 0) {
            return arrayList;
        }
        URL zzagl = zzagl();
        if (zzagl == null) {
            zzew("Failed to build batching endpoint url");
            return Collections.emptyList();
        }
        int zzb = z ? zzb(zzagl, zzaVar.getPayload()) : zza(zzagl, zzaVar.getPayload());
        if (200 == zzb) {
            zza("Batched upload completed. Hits batched", Integer.valueOf(zzaVar.zzagn()));
            return arrayList;
        }
        zza("Network error uploading hits. status code", Integer.valueOf(zzb));
        if (zzacb().zzaey().contains(Integer.valueOf(zzb))) {
            zzev("Server instructed the client to stop batching");
            this.fA.start();
        }
        return Collections.emptyList();
    }

    public boolean zzagk() {
        NetworkInfo networkInfo;
        zzzx();
        zzacj();
        try {
            networkInfo = ((ConnectivityManager) getContext().getSystemService("connectivity")).getActiveNetworkInfo();
        } catch (SecurityException e) {
            networkInfo = null;
        }
        if (networkInfo == null || !networkInfo.isConnected()) {
            zzes("No network connectivity");
            return false;
        }
        return true;
    }

    HttpURLConnection zzc(URL url) throws IOException {
        URLConnection openConnection = url.openConnection();
        if (!(openConnection instanceof HttpURLConnection)) {
            throw new IOException("Failed to obtain http connection");
        }
        HttpURLConnection httpURLConnection = (HttpURLConnection) openConnection;
        httpURLConnection.setDefaultUseCaches(false);
        httpURLConnection.setConnectTimeout(zzacb().zzafg());
        httpURLConnection.setReadTimeout(zzacb().zzafh());
        httpURLConnection.setInstanceFollowRedirects(false);
        httpURLConnection.setRequestProperty("User-Agent", this.zzbre);
        httpURLConnection.setDoInput(true);
        return httpURLConnection;
    }

    protected void zzfe(String str) {
    }

    public List<Long> zzt(List<zzab> list) {
        boolean z;
        boolean z2 = true;
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(list);
        if (zzacb().zzaey().isEmpty() || !this.fA.zzz(zzacb().zzaer() * 1000)) {
            z2 = false;
            z = false;
        } else {
            z = zzacb().zzaew() != zzm.NONE;
            if (zzacb().zzaex() != zzo.GZIP) {
                z2 = false;
            }
        }
        return z ? zza(list, z2) : zzu(list);
    }

    protected void zztt() {
    }

    List<Long> zzu(List<zzab> list) {
        ArrayList arrayList = new ArrayList(list.size());
        for (zzab zzabVar : list) {
            if (!zzg(zzabVar)) {
                break;
            }
            arrayList.add(Long.valueOf(zzabVar.zzafz()));
            if (arrayList.size() >= zzacb().zzaep()) {
                break;
            }
        }
        return arrayList;
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        zza("Network initialized. User agent", this.zzbre);
    }
}
