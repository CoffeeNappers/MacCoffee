package com.google.android.gms.common.stats;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.util.Log;
import com.google.android.gms.common.stats.zzb;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class zza {
    private static final Object El = new Object();
    private static Integer FF;
    private static zza Fz;
    private final List<String> FA;
    private final List<String> FB;
    private final List<String> FC;
    private final List<String> FD;
    private zzd FE;
    private zzd FG;

    private zza() {
        if (zzaxs()) {
            this.FA = Collections.EMPTY_LIST;
            this.FB = Collections.EMPTY_LIST;
            this.FC = Collections.EMPTY_LIST;
            this.FD = Collections.EMPTY_LIST;
            return;
        }
        String str = zzb.zza.FK.get();
        this.FA = str == null ? Collections.EMPTY_LIST : Arrays.asList(str.split(","));
        String str2 = zzb.zza.FL.get();
        this.FB = str2 == null ? Collections.EMPTY_LIST : Arrays.asList(str2.split(","));
        String str3 = zzb.zza.FM.get();
        this.FC = str3 == null ? Collections.EMPTY_LIST : Arrays.asList(str3.split(","));
        String str4 = zzb.zza.FN.get();
        this.FD = str4 == null ? Collections.EMPTY_LIST : Arrays.asList(str4.split(","));
        this.FE = new zzd(1024, zzb.zza.FO.get().longValue());
        this.FG = new zzd(1024, zzb.zza.FO.get().longValue());
    }

    private static int getLogLevel() {
        if (FF == null) {
            try {
                FF = Integer.valueOf(com.google.android.gms.common.util.zzd.zzayi() ? zzb.zza.FJ.get().intValue() : zzc.LOG_LEVEL_OFF);
            } catch (SecurityException e) {
                FF = Integer.valueOf(zzc.LOG_LEVEL_OFF);
            }
        }
        return FF.intValue();
    }

    public static zza zzaxr() {
        synchronized (El) {
            if (Fz == null) {
                Fz = new zza();
            }
        }
        return Fz;
    }

    private boolean zzaxs() {
        return getLogLevel() == zzc.LOG_LEVEL_OFF;
    }

    private boolean zzc(Context context, Intent intent) {
        ComponentName component = intent.getComponent();
        if (component == null) {
            return false;
        }
        return com.google.android.gms.common.util.zzd.zzx(context, component.getPackageName());
    }

    @SuppressLint({"UntrackedBindService"})
    public void zza(Context context, ServiceConnection serviceConnection) {
        context.unbindService(serviceConnection);
    }

    public void zza(Context context, ServiceConnection serviceConnection, String str, Intent intent) {
    }

    public boolean zza(Context context, Intent intent, ServiceConnection serviceConnection, int i) {
        return zza(context, context.getClass().getName(), intent, serviceConnection, i);
    }

    @SuppressLint({"UntrackedBindService"})
    public boolean zza(Context context, String str, Intent intent, ServiceConnection serviceConnection, int i) {
        if (zzc(context, intent)) {
            Log.w("ConnectionTracker", "Attempted to bind to a service in a STOPPED package.");
            return false;
        }
        return context.bindService(intent, serviceConnection, i);
    }

    public void zzb(Context context, ServiceConnection serviceConnection) {
    }
}
