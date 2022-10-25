package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
@zzji
/* loaded from: classes.dex */
public abstract class zzjt {
    public abstract void zza(Context context, zzjn zzjnVar, VersionInfoParcel versionInfoParcel);

    /* JADX INFO: Access modifiers changed from: protected */
    public void zze(zzjn zzjnVar) {
        zzjnVar.zztl();
        if (zzjnVar.zztj() != null) {
            zzjnVar.zztj().release();
        }
    }
}
