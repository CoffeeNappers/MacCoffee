package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.reward.client.zza;
@zzji
/* loaded from: classes.dex */
public class zzjz extends zza.AbstractBinderC0026zza {
    private final String zzcpo;
    private final int zzcqw;

    public zzjz(String str, int i) {
        this.zzcpo = str;
        this.zzcqw = i;
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof zzjz)) {
            return false;
        }
        zzjz zzjzVar = (zzjz) obj;
        return com.google.android.gms.common.internal.zzz.equal(getType(), zzjzVar.getType()) && com.google.android.gms.common.internal.zzz.equal(Integer.valueOf(getAmount()), Integer.valueOf(zzjzVar.getAmount()));
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zza
    public int getAmount() {
        return this.zzcqw;
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zza
    public String getType() {
        return this.zzcpo;
    }
}
