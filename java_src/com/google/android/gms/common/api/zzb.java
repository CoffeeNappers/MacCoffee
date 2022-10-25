package com.google.android.gms.common.api;

import android.support.v4.util.ArrayMap;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzql;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzb extends Exception {
    private final ArrayMap<zzql<?>, ConnectionResult> xo;

    public zzb(ArrayMap<zzql<?>, ConnectionResult> arrayMap) {
        this.xo = arrayMap;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        ArrayList arrayList = new ArrayList();
        boolean z = true;
        for (zzql<?> zzqlVar : this.xo.keySet()) {
            ConnectionResult connectionResult = this.xo.get(zzqlVar);
            if (connectionResult.isSuccess()) {
                z = false;
            }
            String valueOf = String.valueOf(zzqlVar.zzarl());
            String valueOf2 = String.valueOf(connectionResult);
            arrayList.add(new StringBuilder(String.valueOf(valueOf).length() + 2 + String.valueOf(valueOf2).length()).append(valueOf).append(": ").append(valueOf2).toString());
        }
        StringBuilder sb = new StringBuilder();
        if (z) {
            sb.append("None of the queried APIs are available. ");
        } else {
            sb.append("Some of the queried APIs are unavailable. ");
        }
        zzx.zzia("; ").zza(sb, arrayList);
        return sb.toString();
    }

    public ArrayMap<zzql<?>, ConnectionResult> zzara() {
        return this.xo;
    }
}
