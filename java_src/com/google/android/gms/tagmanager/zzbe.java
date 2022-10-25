package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzbe extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.INSTALL_REFERRER.toString();
    private static final String aDP = com.google.android.gms.internal.zzah.COMPONENT.toString();
    private final Context zzahs;

    public zzbe(Context context) {
        super(ID, new String[0]);
        this.zzahs = context;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String zzag = zzbf.zzag(this.zzahs, map.get(aDP) != null ? zzdm.zzg(map.get(aDP)) : null);
        return zzag != null ? zzdm.zzat(zzag) : zzdm.zzchm();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
