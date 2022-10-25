package com.google.android.gms.internal;

import android.os.Build;
import android.os.ConditionVariable;
import com.google.android.gms.clearcut.zza;
import com.google.android.gms.internal.zzae;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadLocalRandom;
/* loaded from: classes2.dex */
public class zzap {
    private static final ConditionVariable zzage = new ConditionVariable();
    protected static volatile com.google.android.gms.clearcut.zza zzagf = null;
    private static volatile Random zzagh = null;
    private zzbc zzagd;
    protected Boolean zzagg;

    public zzap(zzbc zzbcVar) {
        this.zzagd = zzbcVar;
        zza(zzbcVar.zzcm());
    }

    private void zza(Executor executor) {
        executor.execute(new Runnable() { // from class: com.google.android.gms.internal.zzap.1
            @Override // java.lang.Runnable
            public void run() {
                if (zzap.this.zzagg != null) {
                    return;
                }
                synchronized (zzap.zzage) {
                    if (zzap.this.zzagg != null) {
                        return;
                    }
                    boolean booleanValue = zzdr.zzbhl.get().booleanValue();
                    if (booleanValue) {
                        zzap.zzagf = new com.google.android.gms.clearcut.zza(zzap.this.zzagd.getContext(), "ADSHIELD", null);
                    }
                    zzap.this.zzagg = Boolean.valueOf(booleanValue);
                    zzap.zzage.open();
                }
            }
        });
    }

    private static Random zzax() {
        if (zzagh == null) {
            synchronized (zzap.class) {
                if (zzagh == null) {
                    zzagh = new Random();
                }
            }
        }
        return zzagh;
    }

    public void zza(int i, int i2, long j) throws IOException {
        try {
            zzage.block();
            if (!this.zzagg.booleanValue() || zzagf == null || !this.zzagd.zzcs()) {
                return;
            }
            zzae.zza zzaVar = new zzae.zza();
            zzaVar.zzcs = this.zzagd.getContext().getPackageName();
            zzaVar.zzct = Long.valueOf(j);
            zza.C0046zza zzm = zzagf.zzm(zzasa.zzf(zzaVar));
            zzm.zzfm(i2);
            zzm.zzfl(i);
            zzm.zze(this.zzagd.zzcq());
        } catch (Exception e) {
        }
    }

    public int zzaw() {
        try {
            return Build.VERSION.SDK_INT >= 21 ? ThreadLocalRandom.current().nextInt() : zzax().nextInt();
        } catch (RuntimeException e) {
            return zzax().nextInt();
        }
    }
}
