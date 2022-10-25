package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzc extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.ADVERTISING_TRACKING_ENABLED.toString();
    private final zza aDO;

    public zzc(Context context) {
        this(zza.zzdw(context));
    }

    zzc(zza zzaVar) {
        super(ID, new String[0]);
        this.aDO = zzaVar;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(Boolean.valueOf(!this.aDO.isLimitAdTrackingEnabled()));
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
