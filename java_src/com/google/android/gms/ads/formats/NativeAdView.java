package com.google.android.gms.ads.formats;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzei;
/* loaded from: classes.dex */
public abstract class NativeAdView extends FrameLayout {
    private final FrameLayout zzald;
    private final zzei zzale;

    public NativeAdView(Context context) {
        super(context);
        this.zzald = zzd(context);
        this.zzale = zzdz();
    }

    public NativeAdView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.zzald = zzd(context);
        this.zzale = zzdz();
    }

    public NativeAdView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.zzald = zzd(context);
        this.zzale = zzdz();
    }

    @TargetApi(21)
    public NativeAdView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.zzald = zzd(context);
        this.zzale = zzdz();
    }

    private FrameLayout zzd(Context context) {
        FrameLayout zze = zze(context);
        zze.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(zze);
        return zze;
    }

    private zzei zzdz() {
        zzaa.zzb(this.zzald, "createDelegate must be called after mOverlayFrame has been created");
        return zzm.zzks().zza(this.zzald.getContext(), this, this.zzald);
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
        super.bringChildToFront(this.zzald);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void bringChildToFront(View view) {
        super.bringChildToFront(view);
        if (this.zzald != view) {
            super.bringChildToFront(this.zzald);
        }
    }

    public void destroy() {
        try {
            this.zzale.destroy();
        } catch (RemoteException e) {
            zzb.zzb("Unable to destroy native ad view", e);
        }
    }

    @Override // android.view.ViewGroup
    public void removeAllViews() {
        super.removeAllViews();
        super.addView(this.zzald);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        if (this.zzald == view) {
            return;
        }
        super.removeView(view);
    }

    public void setNativeAd(NativeAd nativeAd) {
        try {
            this.zzale.zze((zzd) nativeAd.zzdy());
        } catch (RemoteException e) {
            zzb.zzb("Unable to call setNativeAd on delegate", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(String str, View view) {
        try {
            this.zzale.zzc(str, zze.zzac(view));
        } catch (RemoteException e) {
            zzb.zzb("Unable to call setAssetView on delegate", e);
        }
    }

    FrameLayout zze(Context context) {
        return new FrameLayout(context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public View zzu(String str) {
        try {
            zzd zzaw = this.zzale.zzaw(str);
            if (zzaw != null) {
                return (View) zze.zzae(zzaw);
            }
        } catch (RemoteException e) {
            zzb.zzb("Unable to call getAssetView on delegate", e);
        }
        return null;
    }
}
