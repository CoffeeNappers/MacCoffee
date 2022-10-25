package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzy extends zzdk {
    private static final String ID = com.google.android.gms.internal.zzag.DATA_LAYER_WRITE.toString();
    private static final String VALUE = com.google.android.gms.internal.zzah.VALUE.toString();
    private static final String aEZ = com.google.android.gms.internal.zzah.CLEAR_PERSISTENT_DATA_LAYER_PREFIX.toString();
    private final DataLayer aDZ;

    public zzy(DataLayer dataLayer) {
        super(ID, VALUE);
        this.aDZ = dataLayer;
    }

    private void zza(zzaj.zza zzaVar) {
        String zzg;
        if (zzaVar == null || zzaVar == zzdm.zzchg() || (zzg = zzdm.zzg(zzaVar)) == zzdm.zzchl()) {
            return;
        }
        this.aDZ.zzpb(zzg);
    }

    private void zzb(zzaj.zza zzaVar) {
        if (zzaVar == null || zzaVar == zzdm.zzchg()) {
            return;
        }
        Object zzl = zzdm.zzl(zzaVar);
        if (!(zzl instanceof List)) {
            return;
        }
        for (Object obj : (List) zzl) {
            if (obj instanceof Map) {
                this.aDZ.push((Map) obj);
            }
        }
    }

    @Override // com.google.android.gms.tagmanager.zzdk
    public void zzba(Map<String, zzaj.zza> map) {
        zzb(map.get(VALUE));
        zza(map.get(aEZ));
    }
}
