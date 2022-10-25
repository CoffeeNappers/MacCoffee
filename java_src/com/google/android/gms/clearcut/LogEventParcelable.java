package com.google.android.gms.clearcut;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.clearcut.zza;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.internal.zzasf;
import com.google.android.gms.playlog.internal.PlayLoggerContext;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class LogEventParcelable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<LogEventParcelable> CREATOR = new zzc();
    public final int versionCode;
    public byte[][] wA;
    public boolean wB;
    public final zzasf.zzc wC;
    public final zza.zzc wD;
    public final zza.zzc wE;
    public PlayLoggerContext wv;
    public byte[] ww;
    public int[] wx;
    public String[] wy;
    public int[] wz;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LogEventParcelable(int i, PlayLoggerContext playLoggerContext, byte[] bArr, int[] iArr, String[] strArr, int[] iArr2, byte[][] bArr2, boolean z) {
        this.versionCode = i;
        this.wv = playLoggerContext;
        this.ww = bArr;
        this.wx = iArr;
        this.wy = strArr;
        this.wC = null;
        this.wD = null;
        this.wE = null;
        this.wz = iArr2;
        this.wA = bArr2;
        this.wB = z;
    }

    public LogEventParcelable(PlayLoggerContext playLoggerContext, zzasf.zzc zzcVar, zza.zzc zzcVar2, zza.zzc zzcVar3, int[] iArr, String[] strArr, int[] iArr2, byte[][] bArr, boolean z) {
        this.versionCode = 1;
        this.wv = playLoggerContext;
        this.wC = zzcVar;
        this.wD = zzcVar2;
        this.wE = zzcVar3;
        this.wx = iArr;
        this.wy = strArr;
        this.wz = iArr2;
        this.wA = bArr;
        this.wB = z;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LogEventParcelable)) {
            return false;
        }
        LogEventParcelable logEventParcelable = (LogEventParcelable) obj;
        return this.versionCode == logEventParcelable.versionCode && zzz.equal(this.wv, logEventParcelable.wv) && Arrays.equals(this.ww, logEventParcelable.ww) && Arrays.equals(this.wx, logEventParcelable.wx) && Arrays.equals(this.wy, logEventParcelable.wy) && zzz.equal(this.wC, logEventParcelable.wC) && zzz.equal(this.wD, logEventParcelable.wD) && zzz.equal(this.wE, logEventParcelable.wE) && Arrays.equals(this.wz, logEventParcelable.wz) && Arrays.deepEquals(this.wA, logEventParcelable.wA) && this.wB == logEventParcelable.wB;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.versionCode), this.wv, this.ww, this.wx, this.wy, this.wC, this.wD, this.wE, this.wz, this.wA, Boolean.valueOf(this.wB));
    }

    public String toString() {
        return "LogEventParcelable[" + this.versionCode + ", " + this.wv + ", LogEventBytes: " + (this.ww == null ? null : new String(this.ww)) + ", TestCodes: " + Arrays.toString(this.wx) + ", MendelPackages: " + Arrays.toString(this.wy) + ", LogEvent: " + this.wC + ", ExtensionProducer: " + this.wD + ", VeProducer: " + this.wE + ", ExperimentIDs: " + Arrays.toString(this.wz) + ", ExperimentTokens: " + Arrays.toString(this.wA) + ", AddPhenotypeExperimentTokens: " + this.wB + "]";
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }
}
