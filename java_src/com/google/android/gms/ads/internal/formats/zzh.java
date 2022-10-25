package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.view.View;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.ads.internal.zzq;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzhd;
import com.google.android.gms.internal.zzhe;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzmd;
import java.lang.ref.WeakReference;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzh extends zzj {
    private Object zzako;
    @Nullable
    private zzhd zzbnp;
    @Nullable
    private zzhe zzbnq;
    private final zzq zzbnr;
    @Nullable
    private zzi zzbns;
    private boolean zzbnt;

    private zzh(Context context, zzq zzqVar, zzav zzavVar, zzi.zza zzaVar) {
        super(context, zzqVar, null, zzavVar, null, zzaVar, null, null);
        this.zzbnt = false;
        this.zzako = new Object();
        this.zzbnr = zzqVar;
    }

    public zzh(Context context, zzq zzqVar, zzav zzavVar, zzhd zzhdVar, zzi.zza zzaVar) {
        this(context, zzqVar, zzavVar, zzaVar);
        this.zzbnp = zzhdVar;
    }

    public zzh(Context context, zzq zzqVar, zzav zzavVar, zzhe zzheVar, zzi.zza zzaVar) {
        this(context, zzqVar, zzavVar, zzaVar);
        this.zzbnq = zzheVar;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj
    @Nullable
    public zzb zza(View.OnClickListener onClickListener) {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj
    public void zza(View view, Map<String, WeakReference<View>> map, View.OnTouchListener onTouchListener, View.OnClickListener onClickListener) {
        synchronized (this.zzako) {
            this.zzbnt = true;
            try {
                if (this.zzbnp != null) {
                    this.zzbnp.zzl(com.google.android.gms.dynamic.zze.zzac(view));
                } else if (this.zzbnq != null) {
                    this.zzbnq.zzl(com.google.android.gms.dynamic.zze.zzac(view));
                }
            } catch (RemoteException e) {
                zzkx.zzc("Failed to call prepareAd", e);
            }
            this.zzbnt = false;
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj, com.google.android.gms.ads.internal.formats.zzi
    public void zza(View view, Map<String, WeakReference<View>> map, JSONObject jSONObject, View view2) {
        zzaa.zzhs("performClick must be called on the main UI thread.");
        synchronized (this.zzako) {
            if (this.zzbns != null) {
                this.zzbns.zza(view, map, jSONObject, view2);
                this.zzbnr.onAdClicked();
            } else {
                try {
                    if (this.zzbnp != null && !this.zzbnp.getOverrideClickHandling()) {
                        this.zzbnp.zzk(com.google.android.gms.dynamic.zze.zzac(view));
                        this.zzbnr.onAdClicked();
                    }
                    if (this.zzbnq != null && !this.zzbnq.getOverrideClickHandling()) {
                        this.zzbnq.zzk(com.google.android.gms.dynamic.zze.zzac(view));
                        this.zzbnr.onAdClicked();
                    }
                } catch (RemoteException e) {
                    zzkx.zzc("Failed to call performClick", e);
                }
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj, com.google.android.gms.ads.internal.formats.zzi
    public void zzb(View view, Map<String, WeakReference<View>> map) {
        zzaa.zzhs("recordImpression must be called on the main UI thread.");
        synchronized (this.zzako) {
            zzr(true);
            if (this.zzbns != null) {
                this.zzbns.zzb(view, map);
                this.zzbnr.recordImpression();
            } else {
                try {
                    if (this.zzbnp != null && !this.zzbnp.getOverrideImpressionRecording()) {
                        this.zzbnp.recordImpression();
                        this.zzbnr.recordImpression();
                    } else if (this.zzbnq != null && !this.zzbnq.getOverrideImpressionRecording()) {
                        this.zzbnq.recordImpression();
                        this.zzbnr.recordImpression();
                    }
                } catch (RemoteException e) {
                    zzkx.zzc("Failed to call recordImpression", e);
                }
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj, com.google.android.gms.ads.internal.formats.zzi
    public void zzc(View view, Map<String, WeakReference<View>> map) {
        synchronized (this.zzako) {
            try {
                if (this.zzbnp != null) {
                    this.zzbnp.zzm(com.google.android.gms.dynamic.zze.zzac(view));
                } else if (this.zzbnq != null) {
                    this.zzbnq.zzm(com.google.android.gms.dynamic.zze.zzac(view));
                }
            } catch (RemoteException e) {
                zzkx.zzc("Failed to call untrackView", e);
            }
        }
    }

    public void zzc(@Nullable zzi zziVar) {
        synchronized (this.zzako) {
            this.zzbns = zziVar;
        }
    }

    public boolean zzmv() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzbnt;
        }
        return z;
    }

    public zzi zzmw() {
        zzi zziVar;
        synchronized (this.zzako) {
            zziVar = this.zzbns;
        }
        return zziVar;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzj
    @Nullable
    public zzmd zzmx() {
        return null;
    }
}
