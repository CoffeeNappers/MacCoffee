package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzo extends AdListener {
    private final Object lock = new Object();
    private AdListener zzbaq;

    @Override // com.google.android.gms.ads.AdListener
    public void onAdClosed() {
        synchronized (this.lock) {
            if (this.zzbaq != null) {
                this.zzbaq.onAdClosed();
            }
        }
    }

    @Override // com.google.android.gms.ads.AdListener
    public void onAdFailedToLoad(int i) {
        synchronized (this.lock) {
            if (this.zzbaq != null) {
                this.zzbaq.onAdFailedToLoad(i);
            }
        }
    }

    @Override // com.google.android.gms.ads.AdListener
    public void onAdLeftApplication() {
        synchronized (this.lock) {
            if (this.zzbaq != null) {
                this.zzbaq.onAdLeftApplication();
            }
        }
    }

    @Override // com.google.android.gms.ads.AdListener
    public void onAdLoaded() {
        synchronized (this.lock) {
            if (this.zzbaq != null) {
                this.zzbaq.onAdLoaded();
            }
        }
    }

    @Override // com.google.android.gms.ads.AdListener
    public void onAdOpened() {
        synchronized (this.lock) {
            if (this.zzbaq != null) {
                this.zzbaq.onAdOpened();
            }
        }
    }

    public void zza(AdListener adListener) {
        synchronized (this.lock) {
            this.zzbaq = adListener;
        }
    }
}
