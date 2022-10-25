package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.RemoteException;
import com.google.android.gms.auth.account.WorkAccount;
import com.google.android.gms.auth.account.WorkAccountApi;
import com.google.android.gms.auth.account.zza;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public class zznq implements WorkAccountApi {
    private static final Status hS = new Status(13);

    /* loaded from: classes2.dex */
    static class zza extends zza.AbstractBinderC0037zza {
        zza() {
        }

        public void zzbc(boolean z) {
            throw new UnsupportedOperationException();
        }

        public void zzd(Account account) {
            throw new UnsupportedOperationException();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzb implements WorkAccountApi.AddAccountResult {
        private final Account gj;
        private final Status hv;

        public zzb(Status status, Account account) {
            this.hv = status;
            this.gj = account;
        }

        @Override // com.google.android.gms.auth.account.WorkAccountApi.AddAccountResult
        public Account getAccount() {
            return this.gj;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    /* loaded from: classes2.dex */
    static class zzc implements Result {
        private final Status hv;

        public zzc(Status status) {
            this.hv = status;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    @Override // com.google.android.gms.auth.account.WorkAccountApi
    public PendingResult<WorkAccountApi.AddAccountResult> addWorkAccount(GoogleApiClient googleApiClient, final String str) {
        return googleApiClient.zzb((GoogleApiClient) new zzqo.zza<WorkAccountApi.AddAccountResult, zznr>(WorkAccount.API, googleApiClient) { // from class: com.google.android.gms.internal.zznq.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zznr zznrVar) throws RemoteException {
                ((com.google.android.gms.auth.account.zzb) zznrVar.zzavg()).zza(new zza() { // from class: com.google.android.gms.internal.zznq.2.1
                    @Override // com.google.android.gms.internal.zznq.zza, com.google.android.gms.auth.account.zza
                    public void zzd(Account account) {
                        zzc((AnonymousClass2) new zzb(account != null ? Status.xZ : zznq.hS, account));
                    }
                }, str);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzf */
            public WorkAccountApi.AddAccountResult zzc(Status status) {
                return new zzb(status, null);
            }
        });
    }

    @Override // com.google.android.gms.auth.account.WorkAccountApi
    public PendingResult<Result> removeWorkAccount(GoogleApiClient googleApiClient, final Account account) {
        return googleApiClient.zzb((GoogleApiClient) new zzqo.zza<Result, zznr>(WorkAccount.API, googleApiClient) { // from class: com.google.android.gms.internal.zznq.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zznr zznrVar) throws RemoteException {
                ((com.google.android.gms.auth.account.zzb) zznrVar.zzavg()).zza(new zza() { // from class: com.google.android.gms.internal.zznq.3.1
                    @Override // com.google.android.gms.internal.zznq.zza, com.google.android.gms.auth.account.zza
                    public void zzbc(boolean z) {
                        zzc((AnonymousClass3) new zzc(z ? Status.xZ : zznq.hS));
                    }
                }, account);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            public Result zzc(Status status) {
                return new zzc(status);
            }
        });
    }

    @Override // com.google.android.gms.auth.account.WorkAccountApi
    public void setWorkAuthenticatorEnabled(GoogleApiClient googleApiClient, final boolean z) {
        googleApiClient.zzb((GoogleApiClient) new zzqo.zza<Result, zznr>(WorkAccount.API, googleApiClient) { // from class: com.google.android.gms.internal.zznq.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zznr zznrVar) throws RemoteException {
                ((com.google.android.gms.auth.account.zzb) zznrVar.zzavg()).zzbd(z);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            public Result zzc(Status status) {
                return null;
            }
        });
    }
}
