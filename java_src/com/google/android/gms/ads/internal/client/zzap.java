package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.VideoController;
import com.google.android.gms.ads.internal.client.zzac;
/* loaded from: classes.dex */
public final class zzap extends zzac.zza {
    private final VideoController.VideoLifecycleCallbacks zzakq;

    public zzap(VideoController.VideoLifecycleCallbacks videoLifecycleCallbacks) {
        this.zzakq = videoLifecycleCallbacks;
    }

    @Override // com.google.android.gms.ads.internal.client.zzac
    public void onVideoEnd() {
        this.zzakq.onVideoEnd();
    }

    @Override // com.google.android.gms.ads.internal.client.zzac
    public void zzkw() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzac
    public void zzkx() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzac
    public void zzky() {
    }
}
