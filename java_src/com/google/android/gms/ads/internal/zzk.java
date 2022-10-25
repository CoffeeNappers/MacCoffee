package com.google.android.gms.ads.internal;

import android.content.Context;
import android.support.v4.util.SimpleArrayMap;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.client.zzs;
import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzeq;
import com.google.android.gms.internal.zzer;
import com.google.android.gms.internal.zzes;
import com.google.android.gms.internal.zzet;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzk extends zzs.zza {
    private final Context mContext;
    private final zzd zzamb;
    private final zzgz zzamf;
    private com.google.android.gms.ads.internal.client.zzq zzanl;
    private NativeAdOptionsParcel zzanq;
    private zzy zzans;
    private final String zzant;
    private final VersionInfoParcel zzanu;
    private zzeq zzany;
    private zzer zzanz;
    private SimpleArrayMap<String, zzet> zzaob = new SimpleArrayMap<>();
    private SimpleArrayMap<String, zzes> zzaoa = new SimpleArrayMap<>();

    public zzk(Context context, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, zzd zzdVar) {
        this.mContext = context;
        this.zzant = str;
        this.zzamf = zzgzVar;
        this.zzanu = versionInfoParcel;
        this.zzamb = zzdVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(NativeAdOptionsParcel nativeAdOptionsParcel) {
        this.zzanq = nativeAdOptionsParcel;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(zzeq zzeqVar) {
        this.zzany = zzeqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(zzer zzerVar) {
        this.zzanz = zzerVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(String str, zzet zzetVar, zzes zzesVar) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Custom template ID for native custom template ad is empty. Please provide a valid template id.");
        }
        this.zzaob.put(str, zzetVar);
        this.zzaoa.put(str, zzesVar);
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zzb(com.google.android.gms.ads.internal.client.zzq zzqVar) {
        this.zzanl = zzqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zzb(zzy zzyVar) {
        this.zzans = zzyVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public com.google.android.gms.ads.internal.client.zzr zzfl() {
        return new zzj(this.mContext, this.zzant, this.zzamf, this.zzanu, this.zzanl, this.zzany, this.zzanz, this.zzaob, this.zzaoa, this.zzanq, this.zzans, this.zzamb);
    }
}
