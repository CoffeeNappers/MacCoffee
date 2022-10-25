package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
/* loaded from: classes2.dex */
public class zzakj implements zzajm {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static zzakj bge;
    final HashMap<zzajl, List<zzajl>> bgd = new HashMap<>();

    static {
        $assertionsDisabled = !zzakj.class.desiredAssertionStatus();
        bge = new zzakj();
    }

    private zzakj() {
    }

    public static zzakj zzcwl() {
        return bge;
    }

    private void zzj(zzajl zzajlVar) {
        boolean z;
        zzajl zza;
        List<zzajl> list;
        boolean z2;
        int i = 0;
        synchronized (this.bgd) {
            List<zzajl> list2 = this.bgd.get(zzajlVar);
            if (list2 != null) {
                int i2 = 0;
                while (true) {
                    if (i2 >= list2.size()) {
                        z2 = false;
                        break;
                    } else if (list2.get(i2) == zzajlVar) {
                        z2 = true;
                        list2.remove(i2);
                        break;
                    } else {
                        i2++;
                    }
                }
                if (list2.isEmpty()) {
                    this.bgd.remove(zzajlVar);
                }
                z = z2;
            } else {
                z = false;
            }
            if (!$assertionsDisabled && !z && zzajlVar.zzcvd()) {
                throw new AssertionError();
            }
            if (!zzajlVar.zzcud().isDefault() && (list = this.bgd.get((zza = zzajlVar.zza(zzall.zzan(zzajlVar.zzcud().zzcrc()))))) != null) {
                while (true) {
                    if (i >= list.size()) {
                        break;
                    } else if (list.get(i) == zzajlVar) {
                        list.remove(i);
                        break;
                    } else {
                        i++;
                    }
                }
                if (list.isEmpty()) {
                    this.bgd.remove(zza);
                }
            }
        }
    }

    @Override // com.google.android.gms.internal.zzajm
    public void zzd(zzajl zzajlVar) {
        zzj(zzajlVar);
    }

    public void zzi(zzajl zzajlVar) {
        synchronized (this.bgd) {
            List<zzajl> list = this.bgd.get(zzajlVar);
            if (list == null) {
                list = new ArrayList<>();
                this.bgd.put(zzajlVar, list);
            }
            list.add(zzajlVar);
            if (!zzajlVar.zzcud().isDefault()) {
                zzajl zza = zzajlVar.zza(zzall.zzan(zzajlVar.zzcud().zzcrc()));
                List<zzajl> list2 = this.bgd.get(zza);
                if (list2 == null) {
                    list2 = new ArrayList<>();
                    this.bgd.put(zza, list2);
                }
                list2.add(zzajlVar);
            }
            zzajlVar.zzdb(true);
            zzajlVar.zza(this);
        }
    }

    public void zzk(zzajl zzajlVar) {
        synchronized (this.bgd) {
            List<zzajl> list = this.bgd.get(zzajlVar);
            if (list != null && !list.isEmpty()) {
                if (zzajlVar.zzcud().isDefault()) {
                    HashSet hashSet = new HashSet();
                    for (int size = list.size() - 1; size >= 0; size--) {
                        zzajl zzajlVar2 = list.get(size);
                        if (!hashSet.contains(zzajlVar2.zzcud())) {
                            hashSet.add(zzajlVar2.zzcud());
                            zzajlVar2.zzcvb();
                        }
                    }
                } else {
                    list.get(0).zzcvb();
                }
            }
        }
    }
}
