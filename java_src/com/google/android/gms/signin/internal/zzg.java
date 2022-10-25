package com.google.android.gms.signin.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.internal.zzk;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.ResolveAccountRequest;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.common.internal.zzj;
import com.google.android.gms.common.internal.zzp;
import com.google.android.gms.internal.zzxp;
import com.google.android.gms.internal.zzxq;
import com.google.android.gms.signin.internal.zze;
/* loaded from: classes2.dex */
public class zzg extends zzj<zze> implements zzxp {
    private Integer DM;
    private final Bundle aDk;
    private final boolean aDv;
    private final com.google.android.gms.common.internal.zzf zP;

    public zzg(Context context, Looper looper, boolean z, com.google.android.gms.common.internal.zzf zzfVar, Bundle bundle, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 44, zzfVar, connectionCallbacks, onConnectionFailedListener);
        this.aDv = z;
        this.zP = zzfVar;
        this.aDk = bundle;
        this.DM = zzfVar.zzavw();
    }

    public zzg(Context context, Looper looper, boolean z, com.google.android.gms.common.internal.zzf zzfVar, zzxq zzxqVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        this(context, looper, z, zzfVar, zza(zzfVar), connectionCallbacks, onConnectionFailedListener);
    }

    public static Bundle zza(com.google.android.gms.common.internal.zzf zzfVar) {
        zzxq zzavv = zzfVar.zzavv();
        Integer zzavw = zzfVar.zzavw();
        Bundle bundle = new Bundle();
        bundle.putParcelable("com.google.android.gms.signin.internal.clientRequestedAccount", zzfVar.getAccount());
        if (zzavw != null) {
            bundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", zzavw.intValue());
        }
        if (zzavv != null) {
            bundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", zzavv.zzcdd());
            bundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", zzavv.zzaiu());
            bundle.putString("com.google.android.gms.signin.internal.serverClientId", zzavv.zzaix());
            bundle.putBoolean("com.google.android.gms.signin.internal.usePromptModeForAuthCode", true);
            bundle.putBoolean("com.google.android.gms.signin.internal.forceCodeForRefreshToken", zzavv.zzaiw());
            bundle.putString("com.google.android.gms.signin.internal.hostedDomain", zzavv.zzaiy());
            bundle.putBoolean("com.google.android.gms.signin.internal.waitForAccessTokenRefresh", zzavv.zzcde());
            if (zzavv.zzcdf() != null) {
                bundle.putLong("com.google.android.gms.signin.internal.authApiSignInModuleVersion", zzavv.zzcdf().longValue());
            }
            if (zzavv.zzcdg() != null) {
                bundle.putLong("com.google.android.gms.signin.internal.realClientLibraryVersion", zzavv.zzcdg().longValue());
            }
        }
        return bundle;
    }

    private ResolveAccountRequest zzcdl() {
        Account zzave = this.zP.zzave();
        GoogleSignInAccount googleSignInAccount = null;
        if ("<<default account>>".equals(zzave.name)) {
            googleSignInAccount = zzk.zzba(getContext()).zzajm();
        }
        return new ResolveAccountRequest(zzave, this.DM.intValue(), googleSignInAccount);
    }

    @Override // com.google.android.gms.internal.zzxp
    public void connect() {
        zza(new zze.zzi());
    }

    @Override // com.google.android.gms.internal.zzxp
    public void zza(zzp zzpVar, boolean z) {
        try {
            ((zze) zzavg()).zza(zzpVar, this.DM.intValue(), z);
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when saveDefaultAccount is called");
        }
    }

    @Override // com.google.android.gms.internal.zzxp
    public void zza(zzd zzdVar) {
        zzaa.zzb(zzdVar, "Expecting a valid ISignInCallbacks");
        try {
            ((zze) zzavg()).zza(new SignInRequest(zzcdl()), zzdVar);
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when signIn is called");
            try {
                zzdVar.zzb(new SignInResponse(8));
            } catch (RemoteException e2) {
                Log.wtf("SignInClientImpl", "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException.", e);
            }
        }
    }

    @Override // com.google.android.gms.common.internal.zze
    protected Bundle zzahv() {
        if (!getContext().getPackageName().equals(this.zP.zzavs())) {
            this.aDk.putString("com.google.android.gms.signin.internal.realClientPackageName", this.zP.zzavs());
        }
        return this.aDk;
    }

    @Override // com.google.android.gms.common.internal.zze, com.google.android.gms.common.api.Api.zze
    public boolean zzain() {
        return this.aDv;
    }

    @Override // com.google.android.gms.internal.zzxp
    public void zzcdc() {
        try {
            ((zze) zzavg()).zzzv(this.DM.intValue());
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when clearAccountFromSessionStore is called");
        }
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.signin.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.signin.internal.ISignInService";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzkx */
    public zze zzh(IBinder iBinder) {
        return zze.zza.zzkw(iBinder);
    }
}
