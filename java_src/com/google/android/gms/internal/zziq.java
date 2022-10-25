package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzme;
import java.util.concurrent.atomic.AtomicBoolean;
@zzji
/* loaded from: classes.dex */
public abstract class zziq implements zzld<Void>, zzme.zza {
    protected final Context mContext;
    protected final zzmd zzbnz;
    protected final zziu.zza zzcge;
    protected final zzko.zza zzcgf;
    protected AdResponseParcel zzcgg;
    private Runnable zzcgh;
    protected final Object zzcgi = new Object();
    private AtomicBoolean zzcgj = new AtomicBoolean(true);

    /* JADX INFO: Access modifiers changed from: protected */
    public zziq(Context context, zzko.zza zzaVar, zzmd zzmdVar, zziu.zza zzaVar2) {
        this.mContext = context;
        this.zzcgf = zzaVar;
        this.zzcgg = this.zzcgf.zzcsu;
        this.zzbnz = zzmdVar;
        this.zzcge = zzaVar2;
    }

    private zzko zzap(int i) {
        AdRequestInfoParcel adRequestInfoParcel = this.zzcgf.zzcmx;
        return new zzko(adRequestInfoParcel.zzcju, this.zzbnz, this.zzcgg.zzbvk, i, this.zzcgg.zzbvl, this.zzcgg.zzcld, this.zzcgg.orientation, this.zzcgg.zzbvq, adRequestInfoParcel.zzcjx, this.zzcgg.zzclb, null, null, null, null, null, this.zzcgg.zzclc, this.zzcgf.zzarm, this.zzcgg.zzcla, this.zzcgf.zzcso, this.zzcgg.zzclf, this.zzcgg.zzclg, this.zzcgf.zzcsi, null, this.zzcgg.zzclq, this.zzcgg.zzclr, this.zzcgg.zzcls, this.zzcgg.zzclt, this.zzcgg.zzclu, null, this.zzcgg.zzbvn, this.zzcgg.zzclx);
    }

    @Override // com.google.android.gms.internal.zzld
    public void cancel() {
        if (!this.zzcgj.getAndSet(false)) {
            return;
        }
        this.zzbnz.stopLoading();
        com.google.android.gms.ads.internal.zzu.zzgo().zzl(this.zzbnz);
        zzao(-1);
        zzlb.zzcvl.removeCallbacks(this.zzcgh);
    }

    @Override // com.google.android.gms.internal.zzme.zza
    public void zza(zzmd zzmdVar, boolean z) {
        int i = 0;
        zzkx.zzdg("WebView finished loading.");
        if (!this.zzcgj.getAndSet(false)) {
            return;
        }
        if (z) {
            i = zzry();
        }
        zzao(i);
        zzlb.zzcvl.removeCallbacks(this.zzcgh);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzao(int i) {
        if (i != -2) {
            this.zzcgg = new AdResponseParcel(i, this.zzcgg.zzbvq);
        }
        this.zzbnz.zzwx();
        this.zzcge.zzb(zzap(i));
    }

    @Override // com.google.android.gms.internal.zzld
    /* renamed from: zzrw */
    public final Void zzrz() {
        com.google.android.gms.common.internal.zzaa.zzhs("Webview render task needs to be called on UI thread.");
        this.zzcgh = new Runnable() { // from class: com.google.android.gms.internal.zziq.1
            @Override // java.lang.Runnable
            public void run() {
                if (!zziq.this.zzcgj.get()) {
                    return;
                }
                zzkx.e("Timed out waiting for WebView to finish loading.");
                zziq.this.cancel();
            }
        };
        zzlb.zzcvl.postDelayed(this.zzcgh, zzdr.zzbhk.get().longValue());
        zzrx();
        return null;
    }

    protected abstract void zzrx();

    protected int zzry() {
        return -2;
    }
}
