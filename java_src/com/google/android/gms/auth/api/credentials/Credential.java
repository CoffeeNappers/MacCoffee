package com.google.android.gms.auth.api.credentials;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class Credential extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<Credential> CREATOR = new zza();
    public static final String EXTRA_KEY = "com.google.android.gms.credentials.Credential";
    @Nullable
    private final Uri il;
    private final List<IdToken> im;
    @Nullable

    /* renamed from: io  reason: collision with root package name */
    private final String f4io;
    @Nullable
    private final String ip;
    @Nullable
    private final String iq;
    @Nullable
    private final String ir;
    @Nullable
    private final String is;
    @Nullable
    private final String it;
    @Nullable
    private final String mName;
    final int mVersionCode;
    private final String zzboa;

    /* loaded from: classes2.dex */
    public static class Builder {
        private Uri il;
        private List<IdToken> im;

        /* renamed from: io  reason: collision with root package name */
        private String f5io;
        private String ip;
        private String iq;
        private String ir;
        private String is;
        private String it;
        private String mName;
        private final String zzboa;

        public Builder(Credential credential) {
            this.zzboa = credential.zzboa;
            this.mName = credential.mName;
            this.il = credential.il;
            this.im = credential.im;
            this.f5io = credential.f4io;
            this.ip = credential.ip;
            this.iq = credential.iq;
            this.ir = credential.ir;
            this.is = credential.is;
            this.it = credential.it;
        }

        public Builder(String str) {
            this.zzboa = str;
        }

        public Credential build() {
            return new Credential(4, this.zzboa, this.mName, this.il, this.im, this.f5io, this.ip, this.iq, this.ir, this.is, this.it);
        }

        public Builder setAccountType(String str) {
            this.ip = str;
            return this;
        }

        public Builder setName(String str) {
            this.mName = str;
            return this;
        }

        public Builder setPassword(String str) {
            this.f5io = str;
            return this;
        }

        public Builder setProfilePictureUri(Uri uri) {
            this.il = uri;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Credential(int i, String str, String str2, Uri uri, List<IdToken> list, String str3, String str4, String str5, String str6, String str7, String str8) {
        this.mVersionCode = i;
        String trim = ((String) zzaa.zzb(str, "credential identifier cannot be null")).trim();
        zzaa.zzh(trim, "credential identifier cannot be empty");
        this.zzboa = trim;
        if (str2 != null && TextUtils.isEmpty(str2.trim())) {
            str2 = null;
        }
        this.mName = str2;
        this.il = uri;
        this.im = list == null ? Collections.emptyList() : Collections.unmodifiableList(list);
        this.f4io = str3;
        if (str3 == null || !str3.isEmpty()) {
            if (!TextUtils.isEmpty(str4)) {
                com.google.android.gms.auth.api.credentials.internal.zzb.zzfx(str4);
            }
            this.ip = str4;
            this.iq = str5;
            this.ir = str6;
            this.is = str7;
            this.it = str8;
            if (!TextUtils.isEmpty(this.f4io) && !TextUtils.isEmpty(this.ip)) {
                throw new IllegalStateException("password and accountType cannot both be set");
            }
            return;
        }
        throw new IllegalArgumentException("password cannot be empty");
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Credential)) {
            return false;
        }
        Credential credential = (Credential) obj;
        return TextUtils.equals(this.zzboa, credential.zzboa) && TextUtils.equals(this.mName, credential.mName) && zzz.equal(this.il, credential.il) && TextUtils.equals(this.f4io, credential.f4io) && TextUtils.equals(this.ip, credential.ip) && TextUtils.equals(this.iq, credential.iq);
    }

    @Nullable
    public String getAccountType() {
        return this.ip;
    }

    @Nullable
    public String getFamilyName() {
        return this.it;
    }

    @Nullable
    public String getGeneratedPassword() {
        return this.iq;
    }

    @Nullable
    public String getGivenName() {
        return this.is;
    }

    public String getId() {
        return this.zzboa;
    }

    public List<IdToken> getIdTokens() {
        return this.im;
    }

    @Nullable
    public String getName() {
        return this.mName;
    }

    @Nullable
    public String getPassword() {
        return this.f4io;
    }

    @Nullable
    public Uri getProfilePictureUri() {
        return this.il;
    }

    public int hashCode() {
        return zzz.hashCode(this.zzboa, this.mName, this.il, this.f4io, this.ip, this.iq);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    public String zzaif() {
        return this.ir;
    }
}
