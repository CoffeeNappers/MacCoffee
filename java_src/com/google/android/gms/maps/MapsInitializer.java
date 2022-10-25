package com.google.android.gms.maps;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.maps.internal.zzai;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.RuntimeRemoteException;
/* loaded from: classes2.dex */
public final class MapsInitializer {
    private static boolean zzagx = false;

    private MapsInitializer() {
    }

    public static synchronized int initialize(Context context) {
        int i = 0;
        synchronized (MapsInitializer.class) {
            zzaa.zzb(context, "Context is null");
            if (!zzagx) {
                try {
                    zza(zzai.zzdm(context));
                    zzagx = true;
                } catch (GooglePlayServicesNotAvailableException e) {
                    i = e.errorCode;
                }
            }
        }
        return i;
    }

    public static void zza(zzc zzcVar) {
        try {
            CameraUpdateFactory.zza(zzcVar.zzbsu());
            BitmapDescriptorFactory.zza(zzcVar.zzbsv());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
