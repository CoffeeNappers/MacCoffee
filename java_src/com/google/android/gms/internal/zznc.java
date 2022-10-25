package com.google.android.gms.internal;

import android.text.TextUtils;
import android.util.Log;
import com.facebook.internal.AnalyticsEvents;
import java.util.HashMap;
import java.util.UUID;
/* loaded from: classes2.dex */
public final class zznc extends com.google.android.gms.analytics.zzg<zznc> {
    private String cq;
    private int cr;
    private int cs;
    private String ct;
    private String cu;
    private boolean cv;
    private boolean cw;

    public zznc() {
        this(false);
    }

    public zznc(boolean z) {
        this(z, zzabg());
    }

    public zznc(boolean z, int i) {
        com.google.android.gms.common.internal.zzaa.zzgp(i);
        this.cr = i;
        this.cw = z;
    }

    static int zzabg() {
        UUID randomUUID = UUID.randomUUID();
        int leastSignificantBits = (int) (randomUUID.getLeastSignificantBits() & 2147483647L);
        if (leastSignificantBits != 0) {
            return leastSignificantBits;
        }
        int mostSignificantBits = (int) (randomUUID.getMostSignificantBits() & 2147483647L);
        if (mostSignificantBits != 0) {
            return mostSignificantBits;
        }
        Log.e("GAv4", "UUID.randomUUID() returned 0.");
        return Integer.MAX_VALUE;
    }

    private void zzabk() {
    }

    public void setScreenName(String str) {
        zzabk();
        this.cq = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("screenName", this.cq);
        hashMap.put("interstitial", Boolean.valueOf(this.cv));
        hashMap.put(AnalyticsEvents.PARAMETER_SHARE_DIALOG_SHOW_AUTOMATIC, Boolean.valueOf(this.cw));
        hashMap.put("screenId", Integer.valueOf(this.cr));
        hashMap.put("referrerScreenId", Integer.valueOf(this.cs));
        hashMap.put("referrerScreenName", this.ct);
        hashMap.put("referrerUri", this.cu);
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zznc zzncVar) {
        if (!TextUtils.isEmpty(this.cq)) {
            zzncVar.setScreenName(this.cq);
        }
        if (this.cr != 0) {
            zzncVar.zzcd(this.cr);
        }
        if (this.cs != 0) {
            zzncVar.zzce(this.cs);
        }
        if (!TextUtils.isEmpty(this.ct)) {
            zzncVar.zzek(this.ct);
        }
        if (!TextUtils.isEmpty(this.cu)) {
            zzncVar.zzel(this.cu);
        }
        if (this.cv) {
            zzncVar.zzav(this.cv);
        }
        if (this.cw) {
            zzncVar.zzau(this.cw);
        }
    }

    public String zzabh() {
        return this.cq;
    }

    public int zzabi() {
        return this.cr;
    }

    public String zzabj() {
        return this.cu;
    }

    public void zzau(boolean z) {
        zzabk();
        this.cw = z;
    }

    public void zzav(boolean z) {
        zzabk();
        this.cv = z;
    }

    public void zzcd(int i) {
        zzabk();
        this.cr = i;
    }

    public void zzce(int i) {
        zzabk();
        this.cs = i;
    }

    public void zzek(String str) {
        zzabk();
        this.ct = str;
    }

    public void zzel(String str) {
        zzabk();
        if (TextUtils.isEmpty(str)) {
            this.cu = null;
        } else {
            this.cu = str;
        }
    }
}
