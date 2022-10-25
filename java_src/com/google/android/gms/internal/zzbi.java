package com.google.android.gms.internal;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.ExecutionException;
/* loaded from: classes2.dex */
public class zzbi extends zzby {
    private boolean zzaiz;
    private zzad.zza zzaja;
    private static volatile zzam zzaiy = null;
    private static final Object zzaix = new Object();

    public zzbi(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2, boolean z, zzad.zza zzaVar2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.zzaiz = false;
        this.zzaja = null;
        this.zzaiz = z;
        this.zzaja = zzaVar2;
    }

    public static Boolean zza(zzad.zza zzaVar) {
        boolean z = false;
        if (!zzbe.zzs(zzb(zzaVar))) {
            return false;
        }
        if (zzaVar != null && zzaVar.zzck != null && zzaVar.zzck.zzcm.intValue() == 3) {
            z = true;
        }
        return Boolean.valueOf(z);
    }

    public static String zzb(zzad.zza zzaVar) {
        if (zzaVar == null || zzaVar.zzcl == null || zzbe.zzs(zzaVar.zzcl.zzcn)) {
            return null;
        }
        return zzaVar.zzcl.zzcn;
    }

    private boolean zzdi() {
        return zzaiy == null || zzbe.zzs(zzaiy.zzcn) || zzaiy.zzcn.equals("E");
    }

    private int zzdj() {
        if (!zzbe.zzs(zzb(this.zzaja))) {
            return 4;
        }
        return (!zza(this.zzaja).booleanValue() || !zzdk()) ? 2 : 3;
    }

    private boolean zzdk() {
        return this.zzagd.zzcu() && zzdr.zzbil.get().booleanValue() && zzdr.zzbim.get().booleanValue() && zzdr.zzbij.get().booleanValue();
    }

    private String zzdl() {
        try {
            if (this.zzagd.zzcw() != null) {
                this.zzagd.zzcw().get();
            }
            zzaf.zza zzcv = this.zzagd.zzcv();
            if (zzcv != null && zzcv.zzcn != null) {
                return zzcv.zzcn;
            }
        } catch (InterruptedException e) {
        } catch (ExecutionException e2) {
        }
        return null;
    }

    private void zze(int i) throws IllegalAccessException, InvocationTargetException {
        boolean z = true;
        Method method = this.zzajk;
        Object[] objArr = new Object[3];
        objArr[0] = this.zzagd.getContext();
        objArr[1] = Boolean.valueOf(this.zzaiz);
        if (i != 2) {
            z = false;
        }
        objArr[2] = Boolean.valueOf(z);
        zzaiy = new zzam((String) method.invoke(null, objArr));
        if (zzbe.zzs(zzaiy.zzcn) || zzaiy.zzcn.equals("E")) {
            switch (i) {
                case 3:
                    String zzdl = zzdl();
                    if (zzbe.zzs(zzdl)) {
                        return;
                    }
                    zzaiy.zzcn = zzdl;
                    return;
                case 4:
                    zzaiy.zzcn = this.zzaja.zzcl.zzcn;
                    return;
                default:
                    return;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (zzdi()) {
            synchronized (zzaix) {
                int zzdj = zzdj();
                if (zzdj == 3) {
                    this.zzagd.zzcz();
                }
                zze(zzdj);
            }
        }
        synchronized (this.zzajb) {
            if (zzaiy != null) {
                this.zzajb.zzcn = zzaiy.zzcn;
                this.zzajb.zzea = Long.valueOf(zzaiy.zzyi);
                this.zzajb.zzcp = zzaiy.zzcp;
                if (this.zzaiz) {
                    this.zzajb.zzcq = zzaiy.zzcq;
                    this.zzajb.zzcr = zzaiy.zzcr;
                }
            }
        }
    }
}
