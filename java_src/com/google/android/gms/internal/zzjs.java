package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.internal.zzjr;
import java.util.WeakHashMap;
@zzji
/* loaded from: classes.dex */
public final class zzjs {
    private WeakHashMap<Context, zza> zzcqp = new WeakHashMap<>();

    /* loaded from: classes2.dex */
    private class zza {
        public final long zzcqq = com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
        public final zzjr zzcqr;

        public zza(zzjr zzjrVar) {
            this.zzcqr = zzjrVar;
        }

        public boolean hasExpired() {
            return zzdr.zzbgw.get().longValue() + this.zzcqq < com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
        }
    }

    public zzjr zzv(Context context) {
        zza zzaVar = this.zzcqp.get(context);
        zzjr zztr = (zzaVar == null || zzaVar.hasExpired() || !zzdr.zzbgv.get().booleanValue()) ? new zzjr.zza(context).zztr() : new zzjr.zza(context, zzaVar.zzcqr).zztr();
        this.zzcqp.put(context, new zza(zztr));
        return zztr;
    }
}
