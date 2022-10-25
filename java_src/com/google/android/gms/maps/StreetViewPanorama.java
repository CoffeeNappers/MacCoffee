package com.google.android.gms.maps;

import android.graphics.Point;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.zzab;
import com.google.android.gms.maps.internal.zzac;
import com.google.android.gms.maps.internal.zzad;
import com.google.android.gms.maps.internal.zzae;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.StreetViewPanoramaCamera;
import com.google.android.gms.maps.model.StreetViewPanoramaLocation;
import com.google.android.gms.maps.model.StreetViewPanoramaOrientation;
/* loaded from: classes2.dex */
public class StreetViewPanorama {
    private final IStreetViewPanoramaDelegate aoX;

    /* loaded from: classes2.dex */
    public interface OnStreetViewPanoramaCameraChangeListener {
        void onStreetViewPanoramaCameraChange(StreetViewPanoramaCamera streetViewPanoramaCamera);
    }

    /* loaded from: classes2.dex */
    public interface OnStreetViewPanoramaChangeListener {
        void onStreetViewPanoramaChange(StreetViewPanoramaLocation streetViewPanoramaLocation);
    }

    /* loaded from: classes2.dex */
    public interface OnStreetViewPanoramaClickListener {
        void onStreetViewPanoramaClick(StreetViewPanoramaOrientation streetViewPanoramaOrientation);
    }

    /* loaded from: classes2.dex */
    public interface OnStreetViewPanoramaLongClickListener {
        void onStreetViewPanoramaLongClick(StreetViewPanoramaOrientation streetViewPanoramaOrientation);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public StreetViewPanorama(IStreetViewPanoramaDelegate iStreetViewPanoramaDelegate) {
        this.aoX = (IStreetViewPanoramaDelegate) zzaa.zzy(iStreetViewPanoramaDelegate);
    }

    public void animateTo(StreetViewPanoramaCamera streetViewPanoramaCamera, long j) {
        try {
            this.aoX.animateTo(streetViewPanoramaCamera, j);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public StreetViewPanoramaLocation getLocation() {
        try {
            return this.aoX.getStreetViewPanoramaLocation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public StreetViewPanoramaCamera getPanoramaCamera() {
        try {
            return this.aoX.getPanoramaCamera();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean isPanningGesturesEnabled() {
        try {
            return this.aoX.isPanningGesturesEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean isStreetNamesEnabled() {
        try {
            return this.aoX.isStreetNamesEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean isUserNavigationEnabled() {
        try {
            return this.aoX.isUserNavigationEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean isZoomGesturesEnabled() {
        try {
            return this.aoX.isZoomGesturesEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public Point orientationToPoint(StreetViewPanoramaOrientation streetViewPanoramaOrientation) {
        try {
            zzd orientationToPoint = this.aoX.orientationToPoint(streetViewPanoramaOrientation);
            if (orientationToPoint != null) {
                return (Point) zze.zzae(orientationToPoint);
            }
            return null;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public StreetViewPanoramaOrientation pointToOrientation(Point point) {
        try {
            return this.aoX.pointToOrientation(zze.zzac(point));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnStreetViewPanoramaCameraChangeListener(final OnStreetViewPanoramaCameraChangeListener onStreetViewPanoramaCameraChangeListener) {
        try {
            if (onStreetViewPanoramaCameraChangeListener == null) {
                this.aoX.setOnStreetViewPanoramaCameraChangeListener(null);
            } else {
                this.aoX.setOnStreetViewPanoramaCameraChangeListener(new zzab.zza() { // from class: com.google.android.gms.maps.StreetViewPanorama.2
                    @Override // com.google.android.gms.maps.internal.zzab
                    public void onStreetViewPanoramaCameraChange(StreetViewPanoramaCamera streetViewPanoramaCamera) {
                        onStreetViewPanoramaCameraChangeListener.onStreetViewPanoramaCameraChange(streetViewPanoramaCamera);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnStreetViewPanoramaChangeListener(final OnStreetViewPanoramaChangeListener onStreetViewPanoramaChangeListener) {
        try {
            if (onStreetViewPanoramaChangeListener == null) {
                this.aoX.setOnStreetViewPanoramaChangeListener(null);
            } else {
                this.aoX.setOnStreetViewPanoramaChangeListener(new zzac.zza() { // from class: com.google.android.gms.maps.StreetViewPanorama.1
                    @Override // com.google.android.gms.maps.internal.zzac
                    public void onStreetViewPanoramaChange(StreetViewPanoramaLocation streetViewPanoramaLocation) {
                        onStreetViewPanoramaChangeListener.onStreetViewPanoramaChange(streetViewPanoramaLocation);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnStreetViewPanoramaClickListener(final OnStreetViewPanoramaClickListener onStreetViewPanoramaClickListener) {
        try {
            if (onStreetViewPanoramaClickListener == null) {
                this.aoX.setOnStreetViewPanoramaClickListener(null);
            } else {
                this.aoX.setOnStreetViewPanoramaClickListener(new zzad.zza() { // from class: com.google.android.gms.maps.StreetViewPanorama.3
                    @Override // com.google.android.gms.maps.internal.zzad
                    public void onStreetViewPanoramaClick(StreetViewPanoramaOrientation streetViewPanoramaOrientation) {
                        onStreetViewPanoramaClickListener.onStreetViewPanoramaClick(streetViewPanoramaOrientation);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnStreetViewPanoramaLongClickListener(final OnStreetViewPanoramaLongClickListener onStreetViewPanoramaLongClickListener) {
        try {
            if (onStreetViewPanoramaLongClickListener == null) {
                this.aoX.setOnStreetViewPanoramaLongClickListener(null);
            } else {
                this.aoX.setOnStreetViewPanoramaLongClickListener(new zzae.zza() { // from class: com.google.android.gms.maps.StreetViewPanorama.4
                    @Override // com.google.android.gms.maps.internal.zzae
                    public void onStreetViewPanoramaLongClick(StreetViewPanoramaOrientation streetViewPanoramaOrientation) {
                        onStreetViewPanoramaLongClickListener.onStreetViewPanoramaLongClick(streetViewPanoramaOrientation);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setPanningGesturesEnabled(boolean z) {
        try {
            this.aoX.enablePanning(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setPosition(LatLng latLng) {
        try {
            this.aoX.setPosition(latLng);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setPosition(LatLng latLng, int i) {
        try {
            this.aoX.setPositionWithRadius(latLng, i);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setPosition(String str) {
        try {
            this.aoX.setPositionWithID(str);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setStreetNamesEnabled(boolean z) {
        try {
            this.aoX.enableStreetNames(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setUserNavigationEnabled(boolean z) {
        try {
            this.aoX.enableUserNavigation(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setZoomGesturesEnabled(boolean z) {
        try {
            this.aoX.enableZoom(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
