package com.google.android.gms.flags.impl;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import com.google.android.gms.common.util.DynamiteApi;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.flags.impl.zza;
import com.google.android.gms.internal.zzvt;
@DynamiteApi
/* loaded from: classes2.dex */
public class FlagProviderImpl extends zzvt.zza {
    private boolean zzaoz = false;
    private SharedPreferences zzbct;

    @Override // com.google.android.gms.internal.zzvt
    public boolean getBooleanFlagValue(String str, boolean z, int i) {
        return !this.zzaoz ? z : zza.C0065zza.zza(this.zzbct, str, Boolean.valueOf(z)).booleanValue();
    }

    @Override // com.google.android.gms.internal.zzvt
    public int getIntFlagValue(String str, int i, int i2) {
        return !this.zzaoz ? i : zza.zzb.zza(this.zzbct, str, Integer.valueOf(i)).intValue();
    }

    @Override // com.google.android.gms.internal.zzvt
    public long getLongFlagValue(String str, long j, int i) {
        return !this.zzaoz ? j : zza.zzc.zza(this.zzbct, str, Long.valueOf(j)).longValue();
    }

    @Override // com.google.android.gms.internal.zzvt
    public String getStringFlagValue(String str, String str2, int i) {
        return !this.zzaoz ? str2 : zza.zzd.zza(this.zzbct, str, str2);
    }

    @Override // com.google.android.gms.internal.zzvt
    public void init(zzd zzdVar) {
        Context context = (Context) zze.zzae(zzdVar);
        if (this.zzaoz) {
            return;
        }
        try {
            this.zzbct = zzb.zzm(context.createPackageContext("com.google.android.gms", 0));
            this.zzaoz = true;
        } catch (PackageManager.NameNotFoundException e) {
        }
    }
}
