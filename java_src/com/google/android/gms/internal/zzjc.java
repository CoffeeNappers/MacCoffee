package com.google.android.gms.internal;

import android.content.Context;
import android.view.ViewTreeObserver;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzme;
import java.lang.ref.WeakReference;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzjc {
    private final Context mContext;
    private final zzdz zzalt;
    private final com.google.android.gms.ads.internal.zzq zzbnr;
    private final zzav zzbnx;
    private final zzko.zza zzcgf;
    private ViewTreeObserver.OnGlobalLayoutListener zzcir;
    private ViewTreeObserver.OnScrollChangedListener zzcis;
    private final Object zzako = new Object();
    private int zzasl = -1;
    private int zzasm = -1;
    private zzlm zzasn = new zzlm(200);

    public zzjc(Context context, zzav zzavVar, zzko.zza zzaVar, zzdz zzdzVar, com.google.android.gms.ads.internal.zzq zzqVar) {
        this.mContext = context;
        this.zzbnx = zzavVar;
        this.zzcgf = zzaVar;
        this.zzalt = zzdzVar;
        this.zzbnr = zzqVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ViewTreeObserver.OnGlobalLayoutListener zza(final WeakReference<zzmd> weakReference) {
        if (this.zzcir == null) {
            this.zzcir = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.google.android.gms.internal.zzjc.3
                @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                public void onGlobalLayout() {
                    zzjc.this.zza((WeakReference<zzmd>) weakReference, false);
                }
            };
        }
        return this.zzcir;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(WeakReference<zzmd> weakReference, boolean z) {
        zzmd zzmdVar;
        if (weakReference == null || (zzmdVar = weakReference.get()) == null || zzmdVar.getView() == null) {
            return;
        }
        if (z && !this.zzasn.tryAcquire()) {
            return;
        }
        int[] iArr = new int[2];
        zzmdVar.getView().getLocationOnScreen(iArr);
        int zzc = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, iArr[0]);
        int zzc2 = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, iArr[1]);
        synchronized (this.zzako) {
            if (this.zzasl != zzc || this.zzasm != zzc2) {
                this.zzasl = zzc;
                this.zzasm = zzc2;
                zzmdVar.zzxc().zza(this.zzasl, this.zzasm, !z);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ViewTreeObserver.OnScrollChangedListener zzb(final WeakReference<zzmd> weakReference) {
        if (this.zzcis == null) {
            this.zzcis = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.google.android.gms.internal.zzjc.4
                @Override // android.view.ViewTreeObserver.OnScrollChangedListener
                public void onScrollChanged() {
                    zzjc.this.zza((WeakReference<zzmd>) weakReference, true);
                }
            };
        }
        return this.zzcis;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzj(zzmd zzmdVar) {
        zzme zzxc = zzmdVar.zzxc();
        zzxc.zza("/video", zzfd.zzbpw);
        zzxc.zza("/videoMeta", zzfd.zzbpx);
        zzxc.zza("/precache", zzfd.zzbpy);
        zzxc.zza("/delayPageLoaded", zzfd.zzbqb);
        zzxc.zza("/instrument", zzfd.zzbpz);
        zzxc.zza("/log", zzfd.zzbpr);
        zzxc.zza("/videoClicked", zzfd.zzbps);
        zzxc.zza("/trackActiveViewUnit", new zzfe() { // from class: com.google.android.gms.internal.zzjc.2
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar2, Map<String, String> map) {
                zzjc.this.zzbnr.zzfu();
            }
        });
    }

    public zzlt<zzmd> zzg(final JSONObject jSONObject) {
        final zzlq zzlqVar = new zzlq();
        com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzjc.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    final zzmd zzsx = zzjc.this.zzsx();
                    zzjc.this.zzbnr.zzc(zzsx);
                    WeakReference weakReference = new WeakReference(zzsx);
                    zzsx.zzxc().zza(zzjc.this.zza(weakReference), zzjc.this.zzb(weakReference));
                    zzjc.this.zzj(zzsx);
                    zzsx.zzxc().zza(new zzme.zzb() { // from class: com.google.android.gms.internal.zzjc.1.1
                        @Override // com.google.android.gms.internal.zzme.zzb
                        public void zzk(zzmd zzmdVar) {
                            zzsx.zza("google.afma.nativeAds.renderVideo", jSONObject);
                        }
                    });
                    zzsx.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.internal.zzjc.1.2
                        @Override // com.google.android.gms.internal.zzme.zza
                        public void zza(zzmd zzmdVar, boolean z) {
                            zzjc.this.zzbnr.zzfx();
                            zzlqVar.zzh(zzmdVar);
                        }
                    });
                    zzsx.loadUrl(zzja.zza(zzjc.this.zzcgf, zzdr.zzbiy.get()));
                } catch (Exception e) {
                    zzkx.zzc("Exception occurred while getting video view", e);
                    zzlqVar.zzh(null);
                }
            }
        });
        return zzlqVar;
    }

    zzmd zzsx() {
        return com.google.android.gms.ads.internal.zzu.zzgn().zza(this.mContext, AdSizeParcel.zzj(this.mContext), false, false, this.zzbnx, this.zzcgf.zzcmx.zzari, this.zzalt, null, this.zzbnr.zzec());
    }
}
