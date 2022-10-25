package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.vk.sharing.SharingService;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zznd extends com.google.android.gms.analytics.zzg<zznd> {
    public String cd;
    public String cx;
    public String cy;

    public String getAction() {
        return this.cd;
    }

    public String getTarget() {
        return this.cy;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("network", this.cx);
        hashMap.put(NativeProtocol.WEB_DIALOG_ACTION, this.cd);
        hashMap.put(SharingService.EXTRA_TARGET, this.cy);
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zznd zzndVar) {
        if (!TextUtils.isEmpty(this.cx)) {
            zzndVar.zzem(this.cx);
        }
        if (!TextUtils.isEmpty(this.cd)) {
            zzndVar.zzef(this.cd);
        }
        if (!TextUtils.isEmpty(this.cy)) {
            zzndVar.zzen(this.cy);
        }
    }

    public String zzabl() {
        return this.cx;
    }

    public void zzef(String str) {
        this.cd = str;
    }

    public void zzem(String str) {
        this.cx = str;
    }

    public void zzen(String str) {
        this.cy = str;
    }
}
