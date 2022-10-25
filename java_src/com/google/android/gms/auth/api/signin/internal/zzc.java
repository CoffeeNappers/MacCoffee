package com.google.android.gms.auth.api.signin.internal;

import android.accounts.Account;
import android.content.Context;
import android.content.Intent;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInApi;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.GoogleSignInResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.OptionalPendingResult;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.PendingResults;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzru;
import java.util.HashSet;
/* loaded from: classes2.dex */
public class zzc implements GoogleSignInApi {

    /* loaded from: classes2.dex */
    private abstract class zza<R extends Result> extends zzqo.zza<R, zzd> {
        public zza(GoogleApiClient googleApiClient) {
            super(Auth.GOOGLE_SIGN_IN_API, googleApiClient);
        }
    }

    private OptionalPendingResult<GoogleSignInResult> zza(GoogleApiClient googleApiClient, final GoogleSignInOptions googleSignInOptions) {
        Log.d("GoogleSignInApiImpl", "trySilentSignIn");
        return new zzru(googleApiClient.zza((GoogleApiClient) new zza<GoogleSignInResult>(googleApiClient) { // from class: com.google.android.gms.auth.api.signin.internal.zzc.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzd zzdVar) throws RemoteException {
                final zzk zzba = zzk.zzba(zzdVar.getContext());
                ((zzh) zzdVar.zzavg()).zza(new com.google.android.gms.auth.api.signin.internal.zza() { // from class: com.google.android.gms.auth.api.signin.internal.zzc.1.1
                    @Override // com.google.android.gms.auth.api.signin.internal.zza, com.google.android.gms.auth.api.signin.internal.zzg
                    public void zza(GoogleSignInAccount googleSignInAccount, Status status) throws RemoteException {
                        if (googleSignInAccount != null) {
                            zzba.zzb(googleSignInAccount, googleSignInOptions);
                        }
                        zzc((AnonymousClass1) new GoogleSignInResult(googleSignInAccount, status));
                    }
                }, googleSignInOptions);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzn */
            public GoogleSignInResult zzc(Status status) {
                return new GoogleSignInResult(null, status);
            }
        }));
    }

    private boolean zza(Account account, Account account2) {
        return account == null ? account2 == null : account.equals(account2);
    }

    private GoogleSignInOptions zzb(GoogleApiClient googleApiClient) {
        return ((zzd) googleApiClient.zza(Auth.hZ)).zzaje();
    }

    @Override // com.google.android.gms.auth.api.signin.GoogleSignInApi
    public Intent getSignInIntent(GoogleApiClient googleApiClient) {
        zzaa.zzy(googleApiClient);
        return ((zzd) googleApiClient.zza(Auth.hZ)).zzajd();
    }

    @Override // com.google.android.gms.auth.api.signin.GoogleSignInApi
    public GoogleSignInResult getSignInResultFromIntent(Intent intent) {
        if (intent == null || (!intent.hasExtra("googleSignInStatus") && !intent.hasExtra("googleSignInAccount"))) {
            return null;
        }
        GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) intent.getParcelableExtra("googleSignInAccount");
        Status status = (Status) intent.getParcelableExtra("googleSignInStatus");
        if (googleSignInAccount != null) {
            status = Status.xZ;
        }
        return new GoogleSignInResult(googleSignInAccount, status);
    }

    @Override // com.google.android.gms.auth.api.signin.GoogleSignInApi
    public PendingResult<Status> revokeAccess(GoogleApiClient googleApiClient) {
        zzk.zzba(googleApiClient.getContext()).zzajo();
        for (GoogleApiClient googleApiClient2 : GoogleApiClient.zzarc()) {
            googleApiClient2.zzard();
        }
        return googleApiClient.zzb((GoogleApiClient) new zza<Status>(googleApiClient) { // from class: com.google.android.gms.auth.api.signin.internal.zzc.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzd zzdVar) throws RemoteException {
                ((zzh) zzdVar.zzavg()).zzc(new com.google.android.gms.auth.api.signin.internal.zza() { // from class: com.google.android.gms.auth.api.signin.internal.zzc.3.1
                    @Override // com.google.android.gms.auth.api.signin.internal.zza, com.google.android.gms.auth.api.signin.internal.zzg
                    public void zzm(Status status) throws RemoteException {
                        zzc((AnonymousClass3) status);
                    }
                }, zzdVar.zzaje());
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzb */
            public Status zzc(Status status) {
                return status;
            }
        });
    }

    @Override // com.google.android.gms.auth.api.signin.GoogleSignInApi
    public PendingResult<Status> signOut(GoogleApiClient googleApiClient) {
        zzk.zzba(googleApiClient.getContext()).zzajo();
        for (GoogleApiClient googleApiClient2 : GoogleApiClient.zzarc()) {
            googleApiClient2.zzard();
        }
        return googleApiClient.zzb((GoogleApiClient) new zza<Status>(googleApiClient) { // from class: com.google.android.gms.auth.api.signin.internal.zzc.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzd zzdVar) throws RemoteException {
                ((zzh) zzdVar.zzavg()).zzb(new com.google.android.gms.auth.api.signin.internal.zza() { // from class: com.google.android.gms.auth.api.signin.internal.zzc.2.1
                    @Override // com.google.android.gms.auth.api.signin.internal.zza, com.google.android.gms.auth.api.signin.internal.zzg
                    public void zzl(Status status) throws RemoteException {
                        zzc((AnonymousClass2) status);
                    }
                }, zzdVar.zzaje());
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzb */
            public Status zzc(Status status) {
                return status;
            }
        });
    }

    @Override // com.google.android.gms.auth.api.signin.GoogleSignInApi
    public OptionalPendingResult<GoogleSignInResult> silentSignIn(GoogleApiClient googleApiClient) {
        GoogleSignInOptions zzb = zzb(googleApiClient);
        GoogleSignInResult zza2 = zza(googleApiClient.getContext(), zzb);
        return zza2 != null ? PendingResults.zzb(zza2, googleApiClient) : zza(googleApiClient, zzb);
    }

    public GoogleSignInResult zza(Context context, GoogleSignInOptions googleSignInOptions) {
        GoogleSignInAccount zzajm;
        Log.d("GoogleSignInApiImpl", "getSavedSignInResultIfEligible");
        zzaa.zzy(googleSignInOptions);
        zzk zzba = zzk.zzba(context);
        GoogleSignInOptions zzajn = zzba.zzajn();
        if (zzajn != null && zza(zzajn.getAccount(), googleSignInOptions.getAccount()) && !googleSignInOptions.zzaiv()) {
            if ((googleSignInOptions.zzaiu() && (!zzajn.zzaiu() || !googleSignInOptions.zzaix().equals(zzajn.zzaix()))) || !new HashSet(zzajn.zzait()).containsAll(new HashSet(googleSignInOptions.zzait())) || (zzajm = zzba.zzajm()) == null || zzajm.zza()) {
                return null;
            }
            return new GoogleSignInResult(zzajm, Status.xZ);
        }
        return null;
    }
}
