package com.google.android.gms.internal;

import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzxk;
import com.google.android.gms.search.GoogleNowAuthState;
import com.google.android.gms.search.SearchAuth;
import com.google.android.gms.search.SearchAuthApi;
/* loaded from: classes2.dex */
public class zzxn implements SearchAuthApi {

    /* loaded from: classes2.dex */
    static abstract class zza extends zzxk.zza {
        zza() {
        }

        @Override // com.google.android.gms.internal.zzxk
        public void zza(Status status, GoogleNowAuthState googleNowAuthState) {
            throw new UnsupportedOperationException();
        }

        @Override // com.google.android.gms.internal.zzxk
        public void zzeh(Status status) {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes2.dex */
    static class zzb extends zzqo.zza<Status, zzxm> {
        private final String aCW;
        private final String aCZ;
        private final boolean aDa;

        protected zzb(GoogleApiClient googleApiClient, String str) {
            super(SearchAuth.API, googleApiClient);
            this.aDa = Log.isLoggable("SearchAuth", 3);
            this.aCW = str;
            this.aCZ = googleApiClient.getContext().getPackageName();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqo.zza
        public void zza(zzxm zzxmVar) throws RemoteException {
            if (this.aDa) {
                Log.d("SearchAuth", "ClearTokenImpl started");
            }
            ((zzxl) zzxmVar.zzavg()).zzb(new zza() { // from class: com.google.android.gms.internal.zzxn.zzb.1
                @Override // com.google.android.gms.internal.zzxn.zza, com.google.android.gms.internal.zzxk
                public void zzeh(Status status) {
                    if (zzb.this.aDa) {
                        Log.d("SearchAuth", "ClearTokenImpl success");
                    }
                    zzb.this.zzc((zzb) status);
                }
            }, this.aCZ, this.aCW);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            if (this.aDa) {
                String valueOf = String.valueOf(status.getStatusMessage());
                Log.d("SearchAuth", valueOf.length() != 0 ? "ClearTokenImpl received failure: ".concat(valueOf) : new String("ClearTokenImpl received failure: "));
            }
            return status;
        }
    }

    /* loaded from: classes2.dex */
    static class zzc extends zzqo.zza<SearchAuthApi.GoogleNowAuthResult, zzxm> {
        private final String aCZ;
        private final boolean aDa;
        private final String aDc;

        protected zzc(GoogleApiClient googleApiClient, String str) {
            super(SearchAuth.API, googleApiClient);
            this.aDa = Log.isLoggable("SearchAuth", 3);
            this.aDc = str;
            this.aCZ = googleApiClient.getContext().getPackageName();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqo.zza
        public void zza(zzxm zzxmVar) throws RemoteException {
            if (this.aDa) {
                Log.d("SearchAuth", "GetGoogleNowAuthImpl started");
            }
            ((zzxl) zzxmVar.zzavg()).zza(new zza() { // from class: com.google.android.gms.internal.zzxn.zzc.1
                @Override // com.google.android.gms.internal.zzxn.zza, com.google.android.gms.internal.zzxk
                public void zza(Status status, GoogleNowAuthState googleNowAuthState) {
                    if (zzc.this.aDa) {
                        Log.d("SearchAuth", "GetGoogleNowAuthImpl success");
                    }
                    zzc.this.zzc((zzc) new zzd(status, googleNowAuthState));
                }
            }, this.aCZ, this.aDc);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzei */
        public SearchAuthApi.GoogleNowAuthResult zzc(Status status) {
            if (this.aDa) {
                String valueOf = String.valueOf(status.getStatusMessage());
                Log.d("SearchAuth", valueOf.length() != 0 ? "GetGoogleNowAuthImpl received failure: ".concat(valueOf) : new String("GetGoogleNowAuthImpl received failure: "));
            }
            return new zzd(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzd implements SearchAuthApi.GoogleNowAuthResult {
        private final GoogleNowAuthState aDe;
        private final Status hv;

        zzd(Status status, GoogleNowAuthState googleNowAuthState) {
            this.hv = status;
            this.aDe = googleNowAuthState;
        }

        @Override // com.google.android.gms.search.SearchAuthApi.GoogleNowAuthResult
        public GoogleNowAuthState getGoogleNowAuthState() {
            return this.aDe;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    @Override // com.google.android.gms.search.SearchAuthApi
    public PendingResult<Status> clearToken(GoogleApiClient googleApiClient, String str) {
        return googleApiClient.zza((GoogleApiClient) new zzb(googleApiClient, str));
    }

    @Override // com.google.android.gms.search.SearchAuthApi
    public PendingResult<SearchAuthApi.GoogleNowAuthResult> getGoogleNowAuth(GoogleApiClient googleApiClient, String str) {
        return googleApiClient.zza((GoogleApiClient) new zzc(googleApiClient, str));
    }
}
