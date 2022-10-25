package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzcj;
import com.google.android.gms.internal.zzck;
/* loaded from: classes2.dex */
public final class zzci extends com.google.android.gms.dynamic.zzg<zzck> {
    private static final zzci zzakx = new zzci();

    private zzci() {
        super("com.google.android.gms.ads.adshield.AdShieldCreatorImpl");
    }

    public static zzcj zzb(String str, Context context, boolean z) {
        zzcj zzc;
        return (com.google.android.gms.common.zzc.zzaql().isGooglePlayServicesAvailable(context) != 0 || (zzc = zzakx.zzc(str, context, z)) == null) ? new zzch(str, context, z) : zzc;
    }

    private zzcj zzc(String str, Context context, boolean z) {
        com.google.android.gms.dynamic.zzd zzac = com.google.android.gms.dynamic.zze.zzac(context);
        try {
            return zzcj.zza.zzd(z ? zzcr(context).zza(str, zzac) : zzcr(context).zzb(str, zzac));
        } catch (RemoteException | zzg.zza e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzb */
    public zzck zzc(IBinder iBinder) {
        return zzck.zza.zze(iBinder);
    }
}
