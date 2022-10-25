package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalx;
import java.io.PrintWriter;
import java.io.StringWriter;
/* loaded from: classes2.dex */
public class zzalw {
    private final zzalx baR;
    private final String bin;
    private final String prefix;

    public zzalw(zzalx zzalxVar, String str) {
        this(zzalxVar, str, null);
    }

    public zzalw(zzalx zzalxVar, String str, String str2) {
        this.baR = zzalxVar;
        this.bin = str;
        this.prefix = str2;
    }

    private long zzcyv() {
        return System.currentTimeMillis();
    }

    private String zzj(String str, Object... objArr) {
        if (objArr.length > 0) {
            str = String.format(str, objArr);
        }
        if (this.prefix == null) {
            return str;
        }
        String str2 = this.prefix;
        return new StringBuilder(String.valueOf(str2).length() + 3 + String.valueOf(str).length()).append(str2).append(" - ").append(str).toString();
    }

    private static String zzk(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter));
        return stringWriter.toString();
    }

    public void info(String str) {
        this.baR.zzb(zzalx.zza.INFO, this.bin, zzj(str, new Object[0]), zzcyv());
    }

    public void warn(String str) {
        zze(str, null);
    }

    public void zza(String str, Throwable th, Object... objArr) {
        if (zzcyu()) {
            String zzj = zzj(str, objArr);
            if (th != null) {
                String valueOf = String.valueOf(zzk(th));
                zzj = new StringBuilder(String.valueOf(zzj).length() + 1 + String.valueOf(valueOf).length()).append(zzj).append("\n").append(valueOf).toString();
            }
            this.baR.zzb(zzalx.zza.DEBUG, this.bin, zzj, zzcyv());
        }
    }

    public boolean zzcyu() {
        return this.baR.zzctu().ordinal() <= zzalx.zza.DEBUG.ordinal();
    }

    public void zzd(String str, Throwable th) {
        String valueOf = String.valueOf(zzj(str, new Object[0]));
        String valueOf2 = String.valueOf(zzk(th));
        this.baR.zzb(zzalx.zza.ERROR, this.bin, new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append("\n").append(valueOf2).toString(), zzcyv());
    }

    public void zze(String str, Throwable th) {
        String zzj = zzj(str, new Object[0]);
        if (th != null) {
            String valueOf = String.valueOf(zzk(th));
            zzj = new StringBuilder(String.valueOf(zzj).length() + 1 + String.valueOf(valueOf).length()).append(zzj).append("\n").append(valueOf).toString();
        }
        this.baR.zzb(zzalx.zza.WARN, this.bin, zzj, zzcyv());
    }

    public void zzi(String str, Object... objArr) {
        zza(str, null, objArr);
    }
}
