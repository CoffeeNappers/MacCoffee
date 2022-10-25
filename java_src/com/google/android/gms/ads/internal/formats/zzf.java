package com.google.android.gms.ads.internal.formats;

import android.support.v4.util.SimpleArrayMap;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzeo;
import com.google.android.gms.internal.zzji;
import java.util.Arrays;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzf extends zzeo.zza implements zzi.zza {
    private final Object zzako = new Object();
    private final zza zzbng;
    private zzi zzbnj;
    private final String zzbnm;
    private final SimpleArrayMap<String, zzc> zzbnn;
    private final SimpleArrayMap<String, String> zzbno;

    public zzf(String str, SimpleArrayMap<String, zzc> simpleArrayMap, SimpleArrayMap<String, String> simpleArrayMap2, zza zzaVar) {
        this.zzbnm = str;
        this.zzbnn = simpleArrayMap;
        this.zzbno = simpleArrayMap2;
        this.zzbng = zzaVar;
    }

    @Override // com.google.android.gms.internal.zzeo
    public List<String> getAvailableAssetNames() {
        int i = 0;
        String[] strArr = new String[this.zzbnn.size() + this.zzbno.size()];
        int i2 = 0;
        for (int i3 = 0; i3 < this.zzbnn.size(); i3++) {
            strArr[i2] = this.zzbnn.keyAt(i3);
            i2++;
        }
        while (i < this.zzbno.size()) {
            strArr[i2] = this.zzbno.keyAt(i);
            i++;
            i2++;
        }
        return Arrays.asList(strArr);
    }

    @Override // com.google.android.gms.internal.zzeo, com.google.android.gms.ads.internal.formats.zzi.zza
    public String getCustomTemplateId() {
        return this.zzbnm;
    }

    @Override // com.google.android.gms.internal.zzeo
    public void performClick(String str) {
        synchronized (this.zzako) {
            if (this.zzbnj == null) {
                com.google.android.gms.ads.internal.util.client.zzb.e("Attempt to call performClick before ad initialized.");
            } else {
                this.zzbnj.zza(null, str, null, null, null);
            }
        }
    }

    @Override // com.google.android.gms.internal.zzeo
    public void recordImpression() {
        synchronized (this.zzako) {
            if (this.zzbnj == null) {
                com.google.android.gms.ads.internal.util.client.zzb.e("Attempt to perform recordImpression before ad initialized.");
            } else {
                this.zzbnj.zzb(null, null);
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public void zzb(zzi zziVar) {
        synchronized (this.zzako) {
            this.zzbnj = zziVar;
        }
    }

    @Override // com.google.android.gms.internal.zzeo
    public String zzba(String str) {
        return this.zzbno.get(str);
    }

    @Override // com.google.android.gms.internal.zzeo
    public zzeg zzbb(String str) {
        return this.zzbnn.get(str);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public String zzmq() {
        return "3";
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public zza zzmr() {
        return this.zzbng;
    }
}
