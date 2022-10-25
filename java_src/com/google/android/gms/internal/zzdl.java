package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import java.util.Collections;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzdl implements zzdm {
    @Override // com.google.android.gms.internal.zzdm
    public List<String> zza(AdRequestInfoParcel adRequestInfoParcel) {
        return adRequestInfoParcel.zzckj == null ? Collections.emptyList() : adRequestInfoParcel.zzckj;
    }
}
