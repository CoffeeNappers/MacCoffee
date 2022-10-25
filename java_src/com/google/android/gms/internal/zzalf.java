package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzalh;
/* loaded from: classes2.dex */
public class zzalf {
    private final zzamg bhk;
    private final zzalh.zza bhp;
    private final zzamg bhq;
    private final zzalz bhr;
    private final zzalz bhs;

    private zzalf(zzalh.zza zzaVar, zzamg zzamgVar, zzalz zzalzVar, zzalz zzalzVar2, zzamg zzamgVar2) {
        this.bhp = zzaVar;
        this.bhk = zzamgVar;
        this.bhr = zzalzVar;
        this.bhs = zzalzVar2;
        this.bhq = zzamgVar2;
    }

    public static zzalf zza(zzalz zzalzVar, zzamg zzamgVar) {
        return new zzalf(zzalh.zza.CHILD_ADDED, zzamgVar, zzalzVar, null, null);
    }

    public static zzalf zza(zzalz zzalzVar, zzamg zzamgVar, zzamg zzamgVar2) {
        return new zzalf(zzalh.zza.CHILD_CHANGED, zzamgVar, zzalzVar, null, zzamgVar2);
    }

    public static zzalf zza(zzalz zzalzVar, zzaml zzamlVar, zzaml zzamlVar2) {
        return zza(zzalzVar, zzamg.zzn(zzamlVar), zzamg.zzn(zzamlVar2));
    }

    public static zzalf zza(zzamg zzamgVar) {
        return new zzalf(zzalh.zza.VALUE, zzamgVar, null, null, null);
    }

    public static zzalf zzb(zzalz zzalzVar, zzamg zzamgVar) {
        return new zzalf(zzalh.zza.CHILD_REMOVED, zzamgVar, zzalzVar, null, null);
    }

    public static zzalf zzc(zzalz zzalzVar, zzamg zzamgVar) {
        return new zzalf(zzalh.zza.CHILD_MOVED, zzamgVar, zzalzVar, null, null);
    }

    public static zzalf zzc(zzalz zzalzVar, zzaml zzamlVar) {
        return zza(zzalzVar, zzamg.zzn(zzamlVar));
    }

    public static zzalf zzd(zzalz zzalzVar, zzaml zzamlVar) {
        return zzb(zzalzVar, zzamg.zzn(zzamlVar));
    }

    public String toString() {
        String valueOf = String.valueOf(this.bhp);
        String valueOf2 = String.valueOf(this.bhr);
        return new StringBuilder(String.valueOf(valueOf).length() + 9 + String.valueOf(valueOf2).length()).append("Change: ").append(valueOf).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString();
    }

    public zzamg zzcxj() {
        return this.bhk;
    }

    public zzalz zzcxl() {
        return this.bhr;
    }

    public zzalh.zza zzcxm() {
        return this.bhp;
    }

    public zzalz zzcxn() {
        return this.bhs;
    }

    public zzamg zzcxo() {
        return this.bhq;
    }

    public zzalf zzg(zzalz zzalzVar) {
        return new zzalf(this.bhp, this.bhk, this.bhr, zzalzVar, this.bhq);
    }
}
