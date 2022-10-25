package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzaf;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzau extends zzat {
    private static final String TAG = zzau.class.getSimpleName();

    protected zzau(Context context, String str, boolean z) {
        super(context, str, z);
    }

    public static zzau zza(String str, Context context, boolean z) {
        zza(context, z);
        return new zzau(context, str, z);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzat
    public List<Callable<Void>> zzb(zzbc zzbcVar, zzaf.zza zzaVar, zzad.zza zzaVar2) {
        if (zzbcVar.zzcm() == null || !this.zzagy) {
            return super.zzb(zzbcVar, zzaVar, zzaVar2);
        }
        int zzaw = zzbcVar.zzaw();
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(super.zzb(zzbcVar, zzaVar, zzaVar2));
        arrayList.add(new zzbm(zzbcVar, zzay.zzbm(), zzay.zzbn(), zzaVar, zzaw, 24));
        return arrayList;
    }
}
