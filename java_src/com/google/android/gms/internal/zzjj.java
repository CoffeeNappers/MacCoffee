package com.google.android.gms.internal;

import android.location.Location;
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.internal.zzjv;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzjj {
    @Nullable
    public Location zzayt;
    @Nullable
    public String zzcjw;
    @Nullable
    public Bundle zzckb;
    @Nullable
    public Bundle zzcmu;
    @Nullable
    public zzjv.zza zzcmv;
    @Nullable
    public String zzcmw;
    public AdRequestInfoParcel zzcmx;
    public zzjr zzcmy;
    public JSONObject zzcmz = new JSONObject();
    @Nullable
    public List<String> zzckj = new ArrayList();

    public zzjj zza(zzjr zzjrVar) {
        this.zzcmy = zzjrVar;
        return this;
    }

    public zzjj zza(zzjv.zza zzaVar) {
        this.zzcmv = zzaVar;
        return this;
    }

    public zzjj zzc(Location location) {
        this.zzayt = location;
        return this;
    }

    public zzjj zzcm(String str) {
        this.zzcjw = str;
        return this;
    }

    public zzjj zzcn(String str) {
        this.zzcmw = str;
        return this;
    }

    public zzjj zze(Bundle bundle) {
        this.zzcmu = bundle;
        return this;
    }

    public zzjj zzf(Bundle bundle) {
        this.zzckb = bundle;
        return this;
    }

    public zzjj zzf(AdRequestInfoParcel adRequestInfoParcel) {
        this.zzcmx = adRequestInfoParcel;
        return this;
    }

    public zzjj zzi(JSONObject jSONObject) {
        this.zzcmz = jSONObject;
        return this;
    }

    public zzjj zzk(List<String> list) {
        if (list == null) {
            this.zzckj.clear();
        }
        this.zzckj = list;
        return this;
    }
}
