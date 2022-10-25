package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes2.dex */
public class zzsg {
    private final Map<Api.zzc<?>, Api.zze> Aj;
    final Set<zzqq<?>> BF = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap()));
    private final zzb BG = new zzb() { // from class: com.google.android.gms.internal.zzsg.1
        @Override // com.google.android.gms.internal.zzsg.zzb
        public void zzc(zzqq<?> zzqqVar) {
            zzsg.this.BF.remove(zzqqVar);
            if (zzqqVar.zzarh() == null || zzsg.zza(zzsg.this) == null) {
                return;
            }
            zzsg.zza(zzsg.this).remove(zzqqVar.zzarh().intValue());
        }
    };
    public static final Status ym = new Status(8, "The connection to Google Play services was lost");
    private static final zzqq<?>[] BE = new zzqq[0];

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza implements IBinder.DeathRecipient, zzb {
        private final WeakReference<zzqq<?>> BI;
        private final WeakReference<com.google.android.gms.common.api.zze> BJ;
        private final WeakReference<IBinder> BK;

        private zza(zzqq<?> zzqqVar, com.google.android.gms.common.api.zze zzeVar, IBinder iBinder) {
            this.BJ = new WeakReference<>(zzeVar);
            this.BI = new WeakReference<>(zzqqVar);
            this.BK = new WeakReference<>(iBinder);
        }

        private void zzaug() {
            zzqq<?> zzqqVar = this.BI.get();
            com.google.android.gms.common.api.zze zzeVar = this.BJ.get();
            if (zzeVar != null && zzqqVar != null) {
                zzeVar.remove(zzqqVar.zzarh().intValue());
            }
            IBinder iBinder = this.BK.get();
            if (iBinder != null) {
                iBinder.unlinkToDeath(this, 0);
            }
        }

        @Override // android.os.IBinder.DeathRecipient
        public void binderDied() {
            zzaug();
        }

        @Override // com.google.android.gms.internal.zzsg.zzb
        public void zzc(zzqq<?> zzqqVar) {
            zzaug();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zzb {
        void zzc(zzqq<?> zzqqVar);
    }

    public zzsg(Map<Api.zzc<?>, Api.zze> map) {
        this.Aj = map;
    }

    static /* synthetic */ com.google.android.gms.common.api.zze zza(zzsg zzsgVar) {
        return null;
    }

    private static void zza(zzqq<?> zzqqVar, com.google.android.gms.common.api.zze zzeVar, IBinder iBinder) {
        if (zzqqVar.isReady()) {
            zzqqVar.zza(new zza(zzqqVar, zzeVar, iBinder));
        } else if (iBinder == null || !iBinder.isBinderAlive()) {
            zzqqVar.zza((zzb) null);
            zzqqVar.cancel();
            zzeVar.remove(zzqqVar.zzarh().intValue());
        } else {
            zza zzaVar = new zza(zzqqVar, zzeVar, iBinder);
            zzqqVar.zza(zzaVar);
            try {
                iBinder.linkToDeath(zzaVar, 0);
            } catch (RemoteException e) {
                zzqqVar.cancel();
                zzeVar.remove(zzqqVar.zzarh().intValue());
            }
        }
    }

    public void dump(PrintWriter printWriter) {
        printWriter.append(" mUnconsumedApiCalls.size()=").println(this.BF.size());
    }

    public void release() {
        zzqq[] zzqqVarArr;
        for (zzqq zzqqVar : (zzqq[]) this.BF.toArray(BE)) {
            zzqqVar.zza((zzb) null);
            if (zzqqVar.zzarh() != null) {
                zzqqVar.zzaru();
                zza(zzqqVar, null, this.Aj.get(((zzqo.zza) zzqqVar).zzaqv()).zzaqy());
                this.BF.remove(zzqqVar);
            } else if (zzqqVar.zzars()) {
                this.BF.remove(zzqqVar);
            }
        }
    }

    public void zzauf() {
        for (zzqq zzqqVar : (zzqq[]) this.BF.toArray(BE)) {
            zzqqVar.zzab(ym);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzqq<? extends Result> zzqqVar) {
        this.BF.add(zzqqVar);
        zzqqVar.zza(this.BG);
    }
}
