package com.google.android.gms.ads.internal.cache;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzcz;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
@zzji
/* loaded from: classes.dex */
public class zza {
    @Nullable
    private Context mContext;
    @Nullable
    private zzc zzaxz;
    @Nullable
    private zzf zzaya;
    private final Runnable zzaxy = new Runnable() { // from class: com.google.android.gms.ads.internal.cache.zza.1
        @Override // java.lang.Runnable
        public void run() {
            zza.this.disconnect();
        }
    };
    private final Object zzako = new Object();

    /* JADX INFO: Access modifiers changed from: private */
    public void connect() {
        synchronized (this.zzako) {
            if (this.mContext == null || this.zzaxz != null) {
                return;
            }
            this.zzaxz = zza(new zze.zzb() { // from class: com.google.android.gms.ads.internal.cache.zza.3
                @Override // com.google.android.gms.common.internal.zze.zzb
                public void onConnected(@Nullable Bundle bundle) {
                    synchronized (zza.this.zzako) {
                        try {
                            zza.this.zzaya = zza.this.zzaxz.zzjz();
                        } catch (DeadObjectException e) {
                            zzkx.zzb("Unable to obtain a cache service instance.", e);
                            zza.this.disconnect();
                        }
                        zza.this.zzako.notifyAll();
                    }
                }

                @Override // com.google.android.gms.common.internal.zze.zzb
                public void onConnectionSuspended(int i) {
                    synchronized (zza.this.zzako) {
                        zza.this.zzaxz = null;
                        zza.this.zzaya = null;
                        zza.this.zzako.notifyAll();
                        zzu.zzhc().zzwk();
                    }
                }
            }, new zze.zzc() { // from class: com.google.android.gms.ads.internal.cache.zza.4
                @Override // com.google.android.gms.common.internal.zze.zzc
                public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
                    synchronized (zza.this.zzako) {
                        zza.this.zzaxz = null;
                        zza.this.zzaya = null;
                        zza.this.zzako.notifyAll();
                        zzu.zzhc().zzwk();
                    }
                }
            });
            this.zzaxz.zzavd();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void disconnect() {
        synchronized (this.zzako) {
            if (this.zzaxz == null) {
                return;
            }
            if (this.zzaxz.isConnected() || this.zzaxz.isConnecting()) {
                this.zzaxz.disconnect();
            }
            this.zzaxz = null;
            this.zzaya = null;
            Binder.flushPendingCommands();
            zzu.zzhc().zzwk();
        }
    }

    public void initialize(Context context) {
        if (context == null) {
            return;
        }
        synchronized (this.zzako) {
            if (this.mContext != null) {
                return;
            }
            this.mContext = context.getApplicationContext();
            if (zzdr.zzbkr.get().booleanValue()) {
                connect();
            } else if (zzdr.zzbkq.get().booleanValue()) {
                zza(new zzcz.zzb() { // from class: com.google.android.gms.ads.internal.cache.zza.2
                    @Override // com.google.android.gms.internal.zzcz.zzb
                    public void zzk(boolean z) {
                        if (z) {
                            zza.this.connect();
                        } else {
                            zza.this.disconnect();
                        }
                    }
                });
            }
        }
    }

    public CacheEntryParcel zza(CacheOffering cacheOffering) {
        CacheEntryParcel cacheEntryParcel;
        synchronized (this.zzako) {
            if (this.zzaya == null) {
                cacheEntryParcel = new CacheEntryParcel();
            } else {
                try {
                    cacheEntryParcel = this.zzaya.zza(cacheOffering);
                } catch (RemoteException e) {
                    zzkx.zzb("Unable to call into cache service.", e);
                    cacheEntryParcel = new CacheEntryParcel();
                }
            }
        }
        return cacheEntryParcel;
    }

    protected zzc zza(zze.zzb zzbVar, zze.zzc zzcVar) {
        return new zzc(this.mContext, zzu.zzhc().zzwj(), zzbVar, zzcVar);
    }

    protected void zza(zzcz.zzb zzbVar) {
        zzu.zzgp().zza(zzbVar);
    }

    public void zzjt() {
        if (zzdr.zzbks.get().booleanValue()) {
            synchronized (this.zzako) {
                connect();
                zzu.zzgm();
                zzlb.zzcvl.removeCallbacks(this.zzaxy);
                zzu.zzgm();
                zzlb.zzcvl.postDelayed(this.zzaxy, zzdr.zzbkt.get().longValue());
            }
        }
    }
}
