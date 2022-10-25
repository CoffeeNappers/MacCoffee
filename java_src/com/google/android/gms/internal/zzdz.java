package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzdz {
    boolean zzblg;
    private String zzblz;
    private zzdx zzbma;
    @Nullable
    private zzdz zzbmb;
    private final List<zzdx> zzblx = new LinkedList();
    private final Map<String, String> zzbly = new LinkedHashMap();
    private final Object zzako = new Object();

    public zzdz(boolean z, String str, String str2) {
        this.zzblg = z;
        this.zzbly.put(NativeProtocol.WEB_DIALOG_ACTION, str);
        this.zzbly.put("ad_format", str2);
    }

    public boolean zza(zzdx zzdxVar, long j, String... strArr) {
        synchronized (this.zzako) {
            for (String str : strArr) {
                this.zzblx.add(new zzdx(j, str, zzdxVar));
            }
        }
        return true;
    }

    public boolean zza(@Nullable zzdx zzdxVar, String... strArr) {
        if (!this.zzblg || zzdxVar == null) {
            return false;
        }
        return zza(zzdxVar, com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime(), strArr);
    }

    public void zzaz(String str) {
        if (!this.zzblg) {
            return;
        }
        synchronized (this.zzako) {
            this.zzblz = str;
        }
    }

    @Nullable
    public zzdx zzc(long j) {
        if (!this.zzblg) {
            return null;
        }
        return new zzdx(j, null, null);
    }

    public void zzc(@Nullable zzdz zzdzVar) {
        synchronized (this.zzako) {
            this.zzbmb = zzdzVar;
        }
    }

    public void zzg(String str, String str2) {
        zzdt zzuu;
        if (!this.zzblg || TextUtils.isEmpty(str2) || (zzuu = com.google.android.gms.ads.internal.zzu.zzgq().zzuu()) == null) {
            return;
        }
        synchronized (this.zzako) {
            zzuu.zzax(str).zza(this.zzbly, str, str2);
        }
    }

    public zzdx zzlz() {
        return zzc(com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime());
    }

    public void zzma() {
        synchronized (this.zzako) {
            this.zzbma = zzlz();
        }
    }

    public String zzmb() {
        String sb;
        StringBuilder sb2 = new StringBuilder();
        synchronized (this.zzako) {
            for (zzdx zzdxVar : this.zzblx) {
                long time = zzdxVar.getTime();
                String zzlw = zzdxVar.zzlw();
                zzdx zzlx = zzdxVar.zzlx();
                if (zzlx != null && time > 0) {
                    sb2.append(zzlw).append('.').append(time - zzlx.getTime()).append(',');
                }
            }
            this.zzblx.clear();
            if (!TextUtils.isEmpty(this.zzblz)) {
                sb2.append(this.zzblz);
            } else if (sb2.length() > 0) {
                sb2.setLength(sb2.length() - 1);
            }
            sb = sb2.toString();
        }
        return sb;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<String, String> zzmc() {
        Map<String, String> zza;
        synchronized (this.zzako) {
            zzdt zzuu = com.google.android.gms.ads.internal.zzu.zzgq().zzuu();
            zza = (zzuu == null || this.zzbmb == null) ? this.zzbly : zzuu.zza(this.zzbly, this.zzbmb.zzmc());
        }
        return zza;
    }

    public zzdx zzmd() {
        zzdx zzdxVar;
        synchronized (this.zzako) {
            zzdxVar = this.zzbma;
        }
        return zzdxVar;
    }
}
