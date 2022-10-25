package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes2.dex */
public class zzali {
    private final zzall bhB;
    private final zzamf bhC;

    public zzali(zzall zzallVar) {
        this.bhB = zzallVar;
        this.bhC = zzallVar.zzcya();
    }

    private zzalg zza(zzalf zzalfVar, zzajl zzajlVar, zzamg zzamgVar) {
        if (!zzalfVar.zzcxm().equals(zzalh.zza.VALUE) && !zzalfVar.zzcxm().equals(zzalh.zza.CHILD_REMOVED)) {
            zzalfVar = zzalfVar.zzg(zzamgVar.zza(zzalfVar.zzcxl(), zzalfVar.zzcxj().zzcqy(), this.bhC));
        }
        return zzajlVar.zza(zzalfVar, this.bhB);
    }

    private void zza(List<zzalg> list, zzalh.zza zzaVar, List<zzalf> list2, List<zzajl> list3, zzamg zzamgVar) {
        ArrayList<zzalf> arrayList = new ArrayList();
        for (zzalf zzalfVar : list2) {
            if (zzalfVar.zzcxm().equals(zzaVar)) {
                arrayList.add(zzalfVar);
            }
        }
        Collections.sort(arrayList, zzcxr());
        for (zzalf zzalfVar2 : arrayList) {
            for (zzajl zzajlVar : list3) {
                if (zzajlVar.zza(zzaVar)) {
                    list.add(zza(zzalfVar2, zzajlVar, zzamgVar));
                }
            }
        }
    }

    private Comparator<zzalf> zzcxr() {
        return new Comparator<zzalf>() { // from class: com.google.android.gms.internal.zzali.1
            static final /* synthetic */ boolean $assertionsDisabled;

            static {
                $assertionsDisabled = !zzali.class.desiredAssertionStatus();
            }

            @Override // java.util.Comparator
            /* renamed from: zza */
            public int compare(zzalf zzalfVar, zzalf zzalfVar2) {
                if ($assertionsDisabled || !(zzalfVar.zzcxl() == null || zzalfVar2.zzcxl() == null)) {
                    return zzali.this.bhC.compare(new zzamk(zzalfVar.zzcxl(), zzalfVar.zzcxj().zzcqy()), new zzamk(zzalfVar2.zzcxl(), zzalfVar2.zzcxj().zzcqy()));
                }
                throw new AssertionError();
            }
        };
    }

    public List<zzalg> zza(List<zzalf> list, zzamg zzamgVar, List<zzajl> list2) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (zzalf zzalfVar : list) {
            if (zzalfVar.zzcxm().equals(zzalh.zza.CHILD_CHANGED) && this.bhC.zza(zzalfVar.zzcxo().zzcqy(), zzalfVar.zzcxj().zzcqy())) {
                arrayList2.add(zzalf.zzc(zzalfVar.zzcxl(), zzalfVar.zzcxj()));
            }
        }
        zza(arrayList, zzalh.zza.CHILD_REMOVED, list, list2, zzamgVar);
        zza(arrayList, zzalh.zza.CHILD_ADDED, list, list2, zzamgVar);
        zza(arrayList, zzalh.zza.CHILD_MOVED, arrayList2, list2, zzamgVar);
        zza(arrayList, zzalh.zza.CHILD_CHANGED, list, list2, zzamgVar);
        zza(arrayList, zzalh.zza.VALUE, list, list2, zzamgVar);
        return arrayList;
    }
}
