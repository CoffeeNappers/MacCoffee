package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import java.io.File;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
@zzji
/* loaded from: classes.dex */
public class zzdt {
    final Context mContext;
    final String zzasx;
    String zzblh;
    BlockingQueue<zzdz> zzblj;
    ExecutorService zzblk;
    LinkedHashMap<String, String> zzbll = new LinkedHashMap<>();
    Map<String, zzdw> zzblm = new HashMap();
    private AtomicBoolean zzbln = new AtomicBoolean(false);
    private File zzblo;

    public zzdt(Context context, String str, String str2, Map<String, String> map) {
        File externalStorageDirectory;
        this.mContext = context;
        this.zzasx = str;
        this.zzblh = str2;
        this.zzbln.set(zzdr.zzbes.get().booleanValue());
        if (this.zzbln.get() && (externalStorageDirectory = Environment.getExternalStorageDirectory()) != null) {
            this.zzblo = new File(externalStorageDirectory, "sdk_csi_data.txt");
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            this.zzbll.put(entry.getKey(), entry.getValue());
        }
        this.zzblj = new ArrayBlockingQueue(30);
        this.zzblk = Executors.newSingleThreadExecutor();
        this.zzblk.execute(new Runnable() { // from class: com.google.android.gms.internal.zzdt.1
            @Override // java.lang.Runnable
            public void run() {
                zzdt.this.zzlv();
            }
        });
        this.zzblm.put(NativeProtocol.WEB_DIALOG_ACTION, zzdw.zzblr);
        this.zzblm.put("ad_format", zzdw.zzblr);
        this.zzblm.put("e", zzdw.zzbls);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:36:0x003d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zzc(@android.support.annotation.Nullable java.io.File r4, java.lang.String r5) {
        /*
            r3 = this;
            if (r4 == 0) goto L49
            r2 = 0
            java.io.FileOutputStream r1 = new java.io.FileOutputStream     // Catch: java.io.IOException -> L23 java.lang.Throwable -> L39
            r0 = 1
            r1.<init>(r4, r0)     // Catch: java.io.IOException -> L23 java.lang.Throwable -> L39
            byte[] r0 = r5.getBytes()     // Catch: java.lang.Throwable -> L50 java.io.IOException -> L52
            r1.write(r0)     // Catch: java.lang.Throwable -> L50 java.io.IOException -> L52
            r0 = 10
            r1.write(r0)     // Catch: java.lang.Throwable -> L50 java.io.IOException -> L52
            if (r1 == 0) goto L1a
            r1.close()     // Catch: java.io.IOException -> L1b
        L1a:
            return
        L1b:
            r0 = move-exception
            java.lang.String r1 = "CsiReporter: Cannot close file: sdk_csi_data.txt."
            com.google.android.gms.internal.zzkx.zzc(r1, r0)
            goto L1a
        L23:
            r0 = move-exception
            r1 = r2
        L25:
            java.lang.String r2 = "CsiReporter: Cannot write to file: sdk_csi_data.txt."
            com.google.android.gms.internal.zzkx.zzc(r2, r0)     // Catch: java.lang.Throwable -> L50
            if (r1 == 0) goto L1a
            r1.close()     // Catch: java.io.IOException -> L31
            goto L1a
        L31:
            r0 = move-exception
            java.lang.String r1 = "CsiReporter: Cannot close file: sdk_csi_data.txt."
            com.google.android.gms.internal.zzkx.zzc(r1, r0)
            goto L1a
        L39:
            r0 = move-exception
            r1 = r2
        L3b:
            if (r1 == 0) goto L40
            r1.close()     // Catch: java.io.IOException -> L41
        L40:
            throw r0
        L41:
            r1 = move-exception
            java.lang.String r2 = "CsiReporter: Cannot close file: sdk_csi_data.txt."
            com.google.android.gms.internal.zzkx.zzc(r2, r1)
            goto L40
        L49:
            java.lang.String r0 = "CsiReporter: File doesn't exists. Cannot write CSI data to file."
            com.google.android.gms.internal.zzkx.zzdi(r0)
            goto L1a
        L50:
            r0 = move-exception
            goto L3b
        L52:
            r0 = move-exception
            goto L25
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzdt.zzc(java.io.File, java.lang.String):void");
    }

    private void zzc(Map<String, String> map, String str) {
        String zza = zza(this.zzblh, map, str);
        if (this.zzbln.get()) {
            zzc(this.zzblo, zza);
        } else {
            com.google.android.gms.ads.internal.zzu.zzgm().zzc(this.mContext, this.zzasx, zza);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzlv() {
        while (true) {
            try {
                zzdz take = this.zzblj.take();
                String zzmb = take.zzmb();
                if (!TextUtils.isEmpty(zzmb)) {
                    zzc(zza(this.zzbll, take.zzmc()), zzmb);
                }
            } catch (InterruptedException e) {
                zzkx.zzc("CsiReporter:reporter interrupted", e);
                return;
            }
        }
    }

    String zza(String str, Map<String, String> map, @NonNull String str2) {
        Uri.Builder buildUpon = Uri.parse(str).buildUpon();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            buildUpon.appendQueryParameter(entry.getKey(), entry.getValue());
        }
        StringBuilder sb = new StringBuilder(buildUpon.build().toString());
        sb.append("&").append("it").append("=").append(str2);
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<String, String> zza(Map<String, String> map, @Nullable Map<String, String> map2) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        if (map2 == null) {
            return linkedHashMap;
        }
        for (Map.Entry<String, String> entry : map2.entrySet()) {
            String key = entry.getKey();
            String str = (String) linkedHashMap.get(key);
            linkedHashMap.put(key, zzax(key).zzf(str, entry.getValue()));
        }
        return linkedHashMap;
    }

    public boolean zza(zzdz zzdzVar) {
        return this.zzblj.offer(zzdzVar);
    }

    public zzdw zzax(String str) {
        zzdw zzdwVar = this.zzblm.get(str);
        return zzdwVar != null ? zzdwVar : zzdw.zzblq;
    }

    public void zzc(@Nullable List<String> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        this.zzbll.put("e", TextUtils.join(",", list));
    }
}
