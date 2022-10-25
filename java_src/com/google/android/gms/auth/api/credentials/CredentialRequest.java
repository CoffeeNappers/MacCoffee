package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.google.android.gms.auth.api.credentials.CredentialPickerConfig;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes.dex */
public final class CredentialRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CredentialRequest> CREATOR = new zzc();
    private final CredentialPickerConfig iA;
    private final CredentialPickerConfig iB;
    private final boolean iy;
    private final String[] iz;
    final int mVersionCode;

    /* loaded from: classes.dex */
    public static final class Builder {
        private CredentialPickerConfig iA;
        private CredentialPickerConfig iB;
        private boolean iy;
        private String[] iz;

        public CredentialRequest build() {
            if (this.iz == null) {
                this.iz = new String[0];
            }
            if (this.iy || this.iz.length != 0) {
                return new CredentialRequest(this);
            }
            throw new IllegalStateException("At least one authentication method must be specified");
        }

        public Builder setAccountTypes(String... strArr) {
            if (strArr == null) {
                strArr = new String[0];
            }
            this.iz = strArr;
            return this;
        }

        public Builder setCredentialHintPickerConfig(CredentialPickerConfig credentialPickerConfig) {
            this.iB = credentialPickerConfig;
            return this;
        }

        public Builder setCredentialPickerConfig(CredentialPickerConfig credentialPickerConfig) {
            this.iA = credentialPickerConfig;
            return this;
        }

        public Builder setPasswordLoginSupported(boolean z) {
            this.iy = z;
            return this;
        }

        @Deprecated
        public Builder setSupportsPasswordLogin(boolean z) {
            return setPasswordLoginSupported(z);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CredentialRequest(int i, boolean z, String[] strArr, CredentialPickerConfig credentialPickerConfig, CredentialPickerConfig credentialPickerConfig2) {
        this.mVersionCode = i;
        this.iy = z;
        this.iz = (String[]) zzaa.zzy(strArr);
        this.iA = credentialPickerConfig == null ? new CredentialPickerConfig.Builder().build() : credentialPickerConfig;
        this.iB = credentialPickerConfig2 == null ? new CredentialPickerConfig.Builder().build() : credentialPickerConfig2;
    }

    private CredentialRequest(Builder builder) {
        this(2, builder.iy, builder.iz, builder.iA, builder.iB);
    }

    @NonNull
    public String[] getAccountTypes() {
        return this.iz;
    }

    @NonNull
    public CredentialPickerConfig getCredentialHintPickerConfig() {
        return this.iB;
    }

    @NonNull
    public CredentialPickerConfig getCredentialPickerConfig() {
        return this.iA;
    }

    @Deprecated
    public boolean getSupportsPasswordLogin() {
        return isPasswordLoginSupported();
    }

    public boolean isPasswordLoginSupported() {
        return this.iy;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }
}
