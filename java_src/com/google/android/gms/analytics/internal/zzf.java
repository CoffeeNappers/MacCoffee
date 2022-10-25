package com.google.android.gms.analytics.internal;

import android.content.Context;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.gms.analytics.GoogleAnalytics;
import java.lang.Thread;
/* loaded from: classes.dex */
public class zzf {
    private static volatile zzf cT;
    private final Context cU;
    private final zzr cV;
    private final zzaf cW;
    private final com.google.android.gms.analytics.zzi cX;
    private final zzb cY;
    private final zzv cZ;
    private final zzap da;
    private final zzai db;
    private final GoogleAnalytics dc;
    private final zzn dd;
    private final zza de;
    private final zzk df;
    private final zzu dg;
    private final Context mContext;
    private final com.google.android.gms.common.util.zze zzaql;

    protected zzf(zzg zzgVar) {
        Context applicationContext = zzgVar.getApplicationContext();
        com.google.android.gms.common.internal.zzaa.zzb(applicationContext, "Application context can't be null");
        Context zzacl = zzgVar.zzacl();
        com.google.android.gms.common.internal.zzaa.zzy(zzacl);
        this.mContext = applicationContext;
        this.cU = zzacl;
        this.zzaql = zzgVar.zzh(this);
        this.cV = zzgVar.zzg(this);
        zzaf zzf = zzgVar.zzf(this);
        zzf.initialize();
        this.cW = zzf;
        zzacb();
        zzaf zzaca = zzaca();
        String str = zze.VERSION;
        zzaca.zzeu(new StringBuilder(String.valueOf(str).length() + TsExtractor.TS_STREAM_TYPE_SPLICE_INFO).append("Google Analytics ").append(str).append(" is starting up. To enable debug logging on a device run:\n  adb shell setprop log.tag.GAv4 DEBUG\n  adb logcat -s GAv4").toString());
        zzai zzq = zzgVar.zzq(this);
        zzq.initialize();
        this.db = zzq;
        zzap zze = zzgVar.zze(this);
        zze.initialize();
        this.da = zze;
        zzb zzl = zzgVar.zzl(this);
        zzn zzd = zzgVar.zzd(this);
        zza zzc = zzgVar.zzc(this);
        zzk zzb = zzgVar.zzb(this);
        zzu zza = zzgVar.zza(this);
        com.google.android.gms.analytics.zzi zzax = zzgVar.zzax(applicationContext);
        zzax.zza(zzack());
        this.cX = zzax;
        GoogleAnalytics zzi = zzgVar.zzi(this);
        zzd.initialize();
        this.dd = zzd;
        zzc.initialize();
        this.de = zzc;
        zzb.initialize();
        this.df = zzb;
        zza.initialize();
        this.dg = zza;
        zzv zzp = zzgVar.zzp(this);
        zzp.initialize();
        this.cZ = zzp;
        zzl.initialize();
        this.cY = zzl;
        zzacb();
        zzi.initialize();
        this.dc = zzi;
        zzl.start();
    }

    private void zza(zzd zzdVar) {
        com.google.android.gms.common.internal.zzaa.zzb(zzdVar, "Analytics service not created/initialized");
        com.google.android.gms.common.internal.zzaa.zzb(zzdVar.isInitialized(), "Analytics service not initialized");
    }

    public static zzf zzaw(Context context) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        if (cT == null) {
            synchronized (zzf.class) {
                if (cT == null) {
                    com.google.android.gms.common.util.zze zzayl = com.google.android.gms.common.util.zzh.zzayl();
                    long elapsedRealtime = zzayl.elapsedRealtime();
                    zzf zzfVar = new zzf(new zzg(context));
                    cT = zzfVar;
                    GoogleAnalytics.zzzd();
                    long elapsedRealtime2 = zzayl.elapsedRealtime() - elapsedRealtime;
                    long longValue = zzy.fb.get().longValue();
                    if (elapsedRealtime2 > longValue) {
                        zzfVar.zzaca().zzc("Slow initialization (ms)", Long.valueOf(elapsedRealtime2), Long.valueOf(longValue));
                    }
                }
            }
        }
        return cT;
    }

    public Context getContext() {
        return this.mContext;
    }

    public com.google.android.gms.common.util.zze zzabz() {
        return this.zzaql;
    }

    public zzaf zzaca() {
        zza(this.cW);
        return this.cW;
    }

    public zzr zzacb() {
        return this.cV;
    }

    public com.google.android.gms.analytics.zzi zzacc() {
        com.google.android.gms.common.internal.zzaa.zzy(this.cX);
        return this.cX;
    }

    public zzv zzacd() {
        zza(this.cZ);
        return this.cZ;
    }

    public zzai zzace() {
        zza(this.db);
        return this.db;
    }

    public zzk zzach() {
        zza(this.df);
        return this.df;
    }

    public zzu zzaci() {
        return this.dg;
    }

    protected Thread.UncaughtExceptionHandler zzack() {
        return new Thread.UncaughtExceptionHandler() { // from class: com.google.android.gms.analytics.internal.zzf.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread, Throwable th) {
                zzaf zzacm = zzf.this.zzacm();
                if (zzacm != null) {
                    zzacm.zze("Job execution failed", th);
                }
            }
        };
    }

    public Context zzacl() {
        return this.cU;
    }

    public zzaf zzacm() {
        return this.cW;
    }

    public GoogleAnalytics zzacn() {
        com.google.android.gms.common.internal.zzaa.zzy(this.dc);
        com.google.android.gms.common.internal.zzaa.zzb(this.dc.isInitialized(), "Analytics instance not initialized");
        return this.dc;
    }

    public zzai zzaco() {
        if (this.db == null || !this.db.isInitialized()) {
            return null;
        }
        return this.db;
    }

    public zza zzacp() {
        zza(this.de);
        return this.de;
    }

    public zzn zzacq() {
        zza(this.dd);
        return this.dd;
    }

    public zzb zzzg() {
        zza(this.cY);
        return this.cY;
    }

    public zzap zzzh() {
        zza(this.da);
        return this.da;
    }

    public void zzzx() {
        com.google.android.gms.analytics.zzi.zzzx();
    }
}
