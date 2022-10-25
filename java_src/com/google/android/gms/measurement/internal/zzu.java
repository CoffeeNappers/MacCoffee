package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.MainThread;
import com.google.android.gms.measurement.AppMeasurement;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public final class zzu {
    private final zza atv;

    /* loaded from: classes2.dex */
    public interface zza {
        void doStartService(Context context, Intent intent);
    }

    public zzu(zza zzaVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
        this.atv = zzaVar;
    }

    public static boolean zzh(Context context, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        return zzal.zza(context, z ? "com.google.android.gms.measurement.PackageMeasurementReceiver" : "com.google.android.gms.measurement.AppMeasurementReceiver", false);
    }

    @MainThread
    public void onReceive(final Context context, Intent intent) {
        final zzx zzdq = zzx.zzdq(context);
        final zzq zzbwb = zzdq.zzbwb();
        if (intent == null) {
            zzbwb.zzbxa().log("Receiver called with null intent");
            return;
        }
        zzdq.zzbwd().zzayi();
        String action = intent.getAction();
        zzbwb.zzbxe().zzj("Local receiver got", action);
        if ("com.google.android.gms.measurement.UPLOAD".equals(action)) {
            zzaf.zzi(context, false);
            Intent className = new Intent().setClassName(context, "com.google.android.gms.measurement.AppMeasurementService");
            className.setAction("com.google.android.gms.measurement.UPLOAD");
            this.atv.doStartService(context, className);
        } else if (!"com.android.vending.INSTALL_REFERRER".equals(action)) {
        } else {
            String stringExtra = intent.getStringExtra(ArgKeys.REFERRER);
            if (stringExtra == null) {
                zzbwb.zzbxe().log("Install referrer extras are null");
                return;
            }
            final Bundle zzu = zzdq.zzbvx().zzu(Uri.parse(stringExtra));
            if (zzu == null) {
                zzbwb.zzbxe().log("No campaign defined in install referrer broadcast");
                return;
            }
            final long longExtra = 1000 * intent.getLongExtra("referrer_timestamp_seconds", 0L);
            if (longExtra == 0) {
                zzbwb.zzbxa().log("Install referrer is missing timestamp");
            }
            zzdq.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzu.1
                @Override // java.lang.Runnable
                public void run() {
                    zzak zzar = zzdq.zzbvw().zzar(zzdq.zzbvr().zzup(), "_fot");
                    long longValue = (zzar == null || !(zzar.zzcyd instanceof Long)) ? 0L : ((Long) zzar.zzcyd).longValue();
                    long j = longExtra;
                    long j2 = (longValue <= 0 || (j < longValue && j > 0)) ? j : longValue - 1;
                    if (j2 > 0) {
                        zzu.putLong("click_timestamp", j2);
                    }
                    AppMeasurement.getInstance(context).zze("auto", "_cmp", zzu);
                    zzbwb.zzbxe().log("Install campaign recorded");
                }
            });
        }
    }
}
