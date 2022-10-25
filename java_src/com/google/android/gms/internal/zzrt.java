package com.google.android.gms.internal;

import android.app.Activity;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.concurrent.CancellationException;
/* loaded from: classes2.dex */
public class zzrt extends zzqp {
    private TaskCompletionSource<Void> yg;

    private zzrt(zzrp zzrpVar) {
        super(zzrpVar);
        this.yg = new TaskCompletionSource<>();
        this.Bf.zza("GmsAvailabilityHelper", this);
    }

    public static zzrt zzu(Activity activity) {
        zzrp zzs = zzs(activity);
        zzrt zzrtVar = (zzrt) zzs.zza("GmsAvailabilityHelper", zzrt.class);
        if (zzrtVar != null) {
            if (!zzrtVar.yg.getTask().isComplete()) {
                return zzrtVar;
            }
            zzrtVar.yg = new TaskCompletionSource<>();
            return zzrtVar;
        }
        return new zzrt(zzs);
    }

    public Task<Void> getTask() {
        return this.yg.getTask();
    }

    @Override // com.google.android.gms.internal.zzro
    public void onDestroy() {
        super.onDestroy();
        this.yg.setException(new CancellationException("Host activity was destroyed before Google Play services could be made available."));
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zza(ConnectionResult connectionResult, int i) {
        this.yg.setException(com.google.android.gms.common.internal.zzb.zzk(connectionResult));
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zzarm() {
        int isGooglePlayServicesAvailable = this.xP.isGooglePlayServicesAvailable(this.Bf.zzaty());
        if (isGooglePlayServicesAvailable == 0) {
            this.yg.setResult(null);
        } else {
            zzj(new ConnectionResult(isGooglePlayServicesAvailable, null));
        }
    }

    public void zzj(ConnectionResult connectionResult) {
        zzb(connectionResult, 0);
    }
}
