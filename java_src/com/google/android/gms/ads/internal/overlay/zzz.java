package com.google.android.gms.ads.internal.overlay;

import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzlb;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzz implements Runnable {
    private boolean mCancelled = false;
    private zzk zzcep;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzz(zzk zzkVar) {
        this.zzcep = zzkVar;
    }

    public void cancel() {
        this.mCancelled = true;
        zzlb.zzcvl.removeCallbacks(this);
    }

    @Override // java.lang.Runnable
    public void run() {
        if (!this.mCancelled) {
            this.zzcep.zzqk();
            zzrg();
        }
    }

    public void zzrg() {
        zzlb.zzcvl.postDelayed(this, 250L);
    }
}
