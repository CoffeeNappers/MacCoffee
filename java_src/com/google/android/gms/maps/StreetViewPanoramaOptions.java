package com.google.android.gms.maps;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.StreetViewPanoramaCamera;
/* loaded from: classes2.dex */
public final class StreetViewPanoramaOptions extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<StreetViewPanoramaOptions> CREATOR = new zzb();
    private Boolean aoA;
    private Boolean aou;
    private StreetViewPanoramaCamera api;
    private String apj;
    private LatLng apk;
    private Integer apl;
    private Boolean apm;
    private Boolean apn;
    private Boolean apo;
    private final int mVersionCode;

    public StreetViewPanoramaOptions() {
        this.apm = true;
        this.aoA = true;
        this.apn = true;
        this.apo = true;
        this.mVersionCode = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreetViewPanoramaOptions(int i, StreetViewPanoramaCamera streetViewPanoramaCamera, String str, LatLng latLng, Integer num, byte b, byte b2, byte b3, byte b4, byte b5) {
        this.apm = true;
        this.aoA = true;
        this.apn = true;
        this.apo = true;
        this.mVersionCode = i;
        this.api = streetViewPanoramaCamera;
        this.apk = latLng;
        this.apl = num;
        this.apj = str;
        this.apm = com.google.android.gms.maps.internal.zza.zza(b);
        this.aoA = com.google.android.gms.maps.internal.zza.zza(b2);
        this.apn = com.google.android.gms.maps.internal.zza.zza(b3);
        this.apo = com.google.android.gms.maps.internal.zza.zza(b4);
        this.aou = com.google.android.gms.maps.internal.zza.zza(b5);
    }

    public Boolean getPanningGesturesEnabled() {
        return this.apn;
    }

    public String getPanoramaId() {
        return this.apj;
    }

    public LatLng getPosition() {
        return this.apk;
    }

    public Integer getRadius() {
        return this.apl;
    }

    public Boolean getStreetNamesEnabled() {
        return this.apo;
    }

    public StreetViewPanoramaCamera getStreetViewPanoramaCamera() {
        return this.api;
    }

    public Boolean getUseViewLifecycleInFragment() {
        return this.aou;
    }

    public Boolean getUserNavigationEnabled() {
        return this.apm;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public Boolean getZoomGesturesEnabled() {
        return this.aoA;
    }

    public StreetViewPanoramaOptions panningGesturesEnabled(boolean z) {
        this.apn = Boolean.valueOf(z);
        return this;
    }

    public StreetViewPanoramaOptions panoramaCamera(StreetViewPanoramaCamera streetViewPanoramaCamera) {
        this.api = streetViewPanoramaCamera;
        return this;
    }

    public StreetViewPanoramaOptions panoramaId(String str) {
        this.apj = str;
        return this;
    }

    public StreetViewPanoramaOptions position(LatLng latLng) {
        this.apk = latLng;
        return this;
    }

    public StreetViewPanoramaOptions position(LatLng latLng, Integer num) {
        this.apk = latLng;
        this.apl = num;
        return this;
    }

    public StreetViewPanoramaOptions streetNamesEnabled(boolean z) {
        this.apo = Boolean.valueOf(z);
        return this;
    }

    public StreetViewPanoramaOptions useViewLifecycleInFragment(boolean z) {
        this.aou = Boolean.valueOf(z);
        return this;
    }

    public StreetViewPanoramaOptions userNavigationEnabled(boolean z) {
        this.apm = Boolean.valueOf(z);
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    public StreetViewPanoramaOptions zoomGesturesEnabled(boolean z) {
        this.aoA = Boolean.valueOf(z);
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsf() {
        return com.google.android.gms.maps.internal.zza.zze(this.aou);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsj() {
        return com.google.android.gms.maps.internal.zza.zze(this.aoA);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbsr() {
        return com.google.android.gms.maps.internal.zza.zze(this.apm);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbss() {
        return com.google.android.gms.maps.internal.zza.zze(this.apn);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte zzbst() {
        return com.google.android.gms.maps.internal.zza.zze(this.apo);
    }
}
