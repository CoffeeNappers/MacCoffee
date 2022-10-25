package com.google.android.gms.maps;

import android.graphics.Point;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.maps.internal.IProjectionDelegate;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.VisibleRegion;
/* loaded from: classes2.dex */
public final class Projection {
    private final IProjectionDelegate aoW;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Projection(IProjectionDelegate iProjectionDelegate) {
        this.aoW = iProjectionDelegate;
    }

    public LatLng fromScreenLocation(Point point) {
        try {
            return this.aoW.fromScreenLocation(zze.zzac(point));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public VisibleRegion getVisibleRegion() {
        try {
            return this.aoW.getVisibleRegion();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public Point toScreenLocation(LatLng latLng) {
        try {
            return (Point) zze.zzae(this.aoW.toScreenLocation(latLng));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
