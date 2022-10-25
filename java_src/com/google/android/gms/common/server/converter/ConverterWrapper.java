package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.server.response.FastJsonResponse;
/* loaded from: classes2.dex */
public class ConverterWrapper extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ConverterWrapper> CREATOR = new zza();
    private final StringToIntConverter Fa;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ConverterWrapper(int i, StringToIntConverter stringToIntConverter) {
        this.mVersionCode = i;
        this.Fa = stringToIntConverter;
    }

    private ConverterWrapper(StringToIntConverter stringToIntConverter) {
        this.mVersionCode = 1;
        this.Fa = stringToIntConverter;
    }

    public static ConverterWrapper zza(FastJsonResponse.zza<?, ?> zzaVar) {
        if (zzaVar instanceof StringToIntConverter) {
            return new ConverterWrapper((StringToIntConverter) zzaVar);
        }
        throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StringToIntConverter zzaww() {
        return this.Fa;
    }

    public FastJsonResponse.zza<?, ?> zzawx() {
        if (this.Fa != null) {
            return this.Fa;
        }
        throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
    }
}
