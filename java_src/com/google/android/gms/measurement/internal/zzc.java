package com.google.android.gms.measurement.internal;

import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import com.google.android.gms.internal.zzwa;
import com.google.android.gms.internal.zzwc;
import com.google.android.gms.measurement.AppMeasurement;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzc extends zzaa {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzc(zzx zzxVar) {
        super(zzxVar);
    }

    private Boolean zza(zzwa.zzb zzbVar, zzwc.zzb zzbVar2, long j) {
        zzwa.zzc[] zzcVarArr;
        zzwc.zzc[] zzcVarArr2;
        zzwa.zzc[] zzcVarArr3;
        if (zzbVar.awh != null) {
            Boolean zza = zza(j, zzbVar.awh);
            if (zza == null) {
                return null;
            }
            if (!zza.booleanValue()) {
                return false;
            }
        }
        HashSet hashSet = new HashSet();
        for (zzwa.zzc zzcVar : zzbVar.awf) {
            if (TextUtils.isEmpty(zzcVar.awm)) {
                zzbwb().zzbxa().zzj("null or empty param name in filter. event", zzbVar2.name);
                return null;
            }
            hashSet.add(zzcVar.awm);
        }
        ArrayMap arrayMap = new ArrayMap();
        for (zzwc.zzc zzcVar2 : zzbVar2.awN) {
            if (hashSet.contains(zzcVar2.name)) {
                if (zzcVar2.awR != null) {
                    arrayMap.put(zzcVar2.name, zzcVar2.awR);
                } else if (zzcVar2.avW != null) {
                    arrayMap.put(zzcVar2.name, zzcVar2.avW);
                } else if (zzcVar2.Fe == null) {
                    zzbwb().zzbxa().zze("Unknown value for param. event, param", zzbVar2.name, zzcVar2.name);
                    return null;
                } else {
                    arrayMap.put(zzcVar2.name, zzcVar2.Fe);
                }
            }
        }
        for (zzwa.zzc zzcVar3 : zzbVar.awf) {
            boolean equals = Boolean.TRUE.equals(zzcVar3.awl);
            String str = zzcVar3.awm;
            if (TextUtils.isEmpty(str)) {
                zzbwb().zzbxa().zzj("Event has empty param name. event", zzbVar2.name);
                return null;
            }
            Object obj = arrayMap.get(str);
            if (obj instanceof Long) {
                if (zzcVar3.awk == null) {
                    zzbwb().zzbxa().zze("No number filter for long param. event, param", zzbVar2.name, str);
                    return null;
                }
                Boolean zza2 = zza(((Long) obj).longValue(), zzcVar3.awk);
                if (zza2 == null) {
                    return null;
                }
                if ((!zza2.booleanValue()) ^ equals) {
                    return false;
                }
            } else if (obj instanceof Double) {
                if (zzcVar3.awk == null) {
                    zzbwb().zzbxa().zze("No number filter for double param. event, param", zzbVar2.name, str);
                    return null;
                }
                Boolean zza3 = zza(((Double) obj).doubleValue(), zzcVar3.awk);
                if (zza3 == null) {
                    return null;
                }
                if ((!zza3.booleanValue()) ^ equals) {
                    return false;
                }
            } else if (!(obj instanceof String)) {
                if (obj == null) {
                    zzbwb().zzbxe().zze("Missing param for filter. event, param", zzbVar2.name, str);
                    return false;
                }
                zzbwb().zzbxa().zze("Unknown param type. event, param", zzbVar2.name, str);
                return null;
            } else if (zzcVar3.awj == null) {
                zzbwb().zzbxa().zze("No string filter for String param. event, param", zzbVar2.name, str);
                return null;
            } else {
                Boolean zza4 = zza((String) obj, zzcVar3.awj);
                if (zza4 == null) {
                    return null;
                }
                if ((!zza4.booleanValue()) ^ equals) {
                    return false;
                }
            }
        }
        return true;
    }

    private Boolean zza(zzwa.zze zzeVar, zzwc.zzg zzgVar) {
        zzwa.zzc zzcVar = zzeVar.awu;
        if (zzcVar == null) {
            zzbwb().zzbxa().zzj("Missing property filter. property", zzgVar.name);
            return null;
        }
        boolean equals = Boolean.TRUE.equals(zzcVar.awl);
        if (zzgVar.awR != null) {
            if (zzcVar.awk != null) {
                return zza(zza(zzgVar.awR.longValue(), zzcVar.awk), equals);
            }
            zzbwb().zzbxa().zzj("No number filter for long property. property", zzgVar.name);
            return null;
        } else if (zzgVar.avW != null) {
            if (zzcVar.awk != null) {
                return zza(zza(zzgVar.avW.doubleValue(), zzcVar.awk), equals);
            }
            zzbwb().zzbxa().zzj("No number filter for double property. property", zzgVar.name);
            return null;
        } else if (zzgVar.Fe == null) {
            zzbwb().zzbxa().zzj("User property has no value, property", zzgVar.name);
            return null;
        } else if (zzcVar.awj != null) {
            return zza(zza(zzgVar.Fe, zzcVar.awj), equals);
        } else {
            if (zzcVar.awk == null) {
                zzbwb().zzbxa().zzj("No string or number filter defined. property", zzgVar.name);
                return null;
            } else if (zzal.zzng(zzgVar.Fe)) {
                return zza(zza(zzgVar.Fe, zzcVar.awk), equals);
            } else {
                zzbwb().zzbxa().zze("Invalid user property value for Numeric number filter. property, value", zzgVar.name, zzgVar.Fe);
                return null;
            }
        }
    }

    static Boolean zza(Boolean bool, boolean z) {
        if (bool == null) {
            return null;
        }
        return Boolean.valueOf(bool.booleanValue() ^ z);
    }

    private Boolean zza(String str, int i, boolean z, String str2, List<String> list, String str3) {
        if (str == null) {
            return null;
        }
        if (i == 6) {
            if (list == null || list.size() == 0) {
                return null;
            }
        } else if (str2 == null) {
            return null;
        }
        if (!z && i != 1) {
            str = str.toUpperCase(Locale.ENGLISH);
        }
        switch (i) {
            case 1:
                return Boolean.valueOf(Pattern.compile(str3, z ? 0 : 66).matcher(str).matches());
            case 2:
                return Boolean.valueOf(str.startsWith(str2));
            case 3:
                return Boolean.valueOf(str.endsWith(str2));
            case 4:
                return Boolean.valueOf(str.contains(str2));
            case 5:
                return Boolean.valueOf(str.equals(str2));
            case 6:
                return Boolean.valueOf(list.contains(str));
            default:
                return null;
        }
    }

    private Boolean zza(BigDecimal bigDecimal, int i, BigDecimal bigDecimal2, BigDecimal bigDecimal3, BigDecimal bigDecimal4, double d) {
        boolean z = true;
        if (bigDecimal == null) {
            return null;
        }
        if (i == 4) {
            if (bigDecimal3 == null || bigDecimal4 == null) {
                return null;
            }
        } else if (bigDecimal2 == null) {
            return null;
        }
        switch (i) {
            case 1:
                if (bigDecimal.compareTo(bigDecimal2) != -1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 2:
                if (bigDecimal.compareTo(bigDecimal2) != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 3:
                if (d == 0.0d) {
                    if (bigDecimal.compareTo(bigDecimal2) != 0) {
                        z = false;
                    }
                    return Boolean.valueOf(z);
                }
                if (bigDecimal.compareTo(bigDecimal2.subtract(new BigDecimal(d).multiply(new BigDecimal(2)))) != 1 || bigDecimal.compareTo(bigDecimal2.add(new BigDecimal(d).multiply(new BigDecimal(2)))) != -1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 4:
                if (bigDecimal.compareTo(bigDecimal3) == -1 || bigDecimal.compareTo(bigDecimal4) == 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            default:
                return null;
        }
    }

    private List<String> zza(String[] strArr, boolean z) {
        if (z) {
            return Arrays.asList(strArr);
        }
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            arrayList.add(str.toUpperCase(Locale.ENGLISH));
        }
        return arrayList;
    }

    public Boolean zza(double d, zzwa.zzd zzdVar) {
        try {
            return zza(new BigDecimal(d), zzdVar, Math.ulp(d));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public Boolean zza(long j, zzwa.zzd zzdVar) {
        try {
            return zza(new BigDecimal(j), zzdVar, 0.0d);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public Boolean zza(String str, zzwa.zzd zzdVar) {
        if (!zzal.zzng(str)) {
            return null;
        }
        try {
            return zza(new BigDecimal(str), zzdVar, 0.0d);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    Boolean zza(String str, zzwa.zzf zzfVar) {
        String str2 = null;
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        if (str == null || zzfVar.awv == null || zzfVar.awv.intValue() == 0) {
            return null;
        }
        if (zzfVar.awv.intValue() == 6) {
            if (zzfVar.awy == null || zzfVar.awy.length == 0) {
                return null;
            }
        } else if (zzfVar.aww == null) {
            return null;
        }
        int intValue = zzfVar.awv.intValue();
        boolean z = zzfVar.awx != null && zzfVar.awx.booleanValue();
        String upperCase = (z || intValue == 1 || intValue == 6) ? zzfVar.aww : zzfVar.aww.toUpperCase(Locale.ENGLISH);
        List<String> zza = zzfVar.awy == null ? null : zza(zzfVar.awy, z);
        if (intValue == 1) {
            str2 = upperCase;
        }
        return zza(str, intValue, z, upperCase, zza, str2);
    }

    Boolean zza(BigDecimal bigDecimal, zzwa.zzd zzdVar, double d) {
        BigDecimal bigDecimal2;
        BigDecimal bigDecimal3;
        BigDecimal bigDecimal4;
        com.google.android.gms.common.internal.zzaa.zzy(zzdVar);
        if (zzdVar.awn == null || zzdVar.awn.intValue() == 0) {
            return null;
        }
        if (zzdVar.awn.intValue() == 4) {
            if (zzdVar.awq == null || zzdVar.awr == null) {
                return null;
            }
        } else if (zzdVar.awp == null) {
            return null;
        }
        int intValue = zzdVar.awn.intValue();
        if (zzdVar.awn.intValue() == 4) {
            if (!zzal.zzng(zzdVar.awq) || !zzal.zzng(zzdVar.awr)) {
                return null;
            }
            try {
                bigDecimal4 = new BigDecimal(zzdVar.awq);
                bigDecimal3 = new BigDecimal(zzdVar.awr);
                bigDecimal2 = null;
            } catch (NumberFormatException e) {
                return null;
            }
        } else if (!zzal.zzng(zzdVar.awp)) {
            return null;
        } else {
            try {
                bigDecimal2 = new BigDecimal(zzdVar.awp);
                bigDecimal3 = null;
                bigDecimal4 = null;
            } catch (NumberFormatException e2) {
                return null;
            }
        }
        return zza(bigDecimal, intValue, bigDecimal2, bigDecimal4, bigDecimal3, d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zza(String str, zzwa.zza[] zzaVarArr) {
        zzwa.zzb[] zzbVarArr;
        zzwa.zze[] zzeVarArr;
        com.google.android.gms.common.internal.zzaa.zzy(zzaVarArr);
        for (zzwa.zza zzaVar : zzaVarArr) {
            for (zzwa.zzb zzbVar : zzaVar.awb) {
                String str2 = AppMeasurement.zza.aqx.get(zzbVar.awe);
                if (str2 != null) {
                    zzbVar.awe = str2;
                }
                zzwa.zzc[] zzcVarArr = zzbVar.awf;
                for (zzwa.zzc zzcVar : zzcVarArr) {
                    String str3 = AppMeasurement.zze.aqy.get(zzcVar.awm);
                    if (str3 != null) {
                        zzcVar.awm = str3;
                    }
                }
            }
            for (zzwa.zze zzeVar : zzaVar.awa) {
                String str4 = AppMeasurement.zzg.aqC.get(zzeVar.awt);
                if (str4 != null) {
                    zzeVar.awt = str4;
                }
            }
        }
        zzbvw().zzb(str, zzaVarArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public zzwc.zza[] zza(String str, zzwc.zzb[] zzbVarArr, zzwc.zzg[] zzgVarArr) {
        Map<Integer, List<zzwa.zze>> map;
        zzi zzbwv;
        Map<Integer, List<zzwa.zzb>> map2;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        HashSet hashSet = new HashSet();
        ArrayMap arrayMap = new ArrayMap();
        ArrayMap arrayMap2 = new ArrayMap();
        ArrayMap arrayMap3 = new ArrayMap();
        Map<Integer, zzwc.zzf> zzmd = zzbvw().zzmd(str);
        if (zzmd != null) {
            for (Integer num : zzmd.keySet()) {
                int intValue = num.intValue();
                zzwc.zzf zzfVar = zzmd.get(Integer.valueOf(intValue));
                BitSet bitSet = (BitSet) arrayMap2.get(Integer.valueOf(intValue));
                BitSet bitSet2 = (BitSet) arrayMap3.get(Integer.valueOf(intValue));
                if (bitSet == null) {
                    bitSet = new BitSet();
                    arrayMap2.put(Integer.valueOf(intValue), bitSet);
                    bitSet2 = new BitSet();
                    arrayMap3.put(Integer.valueOf(intValue), bitSet2);
                }
                for (int i = 0; i < zzfVar.axu.length * 64; i++) {
                    if (zzal.zza(zzfVar.axu, i)) {
                        zzbwb().zzbxe().zze("Filter already evaluated. audience ID, filter ID", Integer.valueOf(intValue), Integer.valueOf(i));
                        bitSet2.set(i);
                        if (zzal.zza(zzfVar.axv, i)) {
                            bitSet.set(i);
                        }
                    }
                }
                zzwc.zza zzaVar = new zzwc.zza();
                arrayMap.put(Integer.valueOf(intValue), zzaVar);
                zzaVar.awL = false;
                zzaVar.awK = zzfVar;
                zzaVar.awJ = new zzwc.zzf();
                zzaVar.awJ.axv = zzal.zza(bitSet);
                zzaVar.awJ.axu = zzal.zza(bitSet2);
            }
        }
        if (zzbVarArr != null) {
            ArrayMap arrayMap4 = new ArrayMap();
            int length = zzbVarArr.length;
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 >= length) {
                    break;
                }
                zzwc.zzb zzbVar = zzbVarArr[i3];
                zzi zzap = zzbvw().zzap(str, zzbVar.name);
                if (zzap == null) {
                    zzbwb().zzbxa().zzj("Event aggregate wasn't created during raw event logging. event", zzbVar.name);
                    zzbwv = new zzi(str, zzbVar.name, 1L, 1L, zzbVar.awO.longValue());
                } else {
                    zzbwv = zzap.zzbwv();
                }
                zzbvw().zza(zzbwv);
                long j = zzbwv.arD;
                Map<Integer, List<zzwa.zzb>> map3 = (Map) arrayMap4.get(zzbVar.name);
                if (map3 == null) {
                    Map<Integer, List<zzwa.zzb>> zzas = zzbvw().zzas(str, zzbVar.name);
                    if (zzas == null) {
                        zzas = new ArrayMap<>();
                    }
                    arrayMap4.put(zzbVar.name, zzas);
                    map2 = zzas;
                } else {
                    map2 = map3;
                }
                for (Integer num2 : map2.keySet()) {
                    int intValue2 = num2.intValue();
                    if (hashSet.contains(Integer.valueOf(intValue2))) {
                        zzbwb().zzbxe().zzj("Skipping failed audience ID", Integer.valueOf(intValue2));
                    } else {
                        zzwc.zza zzaVar2 = (zzwc.zza) arrayMap.get(Integer.valueOf(intValue2));
                        BitSet bitSet3 = (BitSet) arrayMap2.get(Integer.valueOf(intValue2));
                        BitSet bitSet4 = (BitSet) arrayMap3.get(Integer.valueOf(intValue2));
                        if (zzaVar2 == null) {
                            zzwc.zza zzaVar3 = new zzwc.zza();
                            arrayMap.put(Integer.valueOf(intValue2), zzaVar3);
                            zzaVar3.awL = true;
                            bitSet3 = new BitSet();
                            arrayMap2.put(Integer.valueOf(intValue2), bitSet3);
                            bitSet4 = new BitSet();
                            arrayMap3.put(Integer.valueOf(intValue2), bitSet4);
                        }
                        for (zzwa.zzb zzbVar2 : map2.get(Integer.valueOf(intValue2))) {
                            if (zzbwb().zzbi(2)) {
                                zzbwb().zzbxe().zzd("Evaluating filter. audience, filter, event", Integer.valueOf(intValue2), zzbVar2.awd, zzbVar2.awe);
                                zzbwb().zzbxe().zzj("Filter definition", zzal.zza(zzbVar2));
                            }
                            if (zzbVar2.awd == null || zzbVar2.awd.intValue() > 256) {
                                zzbwb().zzbxa().zzj("Invalid event filter ID. id", String.valueOf(zzbVar2.awd));
                            } else if (bitSet3.get(zzbVar2.awd.intValue())) {
                                zzbwb().zzbxe().zze("Event filter already evaluated true. audience ID, filter ID", Integer.valueOf(intValue2), zzbVar2.awd);
                            } else {
                                Boolean zza = zza(zzbVar2, zzbVar, j);
                                zzbwb().zzbxe().zzj("Event filter result", zza == null ? "null" : zza);
                                if (zza == null) {
                                    hashSet.add(Integer.valueOf(intValue2));
                                } else {
                                    bitSet4.set(zzbVar2.awd.intValue());
                                    if (zza.booleanValue()) {
                                        bitSet3.set(zzbVar2.awd.intValue());
                                    }
                                }
                            }
                        }
                    }
                }
                i2 = i3 + 1;
            }
        }
        if (zzgVarArr != null) {
            ArrayMap arrayMap5 = new ArrayMap();
            for (zzwc.zzg zzgVar : zzgVarArr) {
                Map<Integer, List<zzwa.zze>> map4 = (Map) arrayMap5.get(zzgVar.name);
                if (map4 == null) {
                    Map<Integer, List<zzwa.zze>> zzat = zzbvw().zzat(str, zzgVar.name);
                    if (zzat == null) {
                        zzat = new ArrayMap<>();
                    }
                    arrayMap5.put(zzgVar.name, zzat);
                    map = zzat;
                } else {
                    map = map4;
                }
                for (Integer num3 : map.keySet()) {
                    int intValue3 = num3.intValue();
                    if (hashSet.contains(Integer.valueOf(intValue3))) {
                        zzbwb().zzbxe().zzj("Skipping failed audience ID", Integer.valueOf(intValue3));
                    } else {
                        zzwc.zza zzaVar4 = (zzwc.zza) arrayMap.get(Integer.valueOf(intValue3));
                        BitSet bitSet5 = (BitSet) arrayMap2.get(Integer.valueOf(intValue3));
                        BitSet bitSet6 = (BitSet) arrayMap3.get(Integer.valueOf(intValue3));
                        if (zzaVar4 == null) {
                            zzwc.zza zzaVar5 = new zzwc.zza();
                            arrayMap.put(Integer.valueOf(intValue3), zzaVar5);
                            zzaVar5.awL = true;
                            bitSet5 = new BitSet();
                            arrayMap2.put(Integer.valueOf(intValue3), bitSet5);
                            bitSet6 = new BitSet();
                            arrayMap3.put(Integer.valueOf(intValue3), bitSet6);
                        }
                        for (zzwa.zze zzeVar : map.get(Integer.valueOf(intValue3))) {
                            if (zzbwb().zzbi(2)) {
                                zzbwb().zzbxe().zzd("Evaluating filter. audience, filter, property", Integer.valueOf(intValue3), zzeVar.awd, zzeVar.awt);
                                zzbwb().zzbxe().zzj("Filter definition", zzal.zza(zzeVar));
                            }
                            if (zzeVar.awd == null || zzeVar.awd.intValue() > 256) {
                                zzbwb().zzbxa().zzj("Invalid property filter ID. id", String.valueOf(zzeVar.awd));
                                hashSet.add(Integer.valueOf(intValue3));
                                break;
                            } else if (bitSet5.get(zzeVar.awd.intValue())) {
                                zzbwb().zzbxe().zze("Property filter already evaluated true. audience ID, filter ID", Integer.valueOf(intValue3), zzeVar.awd);
                            } else {
                                Boolean zza2 = zza(zzeVar, zzgVar);
                                zzbwb().zzbxe().zzj("Property filter result", zza2 == null ? "null" : zza2);
                                if (zza2 == null) {
                                    hashSet.add(Integer.valueOf(intValue3));
                                } else {
                                    bitSet6.set(zzeVar.awd.intValue());
                                    if (zza2.booleanValue()) {
                                        bitSet5.set(zzeVar.awd.intValue());
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        zzwc.zza[] zzaVarArr = new zzwc.zza[arrayMap2.size()];
        int i4 = 0;
        for (K k : arrayMap2.keySet()) {
            int intValue4 = k.intValue();
            if (!hashSet.contains(Integer.valueOf(intValue4))) {
                zzwc.zza zzaVar6 = (zzwc.zza) arrayMap.get(Integer.valueOf(intValue4));
                if (zzaVar6 == null) {
                    zzaVar6 = new zzwc.zza();
                }
                zzwc.zza zzaVar7 = zzaVar6;
                zzaVarArr[i4] = zzaVar7;
                zzaVar7.avZ = Integer.valueOf(intValue4);
                zzaVar7.awJ = new zzwc.zzf();
                zzaVar7.awJ.axv = zzal.zza((BitSet) arrayMap2.get(Integer.valueOf(intValue4)));
                zzaVar7.awJ.axu = zzal.zza((BitSet) arrayMap3.get(Integer.valueOf(intValue4)));
                zzbvw().zza(str, intValue4, zzaVar7.awJ);
                i4++;
            }
        }
        return (zzwc.zza[]) Arrays.copyOf(zzaVarArr, i4);
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
