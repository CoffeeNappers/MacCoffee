package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.maps.model.internal.zze;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class IndoorBuilding {
    private final com.google.android.gms.maps.model.internal.zzd apU;

    public IndoorBuilding(com.google.android.gms.maps.model.internal.zzd zzdVar) {
        this.apU = (com.google.android.gms.maps.model.internal.zzd) zzaa.zzy(zzdVar);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof IndoorBuilding)) {
            return false;
        }
        try {
            return this.apU.zzb(((IndoorBuilding) obj).apU);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public int getActiveLevelIndex() {
        try {
            return this.apU.getActiveLevelIndex();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public int getDefaultLevelIndex() {
        try {
            return this.apU.getActiveLevelIndex();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public List<IndoorLevel> getLevels() {
        try {
            List<IBinder> levels = this.apU.getLevels();
            ArrayList arrayList = new ArrayList(levels.size());
            for (IBinder iBinder : levels) {
                arrayList.add(new IndoorLevel(zze.zza.zzjj(iBinder)));
            }
            return arrayList;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public int hashCode() {
        try {
            return this.apU.hashCodeRemote();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean isUnderground() {
        try {
            return this.apU.isUnderground();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
