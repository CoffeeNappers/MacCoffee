package com.google.android.gms.common.server.response;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes2.dex */
public abstract class FastSafeParcelableJsonResponse extends FastJsonResponse implements SafeParcelable {
    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public Object zzic(String str) {
        return null;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public boolean zzid(String str) {
        return false;
    }
}
