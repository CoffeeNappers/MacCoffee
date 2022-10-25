package com.google.android.gms.internal;

import android.content.Context;
@zzji
/* loaded from: classes.dex */
public final class zzll extends zzkw {
    private final String zzae;
    private final com.google.android.gms.ads.internal.util.client.zzc zzcxh;

    public zzll(Context context, String str, String str2) {
        this(str2, com.google.android.gms.ads.internal.zzu.zzgm().zzh(context, str));
    }

    public zzll(String str, String str2) {
        this.zzcxh = new com.google.android.gms.ads.internal.util.client.zzc(str2);
        this.zzae = str;
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        this.zzcxh.zzv(this.zzae);
    }
}
