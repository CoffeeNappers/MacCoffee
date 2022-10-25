package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public final class zzvu {
    private static zzvu WD;
    private final zzvr WE = new zzvr();
    private final zzvs WF = new zzvs();

    static {
        zza(new zzvu());
    }

    private zzvu() {
    }

    protected static void zza(zzvu zzvuVar) {
        synchronized (zzvu.class) {
            WD = zzvuVar;
        }
    }

    private static zzvu zzbhd() {
        zzvu zzvuVar;
        synchronized (zzvu.class) {
            zzvuVar = WD;
        }
        return zzvuVar;
    }

    public static zzvr zzbhe() {
        return zzbhd().WE;
    }

    public static zzvs zzbhf() {
        return zzbhd().WF;
    }
}
