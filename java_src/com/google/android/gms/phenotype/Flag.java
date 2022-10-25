package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Comparator;
/* loaded from: classes2.dex */
public class Flag extends AbstractSafeParcelable implements Comparable<Flag> {
    public static final Parcelable.Creator<Flag> CREATOR = new zzb();
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    public static final zza aAA = new zza();
    final String Fe;
    final long aAw;
    final byte[] aAx;
    public final int aAy;
    public final int aAz;
    final boolean ahI;
    final double ahK;
    final int mVersionCode;
    public final String name;

    /* loaded from: classes2.dex */
    public static class zza implements Comparator<Flag> {
        @Override // java.util.Comparator
        /* renamed from: zza */
        public int compare(Flag flag, Flag flag2) {
            return flag.aAz == flag2.aAz ? flag.name.compareTo(flag2.name) : flag.aAz - flag2.aAz;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Flag(int i, String str, long j, boolean z, double d, String str2, byte[] bArr, int i2, int i3) {
        this.mVersionCode = i;
        this.name = str;
        this.aAw = j;
        this.ahI = z;
        this.ahK = d;
        this.Fe = str2;
        this.aAx = bArr;
        this.aAy = i2;
        this.aAz = i3;
    }

    private static int compare(byte b, byte b2) {
        return b - b2;
    }

    private static int compare(int i, int i2) {
        if (i < i2) {
            return -1;
        }
        return i == i2 ? 0 : 1;
    }

    private static int compare(long j, long j2) {
        if (j < j2) {
            return -1;
        }
        return j == j2 ? 0 : 1;
    }

    private static int compare(String str, String str2) {
        if (str == str2) {
            return 0;
        }
        if (str == null) {
            return -1;
        }
        if (str2 != null) {
            return str.compareTo(str2);
        }
        return 1;
    }

    private static int compare(boolean z, boolean z2) {
        if (z == z2) {
            return 0;
        }
        return z ? 1 : -1;
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Flag)) {
            return false;
        }
        Flag flag = (Flag) obj;
        if (this.mVersionCode != flag.mVersionCode || !zzz.equal(this.name, flag.name) || this.aAy != flag.aAy || this.aAz != flag.aAz) {
            return false;
        }
        switch (this.aAy) {
            case 1:
                return this.aAw == flag.aAw;
            case 2:
                return this.ahI == flag.ahI;
            case 3:
                return this.ahK == flag.ahK;
            case 4:
                return zzz.equal(this.Fe, flag.Fe);
            case 5:
                return Arrays.equals(this.aAx, flag.aAx);
            default:
                throw new AssertionError(new StringBuilder(31).append("Invalid enum value: ").append(this.aAy).toString());
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        zza(sb);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    @Override // java.lang.Comparable
    /* renamed from: zza */
    public int compareTo(Flag flag) {
        int compareTo = this.name.compareTo(flag.name);
        if (compareTo != 0) {
            return compareTo;
        }
        int compare = compare(this.aAy, flag.aAy);
        if (compare != 0) {
            return compare;
        }
        switch (this.aAy) {
            case 1:
                return compare(this.aAw, flag.aAw);
            case 2:
                return compare(this.ahI, flag.ahI);
            case 3:
                return Double.compare(this.ahK, flag.ahK);
            case 4:
                return compare(this.Fe, flag.Fe);
            case 5:
                if (this.aAx == flag.aAx) {
                    return 0;
                }
                if (this.aAx == null) {
                    return -1;
                }
                if (flag.aAx == null) {
                    return 1;
                }
                for (int i = 0; i < Math.min(this.aAx.length, flag.aAx.length); i++) {
                    int compare2 = compare(this.aAx[i], flag.aAx[i]);
                    if (compare2 != 0) {
                        return compare2;
                    }
                }
                return compare(this.aAx.length, flag.aAx.length);
            default:
                throw new AssertionError(new StringBuilder(31).append("Invalid enum value: ").append(this.aAy).toString());
        }
    }

    public String zza(StringBuilder sb) {
        sb.append("Flag(");
        sb.append(this.mVersionCode);
        sb.append(", ");
        sb.append(this.name);
        sb.append(", ");
        switch (this.aAy) {
            case 1:
                sb.append(this.aAw);
                break;
            case 2:
                sb.append(this.ahI);
                break;
            case 3:
                sb.append(this.ahK);
                break;
            case 4:
                sb.append("'");
                sb.append(this.Fe);
                sb.append("'");
                break;
            case 5:
                if (this.aAx != null) {
                    sb.append("'");
                    sb.append(new String(this.aAx, UTF_8));
                    sb.append("'");
                    break;
                } else {
                    sb.append("null");
                    break;
                }
            default:
                String str = this.name;
                throw new AssertionError(new StringBuilder(String.valueOf(str).length() + 27).append("Invalid type: ").append(str).append(", ").append(this.aAy).toString());
        }
        sb.append(", ");
        sb.append(this.aAy);
        sb.append(", ");
        sb.append(this.aAz);
        sb.append(")");
        return sb.toString();
    }
}
