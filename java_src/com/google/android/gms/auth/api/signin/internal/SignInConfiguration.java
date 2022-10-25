package com.google.android.gms.auth.api.signin.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public final class SignInConfiguration extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<SignInConfiguration> CREATOR = new zzj();
    private final String jK;
    private GoogleSignInOptions jL;
    final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SignInConfiguration(int i, String str, GoogleSignInOptions googleSignInOptions) {
        this.versionCode = i;
        this.jK = zzaa.zzib(str);
        this.jL = googleSignInOptions;
    }

    public SignInConfiguration(String str, GoogleSignInOptions googleSignInOptions) {
        this(3, str, googleSignInOptions);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj != null) {
            try {
                SignInConfiguration signInConfiguration = (SignInConfiguration) obj;
                if (this.jK.equals(signInConfiguration.zzajj()) && (this.jL != null ? this.jL.equals(signInConfiguration.zzajk()) : signInConfiguration.zzajk() == null)) {
                    z = true;
                }
            } catch (ClassCastException e) {
            }
        }
        return z;
    }

    public int hashCode() {
        return new zze().zzq(this.jK).zzq(this.jL).zzajf();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }

    public String zzajj() {
        return this.jK;
    }

    public GoogleSignInOptions zzajk() {
        return this.jL;
    }
}
