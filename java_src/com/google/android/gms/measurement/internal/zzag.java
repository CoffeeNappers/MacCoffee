package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.MainThread;
import android.support.annotation.WorkerThread;
import com.vkontakte.android.TimeUtils;
/* loaded from: classes2.dex */
public class zzag extends zzaa {
    protected long avM;
    private final zzf avN;
    private final zzf avO;
    private Handler mHandler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzag(zzx zzxVar) {
        super(zzxVar);
        this.avN = new zzf(this.aqw) { // from class: com.google.android.gms.measurement.internal.zzag.1
            @Override // com.google.android.gms.measurement.internal.zzf
            @WorkerThread
            public void run() {
                zzag.this.zzbze();
            }
        };
        this.avO = new zzf(this.aqw) { // from class: com.google.android.gms.measurement.internal.zzag.2
            @Override // com.google.android.gms.measurement.internal.zzf
            @WorkerThread
            public void run() {
                zzag.this.zzbzf();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzbn(long j) {
        zzzx();
        zzbzc();
        this.avN.cancel();
        this.avO.cancel();
        zzbwb().zzbxe().zzj("Activity resumed, time", Long.valueOf(j));
        this.avM = j;
        if (zzabz().currentTimeMillis() - zzbwc().atj.get() > zzbwc().atl.get()) {
            zzbwc().atk.set(true);
            zzbwc().atm.set(0L);
        }
        if (zzbwc().atk.get()) {
            this.avN.zzx(Math.max(0L, zzbwc().ati.get() - zzbwc().atm.get()));
        } else {
            this.avO.zzx(Math.max(0L, TimeUtils.HOUR - zzbwc().atm.get()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzbo(long j) {
        zzzx();
        zzbzc();
        this.avN.cancel();
        this.avO.cancel();
        zzbwb().zzbxe().zzj("Activity paused, time", Long.valueOf(j));
        if (this.avM != 0) {
            zzbwc().atm.set(zzbwc().atm.get() + (j - this.avM));
        }
        zzbwc().atl.set(zzabz().currentTimeMillis());
    }

    private void zzbzc() {
        synchronized (this) {
            if (this.mHandler == null) {
                this.mHandler = new Handler(Looper.getMainLooper());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzbzf() {
        zzzx();
        zzck(false);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @MainThread
    public void zzbzb() {
        final long elapsedRealtime = zzabz().elapsedRealtime();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzag.3
            @Override // java.lang.Runnable
            public void run() {
                zzag.this.zzbn(elapsedRealtime);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @MainThread
    public void zzbzd() {
        final long elapsedRealtime = zzabz().elapsedRealtime();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzag.4
            @Override // java.lang.Runnable
            public void run() {
                zzag.this.zzbo(elapsedRealtime);
            }
        });
    }

    @WorkerThread
    protected void zzbze() {
        zzzx();
        zzbwb().zzbxe().zzj("Session started, time", Long.valueOf(zzabz().elapsedRealtime()));
        zzbwc().atk.set(false);
        zzbvq().zzf("auto", "_s", new Bundle());
    }

    @WorkerThread
    public boolean zzck(boolean z) {
        zzzx();
        zzacj();
        long elapsedRealtime = zzabz().elapsedRealtime();
        if (this.avM == 0) {
            this.avM = elapsedRealtime - TimeUtils.HOUR;
        }
        long j = elapsedRealtime - this.avM;
        if (!z && j < 1000) {
            zzbwb().zzbxe().zzj("Screen exposed for less than 1000 ms. Event not sent. time", Long.valueOf(j));
            return false;
        }
        zzbwc().atm.set(j);
        zzbwb().zzbxe().zzj("Recording user engagement, ms", Long.valueOf(j));
        Bundle bundle = new Bundle();
        bundle.putLong("_et", j);
        zzad.zza(zzbvu().zzbyt(), bundle);
        zzbvq().zzf("auto", "_e", bundle);
        this.avM = elapsedRealtime;
        this.avO.cancel();
        this.avO.zzx(Math.max(0L, TimeUtils.HOUR - zzbwc().atm.get()));
        return true;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
