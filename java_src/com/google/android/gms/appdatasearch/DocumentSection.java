package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.appdatasearch.RegisterSectionInfo;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public class DocumentSection extends AbstractSafeParcelable {
    public final String go;
    final RegisterSectionInfo gp;
    public final int gq;
    public final byte[] gr;
    final int mVersionCode;
    public static final int gm = Integer.parseInt("-1");
    public static final Parcelable.Creator<DocumentSection> CREATOR = new zzd();
    private static final RegisterSectionInfo gn = new RegisterSectionInfo.zza("SsbContext").zzaz(true).zzfr("blob").zzahr();

    /* JADX INFO: Access modifiers changed from: package-private */
    public DocumentSection(int i, String str, RegisterSectionInfo registerSectionInfo, int i2, byte[] bArr) {
        zzaa.zzb(i2 == gm || zzh.zzcn(i2) != null, new StringBuilder(32).append("Invalid section type ").append(i2).toString());
        this.mVersionCode = i;
        this.go = str;
        this.gp = registerSectionInfo;
        this.gq = i2;
        this.gr = bArr;
        String zzahp = zzahp();
        if (zzahp != null) {
            throw new IllegalArgumentException(zzahp);
        }
    }

    public DocumentSection(String str, RegisterSectionInfo registerSectionInfo) {
        this(1, str, registerSectionInfo, gm, null);
    }

    public DocumentSection(String str, RegisterSectionInfo registerSectionInfo, String str2) {
        this(1, str, registerSectionInfo, zzh.zzfq(str2), null);
    }

    public DocumentSection(byte[] bArr, RegisterSectionInfo registerSectionInfo) {
        this(1, null, registerSectionInfo, gm, bArr);
    }

    public static DocumentSection zzl(byte[] bArr) {
        return new DocumentSection(bArr, gn);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }

    public String zzahp() {
        if (this.gq != gm && zzh.zzcn(this.gq) == null) {
            return new StringBuilder(32).append("Invalid section type ").append(this.gq).toString();
        } else if (this.go != null && this.gr != null) {
            return "Both content and blobContent set";
        } else {
            return null;
        }
    }
}
