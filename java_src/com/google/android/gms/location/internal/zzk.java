package com.google.android.gms.location.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.location.LocationAvailability;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.zzh;
import com.google.android.gms.location.zzi;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzk {
    private final zzp<zzi> akH;
    private final Context mContext;
    private ContentProviderClient akU = null;
    private boolean akV = false;
    private Map<LocationListener, zzc> VB = new HashMap();
    private Map<LocationCallback, zza> akW = new HashMap();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza extends zzh.zza {
        private Handler akX;

        zza(final LocationCallback locationCallback, Looper looper) {
            if (looper == null) {
                looper = Looper.myLooper();
                zzaa.zza(looper != null, "Can't create handler inside thread that has not called Looper.prepare()");
            }
            this.akX = new Handler(looper) { // from class: com.google.android.gms.location.internal.zzk.zza.1
                @Override // android.os.Handler
                public void handleMessage(Message message) {
                    switch (message.what) {
                        case 0:
                            locationCallback.onLocationResult((LocationResult) message.obj);
                            return;
                        case 1:
                            locationCallback.onLocationAvailability((LocationAvailability) message.obj);
                            return;
                        default:
                            return;
                    }
                }
            };
        }

        private synchronized void zzb(int i, Object obj) {
            if (this.akX == null) {
                Log.e("LocationClientHelper", "Received a data in client after calling removeLocationUpdates.");
            } else {
                Message obtain = Message.obtain();
                obtain.what = i;
                obtain.obj = obj;
                this.akX.sendMessage(obtain);
            }
        }

        @Override // com.google.android.gms.location.zzh
        public void onLocationAvailability(LocationAvailability locationAvailability) {
            zzb(1, locationAvailability);
        }

        @Override // com.google.android.gms.location.zzh
        public void onLocationResult(LocationResult locationResult) {
            zzb(0, locationResult);
        }

        public synchronized void release() {
            this.akX = null;
        }
    }

    /* loaded from: classes2.dex */
    private static class zzb extends Handler {
        private final LocationListener akZ;

        public zzb(LocationListener locationListener) {
            this.akZ = locationListener;
        }

        public zzb(LocationListener locationListener, Looper looper) {
            super(looper);
            this.akZ = locationListener;
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    this.akZ.onLocationChanged(new Location((Location) message.obj));
                    return;
                default:
                    Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzc extends zzi.zza {
        private Handler akX;

        zzc(LocationListener locationListener, Looper looper) {
            if (looper == null) {
                zzaa.zza(Looper.myLooper() != null, "Can't create handler inside thread that has not called Looper.prepare()");
            }
            this.akX = looper == null ? new zzb(locationListener) : new zzb(locationListener, looper);
        }

        @Override // com.google.android.gms.location.zzi
        public synchronized void onLocationChanged(Location location) {
            if (this.akX == null) {
                Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
            } else {
                Message obtain = Message.obtain();
                obtain.what = 1;
                obtain.obj = location;
                this.akX.sendMessage(obtain);
            }
        }

        public synchronized void release() {
            this.akX = null;
        }
    }

    public zzk(Context context, zzp<zzi> zzpVar) {
        this.mContext = context;
        this.akH = zzpVar;
    }

    private zza zza(LocationCallback locationCallback, Looper looper) {
        zza zzaVar;
        synchronized (this.akW) {
            zzaVar = this.akW.get(locationCallback);
            if (zzaVar == null) {
                zzaVar = new zza(locationCallback, looper);
            }
            this.akW.put(locationCallback, zzaVar);
        }
        return zzaVar;
    }

    private zzc zza(LocationListener locationListener, Looper looper) {
        zzc zzcVar;
        synchronized (this.VB) {
            zzcVar = this.VB.get(locationListener);
            if (zzcVar == null) {
                zzcVar = new zzc(locationListener, looper);
            }
            this.VB.put(locationListener, zzcVar);
        }
        return zzcVar;
    }

    public Location getLastLocation() {
        this.akH.zzavf();
        try {
            return this.akH.zzavg().zzkx(this.mContext.getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeAllListeners() {
        try {
            synchronized (this.VB) {
                for (zzc zzcVar : this.VB.values()) {
                    if (zzcVar != null) {
                        this.akH.zzavg().zza(LocationRequestUpdateData.zza(zzcVar, (zzg) null));
                    }
                }
                this.VB.clear();
            }
            synchronized (this.akW) {
                for (zza zzaVar : this.akW.values()) {
                    if (zzaVar != null) {
                        this.akH.zzavg().zza(LocationRequestUpdateData.zza(zzaVar, (zzg) null));
                    }
                }
                this.akW.clear();
            }
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void zza(PendingIntent pendingIntent, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zza(LocationRequestUpdateData.zzb(pendingIntent, zzgVar));
    }

    public void zza(LocationCallback locationCallback, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        zzaa.zzb(locationCallback, "Invalid null callback");
        synchronized (this.akW) {
            zza remove = this.akW.remove(locationCallback);
            if (remove != null) {
                remove.release();
                this.akH.zzavg().zza(LocationRequestUpdateData.zza(remove, zzgVar));
            }
        }
    }

    public void zza(LocationListener locationListener, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        zzaa.zzb(locationListener, "Invalid null listener");
        synchronized (this.VB) {
            zzc remove = this.VB.remove(locationListener);
            if (remove != null) {
                remove.release();
                this.akH.zzavg().zza(LocationRequestUpdateData.zza(remove, zzgVar));
            }
        }
    }

    public void zza(LocationRequest locationRequest, PendingIntent pendingIntent, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zza(LocationRequestUpdateData.zza(LocationRequestInternal.zzb(locationRequest), pendingIntent, zzgVar));
    }

    public void zza(LocationRequest locationRequest, LocationListener locationListener, Looper looper, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zza(LocationRequestUpdateData.zza(LocationRequestInternal.zzb(locationRequest), zza(locationListener, looper), zzgVar));
    }

    public void zza(LocationRequestInternal locationRequestInternal, LocationCallback locationCallback, Looper looper, zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zza(LocationRequestUpdateData.zza(locationRequestInternal, zza(locationCallback, looper), zzgVar));
    }

    public void zza(zzg zzgVar) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zza(zzgVar);
    }

    public LocationAvailability zzbqg() {
        this.akH.zzavf();
        try {
            return this.akH.zzavg().zzky(this.mContext.getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void zzbqh() {
        if (this.akV) {
            try {
                zzcd(false);
            } catch (RemoteException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    public void zzcd(boolean z) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zzcd(z);
        this.akV = z;
    }

    public void zzd(Location location) throws RemoteException {
        this.akH.zzavf();
        this.akH.zzavg().zzd(location);
    }
}
