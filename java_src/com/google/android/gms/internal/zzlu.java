package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzlu {
    private final Object zzcyo = new Object();
    private final List<Runnable> zzcyp = new ArrayList();
    private final List<Runnable> zzcyq = new ArrayList();
    private boolean zzcyr = false;

    private void zze(Runnable runnable) {
        zzla.zza(runnable);
    }

    private void zzf(Runnable runnable) {
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(runnable);
    }

    public void zzc(Runnable runnable) {
        synchronized (this.zzcyo) {
            if (this.zzcyr) {
                zze(runnable);
            } else {
                this.zzcyp.add(runnable);
            }
        }
    }

    public void zzd(Runnable runnable) {
        synchronized (this.zzcyo) {
            if (this.zzcyr) {
                zzf(runnable);
            } else {
                this.zzcyq.add(runnable);
            }
        }
    }

    public void zzwt() {
        synchronized (this.zzcyo) {
            if (this.zzcyr) {
                return;
            }
            for (Runnable runnable : this.zzcyp) {
                zze(runnable);
            }
            for (Runnable runnable2 : this.zzcyq) {
                zzf(runnable2);
            }
            this.zzcyp.clear();
            this.zzcyq.clear();
            this.zzcyr = true;
        }
    }
}
