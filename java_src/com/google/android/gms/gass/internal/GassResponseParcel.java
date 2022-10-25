package com.google.android.gms.gass.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzaf;
import com.google.android.gms.internal.zzarz;
import com.google.android.gms.internal.zzasa;
/* loaded from: classes2.dex */
public final class GassResponseParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GassResponseParcel> CREATOR = new zzd();
    private zzaf.zza agI = null;
    private byte[] agJ;
    public final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GassResponseParcel(int i, byte[] bArr) {
        this.versionCode = i;
        this.agJ = bArr;
        zzazw();
    }

    private void zzazu() {
        if (!zzazv()) {
            try {
                this.agI = zzaf.zza.zzd(this.agJ);
                this.agJ = null;
            } catch (zzarz e) {
                throw new IllegalStateException(e);
            }
        }
        zzazw();
    }

    private boolean zzazv() {
        return this.agI != null;
    }

    private void zzazw() {
        if (this.agI != null || this.agJ == null) {
            if (this.agI != null && this.agJ == null) {
                return;
            }
            if (this.agI != null && this.agJ != null) {
                throw new IllegalStateException("Invalid internal representation - full");
            }
            if (this.agI != null || this.agJ != null) {
                throw new IllegalStateException("Impossible");
            }
            throw new IllegalStateException("Invalid internal representation - empty");
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }

    public byte[] zzbnn() {
        return this.agJ != null ? this.agJ : zzasa.zzf(this.agI);
    }

    public zzaf.zza zzbno() {
        zzazu();
        return this.agI;
    }
}
