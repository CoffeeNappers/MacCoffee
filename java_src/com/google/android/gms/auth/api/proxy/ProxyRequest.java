package com.google.android.gms.auth.api.proxy;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Patterns;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class ProxyRequest extends AbstractSafeParcelable {
    public static final int VERSION_CODE = 2;
    public final byte[] body;
    public final int httpMethod;
    Bundle iW;
    public final long timeoutMillis;
    public final String url;
    final int versionCode;
    public static final Parcelable.Creator<ProxyRequest> CREATOR = new zzb();
    public static final int HTTP_METHOD_GET = 0;
    public static final int HTTP_METHOD_POST = 1;
    public static final int HTTP_METHOD_PUT = 2;
    public static final int HTTP_METHOD_DELETE = 3;
    public static final int HTTP_METHOD_HEAD = 4;
    public static final int HTTP_METHOD_OPTIONS = 5;
    public static final int HTTP_METHOD_TRACE = 6;
    public static final int HTTP_METHOD_PATCH = 7;
    public static final int LAST_CODE = 7;

    /* loaded from: classes2.dex */
    public static class Builder {
        private String iX;
        private int iY = ProxyRequest.HTTP_METHOD_GET;
        private long zzcri = 3000;
        private byte[] iZ = null;
        private Bundle ja = new Bundle();

        public Builder(String str) {
            zzaa.zzib(str);
            if (Patterns.WEB_URL.matcher(str).matches()) {
                this.iX = str;
                return;
            }
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 51).append("The supplied url [ ").append(str).append("] is not match Patterns.WEB_URL!").toString());
        }

        public ProxyRequest build() {
            if (this.iZ == null) {
                this.iZ = new byte[0];
            }
            return new ProxyRequest(2, this.iX, this.iY, this.zzcri, this.iZ, this.ja);
        }

        public Builder putHeader(String str, String str2) {
            zzaa.zzh(str, "Header name cannot be null or empty!");
            Bundle bundle = this.ja;
            if (str2 == null) {
                str2 = "";
            }
            bundle.putString(str, str2);
            return this;
        }

        public Builder setBody(byte[] bArr) {
            this.iZ = bArr;
            return this;
        }

        public Builder setHttpMethod(int i) {
            zzaa.zzb(i >= 0 && i <= ProxyRequest.LAST_CODE, "Unrecognized http method code.");
            this.iY = i;
            return this;
        }

        public Builder setTimeoutMillis(long j) {
            zzaa.zzb(j >= 0, "The specified timeout must be non-negative.");
            this.zzcri = j;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ProxyRequest(int i, String str, int i2, long j, byte[] bArr, Bundle bundle) {
        this.versionCode = i;
        this.url = str;
        this.httpMethod = i2;
        this.timeoutMillis = j;
        this.body = bArr;
        this.iW = bundle;
    }

    public Map<String, String> getHeaderMap() {
        LinkedHashMap linkedHashMap = new LinkedHashMap(this.iW.size());
        for (String str : this.iW.keySet()) {
            linkedHashMap.put(str, this.iW.getString(str));
        }
        return Collections.unmodifiableMap(linkedHashMap);
    }

    public String toString() {
        String str = this.url;
        return new StringBuilder(String.valueOf(str).length() + 42).append("ProxyRequest[ url: ").append(str).append(", method: ").append(this.httpMethod).append(" ]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
