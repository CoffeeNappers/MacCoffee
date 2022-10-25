package com.google.android.gms.internal;

import com.google.android.gms.internal.zzai;
import com.google.android.gms.internal.zzaj;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzafw {

    /* loaded from: classes2.dex */
    public static class zza {
        private final zzaj.zza aHd;
        private final Map<String, zzaj.zza> aLM;

        private zza(Map<String, zzaj.zza> map, zzaj.zza zzaVar) {
            this.aLM = map;
            this.aHd = zzaVar;
        }

        public static zzb zzcku() {
            return new zzb();
        }

        public String toString() {
            String valueOf = String.valueOf(zzcjt());
            String valueOf2 = String.valueOf(this.aHd);
            return new StringBuilder(String.valueOf(valueOf).length() + 32 + String.valueOf(valueOf2).length()).append("Properties: ").append(valueOf).append(" pushAfterEvaluate: ").append(valueOf2).toString();
        }

        public void zza(String str, zzaj.zza zzaVar) {
            this.aLM.put(str, zzaVar);
        }

        public zzaj.zza zzcgm() {
            return this.aHd;
        }

        public Map<String, zzaj.zza> zzcjt() {
            return Collections.unmodifiableMap(this.aLM);
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb {
        private zzaj.zza aHd;
        private final Map<String, zzaj.zza> aLM;

        private zzb() {
            this.aLM = new HashMap();
        }

        public zzb zzb(String str, zzaj.zza zzaVar) {
            this.aLM.put(str, zzaVar);
            return this;
        }

        public zza zzckv() {
            return new zza(this.aLM, this.aHd);
        }

        public zzb zzq(zzaj.zza zzaVar) {
            this.aHd = zzaVar;
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzc {
        private final List<zze> aLJ;
        private final Map<String, List<zza>> aLK;
        private final int aLL;
        private final String um;

        private zzc(List<zze> list, Map<String, List<zza>> map, String str, int i) {
            this.aLJ = Collections.unmodifiableList(list);
            this.aLK = Collections.unmodifiableMap(map);
            this.um = str;
            this.aLL = i;
        }

        public static zzd zzckw() {
            return new zzd();
        }

        public String getVersion() {
            return this.um;
        }

        public String toString() {
            String valueOf = String.valueOf(zzcjr());
            String valueOf2 = String.valueOf(this.aLK);
            return new StringBuilder(String.valueOf(valueOf).length() + 17 + String.valueOf(valueOf2).length()).append("Rules: ").append(valueOf).append("  Macros: ").append(valueOf2).toString();
        }

        public List<zze> zzcjr() {
            return this.aLJ;
        }

        public Map<String, List<zza>> zzckx() {
            return this.aLK;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd {
        private final List<zze> aLJ;
        private final Map<String, List<zza>> aLK;
        private int aLL;
        private String um;

        private zzd() {
            this.aLJ = new ArrayList();
            this.aLK = new HashMap();
            this.um = "";
            this.aLL = 0;
        }

        public zzd zzaao(int i) {
            this.aLL = i;
            return this;
        }

        public zzd zzb(zze zzeVar) {
            this.aLJ.add(zzeVar);
            return this;
        }

        public zzd zzc(zza zzaVar) {
            String zzg = com.google.android.gms.tagmanager.zzdm.zzg(zzaVar.zzcjt().get(zzah.INSTANCE_NAME.toString()));
            List<zza> list = this.aLK.get(zzg);
            if (list == null) {
                list = new ArrayList<>();
                this.aLK.put(zzg, list);
            }
            list.add(zzaVar);
            return this;
        }

        public zzc zzcky() {
            return new zzc(this.aLJ, this.aLK, this.um, this.aLL);
        }

        public zzd zzri(String str) {
            this.um = str;
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zze {
        private final List<zza> aLO;
        private final List<zza> aLP;
        private final List<zza> aLQ;
        private final List<zza> aLR;
        private final List<String> aMA;
        private final List<String> aMB;
        private final List<String> aMC;
        private final List<zza> aMx;
        private final List<zza> aMy;
        private final List<String> aMz;

        private zze(List<zza> list, List<zza> list2, List<zza> list3, List<zza> list4, List<zza> list5, List<zza> list6, List<String> list7, List<String> list8, List<String> list9, List<String> list10) {
            this.aLO = Collections.unmodifiableList(list);
            this.aLP = Collections.unmodifiableList(list2);
            this.aLQ = Collections.unmodifiableList(list3);
            this.aLR = Collections.unmodifiableList(list4);
            this.aMx = Collections.unmodifiableList(list5);
            this.aMy = Collections.unmodifiableList(list6);
            this.aMz = Collections.unmodifiableList(list7);
            this.aMA = Collections.unmodifiableList(list8);
            this.aMB = Collections.unmodifiableList(list9);
            this.aMC = Collections.unmodifiableList(list10);
        }

        public static zzf zzckz() {
            return new zzf();
        }

        public String toString() {
            String valueOf = String.valueOf(zzcjv());
            String valueOf2 = String.valueOf(zzcjw());
            String valueOf3 = String.valueOf(zzcjx());
            String valueOf4 = String.valueOf(zzcjy());
            String valueOf5 = String.valueOf(zzcla());
            String valueOf6 = String.valueOf(zzcld());
            return new StringBuilder(String.valueOf(valueOf).length() + 102 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length() + String.valueOf(valueOf4).length() + String.valueOf(valueOf5).length() + String.valueOf(valueOf6).length()).append("Positive predicates: ").append(valueOf).append("  Negative predicates: ").append(valueOf2).append("  Add tags: ").append(valueOf3).append("  Remove tags: ").append(valueOf4).append("  Add macros: ").append(valueOf5).append("  Remove macros: ").append(valueOf6).toString();
        }

        public List<zza> zzcjv() {
            return this.aLO;
        }

        public List<zza> zzcjw() {
            return this.aLP;
        }

        public List<zza> zzcjx() {
            return this.aLQ;
        }

        public List<zza> zzcjy() {
            return this.aLR;
        }

        public List<zza> zzcla() {
            return this.aMx;
        }

        public List<String> zzclb() {
            return this.aMB;
        }

        public List<String> zzclc() {
            return this.aMC;
        }

        public List<zza> zzcld() {
            return this.aMy;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzf {
        private final List<zza> aLO;
        private final List<zza> aLP;
        private final List<zza> aLQ;
        private final List<zza> aLR;
        private final List<String> aMA;
        private final List<String> aMB;
        private final List<String> aMC;
        private final List<zza> aMx;
        private final List<zza> aMy;
        private final List<String> aMz;

        private zzf() {
            this.aLO = new ArrayList();
            this.aLP = new ArrayList();
            this.aLQ = new ArrayList();
            this.aLR = new ArrayList();
            this.aMx = new ArrayList();
            this.aMy = new ArrayList();
            this.aMz = new ArrayList();
            this.aMA = new ArrayList();
            this.aMB = new ArrayList();
            this.aMC = new ArrayList();
        }

        public zze zzcle() {
            return new zze(this.aLO, this.aLP, this.aLQ, this.aLR, this.aMx, this.aMy, this.aMz, this.aMA, this.aMB, this.aMC);
        }

        public zzf zzd(zza zzaVar) {
            this.aLO.add(zzaVar);
            return this;
        }

        public zzf zze(zza zzaVar) {
            this.aLP.add(zzaVar);
            return this;
        }

        public zzf zzf(zza zzaVar) {
            this.aLQ.add(zzaVar);
            return this;
        }

        public zzf zzg(zza zzaVar) {
            this.aLR.add(zzaVar);
            return this;
        }

        public zzf zzh(zza zzaVar) {
            this.aMx.add(zzaVar);
            return this;
        }

        public zzf zzi(zza zzaVar) {
            this.aMy.add(zzaVar);
            return this;
        }

        public zzf zzrj(String str) {
            this.aMB.add(str);
            return this;
        }

        public zzf zzrk(String str) {
            this.aMC.add(str);
            return this;
        }

        public zzf zzrl(String str) {
            this.aMz.add(str);
            return this;
        }

        public zzf zzrm(String str) {
            this.aMA.add(str);
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzg extends Exception {
        public zzg(String str) {
            super(str);
        }
    }

    private static zza zza(zzai.zzb zzbVar, zzai.zzf zzfVar, zzaj.zza[] zzaVarArr, int i) throws zzg {
        zzb zzcku = zza.zzcku();
        for (int i2 : zzbVar.zzvu) {
            zzai.zze zzeVar = (zzai.zze) zza(zzfVar.zzwk, Integer.valueOf(i2).intValue(), "properties");
            String str = (String) zza(zzfVar.zzwi, zzeVar.key, "keys");
            zzaj.zza zzaVar = (zzaj.zza) zza(zzaVarArr, zzeVar.value, "values");
            if (zzah.PUSH_AFTER_EVALUATE.toString().equals(str)) {
                zzcku.zzq(zzaVar);
            } else {
                zzcku.zzb(str, zzaVar);
            }
        }
        return zzcku.zzckv();
    }

    private static zze zza(zzai.zzg zzgVar, List<zza> list, List<zza> list2, List<zza> list3, zzai.zzf zzfVar) {
        zzf zzckz = zze.zzckz();
        for (int i : zzgVar.zzwy) {
            zzckz.zzd(list3.get(Integer.valueOf(i).intValue()));
        }
        for (int i2 : zzgVar.zzwz) {
            zzckz.zze(list3.get(Integer.valueOf(i2).intValue()));
        }
        for (int i3 : zzgVar.zzxa) {
            zzckz.zzf(list.get(Integer.valueOf(i3).intValue()));
        }
        for (int i4 : zzgVar.zzxc) {
            zzckz.zzrj(zzfVar.zzwj[Integer.valueOf(i4).intValue()].string);
        }
        for (int i5 : zzgVar.zzxb) {
            zzckz.zzg(list.get(Integer.valueOf(i5).intValue()));
        }
        for (int i6 : zzgVar.zzxd) {
            zzckz.zzrk(zzfVar.zzwj[Integer.valueOf(i6).intValue()].string);
        }
        for (int i7 : zzgVar.zzxe) {
            zzckz.zzh(list2.get(Integer.valueOf(i7).intValue()));
        }
        for (int i8 : zzgVar.zzxg) {
            zzckz.zzrl(zzfVar.zzwj[Integer.valueOf(i8).intValue()].string);
        }
        for (int i9 : zzgVar.zzxf) {
            zzckz.zzi(list2.get(Integer.valueOf(i9).intValue()));
        }
        for (int i10 : zzgVar.zzxh) {
            zzckz.zzrm(zzfVar.zzwj[Integer.valueOf(i10).intValue()].string);
        }
        return zzckz.zzcle();
    }

    private static zzaj.zza zza(int i, zzai.zzf zzfVar, zzaj.zza[] zzaVarArr, Set<Integer> set) throws zzg {
        int i2 = 0;
        if (set.contains(Integer.valueOf(i))) {
            String valueOf = String.valueOf(set);
            zzqt(new StringBuilder(String.valueOf(valueOf).length() + 90).append("Value cycle detected.  Current value reference: ").append(i).append(".  Previous value references: ").append(valueOf).append(".").toString());
        }
        zzaj.zza zzaVar = (zzaj.zza) zza(zzfVar.zzwj, i, "values");
        if (zzaVarArr[i] != null) {
            return zzaVarArr[i];
        }
        zzaj.zza zzaVar2 = null;
        set.add(Integer.valueOf(i));
        switch (zzaVar.type) {
            case 1:
            case 5:
            case 6:
            case 8:
                zzaVar2 = zzaVar;
                break;
            case 2:
                zzai.zzh zzp = zzp(zzaVar);
                zzaVar2 = zzo(zzaVar);
                zzaVar2.zzxy = new zzaj.zza[zzp.zzxk.length];
                int[] iArr = zzp.zzxk;
                int length = iArr.length;
                int i3 = 0;
                while (i2 < length) {
                    zzaVar2.zzxy[i3] = zza(iArr[i2], zzfVar, zzaVarArr, set);
                    i2++;
                    i3++;
                }
                break;
            case 3:
                zzaVar2 = zzo(zzaVar);
                zzai.zzh zzp2 = zzp(zzaVar);
                if (zzp2.zzxl.length != zzp2.zzxm.length) {
                    zzqt(new StringBuilder(58).append("Uneven map keys (").append(zzp2.zzxl.length).append(") and map values (").append(zzp2.zzxm.length).append(")").toString());
                }
                zzaVar2.zzxz = new zzaj.zza[zzp2.zzxl.length];
                zzaVar2.zzya = new zzaj.zza[zzp2.zzxl.length];
                int[] iArr2 = zzp2.zzxl;
                int length2 = iArr2.length;
                int i4 = 0;
                int i5 = 0;
                while (i4 < length2) {
                    zzaVar2.zzxz[i5] = zza(iArr2[i4], zzfVar, zzaVarArr, set);
                    i4++;
                    i5++;
                }
                int[] iArr3 = zzp2.zzxm;
                int length3 = iArr3.length;
                int i6 = 0;
                while (i2 < length3) {
                    zzaVar2.zzya[i6] = zza(iArr3[i2], zzfVar, zzaVarArr, set);
                    i2++;
                    i6++;
                }
                break;
            case 4:
                zzaVar2 = zzo(zzaVar);
                zzaVar2.zzyb = com.google.android.gms.tagmanager.zzdm.zzg(zza(zzp(zzaVar).zzxp, zzfVar, zzaVarArr, set));
                break;
            case 7:
                zzaVar2 = zzo(zzaVar);
                zzai.zzh zzp3 = zzp(zzaVar);
                zzaVar2.zzyf = new zzaj.zza[zzp3.zzxo.length];
                int[] iArr4 = zzp3.zzxo;
                int length4 = iArr4.length;
                int i7 = 0;
                while (i2 < length4) {
                    zzaVar2.zzyf[i7] = zza(iArr4[i2], zzfVar, zzaVarArr, set);
                    i2++;
                    i7++;
                }
                break;
        }
        if (zzaVar2 == null) {
            String valueOf2 = String.valueOf(zzaVar);
            zzqt(new StringBuilder(String.valueOf(valueOf2).length() + 15).append("Invalid value: ").append(valueOf2).toString());
        }
        zzaVarArr[i] = zzaVar2;
        set.remove(Integer.valueOf(i));
        return zzaVar2;
    }

    private static <T> T zza(T[] tArr, int i, String str) throws zzg {
        if (i < 0 || i >= tArr.length) {
            zzqt(new StringBuilder(String.valueOf(str).length() + 45).append("Index out of bounds detected: ").append(i).append(" in ").append(str).toString());
        }
        return tArr[i];
    }

    public static zzc zzb(zzai.zzf zzfVar) throws zzg {
        zzaj.zza[] zzaVarArr = new zzaj.zza[zzfVar.zzwj.length];
        for (int i = 0; i < zzfVar.zzwj.length; i++) {
            zza(i, zzfVar, zzaVarArr, new HashSet(0));
        }
        zzd zzckw = zzc.zzckw();
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < zzfVar.zzwm.length; i2++) {
            arrayList.add(zza(zzfVar.zzwm[i2], zzfVar, zzaVarArr, i2));
        }
        ArrayList arrayList2 = new ArrayList();
        for (int i3 = 0; i3 < zzfVar.zzwn.length; i3++) {
            arrayList2.add(zza(zzfVar.zzwn[i3], zzfVar, zzaVarArr, i3));
        }
        ArrayList arrayList3 = new ArrayList();
        for (int i4 = 0; i4 < zzfVar.zzwl.length; i4++) {
            zza zza2 = zza(zzfVar.zzwl[i4], zzfVar, zzaVarArr, i4);
            zzckw.zzc(zza2);
            arrayList3.add(zza2);
        }
        for (zzai.zzg zzgVar : zzfVar.zzwo) {
            zzckw.zzb(zza(zzgVar, arrayList, arrayList3, arrayList2, zzfVar));
        }
        zzckw.zzri(zzfVar.version);
        zzckw.zzaao(zzfVar.zzww);
        return zzckw.zzcky();
    }

    public static void zzc(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[1024];
        while (true) {
            int read = inputStream.read(bArr);
            if (read == -1) {
                return;
            }
            outputStream.write(bArr, 0, read);
        }
    }

    public static zzaj.zza zzo(zzaj.zza zzaVar) {
        zzaj.zza zzaVar2 = new zzaj.zza();
        zzaVar2.type = zzaVar.type;
        zzaVar2.zzyg = (int[]) zzaVar.zzyg.clone();
        if (zzaVar.zzyh) {
            zzaVar2.zzyh = zzaVar.zzyh;
        }
        return zzaVar2;
    }

    private static zzai.zzh zzp(zzaj.zza zzaVar) throws zzg {
        if (((zzai.zzh) zzaVar.zza(zzai.zzh.zzxi)) == null) {
            String valueOf = String.valueOf(zzaVar);
            zzqt(new StringBuilder(String.valueOf(valueOf).length() + 54).append("Expected a ServingValue and didn't get one. Value is: ").append(valueOf).toString());
        }
        return (zzai.zzh) zzaVar.zza(zzai.zzh.zzxi);
    }

    private static void zzqt(String str) throws zzg {
        com.google.android.gms.tagmanager.zzbo.e(str);
        throw new zzg(str);
    }
}
