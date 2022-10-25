package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseException;
/* loaded from: classes2.dex */
public class zzamp {
    public static zzaml c() {
        return zzame.zzczq();
    }

    public static zzaml zzbu(Object obj) {
        zzaml zzbt = zzamm.zzbt(obj);
        if (zzbt instanceof zzamj) {
            zzbt = new zzamd(Double.valueOf(((Long) zzbt.getValue()).longValue()), c());
        }
        if (!zzq(zzbt)) {
            throw new DatabaseException("Invalid Firebase Database priority (must be a string, double, ServerValue, or null)");
        }
        return zzbt;
    }

    public static boolean zzq(zzaml zzamlVar) {
        return zzamlVar.zzczf().isEmpty() && (zzamlVar.isEmpty() || (zzamlVar instanceof zzamd) || (zzamlVar instanceof zzamr) || (zzamlVar instanceof zzamc));
    }
}
