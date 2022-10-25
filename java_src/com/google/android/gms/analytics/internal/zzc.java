package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.analytics.GoogleAnalytics;
/* loaded from: classes.dex */
public class zzc {
    private final zzf cQ;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzc(zzf zzfVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        this.cQ = zzfVar;
    }

    private void zza(int i, String str, Object obj, Object obj2, Object obj3) {
        zzaf zzafVar = null;
        if (this.cQ != null) {
            zzafVar = this.cQ.zzacm();
        }
        if (zzafVar != null) {
            zzafVar.zza(i, str, obj, obj2, obj3);
            return;
        }
        String str2 = zzy.en.get();
        if (!Log.isLoggable(str2, i)) {
            return;
        }
        Log.println(i, str2, zzc(str, obj, obj2, obj3));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String zzc(String str, Object obj, Object obj2, Object obj3) {
        if (str == null) {
            str = "";
        }
        String zzk = zzk(obj);
        String zzk2 = zzk(obj2);
        String zzk3 = zzk(obj3);
        StringBuilder sb = new StringBuilder();
        String str2 = "";
        if (!TextUtils.isEmpty(str)) {
            sb.append(str);
            str2 = ": ";
        }
        if (!TextUtils.isEmpty(zzk)) {
            sb.append(str2);
            sb.append(zzk);
            str2 = ", ";
        }
        if (!TextUtils.isEmpty(zzk2)) {
            sb.append(str2);
            sb.append(zzk2);
            str2 = ", ";
        }
        if (!TextUtils.isEmpty(zzk3)) {
            sb.append(str2);
            sb.append(zzk3);
        }
        return sb.toString();
    }

    private static String zzk(Object obj) {
        if (obj == null) {
            return "";
        }
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof Boolean) {
            return obj == Boolean.TRUE ? "true" : "false";
        }
        return obj instanceof Throwable ? ((Throwable) obj).toString() : obj.toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Context getContext() {
        return this.cQ.getContext();
    }

    public void zza(String str, Object obj) {
        zza(2, str, obj, null, null);
    }

    public void zza(String str, Object obj, Object obj2) {
        zza(2, str, obj, obj2, null);
    }

    public void zza(String str, Object obj, Object obj2, Object obj3) {
        zza(3, str, obj, obj2, obj3);
    }

    public zzf zzabx() {
        return this.cQ;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzaby() {
        zzacb();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public com.google.android.gms.common.util.zze zzabz() {
        return this.cQ.zzabz();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzaf zzaca() {
        return this.cQ.zzaca();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzr zzacb() {
        return this.cQ.zzacb();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public com.google.android.gms.analytics.zzi zzacc() {
        return this.cQ.zzacc();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzv zzacd() {
        return this.cQ.zzacd();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzai zzace() {
        return this.cQ.zzace();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzn zzacf() {
        return this.cQ.zzacq();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zza zzacg() {
        return this.cQ.zzacp();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzk zzach() {
        return this.cQ.zzach();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzu zzaci() {
        return this.cQ.zzaci();
    }

    public void zzb(String str, Object obj) {
        zza(3, str, obj, null, null);
    }

    public void zzb(String str, Object obj, Object obj2) {
        zza(3, str, obj, obj2, null);
    }

    public void zzb(String str, Object obj, Object obj2, Object obj3) {
        zza(5, str, obj, obj2, obj3);
    }

    public void zzc(String str, Object obj) {
        zza(4, str, obj, null, null);
    }

    public void zzc(String str, Object obj, Object obj2) {
        zza(5, str, obj, obj2, null);
    }

    public void zzd(String str, Object obj) {
        zza(5, str, obj, null, null);
    }

    public void zzd(String str, Object obj, Object obj2) {
        zza(6, str, obj, obj2, null);
    }

    public void zze(String str, Object obj) {
        zza(6, str, obj, null, null);
    }

    public void zzes(String str) {
        zza(2, str, null, null, null);
    }

    public void zzet(String str) {
        zza(3, str, null, null, null);
    }

    public void zzeu(String str) {
        zza(4, str, null, null, null);
    }

    public void zzev(String str) {
        zza(5, str, null, null, null);
    }

    public void zzew(String str) {
        zza(6, str, null, null, null);
    }

    public boolean zzvo() {
        return Log.isLoggable(zzy.en.get(), 2);
    }

    public GoogleAnalytics zzza() {
        return this.cQ.zzacn();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzb zzzg() {
        return this.cQ.zzzg();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzap zzzh() {
        return this.cQ.zzzh();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzzx() {
        this.cQ.zzzx();
    }
}
