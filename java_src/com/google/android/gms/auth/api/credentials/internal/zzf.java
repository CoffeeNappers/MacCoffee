package com.google.android.gms.auth.api.credentials.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class zzf<R extends Result> extends zzqo.zza<R, zzg> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzf(GoogleApiClient googleApiClient) {
        super(Auth.CREDENTIALS_API, googleApiClient);
    }

    protected abstract void zza(Context context, zzk zzkVar) throws DeadObjectException, RemoteException;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzqo.zza
    public final void zza(zzg zzgVar) throws DeadObjectException, RemoteException {
        zza(zzgVar.getContext(), (zzk) zzgVar.zzavg());
    }
}
