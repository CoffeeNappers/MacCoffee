package com.google.android.gms.auth.api.signin;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes.dex */
public class SignInAccount extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<SignInAccount> CREATOR = new zzc();
    @Deprecated
    String ck;
    @Deprecated
    String jg;
    private GoogleSignInAccount jy;
    final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SignInAccount(int i, String str, GoogleSignInAccount googleSignInAccount, String str2) {
        this.versionCode = i;
        this.jy = googleSignInAccount;
        this.jg = zzaa.zzh(str, "8.3 and 8.4 SDKs require non-null email");
        this.ck = zzaa.zzh(str2, "8.3 and 8.4 SDKs require non-null userId");
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }

    public GoogleSignInAccount zzaiz() {
        return this.jy;
    }
}
