package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
/* loaded from: classes2.dex */
public class RegisterSectionInfo extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RegisterSectionInfo> CREATOR = new zzi();
    public final String gD;
    public final boolean gE;
    public final boolean gF;
    public final String gG;
    public final Feature[] gH;
    final int[] gI;
    public final String gJ;
    final int mVersionCode;
    public final String name;
    public final int weight;

    /* loaded from: classes2.dex */
    public static final class zza {
        private String gK;
        private boolean gL;
        private boolean gN;
        private BitSet gP;
        private String gQ;
        private final String mName;
        private int gM = 1;
        private final List<Feature> gO = new ArrayList();

        public zza(String str) {
            this.mName = str;
        }

        public RegisterSectionInfo zzahr() {
            int[] iArr;
            int i = 0;
            if (this.gP != null) {
                iArr = new int[this.gP.cardinality()];
                int nextSetBit = this.gP.nextSetBit(0);
                while (nextSetBit >= 0) {
                    iArr[i] = nextSetBit;
                    nextSetBit = this.gP.nextSetBit(nextSetBit + 1);
                    i++;
                }
            } else {
                iArr = null;
            }
            return new RegisterSectionInfo(this.mName, this.gK, this.gL, this.gM, this.gN, null, (Feature[]) this.gO.toArray(new Feature[this.gO.size()]), iArr, this.gQ);
        }

        public zza zzaz(boolean z) {
            this.gL = z;
            return this;
        }

        public zza zzba(boolean z) {
            this.gN = z;
            return this;
        }

        public zza zzco(int i) {
            if (this.gP == null) {
                this.gP = new BitSet();
            }
            this.gP.set(i);
            return this;
        }

        public zza zzfr(String str) {
            this.gK = str;
            return this;
        }

        public zza zzfs(String str) {
            this.gQ = str;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public RegisterSectionInfo(int i, String str, String str2, boolean z, int i2, boolean z2, String str3, Feature[] featureArr, int[] iArr, String str4) {
        this.mVersionCode = i;
        this.name = str;
        this.gD = str2;
        this.gE = z;
        this.weight = i2;
        this.gF = z2;
        this.gG = str3;
        this.gH = featureArr;
        this.gI = iArr;
        this.gJ = str4;
    }

    RegisterSectionInfo(String str, String str2, boolean z, int i, boolean z2, String str3, Feature[] featureArr, int[] iArr, String str4) {
        this(2, str, str2, z, i, z2, str3, featureArr, iArr, str4);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzi.zza(this, parcel, i);
    }
}
