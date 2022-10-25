package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.support.annotation.Nullable;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzmd;
@zzji
/* loaded from: classes.dex */
public abstract class zzj {
    @Nullable
    public abstract zzi zza(Context context, zzmd zzmdVar, int i, boolean z, zzdz zzdzVar);

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean zzh(zzmd zzmdVar) {
        return zzmdVar.zzeg().zzazr;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean zzp(Context context) {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        return com.google.android.gms.common.util.zzs.zzayq() && (applicationInfo == null || applicationInfo.targetSdkVersion >= 11);
    }
}
