package com.google.android.gms.ads.internal;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import com.google.android.gms.internal.zzaq;
import com.google.android.gms.internal.zzau;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzla;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzi implements zzaq, Runnable {
    private zzv zzaly;
    private final List<Object[]> zzani = new Vector();
    private final AtomicReference<zzaq> zzanj = new AtomicReference<>();
    CountDownLatch zzank = new CountDownLatch(1);

    public zzi(zzv zzvVar) {
        this.zzaly = zzvVar;
        if (com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            zzla.zza(this);
        } else {
            run();
        }
    }

    private void zzfi() {
        if (this.zzani.isEmpty()) {
            return;
        }
        for (Object[] objArr : this.zzani) {
            if (objArr.length == 1) {
                this.zzanj.get().zza((MotionEvent) objArr[0]);
            } else if (objArr.length == 3) {
                this.zzanj.get().zza(((Integer) objArr[0]).intValue(), ((Integer) objArr[1]).intValue(), ((Integer) objArr[2]).intValue());
            }
        }
        this.zzani.clear();
    }

    private Context zzg(Context context) {
        Context applicationContext;
        return (zzdr.zzbdj.get().booleanValue() && (applicationContext = context.getApplicationContext()) != null) ? applicationContext : context;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            zza(zzd(this.zzaly.zzari.zzda, zzg(this.zzaly.zzahs), !zzdr.zzbef.get().booleanValue() || this.zzaly.zzari.zzcyc));
        } finally {
            this.zzank.countDown();
            this.zzaly = null;
        }
    }

    @Override // com.google.android.gms.internal.zzaq
    public String zza(Context context, String str, View view) {
        zzaq zzaqVar;
        if (!zzfh() || (zzaqVar = this.zzanj.get()) == null) {
            return "";
        }
        zzfi();
        return zzaqVar.zza(zzg(context), str, view);
    }

    public String zza(Context context, byte[] bArr) {
        zzaq zzaqVar;
        if (!zzfh() || (zzaqVar = this.zzanj.get()) == null) {
            return "";
        }
        zzfi();
        return zzaqVar.zzb(zzg(context));
    }

    @Override // com.google.android.gms.internal.zzaq
    public void zza(int i, int i2, int i3) {
        zzaq zzaqVar = this.zzanj.get();
        if (zzaqVar == null) {
            this.zzani.add(new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3)});
            return;
        }
        zzfi();
        zzaqVar.zza(i, i2, i3);
    }

    @Override // com.google.android.gms.internal.zzaq
    public void zza(MotionEvent motionEvent) {
        zzaq zzaqVar = this.zzanj.get();
        if (zzaqVar == null) {
            this.zzani.add(new Object[]{motionEvent});
            return;
        }
        zzfi();
        zzaqVar.zza(motionEvent);
    }

    protected void zza(zzaq zzaqVar) {
        this.zzanj.set(zzaqVar);
    }

    @Override // com.google.android.gms.internal.zzaq
    public String zzb(Context context) {
        return zza(context, null);
    }

    protected zzaq zzd(String str, Context context, boolean z) {
        return zzau.zza(str, context, z);
    }

    protected boolean zzfh() {
        try {
            this.zzank.await();
            return true;
        } catch (InterruptedException e) {
            zzkx.zzc("Interrupted during GADSignals creation.", e);
            return false;
        }
    }
}
