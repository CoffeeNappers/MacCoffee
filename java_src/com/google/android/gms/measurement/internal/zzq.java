package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.measurement.AppMeasurement;
/* loaded from: classes2.dex */
public class zzq extends zzaa {
    private final String EC;
    private final long aqN;
    private final char asA;
    private final zza asB;
    private final zza asC;
    private final zza asD;
    private final zza asE;
    private final zza asF;
    private final zza asG;
    private final zza asH;
    private final zza asI;
    private final zza asJ;

    /* loaded from: classes2.dex */
    public class zza {
        private final boolean asM;
        private final boolean asN;
        private final int mPriority;

        zza(int i, boolean z, boolean z2) {
            this.mPriority = i;
            this.asM = z;
            this.asN = z2;
        }

        public void log(String str) {
            zzq.this.zza(this.mPriority, this.asM, this.asN, str, null, null, null);
        }

        public void zzd(String str, Object obj, Object obj2, Object obj3) {
            zzq.this.zza(this.mPriority, this.asM, this.asN, str, obj, obj2, obj3);
        }

        public void zze(String str, Object obj, Object obj2) {
            zzq.this.zza(this.mPriority, this.asM, this.asN, str, obj, obj2, null);
        }

        public void zzj(String str, Object obj) {
            zzq.this.zza(this.mPriority, this.asM, this.asN, str, obj, null, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzq(zzx zzxVar) {
        super(zzxVar);
        this.EC = zzbwd().zzbub();
        this.aqN = zzbwd().zzbto();
        if (zzbwd().zzaef()) {
            zzbwd().zzayi();
            this.asA = 'C';
        } else {
            zzbwd().zzayi();
            this.asA = 'c';
        }
        this.asB = new zza(6, false, false);
        this.asC = new zza(6, true, false);
        this.asD = new zza(6, false, true);
        this.asE = new zza(5, false, false);
        this.asF = new zza(5, true, false);
        this.asG = new zza(5, false, true);
        this.asH = new zza(4, false, false);
        this.asI = new zza(3, false, false);
        this.asJ = new zza(2, false, false);
    }

    static String zza(boolean z, String str, Object obj, Object obj2, Object obj3) {
        if (str == null) {
            str = "";
        }
        String zzc = zzc(z, obj);
        String zzc2 = zzc(z, obj2);
        String zzc3 = zzc(z, obj3);
        StringBuilder sb = new StringBuilder();
        String str2 = "";
        if (!TextUtils.isEmpty(str)) {
            sb.append(str);
            str2 = ": ";
        }
        if (!TextUtils.isEmpty(zzc)) {
            sb.append(str2);
            sb.append(zzc);
            str2 = ", ";
        }
        if (!TextUtils.isEmpty(zzc2)) {
            sb.append(str2);
            sb.append(zzc2);
            str2 = ", ";
        }
        if (!TextUtils.isEmpty(zzc3)) {
            sb.append(str2);
            sb.append(zzc3);
        }
        return sb.toString();
    }

    static String zzc(boolean z, Object obj) {
        StackTraceElement[] stackTrace;
        String className;
        if (obj == null) {
            return "";
        }
        Object valueOf = obj instanceof Integer ? Long.valueOf(((Integer) obj).intValue()) : obj;
        if (valueOf instanceof Long) {
            if (z && Math.abs(((Long) valueOf).longValue()) >= 100) {
                String str = String.valueOf(valueOf).charAt(0) == '-' ? "-" : "";
                String valueOf2 = String.valueOf(Math.abs(((Long) valueOf).longValue()));
                return new StringBuilder(String.valueOf(str).length() + 43 + String.valueOf(str).length()).append(str).append(Math.round(Math.pow(10.0d, valueOf2.length() - 1))).append("...").append(str).append(Math.round(Math.pow(10.0d, valueOf2.length()) - 1.0d)).toString();
            }
            return String.valueOf(valueOf);
        } else if (valueOf instanceof Boolean) {
            return String.valueOf(valueOf);
        } else {
            if (!(valueOf instanceof Throwable)) {
                return z ? "-" : String.valueOf(valueOf);
            }
            Throwable th = (Throwable) valueOf;
            StringBuilder sb = new StringBuilder(z ? th.getClass().getName() : th.toString());
            String zzmj = zzmj(AppMeasurement.class.getCanonicalName());
            String zzmj2 = zzmj(zzx.class.getCanonicalName());
            for (StackTraceElement stackTraceElement : th.getStackTrace()) {
                if (!stackTraceElement.isNativeMethod() && (className = stackTraceElement.getClassName()) != null) {
                    String zzmj3 = zzmj(className);
                    if (zzmj3.equals(zzmj) || zzmj3.equals(zzmj2)) {
                        sb.append(": ");
                        sb.append(stackTraceElement);
                        break;
                    }
                }
            }
            return sb.toString();
        }
    }

    private static String zzmj(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(46);
        return lastIndexOf != -1 ? str.substring(0, lastIndexOf) : str;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    protected void zza(int i, boolean z, boolean z2, String str, Object obj, Object obj2, Object obj3) {
        if (!z && zzbi(i)) {
            zzn(i, zza(false, str, obj, obj2, obj3));
        }
        if (z2 || i < 5) {
            return;
        }
        zzb(i, str, obj, obj2, obj3);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    public void zzb(int i, String str, Object obj, Object obj2, Object obj3) {
        com.google.android.gms.common.internal.zzaa.zzy(str);
        zzw zzbxs = this.aqw.zzbxs();
        if (zzbxs == null) {
            zzn(6, "Scheduler not set. Not logging error/warn.");
        } else if (!zzbxs.isInitialized()) {
            zzn(6, "Scheduler not initialized. Not logging error/warn.");
        } else if (zzbxs.zzbyn()) {
            zzn(6, "Scheduler shutdown. Not logging error/warn.");
        } else {
            if (i < 0) {
                i = 0;
            }
            if (i >= "01VDIWEA?".length()) {
                i = "01VDIWEA?".length() - 1;
            }
            String valueOf = String.valueOf(AppEventsConstants.EVENT_PARAM_VALUE_YES);
            char charAt = "01VDIWEA?".charAt(i);
            char c = this.asA;
            long j = this.aqN;
            String valueOf2 = String.valueOf(zza(true, str, obj, obj2, obj3));
            final String sb = new StringBuilder(String.valueOf(valueOf).length() + 23 + String.valueOf(valueOf2).length()).append(valueOf).append(charAt).append(c).append(j).append(":").append(valueOf2).toString();
            if (sb.length() > 1024) {
                sb = str.substring(0, 1024);
            }
            zzbxs.zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzq.1
                @Override // java.lang.Runnable
                public void run() {
                    zzt zzbwc = zzq.this.aqw.zzbwc();
                    if (!zzbwc.isInitialized() || zzbwc.zzbyn()) {
                        zzq.this.zzn(6, "Persisted config not initialized . Not logging error/warn.");
                    } else {
                        zzbwc.asY.zzfg(sb);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean zzbi(int i) {
        return Log.isLoggable(this.EC, i);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    public zza zzbwy() {
        return this.asB;
    }

    public zza zzbwz() {
        return this.asC;
    }

    public zza zzbxa() {
        return this.asE;
    }

    public zza zzbxb() {
        return this.asG;
    }

    public zza zzbxc() {
        return this.asH;
    }

    public zza zzbxd() {
        return this.asI;
    }

    public zza zzbxe() {
        return this.asJ;
    }

    public String zzbxf() {
        Pair<String, Long> zzagw = zzbwc().asY.zzagw();
        if (zzagw == null || zzagw == zzt.asX) {
            return null;
        }
        String valueOf = String.valueOf(String.valueOf(zzagw.second));
        String str = (String) zzagw.first;
        return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(str).length()).append(valueOf).append(":").append(str).toString();
    }

    protected void zzn(int i, String str) {
        Log.println(i, this.EC, str);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
