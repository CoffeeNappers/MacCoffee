package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.text.TextUtils;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzh {
    final String arA;
    final long arB;
    final EventParams arC;
    final String mName;
    final long vO;
    final String zzctj;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzh(zzx zzxVar, String str, String str2, String str3, long j, long j2, Bundle bundle) {
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        com.google.android.gms.common.internal.zzaa.zzib(str3);
        this.zzctj = str2;
        this.mName = str3;
        this.arA = TextUtils.isEmpty(str) ? null : str;
        this.vO = j;
        this.arB = j2;
        if (this.arB != 0 && this.arB > this.vO) {
            zzxVar.zzbwb().zzbxa().log("Event created with reverse previous/current timestamps");
        }
        this.arC = zza(zzxVar, bundle);
    }

    private zzh(zzx zzxVar, String str, String str2, String str3, long j, long j2, EventParams eventParams) {
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        com.google.android.gms.common.internal.zzaa.zzib(str3);
        com.google.android.gms.common.internal.zzaa.zzy(eventParams);
        this.zzctj = str2;
        this.mName = str3;
        this.arA = TextUtils.isEmpty(str) ? null : str;
        this.vO = j;
        this.arB = j2;
        if (this.arB != 0 && this.arB > this.vO) {
            zzxVar.zzbwb().zzbxa().log("Event created with reverse previous/current timestamps");
        }
        this.arC = eventParams;
    }

    static EventParams zza(zzx zzxVar, Bundle bundle) {
        if (bundle == null || bundle.isEmpty()) {
            return new EventParams(new Bundle());
        }
        Bundle bundle2 = new Bundle(bundle);
        Iterator<String> it = bundle2.keySet().iterator();
        while (it.hasNext()) {
            String next = it.next();
            if (next == null) {
                zzxVar.zzbwb().zzbwy().log("Param name can't be null");
                it.remove();
            } else {
                Object zzl = zzxVar.zzbvx().zzl(next, bundle2.get(next));
                if (zzl == null) {
                    zzxVar.zzbwb().zzbxa().zzj("Param value can't be null", next);
                    it.remove();
                } else {
                    zzxVar.zzbvx().zza(bundle2, next, zzl);
                }
            }
        }
        return new EventParams(bundle2);
    }

    public String toString() {
        String str = this.zzctj;
        String str2 = this.mName;
        String valueOf = String.valueOf(this.arC);
        return new StringBuilder(String.valueOf(str).length() + 33 + String.valueOf(str2).length() + String.valueOf(valueOf).length()).append("Event{appId='").append(str).append("'").append(", name='").append(str2).append("'").append(", params=").append(valueOf).append("}").toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzh zza(zzx zzxVar, long j) {
        return new zzh(zzxVar, this.arA, this.zzctj, this.mName, this.vO, j, this.arC);
    }
}
