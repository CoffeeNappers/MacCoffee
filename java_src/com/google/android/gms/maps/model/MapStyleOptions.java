package com.google.android.gms.maps.model;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.io.IOException;
/* loaded from: classes2.dex */
public final class MapStyleOptions extends AbstractSafeParcelable {
    private String aqa;
    private final int mVersionCode;
    private static final String TAG = MapStyleOptions.class.getSimpleName();
    public static final Parcelable.Creator<MapStyleOptions> CREATOR = new zzf();

    /* JADX INFO: Access modifiers changed from: package-private */
    public MapStyleOptions(int i, String str) {
        this.mVersionCode = i;
        this.aqa = str;
    }

    public MapStyleOptions(String str) {
        this.mVersionCode = 1;
        this.aqa = str;
    }

    public static MapStyleOptions loadRawResourceStyle(Context context, int i) throws Resources.NotFoundException {
        try {
            return new MapStyleOptions(new String(com.google.android.gms.common.util.zzo.zzk(context.getResources().openRawResource(i)), "UTF-8"));
        } catch (IOException e) {
            String valueOf = String.valueOf(e);
            throw new Resources.NotFoundException(new StringBuilder(String.valueOf(valueOf).length() + 37).append("Failed to read resource ").append(i).append(": ").append(valueOf).toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    public String zzbsy() {
        return this.aqa;
    }
}
