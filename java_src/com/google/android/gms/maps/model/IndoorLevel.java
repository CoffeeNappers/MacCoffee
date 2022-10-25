package com.google.android.gms.maps.model;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public final class IndoorLevel {
    private final com.google.android.gms.maps.model.internal.zze apV;

    public IndoorLevel(com.google.android.gms.maps.model.internal.zze zzeVar) {
        this.apV = (com.google.android.gms.maps.model.internal.zze) zzaa.zzy(zzeVar);
    }

    public void activate() {
        try {
            this.apV.activate();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof IndoorLevel)) {
            return false;
        }
        try {
            return this.apV.zza(((IndoorLevel) obj).apV);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public String getName() {
        try {
            return this.apV.getName();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public String getShortName() {
        try {
            return this.apV.getShortName();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public int hashCode() {
        try {
            return this.apV.hashCodeRemote();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
