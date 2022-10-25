package com.google.android.gms.analytics.internal;

import android.util.Log;
import java.util.Map;
/* loaded from: classes.dex */
public class zzaf extends zzd {
    private static String fu = "3";
    private static String fv = "01VDIWEA?";
    private static zzaf fw;

    public zzaf(zzf zzfVar) {
        super(zzfVar);
    }

    public static zzaf zzagg() {
        return fw;
    }

    public void zza(int i, String str, Object obj, Object obj2, Object obj3) {
        String str2 = zzy.en.get();
        if (Log.isLoggable(str2, i)) {
            Log.println(i, str2, zzc(str, obj, obj2, obj3));
        }
        if (i >= 5) {
            zzb(i, str, obj, obj2, obj3);
        }
    }

    public void zza(zzab zzabVar, String str) {
        if (str == null) {
            str = "no reason provided";
        }
        String zzabVar2 = zzabVar != null ? zzabVar.toString() : "no hit data";
        String valueOf = String.valueOf(str);
        zzd(valueOf.length() != 0 ? "Discarding hit. ".concat(valueOf) : new String("Discarding hit. "), zzabVar2);
    }

    public synchronized void zzb(int i, String str, Object obj, Object obj2, Object obj3) {
        char c;
        int i2 = 0;
        synchronized (this) {
            com.google.android.gms.common.internal.zzaa.zzy(str);
            if (i >= 0) {
                i2 = i;
            }
            int length = i2 >= fv.length() ? fv.length() - 1 : i2;
            if (zzacb().zzaef()) {
                zzacb();
                c = 'C';
            } else {
                zzacb();
                c = 'c';
            }
            String str2 = fu;
            char charAt = fv.charAt(length);
            String str3 = zze.VERSION;
            String valueOf = String.valueOf(zzc(str, zzm(obj), zzm(obj2), zzm(obj3)));
            String sb = new StringBuilder(String.valueOf(str2).length() + 3 + String.valueOf(str3).length() + String.valueOf(valueOf).length()).append(str2).append(charAt).append(c).append(str3).append(":").append(valueOf).toString();
            if (sb.length() > 1024) {
                sb = sb.substring(0, 1024);
            }
            zzai zzaco = zzabx().zzaco();
            if (zzaco != null) {
                zzaco.zzagt().zzfg(sb);
            }
        }
    }

    public void zzh(Map<String, String> map, String str) {
        String str2;
        if (str == null) {
            str = "no reason provided";
        }
        if (map != null) {
            StringBuilder sb = new StringBuilder();
            for (Map.Entry<String, String> entry : map.entrySet()) {
                if (sb.length() > 0) {
                    sb.append(',');
                }
                sb.append(entry.getKey());
                sb.append('=');
                sb.append(entry.getValue());
            }
            str2 = sb.toString();
        } else {
            str2 = "no hit data";
        }
        String valueOf = String.valueOf(str);
        zzd(valueOf.length() != 0 ? "Discarding hit. ".concat(valueOf) : new String("Discarding hit. "), str2);
    }

    protected String zzm(Object obj) {
        if (obj == null) {
            return null;
        }
        Object l = obj instanceof Integer ? new Long(((Integer) obj).intValue()) : obj;
        if (!(l instanceof Long)) {
            return l instanceof Boolean ? String.valueOf(l) : l instanceof Throwable ? l.getClass().getCanonicalName() : "-";
        } else if (Math.abs(((Long) l).longValue()) < 100) {
            return String.valueOf(l);
        } else {
            String str = String.valueOf(l).charAt(0) == '-' ? "-" : "";
            String valueOf = String.valueOf(Math.abs(((Long) l).longValue()));
            return str + Math.round(Math.pow(10.0d, valueOf.length() - 1)) + "..." + str + Math.round(Math.pow(10.0d, valueOf.length()) - 1.0d);
        }
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        synchronized (zzaf.class) {
            fw = this;
        }
    }
}
