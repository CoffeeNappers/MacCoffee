package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public class AccountChangeEvent extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AccountChangeEvent> CREATOR = new zza();
    final int hA;
    final String hB;
    final long hx;
    final String hy;
    final int hz;
    final int mVersion;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccountChangeEvent(int i, long j, String str, int i2, int i3, String str2) {
        this.mVersion = i;
        this.hx = j;
        this.hy = (String) zzaa.zzy(str);
        this.hz = i2;
        this.hA = i3;
        this.hB = str2;
    }

    public AccountChangeEvent(long j, String str, int i, int i2, String str2) {
        this.mVersion = 1;
        this.hx = j;
        this.hy = (String) zzaa.zzy(str);
        this.hz = i;
        this.hA = i2;
        this.hB = str2;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AccountChangeEvent)) {
            return false;
        }
        AccountChangeEvent accountChangeEvent = (AccountChangeEvent) obj;
        return this.mVersion == accountChangeEvent.mVersion && this.hx == accountChangeEvent.hx && zzz.equal(this.hy, accountChangeEvent.hy) && this.hz == accountChangeEvent.hz && this.hA == accountChangeEvent.hA && zzz.equal(this.hB, accountChangeEvent.hB);
    }

    public String getAccountName() {
        return this.hy;
    }

    public String getChangeData() {
        return this.hB;
    }

    public int getChangeType() {
        return this.hz;
    }

    public int getEventIndex() {
        return this.hA;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.mVersion), Long.valueOf(this.hx), this.hy, Integer.valueOf(this.hz), Integer.valueOf(this.hA), this.hB);
    }

    public String toString() {
        String str = "UNKNOWN";
        switch (this.hz) {
            case 1:
                str = "ADDED";
                break;
            case 2:
                str = "REMOVED";
                break;
            case 3:
                str = "RENAMED_FROM";
                break;
            case 4:
                str = "RENAMED_TO";
                break;
        }
        String str2 = this.hy;
        String str3 = this.hB;
        return new StringBuilder(String.valueOf(str2).length() + 91 + String.valueOf(str).length() + String.valueOf(str3).length()).append("AccountChangeEvent {accountName = ").append(str2).append(", changeType = ").append(str).append(", changeData = ").append(str3).append(", eventIndex = ").append(this.hA).append("}").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }
}
