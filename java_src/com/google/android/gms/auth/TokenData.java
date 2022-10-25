package com.google.android.gms.auth;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
import java.util.List;
/* loaded from: classes2.dex */
public class TokenData extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<TokenData> CREATOR = new zzf();
    private final String hN;
    private final Long hO;
    private final boolean hP;
    private final boolean hQ;
    private final List<String> hR;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TokenData(int i, String str, Long l, boolean z, boolean z2, List<String> list) {
        this.mVersionCode = i;
        this.hN = zzaa.zzib(str);
        this.hO = l;
        this.hP = z;
        this.hQ = z2;
        this.hR = list;
    }

    @Nullable
    public static TokenData zzd(Bundle bundle, String str) {
        bundle.setClassLoader(TokenData.class.getClassLoader());
        Bundle bundle2 = bundle.getBundle(str);
        if (bundle2 == null) {
            return null;
        }
        bundle2.setClassLoader(TokenData.class.getClassLoader());
        return (TokenData) bundle2.getParcelable("TokenData");
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof TokenData)) {
            return false;
        }
        TokenData tokenData = (TokenData) obj;
        return TextUtils.equals(this.hN, tokenData.hN) && zzz.equal(this.hO, tokenData.hO) && this.hP == tokenData.hP && this.hQ == tokenData.hQ && zzz.equal(this.hR, tokenData.hR);
    }

    public String getToken() {
        return this.hN;
    }

    public int hashCode() {
        return zzz.hashCode(this.hN, this.hO, Boolean.valueOf(this.hP), Boolean.valueOf(this.hQ), this.hR);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    @Nullable
    public Long zzahy() {
        return this.hO;
    }

    public boolean zzahz() {
        return this.hP;
    }

    public boolean zzaia() {
        return this.hQ;
    }

    @Nullable
    public List<String> zzaib() {
        return this.hR;
    }
}
