package com.google.android.gms.analytics.internal;

import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class zzab {
    private final List<Command> fi;
    private final long fj;
    private final long fk;
    private final int fl;
    private final boolean fm;
    private final String fn;
    private final Map<String, String> zzbly;

    public zzab(zzc zzcVar, Map<String, String> map, long j, boolean z) {
        this(zzcVar, map, j, z, 0L, 0, null);
    }

    public zzab(zzc zzcVar, Map<String, String> map, long j, boolean z, long j2, int i) {
        this(zzcVar, map, j, z, j2, i, null);
    }

    public zzab(zzc zzcVar, Map<String, String> map, long j, boolean z, long j2, int i, List<Command> list) {
        String zza;
        String zza2;
        com.google.android.gms.common.internal.zzaa.zzy(zzcVar);
        com.google.android.gms.common.internal.zzaa.zzy(map);
        this.fk = j;
        this.fm = z;
        this.fj = j2;
        this.fl = i;
        this.fi = list != null ? list : Collections.emptyList();
        this.fn = zzs(list);
        HashMap hashMap = new HashMap();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (zzl(entry.getKey()) && (zza2 = zza(zzcVar, entry.getKey())) != null) {
                hashMap.put(zza2, zzb(zzcVar, entry.getValue()));
            }
        }
        for (Map.Entry<String, String> entry2 : map.entrySet()) {
            if (!zzl(entry2.getKey()) && (zza = zza(zzcVar, entry2.getKey())) != null) {
                hashMap.put(zza, zzb(zzcVar, entry2.getValue()));
            }
        }
        if (!TextUtils.isEmpty(this.fn)) {
            zzao.zzc(hashMap, "_v", this.fn);
            if (this.fn.equals("ma4.0.0") || this.fn.equals("ma4.0.1")) {
                hashMap.remove("adid");
            }
        }
        this.zzbly = Collections.unmodifiableMap(hashMap);
    }

    public static zzab zza(zzc zzcVar, zzab zzabVar, Map<String, String> map) {
        return new zzab(zzcVar, map, zzabVar.zzaga(), zzabVar.zzagc(), zzabVar.zzafz(), zzabVar.zzafy(), zzabVar.zzagb());
    }

    private static String zza(zzc zzcVar, Object obj) {
        if (obj == null) {
            return null;
        }
        String obj2 = obj.toString();
        if (obj2.startsWith("&")) {
            obj2 = obj2.substring(1);
        }
        int length = obj2.length();
        if (length > 256) {
            obj2 = obj2.substring(0, 256);
            zzcVar.zzc("Hit param name is too long and will be trimmed", Integer.valueOf(length), obj2);
        }
        if (!TextUtils.isEmpty(obj2)) {
            return obj2;
        }
        return null;
    }

    private static String zzb(zzc zzcVar, Object obj) {
        String obj2 = obj == null ? "" : obj.toString();
        int length = obj2.length();
        if (length > 8192) {
            String substring = obj2.substring(0, 8192);
            zzcVar.zzc("Hit param value is too long and will be trimmed", Integer.valueOf(length), substring);
            return substring;
        }
        return obj2;
    }

    private static boolean zzl(Object obj) {
        if (obj == null) {
            return false;
        }
        return obj.toString().startsWith("&");
    }

    private String zzr(String str, String str2) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzb(!str.startsWith("&"), "Short param name required");
        String str3 = this.zzbly.get(str);
        return str3 != null ? str3 : str2;
    }

    private static String zzs(List<Command> list) {
        String str;
        if (list != null) {
            for (Command command : list) {
                if ("appendVersion".equals(command.getId())) {
                    str = command.getValue();
                    break;
                }
            }
        }
        str = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return str;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("ht=").append(this.fk);
        if (this.fj != 0) {
            stringBuffer.append(", dbId=").append(this.fj);
        }
        if (this.fl != 0) {
            stringBuffer.append(", appUID=").append(this.fl);
        }
        ArrayList<String> arrayList = new ArrayList(this.zzbly.keySet());
        Collections.sort(arrayList);
        for (String str : arrayList) {
            stringBuffer.append(", ");
            stringBuffer.append(str);
            stringBuffer.append("=");
            stringBuffer.append(this.zzbly.get(str));
        }
        return stringBuffer.toString();
    }

    public int zzafy() {
        return this.fl;
    }

    public long zzafz() {
        return this.fj;
    }

    public long zzaga() {
        return this.fk;
    }

    public List<Command> zzagb() {
        return this.fi;
    }

    public boolean zzagc() {
        return this.fm;
    }

    public long zzagd() {
        return zzao.zzfj(zzr("_s", AppEventsConstants.EVENT_PARAM_VALUE_NO));
    }

    public String zzage() {
        return zzr("_m", "");
    }

    public Map<String, String> zzmc() {
        return this.zzbly;
    }
}
