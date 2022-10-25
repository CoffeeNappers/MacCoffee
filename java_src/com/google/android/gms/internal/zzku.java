package com.google.android.gms.internal;

import android.os.Bundle;
@zzji
/* loaded from: classes.dex */
public class zzku {
    private final Object zzako;
    private final zzkr zzaqj;
    private final String zzcsx;
    private int zzcuo;
    private int zzcup;

    zzku(zzkr zzkrVar, String str) {
        this.zzako = new Object();
        this.zzaqj = zzkrVar;
        this.zzcsx = str;
    }

    public zzku(String str) {
        this(com.google.android.gms.ads.internal.zzu.zzgq(), str);
    }

    public Bundle toBundle() {
        Bundle bundle;
        synchronized (this.zzako) {
            bundle = new Bundle();
            bundle.putInt("pmnli", this.zzcuo);
            bundle.putInt("pmnll", this.zzcup);
        }
        return bundle;
    }

    public void zzj(int i, int i2) {
        synchronized (this.zzako) {
            this.zzcuo = i;
            this.zzcup = i2;
            this.zzaqj.zza(this.zzcsx, this);
        }
    }
}
