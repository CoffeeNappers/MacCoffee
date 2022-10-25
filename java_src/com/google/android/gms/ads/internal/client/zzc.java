package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.internal.client.zzq;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class zzc extends zzq.zza {
    private final AdListener zzayk;

    public zzc(AdListener adListener) {
        this.zzayk = adListener;
    }

    @Override // com.google.android.gms.ads.internal.client.zzq
    public void onAdClosed() {
        this.zzayk.onAdClosed();
    }

    @Override // com.google.android.gms.ads.internal.client.zzq
    public void onAdFailedToLoad(int i) {
        this.zzayk.onAdFailedToLoad(i);
    }

    @Override // com.google.android.gms.ads.internal.client.zzq
    public void onAdLeftApplication() {
        this.zzayk.onAdLeftApplication();
    }

    @Override // com.google.android.gms.ads.internal.client.zzq
    public void onAdLoaded() {
        this.zzayk.onAdLoaded();
    }

    @Override // com.google.android.gms.ads.internal.client.zzq
    public void onAdOpened() {
        this.zzayk.onAdOpened();
    }
}
