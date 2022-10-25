package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.auth.api.proxy.ProxyApi;
import com.google.android.gms.auth.api.proxy.ProxyRequest;
import com.google.android.gms.auth.api.proxy.ProxyResponse;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
/* loaded from: classes2.dex */
public class zzoc implements ProxyApi {
    @Override // com.google.android.gms.auth.api.proxy.ProxyApi
    public PendingResult<ProxyApi.ProxyResult> performProxyRequest(GoogleApiClient googleApiClient, final ProxyRequest proxyRequest) {
        com.google.android.gms.common.internal.zzaa.zzy(googleApiClient);
        com.google.android.gms.common.internal.zzaa.zzy(proxyRequest);
        return googleApiClient.zzb((GoogleApiClient) new zzob(googleApiClient) { // from class: com.google.android.gms.internal.zzoc.1
            @Override // com.google.android.gms.internal.zzob
            protected void zza(Context context, zzoa zzoaVar) throws RemoteException {
                zzoaVar.zza(new zznx() { // from class: com.google.android.gms.internal.zzoc.1.1
                    @Override // com.google.android.gms.internal.zznx, com.google.android.gms.internal.zznz
                    public void zza(ProxyResponse proxyResponse) {
                        zzc((AnonymousClass1) new zzod(proxyResponse));
                    }
                }, proxyRequest);
            }
        });
    }
}
