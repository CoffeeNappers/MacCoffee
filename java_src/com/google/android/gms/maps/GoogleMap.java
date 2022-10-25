package com.google.android.gms.maps;

import android.graphics.Bitmap;
import android.location.Location;
import android.os.RemoteException;
import android.support.annotation.RequiresPermission;
import android.view.View;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.maps.LocationSource;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate;
import com.google.android.gms.maps.internal.zzaa;
import com.google.android.gms.maps.internal.zzag;
import com.google.android.gms.maps.internal.zzb;
import com.google.android.gms.maps.internal.zzd;
import com.google.android.gms.maps.internal.zze;
import com.google.android.gms.maps.internal.zzf;
import com.google.android.gms.maps.internal.zzg;
import com.google.android.gms.maps.internal.zzh;
import com.google.android.gms.maps.internal.zzi;
import com.google.android.gms.maps.internal.zzj;
import com.google.android.gms.maps.internal.zzk;
import com.google.android.gms.maps.internal.zzl;
import com.google.android.gms.maps.internal.zzm;
import com.google.android.gms.maps.internal.zzn;
import com.google.android.gms.maps.internal.zzo;
import com.google.android.gms.maps.internal.zzp;
import com.google.android.gms.maps.internal.zzq;
import com.google.android.gms.maps.internal.zzr;
import com.google.android.gms.maps.internal.zzs;
import com.google.android.gms.maps.internal.zzu;
import com.google.android.gms.maps.internal.zzv;
import com.google.android.gms.maps.internal.zzw;
import com.google.android.gms.maps.internal.zzx;
import com.google.android.gms.maps.internal.zzy;
import com.google.android.gms.maps.internal.zzz;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.IndoorBuilding;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.MapStyleOptions;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PointOfInterest;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.internal.IPolylineDelegate;
import com.google.android.gms.maps.model.internal.zzc;
import com.google.android.gms.maps.model.internal.zzd;
import com.google.android.gms.maps.model.internal.zzf;
import com.google.android.gms.maps.model.internal.zzh;
/* loaded from: classes.dex */
public final class GoogleMap {
    public static final int MAP_TYPE_HYBRID = 4;
    public static final int MAP_TYPE_NONE = 0;
    public static final int MAP_TYPE_NORMAL = 1;
    public static final int MAP_TYPE_SATELLITE = 2;
    public static final int MAP_TYPE_TERRAIN = 3;
    private final IGoogleMapDelegate anP;
    private UiSettings anQ;

    /* loaded from: classes2.dex */
    public interface CancelableCallback {
        void onCancel();

        void onFinish();
    }

    /* loaded from: classes2.dex */
    public interface InfoWindowAdapter {
        View getInfoContents(Marker marker);

        View getInfoWindow(Marker marker);
    }

    @Deprecated
    /* loaded from: classes.dex */
    public interface OnCameraChangeListener {
        void onCameraChange(CameraPosition cameraPosition);
    }

    /* loaded from: classes2.dex */
    public interface OnCameraIdleListener {
        void onCameraIdle();
    }

    /* loaded from: classes2.dex */
    public interface OnCameraMoveCanceledListener {
        void onCameraMoveCanceled();
    }

    /* loaded from: classes2.dex */
    public interface OnCameraMoveListener {
        void onCameraMove();
    }

    /* loaded from: classes2.dex */
    public interface OnCameraMoveStartedListener {
        public static final int REASON_API_ANIMATION = 2;
        public static final int REASON_DEVELOPER_ANIMATION = 3;
        public static final int REASON_GESTURE = 1;

        void onCameraMoveStarted(int i);
    }

    /* loaded from: classes2.dex */
    public interface OnCircleClickListener {
        void onCircleClick(Circle circle);
    }

    /* loaded from: classes2.dex */
    public interface OnGroundOverlayClickListener {
        void onGroundOverlayClick(GroundOverlay groundOverlay);
    }

    /* loaded from: classes2.dex */
    public interface OnIndoorStateChangeListener {
        void onIndoorBuildingFocused();

        void onIndoorLevelActivated(IndoorBuilding indoorBuilding);
    }

    /* loaded from: classes2.dex */
    public interface OnInfoWindowClickListener {
        void onInfoWindowClick(Marker marker);
    }

    /* loaded from: classes2.dex */
    public interface OnInfoWindowCloseListener {
        void onInfoWindowClose(Marker marker);
    }

    /* loaded from: classes2.dex */
    public interface OnInfoWindowLongClickListener {
        void onInfoWindowLongClick(Marker marker);
    }

    /* loaded from: classes2.dex */
    public interface OnMapClickListener {
        void onMapClick(LatLng latLng);
    }

    /* loaded from: classes2.dex */
    public interface OnMapLoadedCallback {
        void onMapLoaded();
    }

    /* loaded from: classes2.dex */
    public interface OnMapLongClickListener {
        void onMapLongClick(LatLng latLng);
    }

    /* loaded from: classes2.dex */
    public interface OnMarkerClickListener {
        boolean onMarkerClick(Marker marker);
    }

    /* loaded from: classes2.dex */
    public interface OnMarkerDragListener {
        void onMarkerDrag(Marker marker);

        void onMarkerDragEnd(Marker marker);

        void onMarkerDragStart(Marker marker);
    }

    /* loaded from: classes2.dex */
    public interface OnMyLocationButtonClickListener {
        boolean onMyLocationButtonClick();
    }

    @Deprecated
    /* loaded from: classes.dex */
    public interface OnMyLocationChangeListener {
        void onMyLocationChange(Location location);
    }

    /* loaded from: classes2.dex */
    public interface OnPoiClickListener {
        void onPoiClick(PointOfInterest pointOfInterest);
    }

    /* loaded from: classes2.dex */
    public interface OnPolygonClickListener {
        void onPolygonClick(Polygon polygon);
    }

    /* loaded from: classes2.dex */
    public interface OnPolylineClickListener {
        void onPolylineClick(Polyline polyline);
    }

    /* loaded from: classes2.dex */
    public interface SnapshotReadyCallback {
        void onSnapshotReady(Bitmap bitmap);
    }

    /* loaded from: classes2.dex */
    private static final class zza extends zzb.zza {
        private final CancelableCallback aos;

        zza(CancelableCallback cancelableCallback) {
            this.aos = cancelableCallback;
        }

        @Override // com.google.android.gms.maps.internal.zzb
        public void onCancel() {
            this.aos.onCancel();
        }

        @Override // com.google.android.gms.maps.internal.zzb
        public void onFinish() {
            this.aos.onFinish();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GoogleMap(IGoogleMapDelegate iGoogleMapDelegate) {
        this.anP = (IGoogleMapDelegate) zzaa.zzy(iGoogleMapDelegate);
    }

    public final Circle addCircle(CircleOptions circleOptions) {
        try {
            return new Circle(this.anP.addCircle(circleOptions));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final GroundOverlay addGroundOverlay(GroundOverlayOptions groundOverlayOptions) {
        try {
            zzc addGroundOverlay = this.anP.addGroundOverlay(groundOverlayOptions);
            if (addGroundOverlay == null) {
                return null;
            }
            return new GroundOverlay(addGroundOverlay);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Marker addMarker(MarkerOptions markerOptions) {
        try {
            zzf addMarker = this.anP.addMarker(markerOptions);
            if (addMarker == null) {
                return null;
            }
            return new Marker(addMarker);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polygon addPolygon(PolygonOptions polygonOptions) {
        try {
            return new Polygon(this.anP.addPolygon(polygonOptions));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polyline addPolyline(PolylineOptions polylineOptions) {
        try {
            return new Polyline(this.anP.addPolyline(polylineOptions));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final TileOverlay addTileOverlay(TileOverlayOptions tileOverlayOptions) {
        try {
            zzh addTileOverlay = this.anP.addTileOverlay(tileOverlayOptions);
            if (addTileOverlay == null) {
                return null;
            }
            return new TileOverlay(addTileOverlay);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate cameraUpdate) {
        try {
            this.anP.animateCamera(cameraUpdate.zzbsc());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate cameraUpdate, int i, CancelableCallback cancelableCallback) {
        try {
            this.anP.animateCameraWithDurationAndCallback(cameraUpdate.zzbsc(), i, cancelableCallback == null ? null : new zza(cancelableCallback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate cameraUpdate, CancelableCallback cancelableCallback) {
        try {
            this.anP.animateCameraWithCallback(cameraUpdate.zzbsc(), cancelableCallback == null ? null : new zza(cancelableCallback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void clear() {
        try {
            this.anP.clear();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final CameraPosition getCameraPosition() {
        try {
            return this.anP.getCameraPosition();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public IndoorBuilding getFocusedBuilding() {
        try {
            zzd focusedBuilding = this.anP.getFocusedBuilding();
            if (focusedBuilding == null) {
                return null;
            }
            return new IndoorBuilding(focusedBuilding);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final int getMapType() {
        try {
            return this.anP.getMapType();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMaxZoomLevel() {
        try {
            return this.anP.getMaxZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMinZoomLevel() {
        try {
            return this.anP.getMinZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final Location getMyLocation() {
        try {
            return this.anP.getMyLocation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Projection getProjection() {
        try {
            return new Projection(this.anP.getProjection());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final UiSettings getUiSettings() {
        try {
            if (this.anQ == null) {
                this.anQ = new UiSettings(this.anP.getUiSettings());
            }
            return this.anQ;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isBuildingsEnabled() {
        try {
            return this.anP.isBuildingsEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isIndoorEnabled() {
        try {
            return this.anP.isIndoorEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isMyLocationEnabled() {
        try {
            return this.anP.isMyLocationEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isTrafficEnabled() {
        try {
            return this.anP.isTrafficEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void moveCamera(CameraUpdate cameraUpdate) {
        try {
            this.anP.moveCamera(cameraUpdate.zzbsc());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void resetMinMaxZoomPreference() {
        try {
            this.anP.resetMinMaxZoomPreference();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setBuildingsEnabled(boolean z) {
        try {
            this.anP.setBuildingsEnabled(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setContentDescription(String str) {
        try {
            this.anP.setContentDescription(str);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean setIndoorEnabled(boolean z) {
        try {
            return this.anP.setIndoorEnabled(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setInfoWindowAdapter(final InfoWindowAdapter infoWindowAdapter) {
        try {
            if (infoWindowAdapter == null) {
                this.anP.setInfoWindowAdapter(null);
            } else {
                this.anP.setInfoWindowAdapter(new zzd.zza() { // from class: com.google.android.gms.maps.GoogleMap.7
                    @Override // com.google.android.gms.maps.internal.zzd
                    public com.google.android.gms.dynamic.zzd zzh(zzf zzfVar) {
                        return zze.zzac(infoWindowAdapter.getInfoWindow(new Marker(zzfVar)));
                    }

                    @Override // com.google.android.gms.maps.internal.zzd
                    public com.google.android.gms.dynamic.zzd zzi(zzf zzfVar) {
                        return zze.zzac(infoWindowAdapter.getInfoContents(new Marker(zzfVar)));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setLatLngBoundsForCameraTarget(LatLngBounds latLngBounds) {
        try {
            this.anP.setLatLngBoundsForCameraTarget(latLngBounds);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setLocationSource(final LocationSource locationSource) {
        try {
            if (locationSource == null) {
                this.anP.setLocationSource(null);
            } else {
                this.anP.setLocationSource(new ILocationSourceDelegate.zza() { // from class: com.google.android.gms.maps.GoogleMap.12
                    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
                    public void activate(final zzp zzpVar) {
                        locationSource.activate(new LocationSource.OnLocationChangedListener() { // from class: com.google.android.gms.maps.GoogleMap.12.1
                            @Override // com.google.android.gms.maps.LocationSource.OnLocationChangedListener
                            public void onLocationChanged(Location location) {
                                try {
                                    zzpVar.zze(location);
                                } catch (RemoteException e) {
                                    throw new RuntimeRemoteException(e);
                                }
                            }
                        });
                    }

                    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
                    public void deactivate() {
                        locationSource.deactivate();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public boolean setMapStyle(MapStyleOptions mapStyleOptions) {
        try {
            return this.anP.setMapStyle(mapStyleOptions);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setMapType(int i) {
        try {
            this.anP.setMapType(i);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setMaxZoomPreference(float f) {
        try {
            this.anP.setMaxZoomPreference(f);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setMinZoomPreference(float f) {
        try {
            this.anP.setMinZoomPreference(f);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public final void setMyLocationEnabled(boolean z) {
        try {
            this.anP.setMyLocationEnabled(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final void setOnCameraChangeListener(final OnCameraChangeListener onCameraChangeListener) {
        try {
            if (onCameraChangeListener == null) {
                this.anP.setOnCameraChangeListener(null);
            } else {
                this.anP.setOnCameraChangeListener(new zze.zza() { // from class: com.google.android.gms.maps.GoogleMap.18
                    @Override // com.google.android.gms.maps.internal.zze
                    public void onCameraChange(CameraPosition cameraPosition) {
                        onCameraChangeListener.onCameraChange(cameraPosition);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraIdleListener(final OnCameraIdleListener onCameraIdleListener) {
        try {
            if (onCameraIdleListener == null) {
                this.anP.setOnCameraIdleListener(null);
            } else {
                this.anP.setOnCameraIdleListener(new zzf.zza() { // from class: com.google.android.gms.maps.GoogleMap.22
                    @Override // com.google.android.gms.maps.internal.zzf
                    public void onCameraIdle() {
                        onCameraIdleListener.onCameraIdle();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraMoveCanceledListener(final OnCameraMoveCanceledListener onCameraMoveCanceledListener) {
        try {
            if (onCameraMoveCanceledListener == null) {
                this.anP.setOnCameraMoveCanceledListener(null);
            } else {
                this.anP.setOnCameraMoveCanceledListener(new zzg.zza() { // from class: com.google.android.gms.maps.GoogleMap.21
                    @Override // com.google.android.gms.maps.internal.zzg
                    public void onCameraMoveCanceled() {
                        onCameraMoveCanceledListener.onCameraMoveCanceled();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraMoveListener(final OnCameraMoveListener onCameraMoveListener) {
        try {
            if (onCameraMoveListener == null) {
                this.anP.setOnCameraMoveListener(null);
            } else {
                this.anP.setOnCameraMoveListener(new zzh.zza() { // from class: com.google.android.gms.maps.GoogleMap.20
                    @Override // com.google.android.gms.maps.internal.zzh
                    public void onCameraMove() {
                        onCameraMoveListener.onCameraMove();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraMoveStartedListener(final OnCameraMoveStartedListener onCameraMoveStartedListener) {
        try {
            if (onCameraMoveStartedListener == null) {
                this.anP.setOnCameraMoveStartedListener(null);
            } else {
                this.anP.setOnCameraMoveStartedListener(new zzi.zza() { // from class: com.google.android.gms.maps.GoogleMap.19
                    @Override // com.google.android.gms.maps.internal.zzi
                    public void onCameraMoveStarted(int i) {
                        onCameraMoveStartedListener.onCameraMoveStarted(i);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCircleClickListener(final OnCircleClickListener onCircleClickListener) {
        try {
            if (onCircleClickListener == null) {
                this.anP.setOnCircleClickListener(null);
            } else {
                this.anP.setOnCircleClickListener(new zzj.zza() { // from class: com.google.android.gms.maps.GoogleMap.13
                    @Override // com.google.android.gms.maps.internal.zzj
                    public void zza(com.google.android.gms.maps.model.internal.zzb zzbVar) {
                        onCircleClickListener.onCircleClick(new Circle(zzbVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnGroundOverlayClickListener(final OnGroundOverlayClickListener onGroundOverlayClickListener) {
        try {
            if (onGroundOverlayClickListener == null) {
                this.anP.setOnGroundOverlayClickListener(null);
            } else {
                this.anP.setOnGroundOverlayClickListener(new zzk.zza() { // from class: com.google.android.gms.maps.GoogleMap.11
                    @Override // com.google.android.gms.maps.internal.zzk
                    public void zza(zzc zzcVar) {
                        onGroundOverlayClickListener.onGroundOverlayClick(new GroundOverlay(zzcVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnIndoorStateChangeListener(final OnIndoorStateChangeListener onIndoorStateChangeListener) {
        try {
            if (onIndoorStateChangeListener == null) {
                this.anP.setOnIndoorStateChangeListener(null);
            } else {
                this.anP.setOnIndoorStateChangeListener(new zzl.zza() { // from class: com.google.android.gms.maps.GoogleMap.1
                    @Override // com.google.android.gms.maps.internal.zzl
                    public void onIndoorBuildingFocused() {
                        onIndoorStateChangeListener.onIndoorBuildingFocused();
                    }

                    @Override // com.google.android.gms.maps.internal.zzl
                    public void zza(com.google.android.gms.maps.model.internal.zzd zzdVar) {
                        onIndoorStateChangeListener.onIndoorLevelActivated(new IndoorBuilding(zzdVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener onInfoWindowClickListener) {
        try {
            if (onInfoWindowClickListener == null) {
                this.anP.setOnInfoWindowClickListener(null);
            } else {
                this.anP.setOnInfoWindowClickListener(new zzm.zza() { // from class: com.google.android.gms.maps.GoogleMap.4
                    @Override // com.google.android.gms.maps.internal.zzm
                    public void zze(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onInfoWindowClickListener.onInfoWindowClick(new Marker(zzfVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnInfoWindowCloseListener(final OnInfoWindowCloseListener onInfoWindowCloseListener) {
        try {
            if (onInfoWindowCloseListener == null) {
                this.anP.setOnInfoWindowCloseListener(null);
            } else {
                this.anP.setOnInfoWindowCloseListener(new zzn.zza() { // from class: com.google.android.gms.maps.GoogleMap.6
                    @Override // com.google.android.gms.maps.internal.zzn
                    public void zzg(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onInfoWindowCloseListener.onInfoWindowClose(new Marker(zzfVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnInfoWindowLongClickListener(final OnInfoWindowLongClickListener onInfoWindowLongClickListener) {
        try {
            if (onInfoWindowLongClickListener == null) {
                this.anP.setOnInfoWindowLongClickListener(null);
            } else {
                this.anP.setOnInfoWindowLongClickListener(new zzo.zza() { // from class: com.google.android.gms.maps.GoogleMap.5
                    @Override // com.google.android.gms.maps.internal.zzo
                    public void zzf(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onInfoWindowLongClickListener.onInfoWindowLongClick(new Marker(zzfVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMapClickListener(final OnMapClickListener onMapClickListener) {
        try {
            if (onMapClickListener == null) {
                this.anP.setOnMapClickListener(null);
            } else {
                this.anP.setOnMapClickListener(new zzq.zza() { // from class: com.google.android.gms.maps.GoogleMap.23
                    @Override // com.google.android.gms.maps.internal.zzq
                    public void onMapClick(LatLng latLng) {
                        onMapClickListener.onMapClick(latLng);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setOnMapLoadedCallback(final OnMapLoadedCallback onMapLoadedCallback) {
        try {
            if (onMapLoadedCallback == null) {
                this.anP.setOnMapLoadedCallback(null);
            } else {
                this.anP.setOnMapLoadedCallback(new zzr.zza() { // from class: com.google.android.gms.maps.GoogleMap.10
                    @Override // com.google.android.gms.maps.internal.zzr
                    public void onMapLoaded() throws RemoteException {
                        onMapLoadedCallback.onMapLoaded();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMapLongClickListener(final OnMapLongClickListener onMapLongClickListener) {
        try {
            if (onMapLongClickListener == null) {
                this.anP.setOnMapLongClickListener(null);
            } else {
                this.anP.setOnMapLongClickListener(new zzs.zza() { // from class: com.google.android.gms.maps.GoogleMap.24
                    @Override // com.google.android.gms.maps.internal.zzs
                    public void onMapLongClick(LatLng latLng) {
                        onMapLongClickListener.onMapLongClick(latLng);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMarkerClickListener(final OnMarkerClickListener onMarkerClickListener) {
        try {
            if (onMarkerClickListener == null) {
                this.anP.setOnMarkerClickListener(null);
            } else {
                this.anP.setOnMarkerClickListener(new zzu.zza() { // from class: com.google.android.gms.maps.GoogleMap.2
                    @Override // com.google.android.gms.maps.internal.zzu
                    public boolean zza(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        return onMarkerClickListener.onMarkerClick(new Marker(zzfVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMarkerDragListener(final OnMarkerDragListener onMarkerDragListener) {
        try {
            if (onMarkerDragListener == null) {
                this.anP.setOnMarkerDragListener(null);
            } else {
                this.anP.setOnMarkerDragListener(new zzv.zza() { // from class: com.google.android.gms.maps.GoogleMap.3
                    @Override // com.google.android.gms.maps.internal.zzv
                    public void zzb(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onMarkerDragListener.onMarkerDragStart(new Marker(zzfVar));
                    }

                    @Override // com.google.android.gms.maps.internal.zzv
                    public void zzc(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onMarkerDragListener.onMarkerDragEnd(new Marker(zzfVar));
                    }

                    @Override // com.google.android.gms.maps.internal.zzv
                    public void zzd(com.google.android.gms.maps.model.internal.zzf zzfVar) {
                        onMarkerDragListener.onMarkerDrag(new Marker(zzfVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMyLocationButtonClickListener(final OnMyLocationButtonClickListener onMyLocationButtonClickListener) {
        try {
            if (onMyLocationButtonClickListener == null) {
                this.anP.setOnMyLocationButtonClickListener(null);
            } else {
                this.anP.setOnMyLocationButtonClickListener(new zzw.zza() { // from class: com.google.android.gms.maps.GoogleMap.9
                    @Override // com.google.android.gms.maps.internal.zzw
                    public boolean onMyLocationButtonClick() throws RemoteException {
                        return onMyLocationButtonClickListener.onMyLocationButtonClick();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener onMyLocationChangeListener) {
        try {
            if (onMyLocationChangeListener == null) {
                this.anP.setOnMyLocationChangeListener(null);
            } else {
                this.anP.setOnMyLocationChangeListener(new zzx.zza() { // from class: com.google.android.gms.maps.GoogleMap.8
                    @Override // com.google.android.gms.maps.internal.zzx
                    public void zzaf(com.google.android.gms.dynamic.zzd zzdVar) {
                        onMyLocationChangeListener.onMyLocationChange((Location) com.google.android.gms.dynamic.zze.zzae(zzdVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnPoiClickListener(final OnPoiClickListener onPoiClickListener) {
        try {
            if (onPoiClickListener == null) {
                this.anP.setOnPoiClickListener(null);
            } else {
                this.anP.setOnPoiClickListener(new zzy.zza() { // from class: com.google.android.gms.maps.GoogleMap.17
                    @Override // com.google.android.gms.maps.internal.zzy
                    public void zza(PointOfInterest pointOfInterest) throws RemoteException {
                        onPoiClickListener.onPoiClick(pointOfInterest);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnPolygonClickListener(final OnPolygonClickListener onPolygonClickListener) {
        try {
            if (onPolygonClickListener == null) {
                this.anP.setOnPolygonClickListener(null);
            } else {
                this.anP.setOnPolygonClickListener(new zzz.zza() { // from class: com.google.android.gms.maps.GoogleMap.14
                    @Override // com.google.android.gms.maps.internal.zzz
                    public void zza(com.google.android.gms.maps.model.internal.zzg zzgVar) {
                        onPolygonClickListener.onPolygonClick(new Polygon(zzgVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnPolylineClickListener(final OnPolylineClickListener onPolylineClickListener) {
        try {
            if (onPolylineClickListener == null) {
                this.anP.setOnPolylineClickListener(null);
            } else {
                this.anP.setOnPolylineClickListener(new zzaa.zza() { // from class: com.google.android.gms.maps.GoogleMap.15
                    @Override // com.google.android.gms.maps.internal.zzaa
                    public void zza(IPolylineDelegate iPolylineDelegate) {
                        onPolylineClickListener.onPolylineClick(new Polyline(iPolylineDelegate));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setPadding(int i, int i2, int i3, int i4) {
        try {
            this.anP.setPadding(i, i2, i3, i4);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setTrafficEnabled(boolean z) {
        try {
            this.anP.setTrafficEnabled(z);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void snapshot(SnapshotReadyCallback snapshotReadyCallback) {
        snapshot(snapshotReadyCallback, null);
    }

    public final void snapshot(final SnapshotReadyCallback snapshotReadyCallback, Bitmap bitmap) {
        try {
            this.anP.snapshot(new zzag.zza() { // from class: com.google.android.gms.maps.GoogleMap.16
                @Override // com.google.android.gms.maps.internal.zzag
                public void onSnapshotReady(Bitmap bitmap2) throws RemoteException {
                    snapshotReadyCallback.onSnapshotReady(bitmap2);
                }

                @Override // com.google.android.gms.maps.internal.zzag
                public void zzag(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                    snapshotReadyCallback.onSnapshotReady((Bitmap) com.google.android.gms.dynamic.zze.zzae(zzdVar));
                }
            }, (com.google.android.gms.dynamic.zze) (bitmap != null ? com.google.android.gms.dynamic.zze.zzac(bitmap) : null));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void stopAnimation() {
        try {
            this.anP.stopAnimation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
