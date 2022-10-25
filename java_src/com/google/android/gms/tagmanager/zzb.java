package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzb extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.ADVERTISER_ID.toString();
    private final zza aDO;

    public zzb(Context context) {
        this(zza.zzdw(context));
    }

    zzb(zza zzaVar) {
        super(ID, new String[0]);
        this.aDO = zzaVar;
        this.aDO.zzcdo();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String zzcdo = this.aDO.zzcdo();
        return zzcdo == null ? zzdm.zzchm() : zzdm.zzat(zzcdo);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
