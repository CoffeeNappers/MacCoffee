package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.client.zzv;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zze extends com.google.android.gms.dynamic.zzg<zzv> {
    public zze() {
        super("com.google.android.gms.ads.AdManagerCreatorImpl");
    }

    public zzu zza(Context context, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) {
        try {
            return zzu.zza.zzq(zzcr(context).zza(com.google.android.gms.dynamic.zze.zzac(context), adSizeParcel, str, zzgzVar, 9877000, i));
        } catch (RemoteException | zzg.zza e) {
            com.google.android.gms.ads.internal.util.client.zzb.zza("Could not create remote AdManager.", e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzk */
    public zzv zzc(IBinder iBinder) {
        return zzv.zza.zzr(iBinder);
    }
}
