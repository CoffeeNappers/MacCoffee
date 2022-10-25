package com.google.android.gms.internal;

import android.content.Context;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.internal.zzgh;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzlw;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zzja {
    private final Context mContext;
    private final com.google.android.gms.ads.internal.zzq zzbnr;
    private final zzav zzbnx;
    private final zzko.zza zzcgf;
    private zzgf zzchm;
    private zzgh.zze zzchn;
    private zzge zzcho;
    private boolean zzchp;
    private static final long zzchj = TimeUnit.SECONDS.toMillis(60);
    private static final Object zzaox = new Object();
    private static boolean zzchk = false;
    private static zzgh zzchl = null;

    /* loaded from: classes2.dex */
    public static abstract class zza {
        public abstract void zze(zzgi zzgiVar);

        public void zzsr() {
        }
    }

    public zzja(Context context, zzko.zza zzaVar, com.google.android.gms.ads.internal.zzq zzqVar, zzav zzavVar) {
        this.zzchp = false;
        this.mContext = context;
        this.zzcgf = zzaVar;
        this.zzbnr = zzqVar;
        this.zzbnx = zzavVar;
        this.zzchp = zzdr.zzbiz.get().booleanValue();
    }

    public static String zza(zzko.zza zzaVar, String str) {
        String valueOf = String.valueOf(zzaVar.zzcsu.zzcbo.indexOf(UriUtil.HTTPS_SCHEME) == 0 ? "https:" : "http:");
        String valueOf2 = String.valueOf(str);
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    private void zzsj() {
        synchronized (zzaox) {
            if (!zzchk) {
                zzchl = new zzgh(this.mContext.getApplicationContext() != null ? this.mContext.getApplicationContext() : this.mContext, this.zzcgf.zzcmx.zzari, zza(this.zzcgf, zzdr.zzbix.get()), new zzlg<zzge>() { // from class: com.google.android.gms.internal.zzja.3
                    @Override // com.google.android.gms.internal.zzlg
                    /* renamed from: zza */
                    public void zzd(zzge zzgeVar) {
                        zzgeVar.zza(zzja.this.zzbnr, zzja.this.zzbnr, zzja.this.zzbnr, zzja.this.zzbnr, false, null, null, null, null);
                    }
                }, new zzgh.zzb());
                zzchk = true;
            }
        }
    }

    private void zzsk() {
        this.zzchn = new zzgh.zze(zzsp().zzc(this.zzbnx));
    }

    private void zzsl() {
        this.zzchm = new zzgf();
    }

    private void zzsm() throws CancellationException, ExecutionException, InterruptedException, TimeoutException {
        this.zzcho = zzsn().zza(this.mContext, this.zzcgf.zzcmx.zzari, zza(this.zzcgf, zzdr.zzbix.get()), this.zzbnx, this.zzbnr.zzec()).get(zzchj, TimeUnit.MILLISECONDS);
        this.zzcho.zza(this.zzbnr, this.zzbnr, this.zzbnr, this.zzbnr, false, null, null, null, null);
    }

    public void zza(final zza zzaVar) {
        if (this.zzchp) {
            zzgh.zze zzsq = zzsq();
            if (zzsq == null) {
                zzkx.zzdi("SharedJavascriptEngine not initialized");
                return;
            } else {
                zzsq.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzja.1
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zzb */
                    public void zzd(zzgi zzgiVar) {
                        zzaVar.zze(zzgiVar);
                    }
                }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzja.2
                    @Override // com.google.android.gms.internal.zzlw.zza
                    public void run() {
                        zzaVar.zzsr();
                    }
                });
                return;
            }
        }
        zzge zzso = zzso();
        if (zzso == null) {
            zzkx.zzdi("JavascriptEngine not initialized");
        } else {
            zzaVar.zze(zzso);
        }
    }

    public void zzsh() {
        if (this.zzchp) {
            zzsj();
        } else {
            zzsl();
        }
    }

    public void zzsi() throws CancellationException, ExecutionException, InterruptedException, TimeoutException {
        if (this.zzchp) {
            zzsk();
        } else {
            zzsm();
        }
    }

    protected zzgf zzsn() {
        return this.zzchm;
    }

    protected zzge zzso() {
        return this.zzcho;
    }

    protected zzgh zzsp() {
        return zzchl;
    }

    protected zzgh.zze zzsq() {
        return this.zzchn;
    }
}
