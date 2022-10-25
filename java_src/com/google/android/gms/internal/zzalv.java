package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalx;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzalv implements zzalx {
    private final Set<String> bil;
    private final zzalx.zza bim;

    public zzalv(zzalx.zza zzaVar, List<String> list) {
        if (list != null) {
            this.bil = new HashSet(list);
        } else {
            this.bil = null;
        }
        this.bim = zzaVar;
    }

    protected String zza(zzalx.zza zzaVar, String str, String str2, long j) {
        String valueOf = String.valueOf(new Date(j).toString());
        String valueOf2 = String.valueOf(zzaVar);
        return new StringBuilder(String.valueOf(valueOf).length() + 6 + String.valueOf(valueOf2).length() + String.valueOf(str).length() + String.valueOf(str2).length()).append(valueOf).append(" [").append(valueOf2).append("] ").append(str).append(": ").append(str2).toString();
    }

    protected boolean zza(zzalx.zza zzaVar, String str) {
        return zzaVar.ordinal() >= this.bim.ordinal() && (this.bil == null || zzaVar.ordinal() > zzalx.zza.DEBUG.ordinal() || this.bil.contains(str));
    }

    @Override // com.google.android.gms.internal.zzalx
    public void zzb(zzalx.zza zzaVar, String str, String str2, long j) {
        if (zza(zzaVar, str)) {
            String zza = zza(zzaVar, str, str2, j);
            switch (zzaVar) {
                case ERROR:
                    zzbq(str, zza);
                    return;
                case WARN:
                    zzbr(str, zza);
                    return;
                case INFO:
                    zzbs(str, zza);
                    return;
                case DEBUG:
                    zzbt(str, zza);
                    return;
                default:
                    throw new RuntimeException("Should not reach here!");
            }
        }
    }

    protected void zzbq(String str, String str2) {
        System.err.println(str2);
    }

    protected void zzbr(String str, String str2) {
        System.out.println(str2);
    }

    protected void zzbs(String str, String str2) {
        System.out.println(str2);
    }

    protected void zzbt(String str, String str2) {
        System.out.println(str2);
    }

    @Override // com.google.android.gms.internal.zzalx
    public zzalx.zza zzctu() {
        return this.bim;
    }
}
