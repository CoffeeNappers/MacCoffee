package com.google.android.gms.internal;

import android.os.DeadObjectException;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.util.Log;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrh;
import com.google.android.gms.internal.zzrr;
import com.google.android.gms.tasks.TaskCompletionSource;
/* loaded from: classes2.dex */
public abstract class zzqj {
    public final int nV;

    /* loaded from: classes2.dex */
    private static abstract class zza extends zzqj {
        protected final TaskCompletionSource<Void> yg;

        public zza(int i, TaskCompletionSource<Void> taskCompletionSource) {
            super(i);
            this.yg = taskCompletionSource;
        }

        private void zza(RemoteException remoteException) {
            zzy(new Status(8, remoteException.getLocalizedMessage(), null));
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zza(@NonNull zzqv zzqvVar, boolean z) {
        }

        @Override // com.google.android.gms.internal.zzqj
        public final void zza(zzrh.zza<?> zzaVar) throws DeadObjectException {
            try {
                zzb(zzaVar);
            } catch (DeadObjectException e) {
                zza(e);
                throw e;
            } catch (RemoteException e2) {
                zza(e2);
            }
        }

        protected abstract void zzb(zzrh.zza<?> zzaVar) throws RemoteException;

        @Override // com.google.android.gms.internal.zzqj
        public void zzy(@NonNull Status status) {
            this.yg.trySetException(new com.google.android.gms.common.api.zza(status));
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb<A extends zzqo.zza<? extends Result, Api.zzb>> extends zzqj {
        protected final A yh;

        public zzb(int i, A a) {
            super(i);
            this.yh = a;
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zza(@NonNull zzqv zzqvVar, boolean z) {
            zzqvVar.zza(this.yh, z);
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zza(zzrh.zza<?> zzaVar) throws DeadObjectException {
            this.yh.zzb(zzaVar.getClient());
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zzy(@NonNull Status status) {
            this.yh.zzaa(status);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zza {
        public final zzrw<Api.zzb> yi;
        public final zzsh<Api.zzb> yj;

        public zzc(zzrx zzrxVar, TaskCompletionSource<Void> taskCompletionSource) {
            super(3, taskCompletionSource);
            this.yi = zzrxVar.yi;
            this.yj = zzrxVar.yj;
        }

        @Override // com.google.android.gms.internal.zzqj.zza, com.google.android.gms.internal.zzqj
        public /* bridge */ /* synthetic */ void zza(@NonNull zzqv zzqvVar, boolean z) {
            super.zza(zzqvVar, z);
        }

        @Override // com.google.android.gms.internal.zzqj.zza
        public void zzb(zzrh.zza<?> zzaVar) throws DeadObjectException {
            this.yi.zza(zzaVar.getClient(), this.yg);
            if (this.yi.zzatz() != null) {
                zzaVar.zzatn().put(this.yi.zzatz(), new zzrx(this.yi, this.yj));
            }
        }

        @Override // com.google.android.gms.internal.zzqj.zza, com.google.android.gms.internal.zzqj
        public /* bridge */ /* synthetic */ void zzy(@NonNull Status status) {
            super.zzy(status);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd<TResult> extends zzqj {
        private static final Status ym = new Status(8, "Connection to Google Play services was lost while executing the API call.");
        private final TaskCompletionSource<TResult> yg;
        private final zzse<Api.zzb, TResult> yk;
        private final zzsb yl;

        public zzd(int i, zzse<Api.zzb, TResult> zzseVar, TaskCompletionSource<TResult> taskCompletionSource, zzsb zzsbVar) {
            super(i);
            this.yg = taskCompletionSource;
            this.yk = zzseVar;
            this.yl = zzsbVar;
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zza(@NonNull zzqv zzqvVar, boolean z) {
            zzqvVar.zza(this.yg, z);
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zza(zzrh.zza<?> zzaVar) throws DeadObjectException {
            try {
                this.yk.zzb(zzaVar.getClient(), this.yg);
            } catch (DeadObjectException e) {
                throw e;
            } catch (RemoteException e2) {
                zzy(ym);
            }
        }

        @Override // com.google.android.gms.internal.zzqj
        public void zzy(@NonNull Status status) {
            this.yg.trySetException(this.yl.zzz(status));
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zza {
        public final zzrr.zzb<?> yn;

        public zze(zzrr.zzb<?> zzbVar, TaskCompletionSource<Void> taskCompletionSource) {
            super(4, taskCompletionSource);
            this.yn = zzbVar;
        }

        @Override // com.google.android.gms.internal.zzqj.zza, com.google.android.gms.internal.zzqj
        public /* bridge */ /* synthetic */ void zza(@NonNull zzqv zzqvVar, boolean z) {
            super.zza(zzqvVar, z);
        }

        @Override // com.google.android.gms.internal.zzqj.zza
        public void zzb(zzrh.zza<?> zzaVar) throws DeadObjectException {
            zzrx remove = zzaVar.zzatn().remove(this.yn);
            if (remove != null) {
                remove.yj.zzc(zzaVar.getClient(), this.yg);
                remove.yi.zzaua();
                return;
            }
            Log.wtf("UnregisterListenerTask", "Received call to unregister a listener without a matching registration call.", new Exception());
            this.yg.trySetException(new com.google.android.gms.common.api.zza(Status.yb));
        }

        @Override // com.google.android.gms.internal.zzqj.zza, com.google.android.gms.internal.zzqj
        public /* bridge */ /* synthetic */ void zzy(@NonNull Status status) {
            super.zzy(status);
        }
    }

    public zzqj(int i) {
        this.nV = i;
    }

    public abstract void zza(@NonNull zzqv zzqvVar, boolean z);

    public abstract void zza(zzrh.zza<?> zzaVar) throws DeadObjectException;

    public abstract void zzy(@NonNull Status status);
}
