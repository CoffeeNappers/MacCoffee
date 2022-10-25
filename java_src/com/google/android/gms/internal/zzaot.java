package com.google.android.gms.internal;

import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzaot {
    private zzapt bom = zzapt.boW;
    private zzapi bon = zzapi.DEFAULT;
    private zzaor boo = zzaoq.IDENTITY;
    private final Map<Type, zzaou<?>> bop = new HashMap();
    private final List<zzapl> boc = new ArrayList();
    private final List<zzapl> boq = new ArrayList();
    private int bor = 2;
    private int bos = 2;
    private boolean bot = true;

    private void zza(String str, int i, int i2, List<zzapl> list) {
        zzaon zzaonVar;
        if (str != null && !"".equals(str.trim())) {
            zzaonVar = new zzaon(str);
        } else if (i == 2 || i2 == 2) {
            return;
        } else {
            zzaonVar = new zzaon(i, i2);
        }
        list.add(zzapj.zza(zzaqo.zzr(Date.class), zzaonVar));
        list.add(zzapj.zza(zzaqo.zzr(Timestamp.class), zzaonVar));
        list.add(zzapj.zza(zzaqo.zzr(java.sql.Date.class), zzaonVar));
    }

    public zzaot aR() {
        this.bot = false;
        return this;
    }

    public zzaos aS() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.boc);
        Collections.reverse(arrayList);
        arrayList.addAll(this.boq);
        zza(null, this.bor, this.bos, arrayList);
        return new zzaos(this.bom, this.boo, this.bop, false, false, false, this.bot, false, false, this.bon, arrayList);
    }

    public zzaot zza(Type type, Object obj) {
        zzapq.zzbt((obj instanceof zzapg) || (obj instanceof zzaox) || (obj instanceof zzaou) || (obj instanceof zzapk));
        if (obj instanceof zzaou) {
            this.bop.put(type, (zzaou) obj);
        }
        if ((obj instanceof zzapg) || (obj instanceof zzaox)) {
            this.boc.add(zzapj.zzb(zzaqo.zzl(type), obj));
        }
        if (obj instanceof zzapk) {
            this.boc.add(zzaqn.zza(zzaqo.zzl(type), (zzapk) obj));
        }
        return this;
    }

    public zzaot zza(zzaoo... zzaooVarArr) {
        for (zzaoo zzaooVar : zzaooVarArr) {
            this.bom = this.bom.zza(zzaooVar, true, true);
        }
        return this;
    }

    public zzaot zzf(int... iArr) {
        this.bom = this.bom.zzg(iArr);
        return this;
    }
}
