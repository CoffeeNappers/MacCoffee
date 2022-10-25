package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzaiw;
import com.google.android.gms.internal.zzalx;
import java.util.List;
/* loaded from: classes2.dex */
public class ConnectionConfig extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ConnectionConfig> CREATOR = new zzb();
    final boolean baS;
    final String baU;
    final HostInfoParcelable bcl;
    final int bcm;
    final List<String> bcn;
    final String bco;
    final int versionCode;

    public ConnectionConfig(int i, HostInfoParcelable hostInfoParcelable, int i2, List<String> list, boolean z, String str, String str2) {
        this.versionCode = i;
        this.bcl = hostInfoParcelable;
        this.bcm = i2;
        this.bcn = list;
        this.baS = z;
        this.bco = str;
        this.baU = str2;
    }

    public ConnectionConfig(zzaiw zzaiwVar, zzalx.zza zzaVar, List<String> list, boolean z, String str, String str2) {
        int i;
        switch (zzaVar) {
            case DEBUG:
                i = 1;
                break;
            case INFO:
                i = 2;
                break;
            case WARN:
                i = 3;
                break;
            case ERROR:
                i = 4;
                break;
            default:
                i = 0;
                break;
        }
        this.versionCode = 1;
        this.bcl = HostInfoParcelable.zza(zzaiwVar);
        this.bcm = i;
        this.bcn = list;
        this.baS = z;
        this.bco = str;
        this.baU = str2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    public zzalx.zza zzctu() {
        switch (this.bcm) {
            case 0:
                return zzalx.zza.NONE;
            case 1:
                return zzalx.zza.DEBUG;
            case 2:
                return zzalx.zza.INFO;
            case 3:
                return zzalx.zza.WARN;
            case 4:
                return zzalx.zza.ERROR;
            default:
                return zzalx.zza.NONE;
        }
    }

    public List<String> zzctv() {
        return this.bcn;
    }
}
