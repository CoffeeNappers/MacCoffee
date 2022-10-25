package com.google.android.gms.internal;

import android.app.Activity;
import android.view.View;
import android.view.ViewTreeObserver;
@zzji
/* loaded from: classes.dex */
public final class zzlp {
    private final View mView;
    private Activity zzcxl;
    private boolean zzcxm;
    private boolean zzcxn;
    private boolean zzcxo;
    private ViewTreeObserver.OnGlobalLayoutListener zzcxp;
    private ViewTreeObserver.OnScrollChangedListener zzcxq;

    public zzlp(Activity activity, View view, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener onScrollChangedListener) {
        this.zzcxl = activity;
        this.mView = view;
        this.zzcxp = onGlobalLayoutListener;
        this.zzcxq = onScrollChangedListener;
    }

    private void zzwn() {
        if (!this.zzcxm) {
            if (this.zzcxp != null) {
                if (this.zzcxl != null) {
                    com.google.android.gms.ads.internal.zzu.zzgm().zza(this.zzcxl, this.zzcxp);
                }
                com.google.android.gms.ads.internal.zzu.zzhk().zza(this.mView, this.zzcxp);
            }
            if (this.zzcxq != null) {
                if (this.zzcxl != null) {
                    com.google.android.gms.ads.internal.zzu.zzgm().zza(this.zzcxl, this.zzcxq);
                }
                com.google.android.gms.ads.internal.zzu.zzhk().zza(this.mView, this.zzcxq);
            }
            this.zzcxm = true;
        }
    }

    private void zzwo() {
        if (this.zzcxl != null && this.zzcxm) {
            if (this.zzcxp != null && this.zzcxl != null) {
                com.google.android.gms.ads.internal.zzu.zzgo().zzb(this.zzcxl, this.zzcxp);
            }
            if (this.zzcxq != null && this.zzcxl != null) {
                com.google.android.gms.ads.internal.zzu.zzgm().zzb(this.zzcxl, this.zzcxq);
            }
            this.zzcxm = false;
        }
    }

    public void onAttachedToWindow() {
        this.zzcxn = true;
        if (this.zzcxo) {
            zzwn();
        }
    }

    public void onDetachedFromWindow() {
        this.zzcxn = false;
        zzwo();
    }

    public void zzl(Activity activity) {
        this.zzcxl = activity;
    }

    public void zzwl() {
        this.zzcxo = true;
        if (this.zzcxn) {
            zzwn();
        }
    }

    public void zzwm() {
        this.zzcxo = false;
        zzwo();
    }
}
