package com.google.android.gms.measurement.internal;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
/* loaded from: classes2.dex */
public class zzai extends zzaa {
    private final zzf avR;
    private boolean ej;
    private final AlarmManager ek;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzai(zzx zzxVar) {
        super(zzxVar);
        this.ek = (AlarmManager) getContext().getSystemService("alarm");
        this.avR = new zzf(zzxVar) { // from class: com.google.android.gms.measurement.internal.zzai.1
            @Override // com.google.android.gms.measurement.internal.zzf
            public void run() {
                zzai.this.zzbzg();
            }
        };
    }

    private PendingIntent zzafo() {
        Intent intent = new Intent();
        Context context = getContext();
        zzbwd().zzayi();
        Intent className = intent.setClassName(context, "com.google.android.gms.measurement.AppMeasurementReceiver");
        className.setAction("com.google.android.gms.measurement.UPLOAD");
        return PendingIntent.getBroadcast(getContext(), 0, className, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzbzg() {
        Intent intent = new Intent();
        Context context = getContext();
        zzbwd().zzayi();
        Intent className = intent.setClassName(context, "com.google.android.gms.measurement.AppMeasurementReceiver");
        className.setAction("com.google.android.gms.measurement.UPLOAD");
        getContext().sendBroadcast(className);
    }

    public void cancel() {
        zzacj();
        this.ej = false;
        this.ek.cancel(zzafo());
        this.avR.cancel();
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

    public void zzx(long j) {
        zzacj();
        if (!zzbwd().zzayi() && !zzu.zzh(getContext(), false)) {
            zzbwb().zzbxd().log("Receiver not registered/enabled");
        }
        if (!zzbwd().zzayi() && !zzaf.zzi(getContext(), false)) {
            zzbwb().zzbxd().log("Service not registered/enabled");
        }
        cancel();
        long elapsedRealtime = zzabz().elapsedRealtime() + j;
        this.ej = true;
        if (j < zzbwd().zzbvi() && !this.avR.zzfy()) {
            this.avR.zzx(j);
        }
        this.ek.setInexactRepeating(2, elapsedRealtime, Math.max(zzbwd().zzbvj(), j), zzafo());
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
        this.ek.cancel(zzafo());
    }
}
