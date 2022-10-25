package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzalp {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final Map<zzalz, zzalf> bif = new HashMap();

    static {
        $assertionsDisabled = !zzalp.class.desiredAssertionStatus();
    }

    public void zza(zzalf zzalfVar) {
        zzalh.zza zzcxm = zzalfVar.zzcxm();
        zzalz zzcxl = zzalfVar.zzcxl();
        if ($assertionsDisabled || zzcxm == zzalh.zza.CHILD_ADDED || zzcxm == zzalh.zza.CHILD_CHANGED || zzcxm == zzalh.zza.CHILD_REMOVED) {
            if (!$assertionsDisabled && zzalfVar.zzcxl().zzczb()) {
                throw new AssertionError();
            }
            if (!this.bif.containsKey(zzcxl)) {
                this.bif.put(zzalfVar.zzcxl(), zzalfVar);
                return;
            }
            zzalf zzalfVar2 = this.bif.get(zzcxl);
            zzalh.zza zzcxm2 = zzalfVar2.zzcxm();
            if (zzcxm == zzalh.zza.CHILD_ADDED && zzcxm2 == zzalh.zza.CHILD_REMOVED) {
                this.bif.put(zzalfVar.zzcxl(), zzalf.zza(zzcxl, zzalfVar.zzcxj(), zzalfVar2.zzcxj()));
                return;
            } else if (zzcxm == zzalh.zza.CHILD_REMOVED && zzcxm2 == zzalh.zza.CHILD_ADDED) {
                this.bif.remove(zzcxl);
                return;
            } else if (zzcxm == zzalh.zza.CHILD_REMOVED && zzcxm2 == zzalh.zza.CHILD_CHANGED) {
                this.bif.put(zzcxl, zzalf.zzb(zzcxl, zzalfVar2.zzcxo()));
                return;
            } else if (zzcxm == zzalh.zza.CHILD_CHANGED && zzcxm2 == zzalh.zza.CHILD_ADDED) {
                this.bif.put(zzcxl, zzalf.zza(zzcxl, zzalfVar.zzcxj()));
                return;
            } else if (zzcxm == zzalh.zza.CHILD_CHANGED && zzcxm2 == zzalh.zza.CHILD_CHANGED) {
                this.bif.put(zzcxl, zzalf.zza(zzcxl, zzalfVar.zzcxj(), zzalfVar2.zzcxo()));
                return;
            } else {
                String valueOf = String.valueOf(zzalfVar);
                String valueOf2 = String.valueOf(zzalfVar2);
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 48 + String.valueOf(valueOf2).length()).append("Illegal combination of changes: ").append(valueOf).append(" occurred after ").append(valueOf2).toString());
            }
        }
        throw new AssertionError("Only child changes supported for tracking");
    }

    public List<zzalf> zzcyp() {
        return new ArrayList(this.bif.values());
    }
}
