package com.google.android.gms.internal;

import android.app.Activity;
import com.google.android.gms.common.ConnectionResult;
/* loaded from: classes2.dex */
public class zzqw extends zzqp {
    private zzrh xy;
    private final com.google.android.gms.common.util.zza<zzql<?>> zx;

    private zzqw(zzrp zzrpVar) {
        super(zzrpVar);
        this.zx = new com.google.android.gms.common.util.zza<>();
        this.Bf.zza("ConnectionlessLifecycleHelper", this);
    }

    public static void zza(Activity activity, zzrh zzrhVar, zzql<?> zzqlVar) {
        zzrp zzs = zzs(activity);
        zzqw zzqwVar = (zzqw) zzs.zza("ConnectionlessLifecycleHelper", zzqw.class);
        if (zzqwVar == null) {
            zzqwVar = new zzqw(zzs);
        }
        zzqwVar.xy = zzrhVar;
        zzqwVar.zza(zzqlVar);
        zzrhVar.zza(zzqwVar);
    }

    private void zza(zzql<?> zzqlVar) {
        com.google.android.gms.common.internal.zzaa.zzb(zzqlVar, "ApiKey cannot be null");
        this.zx.add(zzqlVar);
    }

    @Override // com.google.android.gms.internal.zzqp, com.google.android.gms.internal.zzro
    public void onStart() {
        super.onStart();
        if (!this.zx.isEmpty()) {
            this.xy.zza(this);
        }
    }

    @Override // com.google.android.gms.internal.zzqp, com.google.android.gms.internal.zzro
    public void onStop() {
        super.onStop();
        this.xy.zzb(this);
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zza(ConnectionResult connectionResult, int i) {
        this.xy.zza(connectionResult, i);
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zzarm() {
        this.xy.zzarm();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public com.google.android.gms.common.util.zza<zzql<?>> zzasl() {
        return this.zx;
    }
}
