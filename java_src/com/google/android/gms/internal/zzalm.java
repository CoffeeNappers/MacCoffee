package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakn;
import com.google.android.gms.internal.zzalo;
import com.google.firebase.database.DatabaseError;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class zzalm {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzall bhB;
    private final zzalo bhS;
    private zzaln bhT;
    private final List<zzajl> bhU;
    private final zzali bhV;

    /* loaded from: classes2.dex */
    public static class zza {
        public final List<zzalg> bhW;
        public final List<zzalf> bhX;

        public zza(List<zzalg> list, List<zzalf> list2) {
            this.bhW = list;
            this.bhX = list2;
        }
    }

    static {
        $assertionsDisabled = !zzalm.class.desiredAssertionStatus();
    }

    public zzalm(zzall zzallVar, zzaln zzalnVar) {
        this.bhB = zzallVar;
        zzalq zzalqVar = new zzalq(zzallVar.zzcya());
        zzals zzcyg = zzallVar.zzcyh().zzcyg();
        this.bhS = new zzalo(zzcyg);
        zzald zzcyn = zzalnVar.zzcyn();
        zzald zzcyl = zzalnVar.zzcyl();
        zzamg zza2 = zzamg.zza(zzame.zzczq(), zzallVar.zzcya());
        zzamg zza3 = zzalqVar.zza(zza2, zzcyn.zzcxj(), null);
        zzamg zza4 = zzcyg.zza(zza2, zzcyl.zzcxj(), null);
        this.bhT = new zzaln(new zzald(zza4, zzcyl.zzcxh(), zzcyg.zzcyr()), new zzald(zza3, zzcyn.zzcxh(), zzalqVar.zzcyr()));
        this.bhU = new ArrayList();
        this.bhV = new zzali(zzallVar);
    }

    private List<zzalg> zza(List<zzalf> list, zzamg zzamgVar, zzajl zzajlVar) {
        return this.bhV.zza(list, zzamgVar, zzajlVar == null ? this.bhU : Arrays.asList(zzajlVar));
    }

    public boolean isEmpty() {
        return this.bhU.isEmpty();
    }

    public List<zzalh> zza(zzajl zzajlVar, DatabaseError databaseError) {
        ArrayList emptyList;
        if (databaseError != null) {
            ArrayList arrayList = new ArrayList();
            if (!$assertionsDisabled && zzajlVar != null) {
                throw new AssertionError("A cancel should cancel all event registrations");
            }
            zzajq zzcrc = this.bhB.zzcrc();
            for (zzajl zzajlVar2 : this.bhU) {
                arrayList.add(new zzale(zzajlVar2, databaseError, zzcrc));
            }
            emptyList = arrayList;
        } else {
            emptyList = Collections.emptyList();
        }
        if (zzajlVar != null) {
            int i = 0;
            int i2 = -1;
            while (true) {
                if (i >= this.bhU.size()) {
                    i = i2;
                    break;
                }
                zzajl zzajlVar3 = this.bhU.get(i);
                if (zzajlVar3.zzc(zzajlVar)) {
                    if (zzajlVar3.zzcvc()) {
                        break;
                    }
                    i2 = i;
                }
                i++;
            }
            if (i != -1) {
                this.bhU.remove(i);
                this.bhU.get(i).zzcvb();
            }
        } else {
            for (zzajl zzajlVar4 : this.bhU) {
                zzajlVar4.zzcvb();
            }
            this.bhU.clear();
        }
        return emptyList;
    }

    public zza zzb(zzakn zzaknVar, zzaki zzakiVar, zzaml zzamlVar) {
        if (zzaknVar.zzcwq() == zzakn.zza.Merge && zzaknVar.zzcwp().zzcwu() != null) {
            if (!$assertionsDisabled && this.bhT.zzcyo() == null) {
                throw new AssertionError("We should always have a full cache before handling merges");
            }
            if (!$assertionsDisabled && this.bhT.zzcym() == null) {
                throw new AssertionError("Missing event cache, even though we have a server cache");
            }
        }
        zzaln zzalnVar = this.bhT;
        zzalo.zza zza2 = this.bhS.zza(zzalnVar, zzaknVar, zzakiVar, zzamlVar);
        if ($assertionsDisabled || zza2.bhT.zzcyn().zzcxh() || !zzalnVar.zzcyn().zzcxh()) {
            this.bhT = zza2.bhT;
            return new zza(zza(zza2.bhX, zza2.bhT.zzcyl().zzcxj(), null), zza2.bhX);
        }
        throw new AssertionError("Once a server snap is complete, it should never go back");
    }

    public void zzb(zzajl zzajlVar) {
        this.bhU.add(zzajlVar);
    }

    public zzall zzcyi() {
        return this.bhB;
    }

    public zzaml zzcyj() {
        return this.bhT.zzcyn().zzcqy();
    }

    public zzaml zzcyk() {
        return this.bhT.zzcyl().zzcqy();
    }

    public List<zzalg> zzl(zzajl zzajlVar) {
        zzald zzcyl = this.bhT.zzcyl();
        ArrayList arrayList = new ArrayList();
        for (zzamk zzamkVar : zzcyl.zzcqy()) {
            arrayList.add(zzalf.zzc(zzamkVar.a(), zzamkVar.zzcqy()));
        }
        if (zzcyl.zzcxh()) {
            arrayList.add(zzalf.zza(zzcyl.zzcxj()));
        }
        return zza(arrayList, zzcyl.zzcxj(), zzajlVar);
    }

    public zzaml zzs(zzajq zzajqVar) {
        zzaml zzcyo = this.bhT.zzcyo();
        if (zzcyo == null || (!this.bhB.zzcye() && (zzajqVar.isEmpty() || zzcyo.zzm(zzajqVar.zzcvj()).isEmpty()))) {
            return null;
        }
        return zzcyo.zzao(zzajqVar);
    }
}
