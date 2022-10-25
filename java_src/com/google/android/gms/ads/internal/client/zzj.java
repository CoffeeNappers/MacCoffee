package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.internal.client.zzw;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class zzj extends zzw.zza {
    private final AppEventListener zzazw;

    public zzj(AppEventListener appEventListener) {
        this.zzazw = appEventListener;
    }

    @Override // com.google.android.gms.ads.internal.client.zzw
    public void onAppEvent(String str, String str2) {
        this.zzazw.onAppEvent(str, str2);
    }
}
