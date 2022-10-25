package com.google.android.gms.ads.internal.client;

import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzr;
import com.google.android.gms.ads.internal.client.zzs;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.internal.zzeq;
import com.google.android.gms.internal.zzer;
import com.google.android.gms.internal.zzes;
import com.google.android.gms.internal.zzet;
/* loaded from: classes.dex */
public class zzaj extends zzs.zza {
    private zzq zzanl;

    /* loaded from: classes.dex */
    private class zza extends zzr.zza {
        private zza() {
        }

        @Override // com.google.android.gms.ads.internal.client.zzr
        public String getMediationAdapterClassName() throws RemoteException {
            return null;
        }

        @Override // com.google.android.gms.ads.internal.client.zzr
        public boolean isLoading() throws RemoteException {
            return false;
        }

        @Override // com.google.android.gms.ads.internal.client.zzr
        public void zzf(AdRequestParcel adRequestParcel) throws RemoteException {
            com.google.android.gms.ads.internal.util.client.zzb.e("This app is using a lightweight version of the Google Mobile Ads SDK that requires the latest Google Play services to be installed, but Google Play services is either missing or out of date.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.client.zzaj.zza.1
                @Override // java.lang.Runnable
                public void run() {
                    if (zzaj.this.zzanl != null) {
                        try {
                            zzaj.this.zzanl.onAdFailedToLoad(1);
                        } catch (RemoteException e) {
                            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not notify onAdFailedToLoad event.", e);
                        }
                    }
                }
            });
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(NativeAdOptionsParcel nativeAdOptionsParcel) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(zzeq zzeqVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(zzer zzerVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zza(String str, zzet zzetVar, zzes zzesVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zzb(zzq zzqVar) throws RemoteException {
        this.zzanl = zzqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public void zzb(zzy zzyVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzs
    public zzr zzfl() throws RemoteException {
        return new zza();
    }
}
