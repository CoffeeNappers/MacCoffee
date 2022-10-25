package com.google.android.gms.analytics;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zznb;
import java.util.ListIterator;
/* loaded from: classes2.dex */
public class zza extends zzh<zza> {
    private final com.google.android.gms.analytics.internal.zzf ao;
    private boolean ap;

    public zza(com.google.android.gms.analytics.internal.zzf zzfVar) {
        super(zzfVar.zzacc(), zzfVar.zzabz());
        this.ao = zzfVar;
    }

    public void enableAdvertisingIdCollection(boolean z) {
        this.ap = z;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.analytics.zzh
    public void zza(zze zzeVar) {
        zznb zznbVar = (zznb) zzeVar.zzb(zznb.class);
        if (TextUtils.isEmpty(zznbVar.zzze())) {
            zznbVar.setClientId(this.ao.zzacq().zzady());
        }
        if (!this.ap || !TextUtils.isEmpty(zznbVar.zzabb())) {
            return;
        }
        com.google.android.gms.analytics.internal.zza zzacp = this.ao.zzacp();
        zznbVar.zzei(zzacp.zzabn());
        zznbVar.zzas(zzacp.zzabc());
    }

    public void zzdr(String str) {
        zzaa.zzib(str);
        zzds(str);
        zzzu().add(new zzb(this.ao, str));
    }

    public void zzds(String str) {
        Uri zzdt = zzb.zzdt(str);
        ListIterator<zzk> listIterator = zzzu().listIterator();
        while (listIterator.hasNext()) {
            if (zzdt.equals(listIterator.next().zzyx())) {
                listIterator.remove();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public com.google.android.gms.analytics.internal.zzf zzyt() {
        return this.ao;
    }

    @Override // com.google.android.gms.analytics.zzh
    public zze zzyu() {
        zze zzzi = zzzt().zzzi();
        zzzi.zza(this.ao.zzach().zzadg());
        zzzi.zza(this.ao.zzaci().zzafl());
        zzd(zzzi);
        return zzzi;
    }
}
