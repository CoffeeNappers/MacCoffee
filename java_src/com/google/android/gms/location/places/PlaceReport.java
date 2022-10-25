package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.share.internal.ShareConstants;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public class PlaceReport extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<PlaceReport> CREATOR = new zzi();
    private final String alV;
    private final String bQ;
    private final String mTag;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PlaceReport(int i, String str, String str2, String str3) {
        this.mVersionCode = i;
        this.alV = str;
        this.mTag = str2;
        this.bQ = str3;
    }

    public static PlaceReport create(String str, String str2) {
        return zzj(str, str2, "unknown");
    }

    public static PlaceReport zzj(String str, String str2, String str3) {
        zzaa.zzy(str);
        zzaa.zzib(str2);
        zzaa.zzib(str3);
        zzaa.zzb(zzla(str3), "Invalid source");
        return new PlaceReport(1, str, str2, str3);
    }

    private static boolean zzla(String str) {
        char c = 65535;
        switch (str.hashCode()) {
            case -1436706272:
                if (str.equals("inferredGeofencing")) {
                    c = 2;
                    break;
                }
                break;
            case -1194968642:
                if (str.equals("userReported")) {
                    c = 1;
                    break;
                }
                break;
            case -284840886:
                if (str.equals("unknown")) {
                    c = 0;
                    break;
                }
                break;
            case -262743844:
                if (str.equals("inferredReverseGeocoding")) {
                    c = 4;
                    break;
                }
                break;
            case 1164924125:
                if (str.equals("inferredSnappedToRoad")) {
                    c = 5;
                    break;
                }
                break;
            case 1287171955:
                if (str.equals("inferredRadioSignals")) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                return true;
            default:
                return false;
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof PlaceReport)) {
            return false;
        }
        PlaceReport placeReport = (PlaceReport) obj;
        return zzz.equal(this.alV, placeReport.alV) && zzz.equal(this.mTag, placeReport.mTag) && zzz.equal(this.bQ, placeReport.bQ);
    }

    public String getPlaceId() {
        return this.alV;
    }

    public String getSource() {
        return this.bQ;
    }

    public String getTag() {
        return this.mTag;
    }

    public int hashCode() {
        return zzz.hashCode(this.alV, this.mTag, this.bQ);
    }

    public String toString() {
        zzz.zza zzx = zzz.zzx(this);
        zzx.zzg("placeId", this.alV);
        zzx.zzg("tag", this.mTag);
        if (!"unknown".equals(this.bQ)) {
            zzx.zzg(ShareConstants.FEED_SOURCE_PARAM, this.bQ);
        }
        return zzx.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzi.zza(this, parcel, i);
    }
}
