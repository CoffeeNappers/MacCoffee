package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.google.android.gms.auth.api.credentials.CredentialPickerConfig;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public final class HintRequest extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<HintRequest> CREATOR = new zzd();
    private final CredentialPickerConfig iC;
    private final boolean iD;
    private final boolean iE;
    private final String[] iz;
    final int mVersionCode;

    /* loaded from: classes2.dex */
    public static final class Builder {
        private CredentialPickerConfig iC = new CredentialPickerConfig.Builder().build();
        private boolean iD;
        private boolean iE;
        private String[] iz;

        public HintRequest build() {
            if (this.iz == null) {
                this.iz = new String[0];
            }
            if (this.iD || this.iE || this.iz.length != 0) {
                return new HintRequest(this);
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

        public Builder setEmailAddressIdentifierSupported(boolean z) {
            this.iD = z;
            return this;
        }

        public Builder setHintPickerConfig(@NonNull CredentialPickerConfig credentialPickerConfig) {
            this.iC = (CredentialPickerConfig) zzaa.zzy(credentialPickerConfig);
            return this;
        }

        public Builder setPhoneNumberIdentifierSupported(boolean z) {
            this.iE = z;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public HintRequest(int i, CredentialPickerConfig credentialPickerConfig, boolean z, boolean z2, String[] strArr) {
        this.mVersionCode = i;
        this.iC = (CredentialPickerConfig) zzaa.zzy(credentialPickerConfig);
        this.iD = z;
        this.iE = z2;
        this.iz = (String[]) zzaa.zzy(strArr);
    }

    private HintRequest(Builder builder) {
        this(1, builder.iC, builder.iD, builder.iE, builder.iz);
    }

    @NonNull
    public String[] getAccountTypes() {
        return this.iz;
    }

    @NonNull
    public CredentialPickerConfig getHintPickerConfig() {
        return this.iC;
    }

    public boolean isEmailAddressIdentifierSupported() {
        return this.iD;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }

    public boolean zzaih() {
        return this.iE;
    }
}
