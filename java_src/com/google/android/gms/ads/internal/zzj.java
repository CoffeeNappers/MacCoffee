package com.google.android.gms.ads.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v4.util.SimpleArrayMap;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzr;
import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzeq;
import com.google.android.gms.internal.zzer;
import com.google.android.gms.internal.zzes;
import com.google.android.gms.internal.zzet;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzlb;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzj extends zzr.zza {
    private final Context mContext;
    private final zzd zzamb;
    private final zzgz zzamf;
    private final com.google.android.gms.ads.internal.client.zzq zzanl;
    @Nullable
    private final zzeq zzanm;
    @Nullable
    private final zzer zzann;
    private final SimpleArrayMap<String, zzet> zzano;
    private final SimpleArrayMap<String, zzes> zzanp;
    private final NativeAdOptionsParcel zzanq;
    private final zzy zzans;
    private final String zzant;
    private final VersionInfoParcel zzanu;
    @Nullable
    private WeakReference<zzq> zzanv;
    private final Object zzako = new Object();
    private final List<String> zzanr = zzfj();

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzj(Context context, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, com.google.android.gms.ads.internal.client.zzq zzqVar, zzeq zzeqVar, zzer zzerVar, SimpleArrayMap<String, zzet> simpleArrayMap, SimpleArrayMap<String, zzes> simpleArrayMap2, NativeAdOptionsParcel nativeAdOptionsParcel, zzy zzyVar, zzd zzdVar) {
        this.mContext = context;
        this.zzant = str;
        this.zzamf = zzgzVar;
        this.zzanu = versionInfoParcel;
        this.zzanl = zzqVar;
        this.zzann = zzerVar;
        this.zzanm = zzeqVar;
        this.zzano = simpleArrayMap;
        this.zzanp = simpleArrayMap2;
        this.zzanq = nativeAdOptionsParcel;
        this.zzans = zzyVar;
        this.zzamb = zzdVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<String> zzfj() {
        ArrayList arrayList = new ArrayList();
        if (this.zzann != null) {
            arrayList.add(AppEventsConstants.EVENT_PARAM_VALUE_YES);
        }
        if (this.zzanm != null) {
            arrayList.add("2");
        }
        if (this.zzano.size() > 0) {
            arrayList.add("3");
        }
        return arrayList;
    }

    @Override // com.google.android.gms.ads.internal.client.zzr
    @Nullable
    public String getMediationAdapterClassName() {
        synchronized (this.zzako) {
            if (this.zzanv != null) {
                zzq zzqVar = this.zzanv.get();
                return zzqVar != null ? zzqVar.getMediationAdapterClassName() : null;
            }
            return null;
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzr
    public boolean isLoading() {
        synchronized (this.zzako) {
            if (this.zzanv != null) {
                zzq zzqVar = this.zzanv.get();
                return zzqVar != null ? zzqVar.isLoading() : false;
            }
            return false;
        }
    }

    protected void runOnUiThread(Runnable runnable) {
        zzlb.zzcvl.post(runnable);
    }

    @Override // com.google.android.gms.ads.internal.client.zzr
    public void zzf(final AdRequestParcel adRequestParcel) {
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.ads.internal.zzj.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zzj.this.zzako) {
                    zzq zzfk = zzj.this.zzfk();
                    zzj.this.zzanv = new WeakReference(zzfk);
                    zzfk.zzb(zzj.this.zzanm);
                    zzfk.zzb(zzj.this.zzann);
                    zzfk.zza(zzj.this.zzano);
                    zzfk.zza(zzj.this.zzanl);
                    zzfk.zzb(zzj.this.zzanp);
                    zzfk.zzb(zzj.this.zzfj());
                    zzfk.zzb(zzj.this.zzanq);
                    zzfk.zza(zzj.this.zzans);
                    zzfk.zzb(adRequestParcel);
                }
            }
        });
    }

    protected zzq zzfk() {
        return new zzq(this.mContext, this.zzamb, AdSizeParcel.zzj(this.mContext), this.zzant, this.zzamf, this.zzanu);
    }
}
