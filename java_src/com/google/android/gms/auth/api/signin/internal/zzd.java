package com.google.android.gms.auth.api.signin.internal;

import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.internal.zzh;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
/* loaded from: classes2.dex */
public class zzd extends com.google.android.gms.common.internal.zzj<zzh> {
    private final GoogleSignInOptions jH;

    public zzd(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleSignInOptions googleSignInOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 91, zzfVar, connectionCallbacks, onConnectionFailedListener);
        googleSignInOptions = googleSignInOptions == null ? new GoogleSignInOptions.Builder().build() : googleSignInOptions;
        if (!zzfVar.zzavq().isEmpty()) {
            GoogleSignInOptions.Builder builder = new GoogleSignInOptions.Builder(googleSignInOptions);
            for (Scope scope : zzfVar.zzavq()) {
                builder.requestScopes(scope, new Scope[0]);
            }
            googleSignInOptions = builder.build();
        }
        this.jH = googleSignInOptions;
    }

    @Override // com.google.android.gms.common.internal.zze, com.google.android.gms.common.api.Api.zze
    public boolean zzajc() {
        return true;
    }

    @Override // com.google.android.gms.common.internal.zze, com.google.android.gms.common.api.Api.zze
    public Intent zzajd() {
        SignInConfiguration signInConfiguration = new SignInConfiguration(getContext().getPackageName(), this.jH);
        Intent intent = new Intent("com.google.android.gms.auth.GOOGLE_SIGN_IN");
        intent.setClass(getContext(), SignInHubActivity.class);
        intent.putExtra("config", signInConfiguration);
        return intent;
    }

    public GoogleSignInOptions zzaje() {
        return this.jH;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzck */
    public zzh zzh(IBinder iBinder) {
        return zzh.zza.zzcm(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.auth.api.signin.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.auth.api.signin.internal.ISignInService";
    }
}
