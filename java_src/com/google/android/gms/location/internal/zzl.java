package com.google.android.gms.location.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationAvailability;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.internal.zzh;
import com.google.android.gms.location.internal.zzj;
import java.util.List;
/* loaded from: classes2.dex */
public class zzl extends com.google.android.gms.location.internal.zzb {
    private final zzk ala;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zza extends zzh.zza {
        private zzqo.zzb<Status> alb;

        public zza(zzqo.zzb<Status> zzbVar) {
            this.alb = zzbVar;
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zza(int i, PendingIntent pendingIntent) {
            Log.wtf("LocationClientImpl", "Unexpected call to onRemoveGeofencesByPendingIntentResult");
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zza(int i, String[] strArr) {
            if (this.alb == null) {
                Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
                return;
            }
            this.alb.setResult(LocationStatusCodes.zzuy(LocationStatusCodes.zzux(i)));
            this.alb = null;
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zzb(int i, String[] strArr) {
            Log.wtf("LocationClientImpl", "Unexpected call to onRemoveGeofencesByRequestIdsResult");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zzb extends zzh.zza {
        private zzqo.zzb<Status> alb;

        public zzb(zzqo.zzb<Status> zzbVar) {
            this.alb = zzbVar;
        }

        private void zzvb(int i) {
            if (this.alb == null) {
                Log.wtf("LocationClientImpl", "onRemoveGeofencesResult called multiple times");
                return;
            }
            this.alb.setResult(LocationStatusCodes.zzuy(LocationStatusCodes.zzux(i)));
            this.alb = null;
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zza(int i, PendingIntent pendingIntent) {
            zzvb(i);
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zza(int i, String[] strArr) {
            Log.wtf("LocationClientImpl", "Unexpected call to onAddGeofencesResult");
        }

        @Override // com.google.android.gms.location.internal.zzh
        public void zzb(int i, String[] strArr) {
            zzvb(i);
        }
    }

    /* loaded from: classes2.dex */
    private static final class zzc extends zzj.zza {
        private zzqo.zzb<LocationSettingsResult> alb;

        public zzc(zzqo.zzb<LocationSettingsResult> zzbVar) {
            zzaa.zzb(zzbVar != null, "listener can't be null.");
            this.alb = zzbVar;
        }

        @Override // com.google.android.gms.location.internal.zzj
        public void zza(LocationSettingsResult locationSettingsResult) throws RemoteException {
            this.alb.setResult(locationSettingsResult);
            this.alb = null;
        }
    }

    public zzl(Context context, Looper looper, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String str) {
        this(context, looper, connectionCallbacks, onConnectionFailedListener, str, com.google.android.gms.common.internal.zzf.zzca(context));
    }

    public zzl(Context context, Looper looper, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String str, com.google.android.gms.common.internal.zzf zzfVar) {
        super(context, looper, connectionCallbacks, onConnectionFailedListener, str, zzfVar);
        this.ala = new zzk(context, this.akH);
    }

    @Override // com.google.android.gms.common.internal.zze, com.google.android.gms.common.api.Api.zze
    public void disconnect() {
        synchronized (this.ala) {
            if (isConnected()) {
                try {
                    this.ala.removeAllListeners();
                    this.ala.zzbqh();
                } catch (Exception e) {
                    Log.e("LocationClientImpl", "Client disconnected before listeners could be cleaned up", e);
                }
            }
            super.disconnect();
        }
    }

    public Location getLastLocation() {
        return this.ala.getLastLocation();
    }

    public void zza(long j, PendingIntent pendingIntent) throws RemoteException {
        zzavf();
        zzaa.zzy(pendingIntent);
        zzaa.zzb(j >= 0, "detectionIntervalMillis must be >= 0");
        ((zzi) zzavg()).zza(j, true, pendingIntent);
    }

    public void zza(PendingIntent pendingIntent, zzqo.zzb<Status> zzbVar) throws RemoteException {
        zzavf();
        zzaa.zzb(pendingIntent, "PendingIntent must be specified.");
        zzaa.zzb(zzbVar, "ResultHolder not provided.");
        ((zzi) zzavg()).zza(pendingIntent, new zzb(zzbVar), getContext().getPackageName());
    }

    public void zza(PendingIntent pendingIntent, zzg zzgVar) throws RemoteException {
        this.ala.zza(pendingIntent, zzgVar);
    }

    public void zza(GeofencingRequest geofencingRequest, PendingIntent pendingIntent, zzqo.zzb<Status> zzbVar) throws RemoteException {
        zzavf();
        zzaa.zzb(geofencingRequest, "geofencingRequest can't be null.");
        zzaa.zzb(pendingIntent, "PendingIntent must be specified.");
        zzaa.zzb(zzbVar, "ResultHolder not provided.");
        ((zzi) zzavg()).zza(geofencingRequest, pendingIntent, new zza(zzbVar));
    }

    public void zza(LocationCallback locationCallback, zzg zzgVar) throws RemoteException {
        this.ala.zza(locationCallback, zzgVar);
    }

    public void zza(LocationListener locationListener, zzg zzgVar) throws RemoteException {
        this.ala.zza(locationListener, zzgVar);
    }

    public void zza(LocationRequest locationRequest, PendingIntent pendingIntent, zzg zzgVar) throws RemoteException {
        this.ala.zza(locationRequest, pendingIntent, zzgVar);
    }

    public void zza(LocationRequest locationRequest, LocationListener locationListener, Looper looper, zzg zzgVar) throws RemoteException {
        synchronized (this.ala) {
            this.ala.zza(locationRequest, locationListener, looper, zzgVar);
        }
    }

    public void zza(LocationSettingsRequest locationSettingsRequest, zzqo.zzb<LocationSettingsResult> zzbVar, String str) throws RemoteException {
        boolean z = true;
        zzavf();
        zzaa.zzb(locationSettingsRequest != null, "locationSettingsRequest can't be null nor empty.");
        if (zzbVar == null) {
            z = false;
        }
        zzaa.zzb(z, "listener can't be null.");
        ((zzi) zzavg()).zza(locationSettingsRequest, new zzc(zzbVar), str);
    }

    public void zza(LocationRequestInternal locationRequestInternal, LocationCallback locationCallback, Looper looper, zzg zzgVar) throws RemoteException {
        synchronized (this.ala) {
            this.ala.zza(locationRequestInternal, locationCallback, looper, zzgVar);
        }
    }

    public void zza(zzg zzgVar) throws RemoteException {
        this.ala.zza(zzgVar);
    }

    public void zza(List<String> list, zzqo.zzb<Status> zzbVar) throws RemoteException {
        zzavf();
        zzaa.zzb(list != null && list.size() > 0, "geofenceRequestIds can't be null nor empty.");
        zzaa.zzb(zzbVar, "ResultHolder not provided.");
        ((zzi) zzavg()).zza((String[]) list.toArray(new String[0]), new zzb(zzbVar), getContext().getPackageName());
    }

    public void zzb(PendingIntent pendingIntent) throws RemoteException {
        zzavf();
        zzaa.zzy(pendingIntent);
        ((zzi) zzavg()).zzb(pendingIntent);
    }

    public LocationAvailability zzbqg() {
        return this.ala.zzbqg();
    }

    public void zzcd(boolean z) throws RemoteException {
        this.ala.zzcd(z);
    }

    public void zzd(Location location) throws RemoteException {
        this.ala.zzd(location);
    }
}
