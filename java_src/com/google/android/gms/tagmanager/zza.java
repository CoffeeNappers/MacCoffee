package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Process;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.vkontakte.android.TimeUtils;
import java.io.IOException;
/* loaded from: classes2.dex */
public class zza {
    private static Object aDL = new Object();
    private static zza aDM;
    private volatile long aDF;
    private volatile long aDG;
    private volatile long aDH;
    private volatile long aDI;
    private final Object aDJ;
    private InterfaceC0209zza aDK;
    private volatile AdvertisingIdClient.Info cD;
    private volatile boolean mClosed;
    private final Context mContext;
    private final com.google.android.gms.common.util.zze zzaql;
    private final Thread zzcur;

    /* renamed from: com.google.android.gms.tagmanager.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public interface InterfaceC0209zza {
        AdvertisingIdClient.Info zzcdt();
    }

    private zza(Context context) {
        this(context, null, com.google.android.gms.common.util.zzh.zzayl());
    }

    public zza(Context context, InterfaceC0209zza interfaceC0209zza, com.google.android.gms.common.util.zze zzeVar) {
        this.aDF = 900000L;
        this.aDG = 30000L;
        this.mClosed = false;
        this.aDJ = new Object();
        this.aDK = new InterfaceC0209zza() { // from class: com.google.android.gms.tagmanager.zza.1
            @Override // com.google.android.gms.tagmanager.zza.InterfaceC0209zza
            public AdvertisingIdClient.Info zzcdt() {
                try {
                    return AdvertisingIdClient.getAdvertisingIdInfo(zza.this.mContext);
                } catch (GooglePlayServicesNotAvailableException e) {
                    zzbo.zzc("GooglePlayServicesNotAvailableException getting Advertising Id Info", e);
                    return null;
                } catch (GooglePlayServicesRepairableException e2) {
                    zzbo.zzc("GooglePlayServicesRepairableException getting Advertising Id Info", e2);
                    return null;
                } catch (IOException e3) {
                    zzbo.zzc("IOException getting Ad Id Info", e3);
                    return null;
                } catch (IllegalStateException e4) {
                    zzbo.zzc("IllegalStateException getting Advertising Id Info", e4);
                    return null;
                } catch (Exception e5) {
                    zzbo.zzc("Unknown exception. Could not get the Advertising Id Info.", e5);
                    return null;
                }
            }
        };
        this.zzaql = zzeVar;
        if (context != null) {
            this.mContext = context.getApplicationContext();
        } else {
            this.mContext = context;
        }
        if (interfaceC0209zza != null) {
            this.aDK = interfaceC0209zza;
        }
        this.aDH = this.zzaql.currentTimeMillis();
        this.zzcur = new Thread(new Runnable() { // from class: com.google.android.gms.tagmanager.zza.2
            @Override // java.lang.Runnable
            public void run() {
                zza.this.zzcds();
            }
        });
    }

    private void zzcdp() {
        synchronized (this) {
            try {
                zzcdq();
                wait(500L);
            } catch (InterruptedException e) {
            }
        }
    }

    private void zzcdq() {
        if (this.zzaql.currentTimeMillis() - this.aDH > this.aDG) {
            synchronized (this.aDJ) {
                this.aDJ.notify();
            }
            this.aDH = this.zzaql.currentTimeMillis();
        }
    }

    private void zzcdr() {
        if (this.zzaql.currentTimeMillis() - this.aDI > TimeUtils.HOUR) {
            this.cD = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcds() {
        Process.setThreadPriority(10);
        while (!this.mClosed) {
            AdvertisingIdClient.Info zzcdt = this.aDK.zzcdt();
            if (zzcdt != null) {
                this.cD = zzcdt;
                this.aDI = this.zzaql.currentTimeMillis();
                zzbo.zzdh("Obtained fresh AdvertisingId info from GmsCore.");
            }
            synchronized (this) {
                notifyAll();
            }
            try {
                synchronized (this.aDJ) {
                    this.aDJ.wait(this.aDF);
                }
            } catch (InterruptedException e) {
                zzbo.zzdh("sleep interrupted in AdvertiserDataPoller thread; continuing");
            }
        }
    }

    public static zza zzdw(Context context) {
        if (aDM == null) {
            synchronized (aDL) {
                if (aDM == null) {
                    aDM = new zza(context);
                    aDM.start();
                }
            }
        }
        return aDM;
    }

    public boolean isLimitAdTrackingEnabled() {
        if (this.cD == null) {
            zzcdp();
        } else {
            zzcdq();
        }
        zzcdr();
        if (this.cD == null) {
            return true;
        }
        return this.cD.isLimitAdTrackingEnabled();
    }

    public void start() {
        this.zzcur.start();
    }

    public String zzcdo() {
        if (this.cD == null) {
            zzcdp();
        } else {
            zzcdq();
        }
        zzcdr();
        if (this.cD == null) {
            return null;
        }
        return this.cD.getId();
    }
}
