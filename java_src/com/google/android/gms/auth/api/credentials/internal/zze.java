package com.google.android.gms.auth.api.credentials.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.auth.api.credentials.CredentialRequest;
import com.google.android.gms.auth.api.credentials.CredentialRequestResult;
import com.google.android.gms.auth.api.credentials.CredentialsApi;
import com.google.android.gms.auth.api.credentials.HintRequest;
import com.google.android.gms.auth.api.credentials.PasswordSpecification;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public final class zze implements CredentialsApi {

    /* loaded from: classes2.dex */
    private static class zza extends com.google.android.gms.auth.api.credentials.internal.zza {
        private zzqo.zzb<Status> iU;

        zza(zzqo.zzb<Status> zzbVar) {
            this.iU = zzbVar;
        }

        @Override // com.google.android.gms.auth.api.credentials.internal.zza, com.google.android.gms.auth.api.credentials.internal.zzj
        public void zzh(Status status) {
            this.iU.setResult(status);
        }
    }

    private PasswordSpecification zza(GoogleApiClient googleApiClient) {
        Auth.AuthCredentialsOptions zzaim = ((zzg) googleApiClient.zza(Auth.hX)).zzaim();
        return (zzaim == null || zzaim.zzaid() == null) ? PasswordSpecification.iG : zzaim.zzaid();
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialsApi
    public PendingResult<Status> delete(GoogleApiClient googleApiClient, final Credential credential) {
        return googleApiClient.zzb((GoogleApiClient) new zzf<Status>(googleApiClient) { // from class: com.google.android.gms.auth.api.credentials.internal.zze.3
            @Override // com.google.android.gms.auth.api.credentials.internal.zzf
            protected void zza(Context context, zzk zzkVar) throws RemoteException {
                zzkVar.zza(new zza(this), new DeleteRequest(credential));
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzb */
            public Status zzc(Status status) {
                return status;
            }
        });
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialsApi
    public PendingResult<Status> disableAutoSignIn(GoogleApiClient googleApiClient) {
        return googleApiClient.zzb((GoogleApiClient) new zzf<Status>(googleApiClient) { // from class: com.google.android.gms.auth.api.credentials.internal.zze.4
            @Override // com.google.android.gms.auth.api.credentials.internal.zzf
            protected void zza(Context context, zzk zzkVar) throws RemoteException {
                zzkVar.zza(new zza(this));
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzb */
            public Status zzc(Status status) {
                return status;
            }
        });
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialsApi
    public PendingIntent getHintPickerIntent(GoogleApiClient googleApiClient, HintRequest hintRequest) {
        zzaa.zzb(googleApiClient, "client must not be null");
        zzaa.zzb(hintRequest, "request must not be null");
        zzaa.zzb(googleApiClient.zza(Auth.CREDENTIALS_API), "Auth.CREDENTIALS_API must be added to GoogleApiClient to use this API");
        return PendingIntent.getActivity(googleApiClient.getContext(), 2000, zzc.zza(googleApiClient.getContext(), hintRequest, zza(googleApiClient)), 268435456);
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialsApi
    public PendingResult<CredentialRequestResult> request(GoogleApiClient googleApiClient, final CredentialRequest credentialRequest) {
        return googleApiClient.zza((GoogleApiClient) new zzf<CredentialRequestResult>(googleApiClient) { // from class: com.google.android.gms.auth.api.credentials.internal.zze.1
            @Override // com.google.android.gms.auth.api.credentials.internal.zzf
            protected void zza(Context context, zzk zzkVar) throws RemoteException {
                zzkVar.zza(new com.google.android.gms.auth.api.credentials.internal.zza() { // from class: com.google.android.gms.auth.api.credentials.internal.zze.1.1
                    @Override // com.google.android.gms.auth.api.credentials.internal.zza, com.google.android.gms.auth.api.credentials.internal.zzj
                    public void zza(Status status, Credential credential) {
                        zzc((AnonymousClass1) new zzd(status, credential));
                    }

                    @Override // com.google.android.gms.auth.api.credentials.internal.zza, com.google.android.gms.auth.api.credentials.internal.zzj
                    public void zzh(Status status) {
                        zzc((AnonymousClass1) zzd.zzi(status));
                    }
                }, credentialRequest);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzj */
            public CredentialRequestResult zzc(Status status) {
                return zzd.zzi(status);
            }
        });
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialsApi
    public PendingResult<Status> save(GoogleApiClient googleApiClient, final Credential credential) {
        return googleApiClient.zzb((GoogleApiClient) new zzf<Status>(googleApiClient) { // from class: com.google.android.gms.auth.api.credentials.internal.zze.2
            @Override // com.google.android.gms.auth.api.credentials.internal.zzf
            protected void zza(Context context, zzk zzkVar) throws RemoteException {
                zzkVar.zza(new zza(this), new SaveRequest(credential));
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzb */
            public Status zzc(Status status) {
                return status;
            }
        });
    }
}
