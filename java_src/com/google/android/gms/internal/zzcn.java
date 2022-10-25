package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzcn {
    private final String zzasu;
    private final JSONObject zzasv;
    private final String zzasw;
    private final String zzasx;
    private final boolean zzasy;
    private final boolean zzasz;

    public zzcn(String str, VersionInfoParcel versionInfoParcel, String str2, JSONObject jSONObject, boolean z, boolean z2) {
        this.zzasx = versionInfoParcel.zzda;
        this.zzasv = jSONObject;
        this.zzasw = str;
        this.zzasu = str2;
        this.zzasy = z;
        this.zzasz = z2;
    }

    public String zzhy() {
        return this.zzasu;
    }

    public String zzhz() {
        return this.zzasx;
    }

    public JSONObject zzia() {
        return this.zzasv;
    }

    public String zzib() {
        return this.zzasw;
    }

    public boolean zzic() {
        return this.zzasy;
    }

    public boolean zzid() {
        return this.zzasz;
    }
}
