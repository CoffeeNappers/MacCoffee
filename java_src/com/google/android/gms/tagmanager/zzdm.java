package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzdm {
    private static final Object aHR = null;
    private static Long aHS = new Long(0);
    private static Double aHT = new Double(0.0d);
    private static zzdl aHU = zzdl.zzbv(0);
    private static String aHV = new String("");
    private static Boolean aHW = new Boolean(false);
    private static List<Object> aHX = new ArrayList(0);
    private static Map<Object, Object> aHY = new HashMap();
    private static zzaj.zza aHZ = zzat(aHV);

    private static double getDouble(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).doubleValue();
        }
        zzbo.e("getDouble received non-Number");
        return 0.0d;
    }

    public static String zzao(Object obj) {
        return obj == null ? aHV : obj.toString();
    }

    public static zzdl zzap(Object obj) {
        return obj instanceof zzdl ? (zzdl) obj : zzav(obj) ? zzdl.zzbv(zzaw(obj)) : zzau(obj) ? zzdl.zza(Double.valueOf(getDouble(obj))) : zzpy(zzao(obj));
    }

    public static Long zzaq(Object obj) {
        return zzav(obj) ? Long.valueOf(zzaw(obj)) : zzpz(zzao(obj));
    }

    public static Double zzar(Object obj) {
        return zzau(obj) ? Double.valueOf(getDouble(obj)) : zzqa(zzao(obj));
    }

    public static Boolean zzas(Object obj) {
        return obj instanceof Boolean ? (Boolean) obj : zzqb(zzao(obj));
    }

    public static zzaj.zza zzat(Object obj) {
        boolean z = false;
        zzaj.zza zzaVar = new zzaj.zza();
        if (obj instanceof zzaj.zza) {
            return (zzaj.zza) obj;
        }
        if (obj instanceof String) {
            zzaVar.type = 1;
            zzaVar.string = (String) obj;
        } else if (obj instanceof List) {
            zzaVar.type = 2;
            List<Object> list = (List) obj;
            ArrayList arrayList = new ArrayList(list.size());
            boolean z2 = false;
            for (Object obj2 : list) {
                zzaj.zza zzat = zzat(obj2);
                if (zzat == aHZ) {
                    return aHZ;
                }
                boolean z3 = z2 || zzat.zzyh;
                arrayList.add(zzat);
                z2 = z3;
            }
            zzaVar.zzxy = (zzaj.zza[]) arrayList.toArray(new zzaj.zza[0]);
            z = z2;
        } else if (obj instanceof Map) {
            zzaVar.type = 3;
            Set<Map.Entry> entrySet = ((Map) obj).entrySet();
            ArrayList arrayList2 = new ArrayList(entrySet.size());
            ArrayList arrayList3 = new ArrayList(entrySet.size());
            boolean z4 = false;
            for (Map.Entry entry : entrySet) {
                zzaj.zza zzat2 = zzat(entry.getKey());
                zzaj.zza zzat3 = zzat(entry.getValue());
                if (zzat2 == aHZ || zzat3 == aHZ) {
                    return aHZ;
                }
                boolean z5 = z4 || zzat2.zzyh || zzat3.zzyh;
                arrayList2.add(zzat2);
                arrayList3.add(zzat3);
                z4 = z5;
            }
            zzaVar.zzxz = (zzaj.zza[]) arrayList2.toArray(new zzaj.zza[0]);
            zzaVar.zzya = (zzaj.zza[]) arrayList3.toArray(new zzaj.zza[0]);
            z = z4;
        } else if (zzau(obj)) {
            zzaVar.type = 1;
            zzaVar.string = obj.toString();
        } else if (zzav(obj)) {
            zzaVar.type = 6;
            zzaVar.zzyd = zzaw(obj);
        } else if (!(obj instanceof Boolean)) {
            String valueOf = String.valueOf(obj == null ? "null" : obj.getClass().toString());
            zzbo.e(valueOf.length() != 0 ? "Converting to Value from unknown object type: ".concat(valueOf) : new String("Converting to Value from unknown object type: "));
            return aHZ;
        } else {
            zzaVar.type = 8;
            zzaVar.zzye = ((Boolean) obj).booleanValue();
        }
        zzaVar.zzyh = z;
        return zzaVar;
    }

    private static boolean zzau(Object obj) {
        return (obj instanceof Double) || (obj instanceof Float) || ((obj instanceof zzdl) && ((zzdl) obj).zzchb());
    }

    private static boolean zzav(Object obj) {
        return (obj instanceof Byte) || (obj instanceof Short) || (obj instanceof Integer) || (obj instanceof Long) || ((obj instanceof zzdl) && ((zzdl) obj).zzchc());
    }

    private static long zzaw(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).longValue();
        }
        zzbo.e("getInt64 received non-Number");
        return 0L;
    }

    public static Object zzchg() {
        return null;
    }

    public static Long zzchh() {
        return aHS;
    }

    public static Double zzchi() {
        return aHT;
    }

    public static Boolean zzchj() {
        return aHW;
    }

    public static zzdl zzchk() {
        return aHU;
    }

    public static String zzchl() {
        return aHV;
    }

    public static zzaj.zza zzchm() {
        return aHZ;
    }

    public static String zzg(zzaj.zza zzaVar) {
        return zzao(zzl(zzaVar));
    }

    public static zzdl zzh(zzaj.zza zzaVar) {
        return zzap(zzl(zzaVar));
    }

    public static Long zzi(zzaj.zza zzaVar) {
        return zzaq(zzl(zzaVar));
    }

    public static Double zzj(zzaj.zza zzaVar) {
        return zzar(zzl(zzaVar));
    }

    public static Boolean zzk(zzaj.zza zzaVar) {
        return zzas(zzl(zzaVar));
    }

    public static Object zzl(zzaj.zza zzaVar) {
        int i = 0;
        if (zzaVar == null) {
            return null;
        }
        switch (zzaVar.type) {
            case 1:
                return zzaVar.string;
            case 2:
                ArrayList arrayList = new ArrayList(zzaVar.zzxy.length);
                zzaj.zza[] zzaVarArr = zzaVar.zzxy;
                int length = zzaVarArr.length;
                while (i < length) {
                    Object zzl = zzl(zzaVarArr[i]);
                    if (zzl == null) {
                        return null;
                    }
                    arrayList.add(zzl);
                    i++;
                }
                return arrayList;
            case 3:
                if (zzaVar.zzxz.length != zzaVar.zzya.length) {
                    String valueOf = String.valueOf(zzaVar.toString());
                    zzbo.e(valueOf.length() != 0 ? "Converting an invalid value to object: ".concat(valueOf) : new String("Converting an invalid value to object: "));
                    return null;
                }
                HashMap hashMap = new HashMap(zzaVar.zzya.length);
                while (i < zzaVar.zzxz.length) {
                    Object zzl2 = zzl(zzaVar.zzxz[i]);
                    Object zzl3 = zzl(zzaVar.zzya[i]);
                    if (zzl2 == null || zzl3 == null) {
                        return null;
                    }
                    hashMap.put(zzl2, zzl3);
                    i++;
                }
                return hashMap;
            case 4:
                zzbo.e("Trying to convert a macro reference to object");
                return null;
            case 5:
                zzbo.e("Trying to convert a function id to object");
                return null;
            case 6:
                return Long.valueOf(zzaVar.zzyd);
            case 7:
                StringBuffer stringBuffer = new StringBuffer();
                zzaj.zza[] zzaVarArr2 = zzaVar.zzyf;
                int length2 = zzaVarArr2.length;
                while (i < length2) {
                    String zzg = zzg(zzaVarArr2[i]);
                    if (zzg == aHV) {
                        return null;
                    }
                    stringBuffer.append(zzg);
                    i++;
                }
                return stringBuffer.toString();
            case 8:
                return Boolean.valueOf(zzaVar.zzye);
            default:
                zzbo.e(new StringBuilder(46).append("Failed to convert a value of type: ").append(zzaVar.type).toString());
                return null;
        }
    }

    public static zzaj.zza zzpx(String str) {
        zzaj.zza zzaVar = new zzaj.zza();
        zzaVar.type = 5;
        zzaVar.zzyc = str;
        return zzaVar;
    }

    private static zzdl zzpy(String str) {
        try {
            return zzdl.zzpw(str);
        } catch (NumberFormatException e) {
            zzbo.e(new StringBuilder(String.valueOf(str).length() + 33).append("Failed to convert '").append(str).append("' to a number.").toString());
            return aHU;
        }
    }

    private static Long zzpz(String str) {
        zzdl zzpy = zzpy(str);
        return zzpy == aHU ? aHS : Long.valueOf(zzpy.longValue());
    }

    private static Double zzqa(String str) {
        zzdl zzpy = zzpy(str);
        return zzpy == aHU ? aHT : Double.valueOf(zzpy.doubleValue());
    }

    private static Boolean zzqb(String str) {
        return "true".equalsIgnoreCase(str) ? Boolean.TRUE : "false".equalsIgnoreCase(str) ? Boolean.FALSE : aHW;
    }
}
