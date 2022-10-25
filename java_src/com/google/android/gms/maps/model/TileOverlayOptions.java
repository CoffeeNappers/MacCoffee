package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.maps.model.internal.zzi;
/* loaded from: classes2.dex */
public final class TileOverlayOptions extends AbstractSafeParcelable {
    public static final Parcelable.Creator<TileOverlayOptions> CREATOR = new zzp();
    private float apJ;
    private boolean apK;
    private float apR;
    private com.google.android.gms.maps.model.internal.zzi aqq;
    private TileProvider aqr;
    private boolean aqs;
    private final int mVersionCode;

    public TileOverlayOptions() {
        this.apK = true;
        this.aqs = true;
        this.apR = 0.0f;
        this.mVersionCode = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TileOverlayOptions(int i, IBinder iBinder, boolean z, float f, boolean z2, float f2) {
        this.apK = true;
        this.aqs = true;
        this.apR = 0.0f;
        this.mVersionCode = i;
        this.aqq = zzi.zza.zzjo(iBinder);
        this.aqr = this.aqq == null ? null : new TileProvider() { // from class: com.google.android.gms.maps.model.TileOverlayOptions.1
            private final com.google.android.gms.maps.model.internal.zzi aqt;

            {
                this.aqt = TileOverlayOptions.this.aqq;
            }

            @Override // com.google.android.gms.maps.model.TileProvider
            public Tile getTile(int i2, int i3, int i4) {
                try {
                    return this.aqt.getTile(i2, i3, i4);
                } catch (RemoteException e) {
                    return null;
                }
            }
        };
        this.apK = z;
        this.apJ = f;
        this.aqs = z2;
        this.apR = f2;
    }

    public TileOverlayOptions fadeIn(boolean z) {
        this.aqs = z;
        return this;
    }

    public boolean getFadeIn() {
        return this.aqs;
    }

    public TileProvider getTileProvider() {
        return this.aqr;
    }

    public float getTransparency() {
        return this.apR;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public float getZIndex() {
        return this.apJ;
    }

    public boolean isVisible() {
        return this.apK;
    }

    public TileOverlayOptions tileProvider(final TileProvider tileProvider) {
        this.aqr = tileProvider;
        this.aqq = this.aqr == null ? null : new zzi.zza() { // from class: com.google.android.gms.maps.model.TileOverlayOptions.2
            @Override // com.google.android.gms.maps.model.internal.zzi
            public Tile getTile(int i, int i2, int i3) {
                return tileProvider.getTile(i, i2, i3);
            }
        };
        return this;
    }

    public TileOverlayOptions transparency(float f) {
        zzaa.zzb(f >= 0.0f && f <= 1.0f, "Transparency must be in the range [0..1]");
        this.apR = f;
        return this;
    }

    public TileOverlayOptions visible(boolean z) {
        this.apK = z;
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzp.zza(this, parcel, i);
    }

    public TileOverlayOptions zIndex(float f) {
        this.apJ = f;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzbtb() {
        return this.aqq.asBinder();
    }
}
