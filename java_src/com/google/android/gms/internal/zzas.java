package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzaf;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzas extends zzat {
    private static final String TAG = zzas.class.getSimpleName();
    private AdvertisingIdClient.Info zzagv;

    protected zzas(Context context) {
        super(context, "");
    }

    public static zzas zzc(Context context) {
        zza(context, true);
        return new zzas(context);
    }

    @Override // com.google.android.gms.internal.zzat, com.google.android.gms.internal.zzar
    protected zzaf.zza zza(Context context, View view) {
        return null;
    }

    public String zza(String str, String str2) {
        return zzan.zza(str, str2, true);
    }

    public void zza(AdvertisingIdClient.Info info) {
        this.zzagv = info;
    }

    @Override // com.google.android.gms.internal.zzat
    protected void zza(zzbc zzbcVar, zzaf.zza zzaVar, zzad.zza zzaVar2) {
        if (!zzbcVar.zzcr()) {
            zza(zzb(zzbcVar, zzaVar, zzaVar2));
        } else if (this.zzagv == null) {
        } else {
            String id = this.zzagv.getId();
            if (!TextUtils.isEmpty(id)) {
                zzaVar.zzew = zzbe.zzr(id);
                zzaVar.zzex = 5;
                zzaVar.zzey = Boolean.valueOf(this.zzagv.isLimitAdTrackingEnabled());
            }
            this.zzagv = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzat
    public List<Callable<Void>> zzb(zzbc zzbcVar, zzaf.zza zzaVar, zzad.zza zzaVar2) {
        ArrayList arrayList = new ArrayList();
        if (zzbcVar.zzcm() == null) {
            return arrayList;
        }
        arrayList.add(new zzbm(zzbcVar, zzay.zzbm(), zzay.zzbn(), zzaVar, zzbcVar.zzaw(), 24));
        return arrayList;
    }
}
