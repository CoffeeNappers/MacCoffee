package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.internal.zzed;
@zzji
/* loaded from: classes.dex */
public final class zzee extends zzed.zza {
    private final OnCustomRenderedAdLoadedListener zzbbh;

    public zzee(OnCustomRenderedAdLoadedListener onCustomRenderedAdLoadedListener) {
        this.zzbbh = onCustomRenderedAdLoadedListener;
    }

    @Override // com.google.android.gms.internal.zzed
    public void zza(zzec zzecVar) {
        this.zzbbh.onCustomRenderedAdLoaded(new zzeb(zzecVar));
    }
}
