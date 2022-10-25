package com.google.android.gms.internal;

import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzani {
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !zzani.class.desiredAssertionStatus();
    }

    private static long zzd(zzami<?> zzamiVar) {
        long j = 8;
        if (!(zzamiVar instanceof zzamd) && !(zzamiVar instanceof zzamj)) {
            if (zzamiVar instanceof zzaly) {
                j = 4;
            } else if (!(zzamiVar instanceof zzamr)) {
                String valueOf = String.valueOf(zzamiVar.getClass());
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 24).append("Unknown leaf node type: ").append(valueOf).toString());
            } else {
                j = ((String) zzamiVar.getValue()).length() + 2;
            }
        }
        if (zzamiVar.zzczf().isEmpty()) {
            return j;
        }
        return zzd((zzami) zzamiVar.zzczf()) + 24 + j;
    }

    public static long zzt(zzaml zzamlVar) {
        long j;
        if (zzamlVar.isEmpty()) {
            return 4L;
        }
        if (zzamlVar.zzcze()) {
            return zzd((zzami) zzamlVar);
        }
        if (!$assertionsDisabled && !(zzamlVar instanceof zzama)) {
            String valueOf = String.valueOf(zzamlVar.getClass());
            throw new AssertionError(new StringBuilder(String.valueOf(valueOf).length() + 22).append("Unexpected node type: ").append(valueOf).toString());
        }
        long j2 = 1;
        Iterator<zzamk> it = zzamlVar.iterator();
        while (true) {
            j = j2;
            if (!it.hasNext()) {
                break;
            }
            zzamk next = it.next();
            j2 = zzt(next.zzcqy()) + j + next.a().asString().length() + 4;
        }
        return !zzamlVar.zzczf().isEmpty() ? j + 12 + zzd((zzami) zzamlVar.zzczf()) : j;
    }

    public static int zzu(zzaml zzamlVar) {
        int i = 0;
        if (zzamlVar.isEmpty()) {
            return 0;
        }
        if (zzamlVar.zzcze()) {
            return 1;
        }
        if (!$assertionsDisabled && !(zzamlVar instanceof zzama)) {
            String valueOf = String.valueOf(zzamlVar.getClass());
            throw new AssertionError(new StringBuilder(String.valueOf(valueOf).length() + 22).append("Unexpected node type: ").append(valueOf).toString());
        }
        Iterator<zzamk> it = zzamlVar.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = zzu(it.next().zzcqy()) + i2;
        }
    }
}
