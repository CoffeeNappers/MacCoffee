package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
/* loaded from: classes2.dex */
public final class zzxo {
    public static final Api.zzf<com.google.android.gms.signin.internal.zzg> hg = new Api.zzf<>();
    public static final Api.zzf<com.google.android.gms.signin.internal.zzg> aDi = new Api.zzf<>();
    public static final Api.zza<com.google.android.gms.signin.internal.zzg, zzxq> hh = new Api.zza<com.google.android.gms.signin.internal.zzg, zzxq>() { // from class: com.google.android.gms.internal.zzxo.1
        @Override // com.google.android.gms.common.api.Api.zza
        public com.google.android.gms.signin.internal.zzg zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, zzxq zzxqVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new com.google.android.gms.signin.internal.zzg(context, looper, true, zzfVar, zzxqVar == null ? zzxq.aDl : zzxqVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    static final Api.zza<com.google.android.gms.signin.internal.zzg, zza> aDj = new Api.zza<com.google.android.gms.signin.internal.zzg, zza>() { // from class: com.google.android.gms.internal.zzxo.2
        @Override // com.google.android.gms.common.api.Api.zza
        public com.google.android.gms.signin.internal.zzg zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, zza zzaVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new com.google.android.gms.signin.internal.zzg(context, looper, false, zzfVar, zzaVar.zzcdb(), connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Scope jn = new Scope("profile");
    public static final Scope jo = new Scope("email");
    public static final Api<zzxq> API = new Api<>("SignIn.API", hh, hg);
    public static final Api<zza> Jb = new Api<>("SignIn.INTERNAL_API", aDj, aDi);

    /* loaded from: classes2.dex */
    public static class zza implements Api.ApiOptions.HasOptions {
        private final Bundle aDk;

        public Bundle zzcdb() {
            return this.aDk;
        }
    }
}
