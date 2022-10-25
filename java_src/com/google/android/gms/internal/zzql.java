package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
/* loaded from: classes2.dex */
public final class zzql<O extends Api.ApiOptions> {
    private final Api<O> vS;
    private final O xw;
    private final boolean yo;
    private final int yp;

    private zzql(Api<O> api) {
        this.yo = true;
        this.vS = api;
        this.xw = null;
        this.yp = System.identityHashCode(this);
    }

    private zzql(Api<O> api, O o) {
        this.yo = false;
        this.vS = api;
        this.xw = o;
        this.yp = com.google.android.gms.common.internal.zzz.hashCode(this.vS, this.xw);
    }

    public static <O extends Api.ApiOptions> zzql<O> zza(Api<O> api, O o) {
        return new zzql<>(api, o);
    }

    public static <O extends Api.ApiOptions> zzql<O> zzb(Api<O> api) {
        return new zzql<>(api);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzql)) {
            return false;
        }
        zzql zzqlVar = (zzql) obj;
        return !this.yo && !zzqlVar.yo && com.google.android.gms.common.internal.zzz.equal(this.vS, zzqlVar.vS) && com.google.android.gms.common.internal.zzz.equal(this.xw, zzqlVar.xw);
    }

    public int hashCode() {
        return this.yp;
    }

    public String zzarl() {
        return this.vS.getName();
    }
}
