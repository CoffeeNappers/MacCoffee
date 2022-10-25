package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLngBounds;
/* loaded from: classes2.dex */
public final class GoogleMapOptions extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<GoogleMapOptions> CREATOR = new zza();
    private Boolean aoA;
    private Boolean aoB;
    private Boolean aoC;
    private Boolean aoD;
    private Boolean aoE;
    private Boolean aoF;
    private Float aoG;
    private Float aoH;
    private LatLngBounds aoI;
    private Boolean aot;
    private Boolean aou;
    private int aov;
    private CameraPosition aow;
    private Boolean aox;
    private Boolean aoy;
    private Boolean aoz;
    private final int mVersionCode;

    public GoogleMapOptions() {
        this.aov = -1;
        this.aoG = null;
        this.aoH = null;
        this.aoI = null;
        this.mVersionCode = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GoogleMapOptions(int i, byte b, byte b2, int i2, CameraPosition cameraPosition, byte b3, byte b4, byte b5, byte b6, byte b7, byte b8, byte b9, byte b10, byte b11, Float f, Float f2, LatLngBounds latLngBounds) {
        this.aov = -1;
        this.aoG = null;
        this.aoH = null;
        this.aoI = null;
        this.mVersionCode = i;
        this.aot = com.google.android.gms.maps.internal.zza.zza(b);
        this.aou = com.google.android.gms.maps.internal.zza.zza(b2);
        this.aov = i2;
        this.aow = cameraPosition;
        this.aox = com.google.android.gms.maps.internal.zza.zza(b3);
        this.aoy = com.google.android.gms.maps.internal.zza.zza(b4);
        this.aoz = com.google.android.gms.maps.internal.zza.zza(b5);
        this.aoA = com.google.android.gms.maps.internal.zza.zza(b6);
        this.aoB = com.google.android.gms.maps.internal.zza.zza(b7);
        this.aoC = com.google.android.gms.maps.internal.zza.zza(b8);
        this.aoD = com.google.android.gms.maps.internal.zza.zza(b9);
        this.aoE = com.google.android.gms.maps.internal.zza.zza(b10);
        this.aoF = com.google.android.gms.maps.internal.zza.zza(b11);
        this.aoG = f;
        this.aoH = f2;
        this.aoI = latLngBounds;
    }

    public static GoogleMapOptions createFromAttributes(Context context, AttributeSet attributeSet) {
        if (attributeSet == null) {
            return null;
        }
        TypedArray obtainAttributes = context.getResources().obtainAttributes(attributeSet, com.google.android.gms.R.styleable.MapAttrs);
        GoogleMapOptions googleMapOptions = new GoogleMapOptions();
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_mapType)) {
            googleMapOptions.mapType(obtainAttributes.getInt(com.google.android.gms.R.styleable.MapAttrs_mapType, -1));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_zOrderOnTop)) {
            googleMapOptions.zOrderOnTop(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_zOrderOnTop, false));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_useViewLifecycle)) {
            googleMapOptions.useViewLifecycleInFragment(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_useViewLifecycle, false));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiCompass)) {
            googleMapOptions.compassEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiCompass, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiRotateGestures)) {
            googleMapOptions.rotateGesturesEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiRotateGestures, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiScrollGestures)) {
            googleMapOptions.scrollGesturesEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiScrollGestures, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiTiltGestures)) {
            googleMapOptions.tiltGesturesEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiTiltGestures, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiZoomGestures)) {
            googleMapOptions.zoomGesturesEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiZoomGestures, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiZoomControls)) {
            googleMapOptions.zoomControlsEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiZoomControls, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_liteMode)) {
            googleMapOptions.liteMode(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_liteMode, false));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_uiMapToolbar)) {
            googleMapOptions.mapToolbarEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_uiMapToolbar, true));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_ambientEnabled)) {
            googleMapOptions.ambientEnabled(obtainAttributes.getBoolean(com.google.android.gms.R.styleable.MapAttrs_ambientEnabled, false));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_cameraMinZoomPreference)) {
            googleMapOptions.minZoomPreference(obtainAttributes.getFloat(com.google.android.gms.R.styleable.MapAttrs_cameraMinZoomPreference, Float.NEGATIVE_INFINITY));
        }
        if (obtainAttributes.hasValue(com.google.android.gms.R.styleable.MapAttrs_cameraMinZoomPreference)) {
            googleMapOptions.maxZoomPreference(obtainAttributes.getFloat(com.google.android.gms.R.styleable.MapAttrs_cameraMaxZoomPreference, Float.POSITIVE_INFINITY));
        }
        googleMapOptions.latLngBoundsForCameraTarget(LatLngBounds.createFromAttributes(context, attributeSet));
        googleMapOptions.camera(CameraPosition.createFromAttributes(context, attributeSet));
        obtainAttributes.recycle();
        return googleMapOptions;
    }

    public GoogleMapOptions ambientEnabled(boolean z) {
        this.aoF = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions camera(CameraPosition cameraPosition) {
        this.aow = cameraPosition;
        return this;
    }

    public GoogleMapOptions compassEnabled(boolean z) {
        this.aoy = Boolean.valueOf(z);
        return this;
    }

    public Boolean getAmbientEnabled() {
        return this.aoF;
    }

    public CameraPosition getCamera() {
        return this.aow;
    }

    public Boolean getCompassEnabled() {
        return this.aoy;
    }

    public LatLngBounds getLatLngBoundsForCameraTarget() {
        return this.aoI;
    }

    public Boolean getLiteMode() {
        return this.aoD;
    }

    public Boolean getMapToolbarEnabled() {
        return this.aoE;
    }

    public int getMapType() {
        return this.aov;
    }

    public Float getMaxZoomPreference() {
        return this.aoH;
    }

    public Float getMinZoomPreference() {
        return this.aoG;
    }

    public Boolean getRotateGesturesEnabled() {
        return this.aoC;
    }

    public Boolean getScrollGesturesEnabled() {
        return this.aoz;
    }

    public Boolean getTiltGesturesEnabled() {
        return this.aoB;
    }

    public Boolean getUseViewLifecycleInFragment() {
        return this.aou;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public Boolean getZOrderOnTop() {
        return this.aot;
    }

    public Boolean getZoomControlsEnabled() {
        return this.aox;
    }

    public Boolean getZoomGesturesEnabled() {
        return this.aoA;
    }

    public GoogleMapOptions latLngBoundsForCameraTarget(LatLngBounds latLngBounds) {
        this.aoI = latLngBounds;
        return this;
    }

    public GoogleMapOptions liteMode(boolean z) {
        this.aoD = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions mapToolbarEnabled(boolean z) {
        this.aoE = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions mapType(int i) {
        this.aov = i;
        return this;
    }

    public GoogleMapOptions maxZoomPreference(float f) {
        this.aoH = Float.valueOf(f);
        return this;
    }

    public GoogleMapOptions minZoomPreference(float f) {
        this.aoG = Float.valueOf(f);
        return this;
    }

    public GoogleMapOptions rotateGesturesEnabled(boolean z) {
        this.aoC = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions scrollGesturesEnabled(boolean z) {
        this.aoz = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions tiltGesturesEnabled(boolean z) {
        this.aoB = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions useViewLifecycleInFragment(boolean z) {
        this.aou = Boolean.valueOf(z);
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    public GoogleMapOptions zOrderOnTop(boolean z) {
        this.aot = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions zoomControlsEnabled(boolean z) {
        this.aox = Boolean.valueOf(z);
        return this;
    }

    public GoogleMapOptions zoomGesturesEnabled(boolean z) {
        this.aoA = Boolean.valueOf(z);
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbse() {
        return com.google.android.gms.maps.internal.zza.zze(this.aot);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsf() {
        return com.google.android.gms.maps.internal.zza.zze(this.aou);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsg() {
        return com.google.android.gms.maps.internal.zza.zze(this.aox);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsh() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoy);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsi() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoz);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsj() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoA);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsk() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoB);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsl() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoC);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsm() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoD);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsn() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbso() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoF);
    }
}
