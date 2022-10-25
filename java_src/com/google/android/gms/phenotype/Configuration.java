package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
/* loaded from: classes2.dex */
public class Configuration extends AbstractSafeParcelable implements Comparable<Configuration> {
    public static final Parcelable.Creator<Configuration> CREATOR = new zza();
    public final int aAs;
    public final Flag[] aAt;
    public final String[] aAu;
    public final Map<String, Flag> aAv = new TreeMap();
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Configuration(int i, int i2, Flag[] flagArr, String[] strArr) {
        this.mVersionCode = i;
        this.aAs = i2;
        this.aAt = flagArr;
        for (Flag flag : flagArr) {
            this.aAv.put(flag.name, flag);
        }
        this.aAu = strArr;
        if (this.aAu != null) {
            Arrays.sort(this.aAu);
        }
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Configuration)) {
            return false;
        }
        Configuration configuration = (Configuration) obj;
        return this.mVersionCode == configuration.mVersionCode && this.aAs == configuration.aAs && zzz.equal(this.aAv, configuration.aAv) && Arrays.equals(this.aAu, configuration.aAu);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Configuration(");
        sb.append(this.mVersionCode);
        sb.append(", ");
        sb.append(this.aAs);
        sb.append(", ");
        sb.append("(");
        for (Flag flag : this.aAv.values()) {
            sb.append(flag);
            sb.append(", ");
        }
        sb.append(")");
        sb.append(", ");
        sb.append("(");
        if (this.aAu != null) {
            for (String str : this.aAu) {
                sb.append(str);
                sb.append(", ");
            }
        } else {
            sb.append("null");
        }
        sb.append(")");
        sb.append(")");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    @Override // java.lang.Comparable
    /* renamed from: zza */
    public int compareTo(Configuration configuration) {
        return this.aAs - configuration.aAs;
    }
}
