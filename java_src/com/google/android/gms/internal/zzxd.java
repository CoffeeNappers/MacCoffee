package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzxb;
import java.util.List;
/* loaded from: classes2.dex */
public class zzxd extends com.google.android.gms.common.internal.zzj<zzxb> {
    private final Context mContext;

    public zzxd(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 45, zzfVar, connectionCallbacks, onConnectionFailedListener);
        this.mContext = context;
    }

    private String zznv(String str) {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        try {
            PackageManager packageManager = this.mContext.getPackageManager();
            if (packageManager != null && (applicationInfo = packageManager.getApplicationInfo(this.mContext.getPackageName(), 128)) != null && (bundle = applicationInfo.metaData) != null) {
                return (String) bundle.get(str);
            }
            return null;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    public void zza(zzxa zzxaVar, String str) throws RemoteException {
        ((zzxb) zzavg()).zza(zzxaVar, str);
    }

    public void zza(zzxa zzxaVar, List<Integer> list, int i, String str, String str2) throws RemoteException {
        String zznv = str2 == null ? zznv("com.google.android.safetynet.API_KEY") : str2;
        int[] iArr = new int[list.size()];
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 >= list.size()) {
                ((zzxb) zzavg()).zza(zzxaVar, zznv, iArr, i, str);
                return;
            } else {
                iArr[i3] = list.get(i3).intValue();
                i2 = i3 + 1;
            }
        }
    }

    public void zza(zzxa zzxaVar, byte[] bArr) throws RemoteException {
        ((zzxb) zzavg()).zza(zzxaVar, bArr, zznv("com.google.android.safetynet.ATTEST_API_KEY"));
    }

    public void zzb(zzxa zzxaVar) throws RemoteException {
        ((zzxb) zzavg()).zzb(zzxaVar);
    }

    public void zzc(zzxa zzxaVar) throws RemoteException {
        ((zzxb) zzavg()).zzc(zzxaVar);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.safetynet.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.safetynet.internal.ISafetyNetService";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzkr */
    public zzxb zzh(IBinder iBinder) {
        return zzxb.zza.zzkq(iBinder);
    }
}
