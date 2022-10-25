package com.google.android.gms.internal;

import android.content.Context;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
@zzji
/* loaded from: classes.dex */
public abstract class zzit extends zzkw {
    protected final Context mContext;
    protected final Object zzako;
    protected final zziu.zza zzcge;
    protected final zzko.zza zzcgf;
    protected AdResponseParcel zzcgg;
    protected final Object zzcgi;

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public static final class zza extends Exception {
        private final int zzcgw;

        public zza(String str, int i) {
            super(str);
            this.zzcgw = i;
        }

        public int getErrorCode() {
            return this.zzcgw;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzit(Context context, zzko.zza zzaVar, zziu.zza zzaVar2) {
        super(true);
        this.zzako = new Object();
        this.zzcgi = new Object();
        this.mContext = context;
        this.zzcgf = zzaVar;
        this.zzcgg = zzaVar.zzcsu;
        this.zzcge = zzaVar2;
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
    }

    protected abstract zzko zzap(int i);

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        synchronized (this.zzako) {
            zzkx.zzdg("AdRendererBackgroundTask started.");
            int i = this.zzcgf.errorCode;
            try {
                zzh(SystemClock.elapsedRealtime());
            } catch (zza e) {
                int errorCode = e.getErrorCode();
                if (errorCode == 3 || errorCode == -1) {
                    zzkx.zzdh(e.getMessage());
                } else {
                    zzkx.zzdi(e.getMessage());
                }
                if (this.zzcgg == null) {
                    this.zzcgg = new AdResponseParcel(errorCode);
                } else {
                    this.zzcgg = new AdResponseParcel(errorCode, this.zzcgg.zzbvq);
                }
                zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzit.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzit.this.onStop();
                    }
                });
                i = errorCode;
            }
            final zzko zzap = zzap(i);
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzit.2
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzit.this.zzako) {
                        zzit.this.zzn(zzap);
                    }
                }
            });
        }
    }

    protected abstract void zzh(long j) throws zza;

    protected void zzn(zzko zzkoVar) {
        this.zzcge.zzb(zzkoVar);
    }
}
