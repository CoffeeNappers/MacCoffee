package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zze extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.ADWORDS_CLICK_REFERRER.toString();
    private static final String aDP = com.google.android.gms.internal.zzah.COMPONENT.toString();
    private static final String aDQ = com.google.android.gms.internal.zzah.CONVERSION_ID.toString();
    private final Context zzahs;

    public zze(Context context) {
        super(ID, aDQ);
        this.zzahs = context;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        zzaj.zza zzaVar = map.get(aDQ);
        if (zzaVar == null) {
            return zzdm.zzchm();
        }
        String zzg = zzdm.zzg(zzaVar);
        zzaj.zza zzaVar2 = map.get(aDP);
        String zzj = zzbf.zzj(this.zzahs, zzg, zzaVar2 != null ? zzdm.zzg(zzaVar2) : null);
        return zzj != null ? zzdm.zzat(zzj) : zzdm.zzchm();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
