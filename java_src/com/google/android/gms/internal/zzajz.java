package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import com.google.android.gms.internal.zzalm;
import com.google.firebase.database.DatabaseError;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzajz {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final Map<zzalk, zzalm> bfe = new HashMap();
    private final zzaku bff;

    static {
        $assertionsDisabled = !zzajz.class.desiredAssertionStatus();
    }

    public zzajz(zzaku zzakuVar) {
        this.bff = zzakuVar;
    }

    private List<zzalg> zza(zzalm zzalmVar, zzakn zzaknVar, zzaki zzakiVar, zzaml zzamlVar) {
        zzalm.zza zzb = zzalmVar.zzb(zzaknVar, zzakiVar, zzamlVar);
        if (!zzalmVar.zzcyi().zzcye()) {
            HashSet hashSet = new HashSet();
            HashSet hashSet2 = new HashSet();
            for (zzalf zzalfVar : zzb.bhX) {
                zzalh.zza zzcxm = zzalfVar.zzcxm();
                if (zzcxm == zzalh.zza.CHILD_ADDED) {
                    hashSet2.add(zzalfVar.zzcxl());
                } else if (zzcxm == zzalh.zza.CHILD_REMOVED) {
                    hashSet.add(zzalfVar.zzcxl());
                }
            }
            if (!hashSet2.isEmpty() || !hashSet.isEmpty()) {
                this.bff.zza(zzalmVar.zzcyi(), hashSet2, hashSet);
            }
        }
        return zzb.bhW;
    }

    public boolean isEmpty() {
        return this.bfe.isEmpty();
    }

    public zzank<List<zzall>, List<zzalh>> zza(zzall zzallVar, zzajl zzajlVar, DatabaseError databaseError) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        boolean zzcvy = zzcvy();
        if (zzallVar.isDefault()) {
            Iterator<Map.Entry<zzalk, zzalm>> it = this.bfe.entrySet().iterator();
            while (it.hasNext()) {
                zzalm value = it.next().getValue();
                arrayList2.addAll(value.zza(zzajlVar, databaseError));
                if (value.isEmpty()) {
                    it.remove();
                    if (!value.zzcyi().zzcye()) {
                        arrayList.add(value.zzcyi());
                    }
                }
            }
        } else {
            zzalm zzalmVar = this.bfe.get(zzallVar.zzcyh());
            if (zzalmVar != null) {
                arrayList2.addAll(zzalmVar.zza(zzajlVar, databaseError));
                if (zzalmVar.isEmpty()) {
                    this.bfe.remove(zzallVar.zzcyh());
                    if (!zzalmVar.zzcyi().zzcye()) {
                        arrayList.add(zzalmVar.zzcyi());
                    }
                }
            }
        }
        if (zzcvy && !zzcvy()) {
            arrayList.add(zzall.zzan(zzallVar.zzcrc()));
        }
        return new zzank<>(arrayList, arrayList2);
    }

    public List<zzalg> zza(zzajl zzajlVar, zzaki zzakiVar, zzald zzaldVar) {
        boolean z;
        zzall zzcud = zzajlVar.zzcud();
        zzalm zzalmVar = this.bfe.get(zzcud.zzcyh());
        if (zzalmVar == null) {
            zzaml zzc = zzakiVar.zzc(zzaldVar.zzcxh() ? zzaldVar.zzcqy() : null);
            if (zzc != null) {
                z = true;
            } else {
                zzc = zzakiVar.zzd(zzaldVar.zzcqy());
                z = false;
            }
            zzalm zzalmVar2 = new zzalm(zzcud, new zzaln(new zzald(zzamg.zza(zzc, zzcud.zzcya()), z, false), zzaldVar));
            if (!zzcud.zzcye()) {
                HashSet hashSet = new HashSet();
                for (zzamk zzamkVar : zzalmVar2.zzcyk()) {
                    hashSet.add(zzamkVar.a());
                }
                this.bff.zza(zzcud, hashSet);
            }
            this.bfe.put(zzcud.zzcyh(), zzalmVar2);
            zzalmVar = zzalmVar2;
        }
        zzalmVar.zzb(zzajlVar);
        return zzalmVar.zzl(zzajlVar);
    }

    public List<zzalg> zza(zzakn zzaknVar, zzaki zzakiVar, zzaml zzamlVar) {
        zzalk zzcwu = zzaknVar.zzcwp().zzcwu();
        if (zzcwu != null) {
            zzalm zzalmVar = this.bfe.get(zzcwu);
            if (!$assertionsDisabled && zzalmVar == null) {
                throw new AssertionError();
            }
            return zza(zzalmVar, zzaknVar, zzakiVar, zzamlVar);
        }
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<zzalk, zzalm> entry : this.bfe.entrySet()) {
            arrayList.addAll(zza(entry.getValue(), zzaknVar, zzakiVar, zzamlVar));
        }
        return arrayList;
    }

    public zzalm zzb(zzall zzallVar) {
        return zzallVar.zzcye() ? zzcvz() : this.bfe.get(zzallVar.zzcyh());
    }

    public boolean zzc(zzall zzallVar) {
        return zzb(zzallVar) != null;
    }

    public List<zzalm> zzcvx() {
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<zzalk, zzalm> entry : this.bfe.entrySet()) {
            zzalm value = entry.getValue();
            if (!value.zzcyi().zzcye()) {
                arrayList.add(value);
            }
        }
        return arrayList;
    }

    public boolean zzcvy() {
        return zzcvz() != null;
    }

    public zzalm zzcvz() {
        for (Map.Entry<zzalk, zzalm> entry : this.bfe.entrySet()) {
            zzalm value = entry.getValue();
            if (value.zzcyi().zzcye()) {
                return value;
            }
        }
        return null;
    }

    public zzaml zzs(zzajq zzajqVar) {
        for (zzalm zzalmVar : this.bfe.values()) {
            if (zzalmVar.zzs(zzajqVar) != null) {
                return zzalmVar.zzs(zzajqVar);
            }
        }
        return null;
    }
}
