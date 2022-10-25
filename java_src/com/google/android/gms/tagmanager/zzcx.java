package com.google.android.gms.tagmanager;

import android.content.Context;
import com.facebook.internal.AnalyticsEvents;
import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.internal.zzaj;
import com.google.android.gms.tagmanager.zzm;
import com.google.android.gms.tagmanager.zzu;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzcx {
    private static final zzce<zzaj.zza> aGL = new zzce<>(zzdm.zzchm(), true);
    private final DataLayer aDZ;
    private final zzafw.zzc aGM;
    private final zzaj aGN;
    private final Map<String, zzam> aGO;
    private final Map<String, zzam> aGP;
    private final Map<String, zzam> aGQ;
    private final zzl<zzafw.zza, zzce<zzaj.zza>> aGR;
    private final zzl<String, zzb> aGS;
    private final Set<zzafw.zze> aGT;
    private final Map<String, zzc> aGU;
    private volatile String aGV;
    private int aGW;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zza {
        void zza(zzafw.zze zzeVar, Set<zzafw.zza> set, Set<zzafw.zza> set2, zzcs zzcsVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzb {
        private zzce<zzaj.zza> aHc;
        private zzaj.zza aHd;

        public zzb(zzce<zzaj.zza> zzceVar, zzaj.zza zzaVar) {
            this.aHc = zzceVar;
            this.aHd = zzaVar;
        }

        public int getSize() {
            return (this.aHd == null ? 0 : this.aHd.cy()) + this.aHc.getObject().cy();
        }

        public zzce<zzaj.zza> zzcgl() {
            return this.aHc;
        }

        public zzaj.zza zzcgm() {
            return this.aHd;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzc {
        private zzafw.zza aHi;
        private final Set<zzafw.zze> aGT = new HashSet();
        private final Map<zzafw.zze, List<zzafw.zza>> aHe = new HashMap();
        private final Map<zzafw.zze, List<String>> aHg = new HashMap();
        private final Map<zzafw.zze, List<zzafw.zza>> aHf = new HashMap();
        private final Map<zzafw.zze, List<String>> aHh = new HashMap();

        public void zza(zzafw.zze zzeVar) {
            this.aGT.add(zzeVar);
        }

        public void zza(zzafw.zze zzeVar, zzafw.zza zzaVar) {
            List<zzafw.zza> list = this.aHe.get(zzeVar);
            if (list == null) {
                list = new ArrayList<>();
                this.aHe.put(zzeVar, list);
            }
            list.add(zzaVar);
        }

        public void zza(zzafw.zze zzeVar, String str) {
            List<String> list = this.aHg.get(zzeVar);
            if (list == null) {
                list = new ArrayList<>();
                this.aHg.put(zzeVar, list);
            }
            list.add(str);
        }

        public void zzb(zzafw.zza zzaVar) {
            this.aHi = zzaVar;
        }

        public void zzb(zzafw.zze zzeVar, zzafw.zza zzaVar) {
            List<zzafw.zza> list = this.aHf.get(zzeVar);
            if (list == null) {
                list = new ArrayList<>();
                this.aHf.put(zzeVar, list);
            }
            list.add(zzaVar);
        }

        public void zzb(zzafw.zze zzeVar, String str) {
            List<String> list = this.aHh.get(zzeVar);
            if (list == null) {
                list = new ArrayList<>();
                this.aHh.put(zzeVar, list);
            }
            list.add(str);
        }

        public Set<zzafw.zze> zzcgn() {
            return this.aGT;
        }

        public Map<zzafw.zze, List<zzafw.zza>> zzcgo() {
            return this.aHe;
        }

        public Map<zzafw.zze, List<String>> zzcgp() {
            return this.aHg;
        }

        public Map<zzafw.zze, List<String>> zzcgq() {
            return this.aHh;
        }

        public Map<zzafw.zze, List<zzafw.zza>> zzcgr() {
            return this.aHf;
        }

        public zzafw.zza zzcgs() {
            return this.aHi;
        }
    }

    public zzcx(Context context, zzafw.zzc zzcVar, DataLayer dataLayer, zzu.zza zzaVar, zzu.zza zzaVar2, zzaj zzajVar) {
        if (zzcVar == null) {
            throw new NullPointerException("resource cannot be null");
        }
        this.aGM = zzcVar;
        this.aGT = new HashSet(zzcVar.zzcjr());
        this.aDZ = dataLayer;
        this.aGN = zzajVar;
        this.aGR = new zzm().zza(1048576, new zzm.zza<zzafw.zza, zzce<zzaj.zza>>() { // from class: com.google.android.gms.tagmanager.zzcx.1
            @Override // com.google.android.gms.tagmanager.zzm.zza
            /* renamed from: zza */
            public int sizeOf(zzafw.zza zzaVar3, zzce<zzaj.zza> zzceVar) {
                return zzceVar.getObject().cy();
            }
        });
        this.aGS = new zzm().zza(1048576, new zzm.zza<String, zzb>() { // from class: com.google.android.gms.tagmanager.zzcx.2
            @Override // com.google.android.gms.tagmanager.zzm.zza
            /* renamed from: zza */
            public int sizeOf(String str, zzb zzbVar) {
                return str.length() + zzbVar.getSize();
            }
        });
        this.aGO = new HashMap();
        zzb(new zzj(context));
        zzb(new zzu(zzaVar2));
        zzb(new zzy(dataLayer));
        zzb(new zzdn(context, dataLayer));
        this.aGP = new HashMap();
        zzc(new zzs());
        zzc(new zzag());
        zzc(new zzah());
        zzc(new zzao());
        zzc(new zzap());
        zzc(new zzbk());
        zzc(new zzbl());
        zzc(new zzcn());
        zzc(new zzdg());
        this.aGQ = new HashMap();
        zza(new com.google.android.gms.tagmanager.zzb(context));
        zza(new com.google.android.gms.tagmanager.zzc(context));
        zza(new zze(context));
        zza(new zzf(context));
        zza(new zzg(context));
        zza(new zzh(context));
        zza(new zzi(context));
        zza(new zzn());
        zza(new zzr(this.aGM.getVersion()));
        zza(new zzu(zzaVar));
        zza(new zzw(dataLayer));
        zza(new zzab(context));
        zza(new zzac());
        zza(new zzaf());
        zza(new zzak(this));
        zza(new zzaq());
        zza(new zzar());
        zza(new zzbe(context));
        zza(new zzbg());
        zza(new zzbj());
        zza(new zzbq());
        zza(new zzbs(context));
        zza(new zzcf());
        zza(new zzch());
        zza(new zzck());
        zza(new zzcm());
        zza(new zzco(context));
        zza(new zzcy());
        zza(new zzcz());
        zza(new zzdi());
        zza(new zzdo());
        this.aGU = new HashMap();
        for (zzafw.zze zzeVar : this.aGT) {
            for (int i = 0; i < zzeVar.zzcla().size(); i++) {
                zzafw.zza zzaVar3 = zzeVar.zzcla().get(i);
                zzc zzi = zzi(this.aGU, zza(zzaVar3));
                zzi.zza(zzeVar);
                zzi.zza(zzeVar, zzaVar3);
                zzi.zza(zzeVar, AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
            }
            for (int i2 = 0; i2 < zzeVar.zzcld().size(); i2++) {
                zzafw.zza zzaVar4 = zzeVar.zzcld().get(i2);
                zzc zzi2 = zzi(this.aGU, zza(zzaVar4));
                zzi2.zza(zzeVar);
                zzi2.zzb(zzeVar, zzaVar4);
                zzi2.zzb(zzeVar, AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
            }
        }
        for (Map.Entry<String, List<zzafw.zza>> entry : this.aGM.zzckx().entrySet()) {
            for (zzafw.zza zzaVar5 : entry.getValue()) {
                if (!zzdm.zzk(zzaVar5.zzcjt().get(com.google.android.gms.internal.zzah.NOT_DEFAULT_MACRO.toString())).booleanValue()) {
                    zzi(this.aGU, entry.getKey()).zzb(zzaVar5);
                }
            }
        }
    }

    private zzce<zzaj.zza> zza(zzaj.zza zzaVar, Set<String> set, zzdp zzdpVar) {
        if (!zzaVar.zzyh) {
            return new zzce<>(zzaVar, true);
        }
        switch (zzaVar.type) {
            case 2:
                zzaj.zza zzo = zzafw.zzo(zzaVar);
                zzo.zzxy = new zzaj.zza[zzaVar.zzxy.length];
                for (int i = 0; i < zzaVar.zzxy.length; i++) {
                    zzce<zzaj.zza> zza2 = zza(zzaVar.zzxy[i], set, zzdpVar.zzaac(i));
                    if (zza2 == aGL) {
                        return aGL;
                    }
                    zzo.zzxy[i] = zza2.getObject();
                }
                return new zzce<>(zzo, false);
            case 3:
                zzaj.zza zzo2 = zzafw.zzo(zzaVar);
                if (zzaVar.zzxz.length != zzaVar.zzya.length) {
                    String valueOf = String.valueOf(zzaVar.toString());
                    zzbo.e(valueOf.length() != 0 ? "Invalid serving value: ".concat(valueOf) : new String("Invalid serving value: "));
                    return aGL;
                }
                zzo2.zzxz = new zzaj.zza[zzaVar.zzxz.length];
                zzo2.zzya = new zzaj.zza[zzaVar.zzxz.length];
                for (int i2 = 0; i2 < zzaVar.zzxz.length; i2++) {
                    zzce<zzaj.zza> zza3 = zza(zzaVar.zzxz[i2], set, zzdpVar.zzaad(i2));
                    zzce<zzaj.zza> zza4 = zza(zzaVar.zzya[i2], set, zzdpVar.zzaae(i2));
                    if (zza3 == aGL || zza4 == aGL) {
                        return aGL;
                    }
                    zzo2.zzxz[i2] = zza3.getObject();
                    zzo2.zzya[i2] = zza4.getObject();
                }
                return new zzce<>(zzo2, false);
            case 4:
                if (set.contains(zzaVar.zzyb)) {
                    String valueOf2 = String.valueOf(zzaVar.zzyb);
                    String valueOf3 = String.valueOf(set.toString());
                    zzbo.e(new StringBuilder(String.valueOf(valueOf2).length() + 79 + String.valueOf(valueOf3).length()).append("Macro cycle detected.  Current macro reference: ").append(valueOf2).append(".  Previous macro references: ").append(valueOf3).append(".").toString());
                    return aGL;
                }
                set.add(zzaVar.zzyb);
                zzce<zzaj.zza> zza5 = zzdq.zza(zza(zzaVar.zzyb, set, zzdpVar.zzcft()), zzaVar.zzyg);
                set.remove(zzaVar.zzyb);
                return zza5;
            case 5:
            case 6:
            default:
                zzbo.e(new StringBuilder(25).append("Unknown type: ").append(zzaVar.type).toString());
                return aGL;
            case 7:
                zzaj.zza zzo3 = zzafw.zzo(zzaVar);
                zzo3.zzyf = new zzaj.zza[zzaVar.zzyf.length];
                for (int i3 = 0; i3 < zzaVar.zzyf.length; i3++) {
                    zzce<zzaj.zza> zza6 = zza(zzaVar.zzyf[i3], set, zzdpVar.zzaaf(i3));
                    if (zza6 == aGL) {
                        return aGL;
                    }
                    zzo3.zzyf[i3] = zza6.getObject();
                }
                return new zzce<>(zzo3, false);
        }
    }

    private zzce<zzaj.zza> zza(String str, Set<String> set, zzbr zzbrVar) {
        zzafw.zza next;
        this.aGW++;
        zzb zzbVar = this.aGS.get(str);
        if (zzbVar != null) {
            zzaj zzajVar = this.aGN;
            zza(zzbVar.zzcgm(), set);
            this.aGW--;
            return zzbVar.zzcgl();
        }
        zzc zzcVar = this.aGU.get(str);
        if (zzcVar == null) {
            String valueOf = String.valueOf(zzcgk());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 15 + String.valueOf(str).length()).append(valueOf).append("Invalid macro: ").append(str).toString());
            this.aGW--;
            return aGL;
        }
        zzce<Set<zzafw.zza>> zza2 = zza(str, zzcVar.zzcgn(), zzcVar.zzcgo(), zzcVar.zzcgp(), zzcVar.zzcgr(), zzcVar.zzcgq(), set, zzbrVar.zzcet());
        if (zza2.getObject().isEmpty()) {
            next = zzcVar.zzcgs();
        } else {
            if (zza2.getObject().size() > 1) {
                String valueOf2 = String.valueOf(zzcgk());
                zzbo.zzdi(new StringBuilder(String.valueOf(valueOf2).length() + 37 + String.valueOf(str).length()).append(valueOf2).append("Multiple macros active for macroName ").append(str).toString());
            }
            next = zza2.getObject().iterator().next();
        }
        if (next == null) {
            this.aGW--;
            return aGL;
        }
        zzce<zzaj.zza> zza3 = zza(this.aGQ, next, set, zzbrVar.zzcfl());
        zzce<zzaj.zza> zzceVar = zza3 == aGL ? aGL : new zzce<>(zza3.getObject(), zza2.zzcfu() && zza3.zzcfu());
        zzaj.zza zzcgm = next.zzcgm();
        if (zzceVar.zzcfu()) {
            this.aGS.zzi(str, new zzb(zzceVar, zzcgm));
        }
        zza(zzcgm, set);
        this.aGW--;
        return zzceVar;
    }

    private zzce<zzaj.zza> zza(Map<String, zzam> map, zzafw.zza zzaVar, Set<String> set, zzcp zzcpVar) {
        boolean z;
        boolean z2 = true;
        zzaj.zza zzaVar2 = zzaVar.zzcjt().get(com.google.android.gms.internal.zzah.FUNCTION.toString());
        if (zzaVar2 == null) {
            zzbo.e("No function id in properties");
            return aGL;
        }
        String str = zzaVar2.zzyc;
        zzam zzamVar = map.get(str);
        if (zzamVar == null) {
            zzbo.e(String.valueOf(str).concat(" has no backing implementation."));
            return aGL;
        }
        zzce<zzaj.zza> zzceVar = this.aGR.get(zzaVar);
        if (zzceVar != null) {
            zzaj zzajVar = this.aGN;
            return zzceVar;
        }
        HashMap hashMap = new HashMap();
        boolean z3 = true;
        for (Map.Entry<String, zzaj.zza> entry : zzaVar.zzcjt().entrySet()) {
            zzce<zzaj.zza> zza2 = zza(entry.getValue(), set, zzcpVar.zzpn(entry.getKey()).zze(entry.getValue()));
            if (zza2 == aGL) {
                return aGL;
            }
            if (zza2.zzcfu()) {
                zzaVar.zza(entry.getKey(), zza2.getObject());
                z = z3;
            } else {
                z = false;
            }
            hashMap.put(entry.getKey(), zza2.getObject());
            z3 = z;
        }
        if (!zzamVar.zzf(hashMap.keySet())) {
            String valueOf = String.valueOf(zzamVar.zzcfh());
            String valueOf2 = String.valueOf(hashMap.keySet());
            zzbo.e(new StringBuilder(String.valueOf(str).length() + 43 + String.valueOf(valueOf).length() + String.valueOf(valueOf2).length()).append("Incorrect keys for function ").append(str).append(" required ").append(valueOf).append(" had ").append(valueOf2).toString());
            return aGL;
        }
        if (!z3 || !zzamVar.zzcdu()) {
            z2 = false;
        }
        zzce<zzaj.zza> zzceVar2 = new zzce<>(zzamVar.zzay(hashMap), z2);
        if (z2) {
            this.aGR.zzi(zzaVar, zzceVar2);
        }
        zzcpVar.zzd(zzceVar2.getObject());
        return zzceVar2;
    }

    private zzce<Set<zzafw.zza>> zza(Set<zzafw.zze> set, Set<String> set2, zza zzaVar, zzcw zzcwVar) {
        Set<zzafw.zza> hashSet = new HashSet<>();
        Set<zzafw.zza> hashSet2 = new HashSet<>();
        boolean z = true;
        for (zzafw.zze zzeVar : set) {
            zzcs zzcfs = zzcwVar.zzcfs();
            zzce<Boolean> zza2 = zza(zzeVar, set2, zzcfs);
            if (zza2.getObject().booleanValue()) {
                zzaVar.zza(zzeVar, hashSet, hashSet2, zzcfs);
            }
            z = z && zza2.zzcfu();
        }
        hashSet.removeAll(hashSet2);
        zzcwVar.zzg(hashSet);
        return new zzce<>(hashSet, z);
    }

    private static String zza(zzafw.zza zzaVar) {
        return zzdm.zzg(zzaVar.zzcjt().get(com.google.android.gms.internal.zzah.INSTANCE_NAME.toString()));
    }

    private void zza(zzaj.zza zzaVar, Set<String> set) {
        zzce<zzaj.zza> zza2;
        if (zzaVar == null || (zza2 = zza(zzaVar, set, new zzcc())) == aGL) {
            return;
        }
        Object zzl = zzdm.zzl(zza2.getObject());
        if (zzl instanceof Map) {
            this.aDZ.push((Map) zzl);
        } else if (!(zzl instanceof List)) {
            zzbo.zzdi("pushAfterEvaluate: value not a Map or List");
        } else {
            for (Object obj : (List) zzl) {
                if (obj instanceof Map) {
                    this.aDZ.push((Map) obj);
                } else {
                    zzbo.zzdi("pushAfterEvaluate: value not a Map");
                }
            }
        }
    }

    private static void zza(Map<String, zzam> map, zzam zzamVar) {
        if (map.containsKey(zzamVar.zzcfg())) {
            String valueOf = String.valueOf(zzamVar.zzcfg());
            throw new IllegalArgumentException(valueOf.length() != 0 ? "Duplicate function type name: ".concat(valueOf) : new String("Duplicate function type name: "));
        } else {
            map.put(zzamVar.zzcfg(), zzamVar);
        }
    }

    private String zzcgk() {
        if (this.aGW <= 1) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(Integer.toString(this.aGW));
        for (int i = 2; i < this.aGW; i++) {
            sb.append(' ');
        }
        sb.append(": ");
        return sb.toString();
    }

    private static zzc zzi(Map<String, zzc> map, String str) {
        zzc zzcVar = map.get(str);
        if (zzcVar == null) {
            zzc zzcVar2 = new zzc();
            map.put(str, zzcVar2);
            return zzcVar2;
        }
        return zzcVar;
    }

    zzce<Boolean> zza(zzafw.zza zzaVar, Set<String> set, zzcp zzcpVar) {
        zzce<zzaj.zza> zza2 = zza(this.aGP, zzaVar, set, zzcpVar);
        Boolean zzk = zzdm.zzk(zza2.getObject());
        zzcpVar.zzd(zzdm.zzat(zzk));
        return new zzce<>(zzk, zza2.zzcfu());
    }

    zzce<Boolean> zza(zzafw.zze zzeVar, Set<String> set, zzcs zzcsVar) {
        boolean z = true;
        for (zzafw.zza zzaVar : zzeVar.zzcjw()) {
            zzce<Boolean> zza2 = zza(zzaVar, set, zzcsVar.zzcfm());
            if (zza2.getObject().booleanValue()) {
                zzcsVar.zzf(zzdm.zzat(false));
                return new zzce<>(false, zza2.zzcfu());
            }
            z = z && zza2.zzcfu();
        }
        for (zzafw.zza zzaVar2 : zzeVar.zzcjv()) {
            zzce<Boolean> zza3 = zza(zzaVar2, set, zzcsVar.zzcfn());
            if (!zza3.getObject().booleanValue()) {
                zzcsVar.zzf(zzdm.zzat(false));
                return new zzce<>(false, zza3.zzcfu());
            }
            z = z && zza3.zzcfu();
        }
        zzcsVar.zzf(zzdm.zzat(true));
        return new zzce<>(true, z);
    }

    zzce<Set<zzafw.zza>> zza(String str, Set<zzafw.zze> set, final Map<zzafw.zze, List<zzafw.zza>> map, final Map<zzafw.zze, List<String>> map2, final Map<zzafw.zze, List<zzafw.zza>> map3, final Map<zzafw.zze, List<String>> map4, Set<String> set2, zzcw zzcwVar) {
        return zza(set, set2, new zza() { // from class: com.google.android.gms.tagmanager.zzcx.3
            @Override // com.google.android.gms.tagmanager.zzcx.zza
            public void zza(zzafw.zze zzeVar, Set<zzafw.zza> set3, Set<zzafw.zza> set4, zzcs zzcsVar) {
                List<zzafw.zza> list = (List) map.get(zzeVar);
                List<String> list2 = (List) map2.get(zzeVar);
                if (list != null) {
                    set3.addAll(list);
                    zzcsVar.zzcfo().zzc(list, list2);
                }
                List<zzafw.zza> list3 = (List) map3.get(zzeVar);
                List<String> list4 = (List) map4.get(zzeVar);
                if (list3 != null) {
                    set4.addAll(list3);
                    zzcsVar.zzcfp().zzc(list3, list4);
                }
            }
        }, zzcwVar);
    }

    zzce<Set<zzafw.zza>> zza(Set<zzafw.zze> set, zzcw zzcwVar) {
        return zza(set, new HashSet(), new zza() { // from class: com.google.android.gms.tagmanager.zzcx.4
            @Override // com.google.android.gms.tagmanager.zzcx.zza
            public void zza(zzafw.zze zzeVar, Set<zzafw.zza> set2, Set<zzafw.zza> set3, zzcs zzcsVar) {
                set2.addAll(zzeVar.zzcjx());
                set3.addAll(zzeVar.zzcjy());
                zzcsVar.zzcfq().zzc(zzeVar.zzcjx(), zzeVar.zzclb());
                zzcsVar.zzcfr().zzc(zzeVar.zzcjy(), zzeVar.zzclc());
            }
        }, zzcwVar);
    }

    void zza(zzam zzamVar) {
        zza(this.aGQ, zzamVar);
    }

    public synchronized void zzam(List<zzai.zzi> list) {
        for (zzai.zzi zziVar : list) {
            if (zziVar.name == null || !zziVar.name.startsWith("gaExperiment:")) {
                String valueOf = String.valueOf(zziVar);
                zzbo.v(new StringBuilder(String.valueOf(valueOf).length() + 22).append("Ignored supplemental: ").append(valueOf).toString());
            } else {
                zzal.zza(this.aDZ, zziVar);
            }
        }
    }

    void zzb(zzam zzamVar) {
        zza(this.aGO, zzamVar);
    }

    void zzc(zzam zzamVar) {
        zza(this.aGP, zzamVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized String zzcgj() {
        return this.aGV;
    }

    public synchronized void zzov(String str) {
        zzps(str);
        zzai zzpi = this.aGN.zzpi(str);
        zzv zzcfe = zzpi.zzcfe();
        for (zzafw.zza zzaVar : zza(this.aGT, zzcfe.zzcet()).getObject()) {
            zza(this.aGO, zzaVar, new HashSet(), zzcfe.zzces());
        }
        zzpi.zzcff();
        zzps(null);
    }

    public zzce<zzaj.zza> zzpr(String str) {
        this.aGW = 0;
        zzai zzph = this.aGN.zzph(str);
        zzce<zzaj.zza> zza2 = zza(str, new HashSet(), zzph.zzcfd());
        zzph.zzcff();
        return zza2;
    }

    synchronized void zzps(String str) {
        this.aGV = str;
    }
}
