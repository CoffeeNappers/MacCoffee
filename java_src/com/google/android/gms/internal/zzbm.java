package com.google.android.gms.internal;

import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.internal.zzaf;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbm extends zzby {
    public zzbm(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    private void zzdm() throws IllegalAccessException, InvocationTargetException {
        synchronized (this.zzajb) {
            this.zzajb.zzew = (String) this.zzajk.invoke(null, this.zzagd.getApplicationContext());
        }
    }

    private void zzdn() {
        AdvertisingIdClient zzdc = this.zzagd.zzdc();
        if (zzdc == null) {
            zzt("E1");
            return;
        }
        try {
            AdvertisingIdClient.Info info = zzdc.getInfo();
            String zzr = zzbe.zzr(info.getId());
            if (zzr != null) {
                synchronized (this.zzajb) {
                    this.zzajb.zzew = zzr;
                    this.zzajb.zzey = Boolean.valueOf(info.isLimitAdTrackingEnabled());
                    this.zzajb.zzex = 5;
                }
            } else {
                zzt("E");
            }
        } catch (IOException e) {
            zzt("E");
        }
    }

    private void zzt(String str) {
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (this.zzagd.zzcr()) {
            zzdn();
        } else {
            zzdm();
        }
    }
}
