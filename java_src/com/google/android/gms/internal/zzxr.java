package com.google.android.gms.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.PowerManager;
import android.os.WorkSource;
import android.text.TextUtils;
import android.util.Log;
/* loaded from: classes2.dex */
public class zzxr {
    private final String Gc;
    private final String Ge;
    private final int aDA;
    private final String aDB;
    private boolean aDC;
    private int aDD;
    private int aDE;
    private final PowerManager.WakeLock aDz;
    private WorkSource ajz;
    private final Context mContext;
    private static String TAG = "WakeLock";
    private static String aDy = "*gcore*:";
    private static boolean DEBUG = false;

    public zzxr(Context context, int i, String str) {
        this(context, i, str, null, context == null ? null : context.getPackageName());
    }

    @SuppressLint({"UnwrappedWakeLock"})
    public zzxr(Context context, int i, String str, String str2, String str3) {
        this(context, i, str, str2, str3, null);
    }

    @SuppressLint({"UnwrappedWakeLock"})
    public zzxr(Context context, int i, String str, String str2, String str3, String str4) {
        this.aDC = true;
        com.google.android.gms.common.internal.zzaa.zzh(str, "Wake lock name can NOT be empty");
        this.aDA = i;
        this.aDB = str2;
        this.Ge = str4;
        this.mContext = context.getApplicationContext();
        if (!"com.google.android.gms".equals(context.getPackageName())) {
            String valueOf = String.valueOf(aDy);
            String valueOf2 = String.valueOf(str);
            this.Gc = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        } else {
            this.Gc = str;
        }
        this.aDz = ((PowerManager) context.getSystemService("power")).newWakeLock(i, str);
        if (com.google.android.gms.common.util.zzy.zzcm(this.mContext)) {
            this.ajz = com.google.android.gms.common.util.zzy.zzy(context, com.google.android.gms.common.util.zzv.zzij(str3) ? context.getPackageName() : str3);
            zzc(this.ajz);
        }
    }

    private void zzd(WorkSource workSource) {
        try {
            this.aDz.setWorkSource(workSource);
        } catch (IllegalArgumentException e) {
            Log.wtf(TAG, e.toString());
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x001d, code lost:
        if (r12.aDE == 0) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0015, code lost:
        if (r0 == false) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zzk(java.lang.String r13, long r14) {
        /*
            r12 = this;
            boolean r0 = r12.zzoo(r13)
            java.lang.String r6 = r12.zzp(r13, r0)
            monitor-enter(r12)
            boolean r1 = r12.aDC     // Catch: java.lang.Throwable -> L44
            if (r1 == 0) goto L17
            int r1 = r12.aDD     // Catch: java.lang.Throwable -> L44
            int r2 = r1 + 1
            r12.aDD = r2     // Catch: java.lang.Throwable -> L44
            if (r1 == 0) goto L1f
            if (r0 != 0) goto L1f
        L17:
            boolean r0 = r12.aDC     // Catch: java.lang.Throwable -> L44
            if (r0 != 0) goto L42
            int r0 = r12.aDE     // Catch: java.lang.Throwable -> L44
            if (r0 != 0) goto L42
        L1f:
            com.google.android.gms.common.stats.zzg r1 = com.google.android.gms.common.stats.zzg.zzayg()     // Catch: java.lang.Throwable -> L44
            android.content.Context r2 = r12.mContext     // Catch: java.lang.Throwable -> L44
            android.os.PowerManager$WakeLock r0 = r12.aDz     // Catch: java.lang.Throwable -> L44
            java.lang.String r3 = com.google.android.gms.common.stats.zze.zza(r0, r6)     // Catch: java.lang.Throwable -> L44
            r4 = 7
            java.lang.String r5 = r12.Gc     // Catch: java.lang.Throwable -> L44
            java.lang.String r7 = r12.Ge     // Catch: java.lang.Throwable -> L44
            int r8 = r12.aDA     // Catch: java.lang.Throwable -> L44
            android.os.WorkSource r0 = r12.ajz     // Catch: java.lang.Throwable -> L44
            java.util.List r9 = com.google.android.gms.common.util.zzy.zzb(r0)     // Catch: java.lang.Throwable -> L44
            r10 = r14
            r1.zza(r2, r3, r4, r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L44
            int r0 = r12.aDE     // Catch: java.lang.Throwable -> L44
            int r0 = r0 + 1
            r12.aDE = r0     // Catch: java.lang.Throwable -> L44
        L42:
            monitor-exit(r12)     // Catch: java.lang.Throwable -> L44
            return
        L44:
            r0 = move-exception
            monitor-exit(r12)     // Catch: java.lang.Throwable -> L44
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzxr.zzk(java.lang.String, long):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x001e, code lost:
        if (r9.aDE == 1) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0015, code lost:
        if (r0 == false) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zzon(java.lang.String r10) {
        /*
            r9 = this;
            boolean r0 = r9.zzoo(r10)
            java.lang.String r5 = r9.zzp(r10, r0)
            monitor-enter(r9)
            boolean r1 = r9.aDC     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L17
            int r1 = r9.aDD     // Catch: java.lang.Throwable -> L45
            int r1 = r1 + (-1)
            r9.aDD = r1     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L20
            if (r0 != 0) goto L20
        L17:
            boolean r0 = r9.aDC     // Catch: java.lang.Throwable -> L45
            if (r0 != 0) goto L43
            int r0 = r9.aDE     // Catch: java.lang.Throwable -> L45
            r1 = 1
            if (r0 != r1) goto L43
        L20:
            com.google.android.gms.common.stats.zzg r0 = com.google.android.gms.common.stats.zzg.zzayg()     // Catch: java.lang.Throwable -> L45
            android.content.Context r1 = r9.mContext     // Catch: java.lang.Throwable -> L45
            android.os.PowerManager$WakeLock r2 = r9.aDz     // Catch: java.lang.Throwable -> L45
            java.lang.String r2 = com.google.android.gms.common.stats.zze.zza(r2, r5)     // Catch: java.lang.Throwable -> L45
            r3 = 8
            java.lang.String r4 = r9.Gc     // Catch: java.lang.Throwable -> L45
            java.lang.String r6 = r9.Ge     // Catch: java.lang.Throwable -> L45
            int r7 = r9.aDA     // Catch: java.lang.Throwable -> L45
            android.os.WorkSource r8 = r9.ajz     // Catch: java.lang.Throwable -> L45
            java.util.List r8 = com.google.android.gms.common.util.zzy.zzb(r8)     // Catch: java.lang.Throwable -> L45
            r0.zza(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L45
            int r0 = r9.aDE     // Catch: java.lang.Throwable -> L45
            int r0 = r0 + (-1)
            r9.aDE = r0     // Catch: java.lang.Throwable -> L45
        L43:
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L45
            return
        L45:
            r0 = move-exception
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L45
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzxr.zzon(java.lang.String):void");
    }

    private boolean zzoo(String str) {
        return !TextUtils.isEmpty(str) && !str.equals(this.aDB);
    }

    private String zzp(String str, boolean z) {
        return (!this.aDC || !z) ? this.aDB : str;
    }

    public void acquire(long j) {
        if (!com.google.android.gms.common.util.zzs.zzayq() && this.aDC) {
            String str = TAG;
            String valueOf = String.valueOf(this.Gc);
            Log.wtf(str, valueOf.length() != 0 ? "Do not acquire with timeout on reference counted WakeLocks before ICS. wakelock: ".concat(valueOf) : new String("Do not acquire with timeout on reference counted WakeLocks before ICS. wakelock: "));
        }
        zzk(null, j);
        this.aDz.acquire(j);
    }

    public boolean isHeld() {
        return this.aDz.isHeld();
    }

    public void release() {
        zzon(null);
        this.aDz.release();
    }

    public void setReferenceCounted(boolean z) {
        this.aDz.setReferenceCounted(z);
        this.aDC = z;
    }

    public void zzc(WorkSource workSource) {
        if (workSource == null || !com.google.android.gms.common.util.zzy.zzcm(this.mContext)) {
            return;
        }
        if (this.ajz != null) {
            this.ajz.add(workSource);
        } else {
            this.ajz = workSource;
        }
        zzd(this.ajz);
    }
}
