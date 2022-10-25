package com.google.android.gms.internal;

import android.text.TextUtils;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzms extends com.google.android.gms.analytics.zzg<zzms> {
    private String bN;
    private String bO;
    private String bP;
    private String zzctj;

    public void setAppId(String str) {
        this.zzctj = str;
    }

    public void setAppInstallerId(String str) {
        this.bP = str;
    }

    public void setAppName(String str) {
        this.bN = str;
    }

    public void setAppVersion(String str) {
        this.bO = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("appName", this.bN);
        hashMap.put("appVersion", this.bO);
        hashMap.put(ArgKeys.APP_ID, this.zzctj);
        hashMap.put("appInstallerId", this.bP);
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzms zzmsVar) {
        if (!TextUtils.isEmpty(this.bN)) {
            zzmsVar.setAppName(this.bN);
        }
        if (!TextUtils.isEmpty(this.bO)) {
            zzmsVar.setAppVersion(this.bO);
        }
        if (!TextUtils.isEmpty(this.zzctj)) {
            zzmsVar.setAppId(this.zzctj);
        }
        if (!TextUtils.isEmpty(this.bP)) {
            zzmsVar.setAppInstallerId(this.bP);
        }
    }

    public String zzaae() {
        return this.bN;
    }

    public String zzaaf() {
        return this.bO;
    }

    public String zzaag() {
        return this.bP;
    }

    public String zzup() {
        return this.zzctj;
    }
}
