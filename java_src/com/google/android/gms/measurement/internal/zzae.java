package com.google.android.gms.measurement.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.measurement.AppMeasurement;
import com.google.android.gms.measurement.internal.zzm;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class zzae extends zzaa {
    private final zza avs;
    private zzm avt;
    private Boolean avu;
    private final zzf avv;
    private final zzah avw;
    private final List<Runnable> avx;
    private final zzf avy;

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public class zza implements ServiceConnection, zze.zzb, zze.zzc {
        private volatile boolean avE;
        private volatile zzp avF;

        protected zza() {
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        @MainThread
        public void onConnected(@Nullable Bundle bundle) {
            com.google.android.gms.common.internal.zzaa.zzhs("MeasurementServiceConnection.onConnected");
            synchronized (this) {
                try {
                    final zzm zzavg = this.avF.zzavg();
                    this.avF = null;
                    zzae.this.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.zza.3
                        @Override // java.lang.Runnable
                        public void run() {
                            synchronized (zza.this) {
                                zza.this.avE = false;
                                if (!zzae.this.isConnected()) {
                                    zzae.this.zzbwb().zzbxd().log("Connected to remote service");
                                    zzae.this.zza(zzavg);
                                }
                            }
                        }
                    });
                } catch (DeadObjectException | IllegalStateException e) {
                    this.avF = null;
                    this.avE = false;
                }
            }
        }

        @Override // com.google.android.gms.common.internal.zze.zzc
        @MainThread
        public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
            com.google.android.gms.common.internal.zzaa.zzhs("MeasurementServiceConnection.onConnectionFailed");
            zzq zzbxr = zzae.this.aqw.zzbxr();
            if (zzbxr != null) {
                zzbxr.zzbxa().zzj("Service connection failed", connectionResult);
            }
            synchronized (this) {
                this.avE = false;
                this.avF = null;
            }
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        @MainThread
        public void onConnectionSuspended(int i) {
            com.google.android.gms.common.internal.zzaa.zzhs("MeasurementServiceConnection.onConnectionSuspended");
            zzae.this.zzbwb().zzbxd().log("Service connection suspended");
            zzae.this.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.zza.4
                @Override // java.lang.Runnable
                public void run() {
                    zzae zzaeVar = zzae.this;
                    Context context = zzae.this.getContext();
                    zzae.this.zzbwd().zzayi();
                    zzaeVar.onServiceDisconnected(new ComponentName(context, "com.google.android.gms.measurement.AppMeasurementService"));
                }
            });
        }

        @Override // android.content.ServiceConnection
        @MainThread
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            com.google.android.gms.common.internal.zzaa.zzhs("MeasurementServiceConnection.onServiceConnected");
            synchronized (this) {
                if (iBinder == null) {
                    this.avE = false;
                    zzae.this.zzbwb().zzbwy().log("Service connected with null binder");
                    return;
                }
                final zzm zzmVar = null;
                try {
                    String interfaceDescriptor = iBinder.getInterfaceDescriptor();
                    if ("com.google.android.gms.measurement.internal.IMeasurementService".equals(interfaceDescriptor)) {
                        zzmVar = zzm.zza.zzjp(iBinder);
                        zzae.this.zzbwb().zzbxe().log("Bound to IMeasurementService interface");
                    } else {
                        zzae.this.zzbwb().zzbwy().zzj("Got binder with a wrong descriptor", interfaceDescriptor);
                    }
                } catch (RemoteException e) {
                    zzae.this.zzbwb().zzbwy().log("Service connect failed to get IMeasurementService");
                }
                if (zzmVar == null) {
                    this.avE = false;
                    try {
                        com.google.android.gms.common.stats.zza.zzaxr().zza(zzae.this.getContext(), zzae.this.avs);
                    } catch (IllegalArgumentException e2) {
                    }
                } else {
                    zzae.this.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.zza.1
                        @Override // java.lang.Runnable
                        public void run() {
                            synchronized (zza.this) {
                                zza.this.avE = false;
                                if (!zzae.this.isConnected()) {
                                    zzae.this.zzbwb().zzbxe().log("Connected to service");
                                    zzae.this.zza(zzmVar);
                                }
                            }
                        }
                    });
                }
            }
        }

        @Override // android.content.ServiceConnection
        @MainThread
        public void onServiceDisconnected(final ComponentName componentName) {
            com.google.android.gms.common.internal.zzaa.zzhs("MeasurementServiceConnection.onServiceDisconnected");
            zzae.this.zzbwb().zzbxd().log("Service disconnected");
            zzae.this.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.zza.2
                @Override // java.lang.Runnable
                public void run() {
                    zzae.this.onServiceDisconnected(componentName);
                }
            });
        }

        @WorkerThread
        public void zzac(Intent intent) {
            zzae.this.zzzx();
            Context context = zzae.this.getContext();
            com.google.android.gms.common.stats.zza zzaxr = com.google.android.gms.common.stats.zza.zzaxr();
            synchronized (this) {
                if (this.avE) {
                    zzae.this.zzbwb().zzbxe().log("Connection attempt already in progress");
                    return;
                }
                this.avE = true;
                zzaxr.zza(context, intent, zzae.this.avs, TsExtractor.TS_STREAM_TYPE_AC3);
            }
        }

        @WorkerThread
        public void zzbza() {
            zzae.this.zzzx();
            Context context = zzae.this.getContext();
            synchronized (this) {
                if (this.avE) {
                    zzae.this.zzbwb().zzbxe().log("Connection attempt already in progress");
                } else if (this.avF != null) {
                    zzae.this.zzbwb().zzbxe().log("Already awaiting connection attempt");
                } else {
                    this.avF = new zzp(context, Looper.getMainLooper(), this, this);
                    zzae.this.zzbwb().zzbxe().log("Connecting to remote service");
                    this.avE = true;
                    this.avF.zzavd();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzae(zzx zzxVar) {
        super(zzxVar);
        this.avx = new ArrayList();
        this.avw = new zzah(zzxVar.zzabz());
        this.avs = new zza();
        this.avv = new zzf(zzxVar) { // from class: com.google.android.gms.measurement.internal.zzae.1
            @Override // com.google.android.gms.measurement.internal.zzf
            public void run() {
                zzae.this.zzacx();
            }
        };
        this.avy = new zzf(zzxVar) { // from class: com.google.android.gms.measurement.internal.zzae.2
            @Override // com.google.android.gms.measurement.internal.zzf
            public void run() {
                zzae.this.zzbwb().zzbxa().log("Tasks have been queued for a long time");
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void onServiceDisconnected(ComponentName componentName) {
        zzzx();
        if (this.avt != null) {
            this.avt = null;
            zzbwb().zzbxe().zzj("Disconnected from device MeasurementService", componentName);
            zzbyy();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zza(zzm zzmVar) {
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzy(zzmVar);
        this.avt = zzmVar;
        zzacw();
        zzbyz();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzacw() {
        zzzx();
        this.avw.start();
        zzx zzxVar = this.aqw;
        this.avv.zzx(zzbwd().zzaez());
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzacx() {
        zzzx();
        if (!isConnected()) {
            return;
        }
        zzbwb().zzbxe().log("Inactivity, disconnecting from the service");
        disconnect();
    }

    private boolean zzbyw() {
        zzbwd().zzayi();
        List<ResolveInfo> queryIntentServices = getContext().getPackageManager().queryIntentServices(new Intent().setClassName(getContext(), "com.google.android.gms.measurement.AppMeasurementService"), 65536);
        return queryIntentServices != null && queryIntentServices.size() > 0;
    }

    @WorkerThread
    private void zzbyy() {
        zzzx();
        zzadl();
    }

    @WorkerThread
    private void zzbyz() {
        zzzx();
        zzbwb().zzbxe().zzj("Processing queued up service tasks", Integer.valueOf(this.avx.size()));
        for (Runnable runnable : this.avx) {
            zzbwa().zzm(runnable);
        }
        this.avx.clear();
        this.avy.cancel();
    }

    @WorkerThread
    private void zzo(Runnable runnable) throws IllegalStateException {
        zzzx();
        if (isConnected()) {
            runnable.run();
        } else if (this.avx.size() >= zzbwd().zzbuy()) {
            zzbwb().zzbwy().log("Discarding data. Max runnable queue size reached");
        } else {
            this.avx.add(runnable);
            zzx zzxVar = this.aqw;
            this.avy.zzx(60000L);
            zzadl();
        }
    }

    @WorkerThread
    public void disconnect() {
        zzzx();
        zzacj();
        try {
            com.google.android.gms.common.stats.zza.zzaxr().zza(getContext(), this.avs);
        } catch (IllegalArgumentException e) {
        } catch (IllegalStateException e2) {
        }
        this.avt = null;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @WorkerThread
    public boolean isConnected() {
        zzzx();
        zzacj();
        return this.avt != null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zza(final AppMeasurement.zzf zzfVar) {
        zzzx();
        zzacj();
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.8
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar = zzae.this.avt;
                if (zzmVar == null) {
                    zzae.this.zzbwb().zzbwy().log("Failed to send current screen to service");
                    return;
                }
                try {
                    if (zzfVar == null) {
                        zzmVar.zza(0L, null, null, zzae.this.getContext().getPackageName());
                    } else {
                        zzmVar.zza(zzfVar.aqB, zzfVar.aqz, zzfVar.aqA, zzae.this.getContext().getPackageName());
                    }
                    zzae.this.zzacw();
                } catch (RemoteException e) {
                    zzae.this.zzbwb().zzbwy().zzj("Failed to send current screen to the service", e);
                }
            }
        });
    }

    @WorkerThread
    void zza(zzm zzmVar, AbstractSafeParcelable abstractSafeParcelable) {
        List<AbstractSafeParcelable> zzxe;
        zzzx();
        zzaby();
        zzacj();
        boolean z = Build.VERSION.SDK_INT >= 11 && !zzbwd().zzayi();
        ArrayList<AbstractSafeParcelable> arrayList = new ArrayList();
        zzbwd().zzbvb();
        int i = 100;
        for (int i2 = 0; i2 < 1001 && i == 100; i2++) {
            if (!z || (zzxe = zzbvv().zzxe(100)) == null) {
                i = 0;
            } else {
                arrayList.addAll(zzxe);
                i = zzxe.size();
            }
            if (abstractSafeParcelable != null && i < 100) {
                arrayList.add(abstractSafeParcelable);
            }
            for (AbstractSafeParcelable abstractSafeParcelable2 : arrayList) {
                if (abstractSafeParcelable2 instanceof EventParcel) {
                    try {
                        zzmVar.zza((EventParcel) abstractSafeParcelable2, zzbvr().zzmi(zzbwb().zzbxf()));
                    } catch (RemoteException e) {
                        zzbwb().zzbwy().zzj("Failed to send event to the service", e);
                    }
                } else if (abstractSafeParcelable2 instanceof UserAttributeParcel) {
                    try {
                        zzmVar.zza((UserAttributeParcel) abstractSafeParcelable2, zzbvr().zzmi(zzbwb().zzbxf()));
                    } catch (RemoteException e2) {
                        zzbwb().zzbwy().zzj("Failed to send attribute to the service", e2);
                    }
                } else {
                    zzbwb().zzbwy().log("Discarding data. Unrecognized parcel type.");
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zza(final AtomicReference<List<UserAttributeParcel>> atomicReference, final boolean z) {
        zzzx();
        zzacj();
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.6
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar;
                synchronized (atomicReference) {
                    try {
                        zzmVar = zzae.this.avt;
                    } catch (RemoteException e) {
                        zzae.this.zzbwb().zzbwy().zzj("Failed to get user properties", e);
                        atomicReference.notify();
                    }
                    if (zzmVar == null) {
                        zzae.this.zzbwb().zzbwy().log("Failed to get user properties");
                        atomicReference.notify();
                        return;
                    }
                    atomicReference.set(zzmVar.zza(zzae.this.zzbvr().zzmi(null), z));
                    zzae.this.zzacw();
                    atomicReference.notify();
                }
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzadl() {
        zzzx();
        zzacj();
        if (isConnected()) {
            return;
        }
        if (this.avu == null) {
            this.avu = zzbwc().zzbxl();
            if (this.avu == null) {
                zzbwb().zzbxe().log("State of service unknown");
                this.avu = Boolean.valueOf(zzbyx());
                zzbwc().zzcg(this.avu.booleanValue());
            }
        }
        if (this.avu.booleanValue()) {
            zzbwb().zzbxe().log("Using measurement service");
            this.avs.zzbza();
            return;
        }
        zzx zzxVar = this.aqw;
        if (!zzbyw()) {
            zzbwb().zzbwy().log("Unable to use remote or local measurement implementation. Please register the AppMeasurementService service in the app manifest");
            return;
        }
        zzbwb().zzbxe().log("Using local app measurement service");
        Intent intent = new Intent("com.google.android.gms.measurement.START");
        Context context = getContext();
        zzbwd().zzayi();
        intent.setComponent(new ComponentName(context, "com.google.android.gms.measurement.AppMeasurementService"));
        this.avs.zzac(intent);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zzb(final UserAttributeParcel userAttributeParcel) {
        final boolean z = true;
        zzzx();
        zzacj();
        if (!(Build.VERSION.SDK_INT >= 11 && !zzbwd().zzayi()) || !zzbvv().zza(userAttributeParcel)) {
            z = false;
        }
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.5
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar = zzae.this.avt;
                if (zzmVar == null) {
                    zzae.this.zzbwb().zzbwy().log("Discarding data. Failed to set user attribute");
                    return;
                }
                zzae.this.zza(zzmVar, z ? null : userAttributeParcel);
                zzae.this.zzacw();
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zzbyq() {
        zzzx();
        zzacj();
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.7
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar = zzae.this.avt;
                if (zzmVar == null) {
                    zzae.this.zzbwb().zzbwy().log("Discarding data. Failed to send app launch");
                    return;
                }
                try {
                    zzae.this.zza(zzmVar, (AbstractSafeParcelable) null);
                    zzmVar.zza(zzae.this.zzbvr().zzmi(zzae.this.zzbwb().zzbxf()));
                    zzae.this.zzacw();
                } catch (RemoteException e) {
                    zzae.this.zzbwb().zzbwy().zzj("Failed to send app launch to the service", e);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zzbyv() {
        zzzx();
        zzacj();
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.3
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar = zzae.this.avt;
                if (zzmVar == null) {
                    zzae.this.zzbwb().zzbwy().log("Failed to send measurementEnabled to service");
                    return;
                }
                try {
                    zzmVar.zzb(zzae.this.zzbvr().zzmi(zzae.this.zzbwb().zzbxf()));
                    zzae.this.zzacw();
                } catch (RemoteException e) {
                    zzae.this.zzbwb().zzbwy().zzj("Failed to send measurementEnabled to the service", e);
                }
            }
        });
    }

    @WorkerThread
    protected boolean zzbyx() {
        zzzx();
        zzacj();
        zzbwd().zzayi();
        zzbwb().zzbxe().log("Checking service availability");
        switch (com.google.android.gms.common.zzc.zzaql().isGooglePlayServicesAvailable(getContext())) {
            case 0:
                zzbwb().zzbxe().log("Service available");
                return true;
            case 1:
                zzbwb().zzbxe().log("Service missing");
                return false;
            case 2:
                zzbwb().zzbxd().log("Service container out of date");
                return true;
            case 3:
                zzbwb().zzbxa().log("Service disabled");
                return false;
            case 9:
                zzbwb().zzbxa().log("Service invalid");
                return false;
            case 18:
                zzbwb().zzbxa().log("Service updating");
                return true;
            default:
                return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zzc(final EventParcel eventParcel, final String str) {
        final boolean z = true;
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        zzzx();
        zzacj();
        final boolean z2 = Build.VERSION.SDK_INT >= 11 && !zzbwd().zzayi();
        if (!z2 || !zzbvv().zza(eventParcel)) {
            z = false;
        }
        zzo(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzae.4
            @Override // java.lang.Runnable
            public void run() {
                zzm zzmVar = zzae.this.avt;
                if (zzmVar == null) {
                    zzae.this.zzbwb().zzbwy().log("Discarding data. Failed to send event to service");
                    return;
                }
                if (z2) {
                    zzae.this.zza(zzmVar, z ? null : eventParcel);
                } else {
                    try {
                        if (TextUtils.isEmpty(str)) {
                            zzmVar.zza(eventParcel, zzae.this.zzbvr().zzmi(zzae.this.zzbwb().zzbxf()));
                        } else {
                            zzmVar.zza(eventParcel, str, zzae.this.zzbwb().zzbxf());
                        }
                    } catch (RemoteException e) {
                        zzae.this.zzbwb().zzbwy().zzj("Failed to send event to the service", e);
                    }
                }
                zzae.this.zzacw();
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
