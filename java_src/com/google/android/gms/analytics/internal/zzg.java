package com.google.android.gms.analytics.internal;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
/* loaded from: classes.dex */
public class zzg {
    private final Context di;
    private final Context zzatc;

    public zzg(Context context) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        Context applicationContext = context.getApplicationContext();
        com.google.android.gms.common.internal.zzaa.zzb(applicationContext, "Application context can't be null");
        this.zzatc = applicationContext;
        this.di = applicationContext;
    }

    public Context getApplicationContext() {
        return this.zzatc;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzu zza(zzf zzfVar) {
        return new zzu(zzfVar);
    }

    public Context zzacl() {
        return this.di;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public com.google.android.gms.analytics.zzi zzax(Context context) {
        return com.google.android.gms.analytics.zzi.zzav(context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzk zzb(zzf zzfVar) {
        return new zzk(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zza zzc(zzf zzfVar) {
        return new zza(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzn zzd(zzf zzfVar) {
        return new zzn(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzap zze(zzf zzfVar) {
        return new zzap(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzaf zzf(zzf zzfVar) {
        return new zzaf(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzr zzg(zzf zzfVar) {
        return new zzr(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public com.google.android.gms.common.util.zze zzh(zzf zzfVar) {
        return com.google.android.gms.common.util.zzh.zzayl();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GoogleAnalytics zzi(zzf zzfVar) {
        return new GoogleAnalytics(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzl zzj(zzf zzfVar) {
        return new zzl(zzfVar, this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzag zzk(zzf zzfVar) {
        return new zzag(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzb zzl(zzf zzfVar) {
        return new zzb(zzfVar, this);
    }

    public zzj zzm(zzf zzfVar) {
        return new zzj(zzfVar);
    }

    public zzah zzn(zzf zzfVar) {
        return new zzah(zzfVar);
    }

    public zzi zzo(zzf zzfVar) {
        return new zzi(zzfVar);
    }

    public zzv zzp(zzf zzfVar) {
        return new zzv(zzfVar);
    }

    public zzai zzq(zzf zzfVar) {
        return new zzai(zzfVar);
    }
}
