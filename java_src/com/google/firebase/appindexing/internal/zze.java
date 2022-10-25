package com.google.firebase.appindexing.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zznf;
import com.google.android.gms.internal.zzni;
import com.google.android.gms.internal.zznk;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzse;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.appindexing.Action;
import com.google.firebase.appindexing.FirebaseAppIndexingInvalidArgumentException;
import com.google.firebase.appindexing.FirebaseUserActions;
/* loaded from: classes2.dex */
public final class zze extends FirebaseUserActions {
    private zza aWP;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza extends com.google.android.gms.common.api.zzc<Api.ApiOptions.NoOptions> {
        zza(Context context) {
            super(context, com.google.android.gms.appdatasearch.zza.gb, (Api.ApiOptions) null, new com.google.firebase.zza());
        }
    }

    /* loaded from: classes2.dex */
    private static abstract class zzb extends zzse<zzni, Void> implements zzqo.zzb<Status> {
        protected TaskCompletionSource<Void> yg;

        private zzb() {
        }

        protected abstract void zza(zznf zznfVar) throws RemoteException;

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzse
        /* renamed from: zza */
        public final void zzb(zzni zzniVar, TaskCompletionSource<Void> taskCompletionSource) throws RemoteException {
            this.yg = taskCompletionSource;
            zza((zznf) zzniVar.zzavg());
        }

        @Override // com.google.android.gms.internal.zzqo.zzb
        public void zzaa(Status status) {
            zzaa.zzb(!status.isSuccess(), "Failed result must not be success.");
            setResult(status);
        }

        @Override // com.google.android.gms.internal.zzqo.zzb
        /* renamed from: zzfb */
        public void setResult(Status status) {
            if (status.isSuccess()) {
                this.yg.setResult(null);
            } else {
                this.yg.setException(zzl.zzb(status, "User Action indexing error, please try again."));
            }
        }
    }

    public zze(Context context) {
        this.aWP = new zza(context);
    }

    private Task<Void> zza(int i, Action action) {
        if (!(action instanceof ActionImpl)) {
            return Tasks.forException(new FirebaseAppIndexingInvalidArgumentException("Custom Action objects are not allowed. Please use the 'Actions' or 'ActionBuilder' class for creating Action objects."));
        }
        final ActionImpl[] actionImplArr = {(ActionImpl) action};
        actionImplArr[0].zzcof().zzaey(i);
        return this.aWP.doWrite(new zzb() { // from class: com.google.firebase.appindexing.internal.zze.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.firebase.appindexing.internal.zze.zzb
            protected void zza(zznf zznfVar) throws RemoteException {
                zznfVar.zza(new zznk.zzd(this), actionImplArr);
            }
        });
    }

    @Override // com.google.firebase.appindexing.FirebaseUserActions
    public Task<Void> end(Action action) {
        return zza(2, action);
    }

    @Override // com.google.firebase.appindexing.FirebaseUserActions
    public Task<Void> start(Action action) {
        return zza(1, action);
    }
}
