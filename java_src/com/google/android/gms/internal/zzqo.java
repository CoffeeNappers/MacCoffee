package com.google.android.gms.internal;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
public class zzqo {

    /* loaded from: classes.dex */
    public static abstract class zza<R extends Result, A extends Api.zzb> extends zzqq<R> implements zzb<R> {
        private final Api<?> vS;
        private final Api.zzc<A> yy;

        @Deprecated
        protected zza(Api.zzc<A> zzcVar, GoogleApiClient googleApiClient) {
            super((GoogleApiClient) com.google.android.gms.common.internal.zzaa.zzb(googleApiClient, "GoogleApiClient must not be null"));
            this.yy = (Api.zzc) com.google.android.gms.common.internal.zzaa.zzy(zzcVar);
            this.vS = null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public zza(Api<?> api, GoogleApiClient googleApiClient) {
            super((GoogleApiClient) com.google.android.gms.common.internal.zzaa.zzb(googleApiClient, "GoogleApiClient must not be null"));
            this.yy = (Api.zzc<A>) api.zzaqv();
            this.vS = api;
        }

        private void zza(RemoteException remoteException) {
            zzaa(new Status(8, remoteException.getLocalizedMessage(), null));
        }

        public final Api<?> getApi() {
            return this.vS;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.gms.internal.zzqo.zzb
        public /* synthetic */ void setResult(Object obj) {
            super.zzc((zza<R, A>) ((Result) obj));
        }

        protected abstract void zza(A a) throws RemoteException;

        @Override // com.google.android.gms.internal.zzqo.zzb
        public final void zzaa(Status status) {
            com.google.android.gms.common.internal.zzaa.zzb(!status.isSuccess(), "Failed result must not be success");
            R zzc = zzc(status);
            zzc((zza<R, A>) zzc);
            zzb((zza<R, A>) zzc);
        }

        public final Api.zzc<A> zzaqv() {
            return this.yy;
        }

        public final void zzb(A a) throws DeadObjectException {
            try {
                zza((zza<R, A>) a);
            } catch (DeadObjectException e) {
                zza(e);
                throw e;
            } catch (RemoteException e2) {
                zza(e2);
            }
        }

        protected void zzb(R r) {
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb<R> {
        void setResult(R r);

        void zzaa(Status status);
    }
}
