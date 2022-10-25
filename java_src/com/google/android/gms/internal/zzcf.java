package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.os.RemoteException;
import android.view.MotionEvent;
@zzji
/* loaded from: classes.dex */
public final class zzcf {
    private final zzcj zzaks;

    public zzcf(String str, Context context, boolean z) {
        this.zzaks = zzci.zzb(str, context, z);
    }

    public void zza(MotionEvent motionEvent) throws RemoteException {
        this.zzaks.zzd(com.google.android.gms.dynamic.zze.zzac(motionEvent));
    }

    public Uri zzc(Uri uri, Context context) throws zzcg, RemoteException {
        com.google.android.gms.dynamic.zzd zza = this.zzaks.zza(com.google.android.gms.dynamic.zze.zzac(uri), com.google.android.gms.dynamic.zze.zzac(context));
        if (zza == null) {
            throw new zzcg();
        }
        return (Uri) com.google.android.gms.dynamic.zze.zzae(zza);
    }

    public Uri zzd(Uri uri, Context context) throws zzcg, RemoteException {
        com.google.android.gms.dynamic.zzd zzb = this.zzaks.zzb(com.google.android.gms.dynamic.zze.zzac(uri), com.google.android.gms.dynamic.zze.zzac(context));
        if (zzb == null) {
            throw new zzcg();
        }
        return (Uri) com.google.android.gms.dynamic.zze.zzae(zzb);
    }
}
