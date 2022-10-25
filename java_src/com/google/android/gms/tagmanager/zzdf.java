package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Locale;
/* loaded from: classes2.dex */
class zzdf implements zzad {
    private final zzb aHE;
    private final zza aHF;
    private final Context mContext;
    private final String zzbre;

    /* loaded from: classes2.dex */
    public interface zza {
        void zza(zzas zzasVar);

        void zzb(zzas zzasVar);

        void zzc(zzas zzasVar);
    }

    /* loaded from: classes2.dex */
    interface zzb {
        HttpURLConnection zzd(URL url) throws IOException;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzdf(Context context, zza zzaVar) {
        this(new zzb() { // from class: com.google.android.gms.tagmanager.zzdf.1
            @Override // com.google.android.gms.tagmanager.zzdf.zzb
            public HttpURLConnection zzd(URL url) throws IOException {
                return (HttpURLConnection) url.openConnection();
            }
        }, context, zzaVar);
    }

    zzdf(zzb zzbVar, Context context, zza zzaVar) {
        this.aHE = zzbVar;
        this.mContext = context.getApplicationContext();
        this.aHF = zzaVar;
        this.zzbre = zza("GoogleTagManager", "4.00", Build.VERSION.RELEASE, zzc(Locale.getDefault()), Build.MODEL, Build.ID);
    }

    static String zzc(Locale locale) {
        if (locale == null || locale.getLanguage() == null || locale.getLanguage().length() == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(locale.getLanguage().toLowerCase());
        if (locale.getCountry() != null && locale.getCountry().length() != 0) {
            sb.append("-").append(locale.getCountry().toLowerCase());
        }
        return sb.toString();
    }

    String zza(String str, String str2, String str3, String str4, String str5, String str6) {
        return String.format("%s/%s (Linux; U; Android %s; %s; %s Build/%s)", str, str2, str3, str4, str5, str6);
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x0084 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // com.google.android.gms.tagmanager.zzad
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void zzal(java.util.List<com.google.android.gms.tagmanager.zzas> r12) {
        /*
            r11 = this;
            r4 = 0
            int r0 = r12.size()
            r1 = 40
            int r6 = java.lang.Math.min(r0, r1)
            r1 = 1
            r5 = r4
        Ld:
            if (r5 >= r6) goto Lbf
            java.lang.Object r0 = r12.get(r5)
            com.google.android.gms.tagmanager.zzas r0 = (com.google.android.gms.tagmanager.zzas) r0
            java.net.URL r2 = r11.zzd(r0)
            if (r2 != 0) goto L2c
            java.lang.String r2 = "No destination: discarding hit."
            com.google.android.gms.tagmanager.zzbo.zzdi(r2)
            com.google.android.gms.tagmanager.zzdf$zza r2 = r11.aHF
            r2.zzb(r0)
            r0 = r1
        L27:
            int r1 = r5 + 1
            r5 = r1
            r1 = r0
            goto Ld
        L2c:
            r3 = 0
            com.google.android.gms.tagmanager.zzdf$zzb r7 = r11.aHE     // Catch: java.io.IOException -> Lc0
            java.net.HttpURLConnection r7 = r7.zzd(r2)     // Catch: java.io.IOException -> Lc0
            if (r1 == 0) goto L3b
            android.content.Context r2 = r11.mContext     // Catch: java.lang.Throwable -> Lc4
            com.google.android.gms.tagmanager.zzbt.zzeg(r2)     // Catch: java.lang.Throwable -> Lc4
            r1 = r4
        L3b:
            java.lang.String r2 = "User-Agent"
            java.lang.String r8 = r11.zzbre     // Catch: java.lang.Throwable -> Lc4
            r7.setRequestProperty(r2, r8)     // Catch: java.lang.Throwable -> Lc4
            int r2 = r7.getResponseCode()     // Catch: java.lang.Throwable -> Lc4
            java.io.InputStream r3 = r7.getInputStream()     // Catch: java.lang.Throwable -> Lc4
            r8 = 200(0xc8, float:2.8E-43)
            if (r2 == r8) goto L77
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L7d
            r9 = 25
            r8.<init>(r9)     // Catch: java.lang.Throwable -> L7d
            java.lang.String r9 = "Bad response: "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Throwable -> L7d
            java.lang.StringBuilder r2 = r8.append(r2)     // Catch: java.lang.Throwable -> L7d
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> L7d
            com.google.android.gms.tagmanager.zzbo.zzdi(r2)     // Catch: java.lang.Throwable -> L7d
            com.google.android.gms.tagmanager.zzdf$zza r2 = r11.aHF     // Catch: java.lang.Throwable -> L7d
            r2.zzc(r0)     // Catch: java.lang.Throwable -> L7d
        L6d:
            if (r3 == 0) goto L72
            r3.close()     // Catch: java.io.IOException -> Lc0
        L72:
            r7.disconnect()     // Catch: java.io.IOException -> Lc0
            r0 = r1
            goto L27
        L77:
            com.google.android.gms.tagmanager.zzdf$zza r2 = r11.aHF     // Catch: java.lang.Throwable -> L7d
            r2.zza(r0)     // Catch: java.lang.Throwable -> L7d
            goto L6d
        L7d:
            r2 = move-exception
            r10 = r2
            r2 = r3
            r3 = r1
            r1 = r10
        L82:
            if (r2 == 0) goto L87
            r2.close()     // Catch: java.io.IOException -> L8b
        L87:
            r7.disconnect()     // Catch: java.io.IOException -> L8b
            throw r1     // Catch: java.io.IOException -> L8b
        L8b:
            r1 = move-exception
            r2 = r3
            r3 = r1
        L8e:
            java.lang.String r7 = "Exception sending hit: "
            java.lang.Class r1 = r3.getClass()
            java.lang.String r1 = r1.getSimpleName()
            java.lang.String r1 = java.lang.String.valueOf(r1)
            int r8 = r1.length()
            if (r8 == 0) goto Lb9
            java.lang.String r1 = r7.concat(r1)
        La7:
            com.google.android.gms.tagmanager.zzbo.zzdi(r1)
            java.lang.String r1 = r3.getMessage()
            com.google.android.gms.tagmanager.zzbo.zzdi(r1)
            com.google.android.gms.tagmanager.zzdf$zza r1 = r11.aHF
            r1.zzc(r0)
            r0 = r2
            goto L27
        Lb9:
            java.lang.String r1 = new java.lang.String
            r1.<init>(r7)
            goto La7
        Lbf:
            return
        Lc0:
            r2 = move-exception
            r3 = r2
            r2 = r1
            goto L8e
        Lc4:
            r2 = move-exception
            r10 = r2
            r2 = r3
            r3 = r1
            r1 = r10
            goto L82
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzdf.zzal(java.util.List):void");
    }

    @Override // com.google.android.gms.tagmanager.zzad
    public boolean zzcez() {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            zzbo.v("...no network connectivity");
            return false;
        }
        return true;
    }

    URL zzd(zzas zzasVar) {
        try {
            return new URL(zzasVar.zzcfk());
        } catch (MalformedURLException e) {
            zzbo.e("Error trying to parse the GTM url.");
            return null;
        }
    }
}
