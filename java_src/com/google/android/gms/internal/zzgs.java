package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import com.google.android.gms.internal.zzgu;
import com.google.android.gms.internal.zzhb;
@zzji
/* loaded from: classes.dex */
public final class zzgs extends zzhb.zza {
    private final Object zzako = new Object();
    private zzgu.zza zzbvy;
    private zzgr zzbvz;

    @Override // com.google.android.gms.internal.zzhb
    public void onAdClicked() {
        synchronized (this.zzako) {
            if (this.zzbvz != null) {
                this.zzbvz.zzes();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdClosed() {
        synchronized (this.zzako) {
            if (this.zzbvz != null) {
                this.zzbvz.zzet();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdFailedToLoad(int i) {
        synchronized (this.zzako) {
            if (this.zzbvy != null) {
                this.zzbvy.zzad(i == 3 ? 1 : 2);
                this.zzbvy = null;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdImpression() {
        synchronized (this.zzako) {
            if (this.zzbvz != null) {
                this.zzbvz.zzex();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdLeftApplication() {
        synchronized (this.zzako) {
            if (this.zzbvz != null) {
                this.zzbvz.zzeu();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdLoaded() {
        synchronized (this.zzako) {
            if (this.zzbvy != null) {
                this.zzbvy.zzad(0);
                this.zzbvy = null;
                return;
            }
            if (this.zzbvz != null) {
                this.zzbvz.zzew();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void onAdOpened() {
        synchronized (this.zzako) {
            if (this.zzbvz != null) {
                this.zzbvz.zzev();
            }
        }
    }

    public void zza(@Nullable zzgr zzgrVar) {
        synchronized (this.zzako) {
            this.zzbvz = zzgrVar;
        }
    }

    public void zza(zzgu.zza zzaVar) {
        synchronized (this.zzako) {
            this.zzbvy = zzaVar;
        }
    }

    @Override // com.google.android.gms.internal.zzhb
    public void zza(zzhc zzhcVar) {
        synchronized (this.zzako) {
            if (this.zzbvy != null) {
                this.zzbvy.zza(0, zzhcVar);
                this.zzbvy = null;
                return;
            }
            if (this.zzbvz != null) {
                this.zzbvz.zzew();
            }
        }
    }
}
