package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.data.ServerKeys;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzmz extends com.google.android.gms.analytics.zzg<zzmz> {
    private String cd;
    private String ce;
    private long cf;
    private String mCategory;

    public String getAction() {
        return this.cd;
    }

    public String getCategory() {
        return this.mCategory;
    }

    public String getLabel() {
        return this.ce;
    }

    public long getValue() {
        return this.cf;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put(ServerKeys.CATEGORY, this.mCategory);
        hashMap.put(NativeProtocol.WEB_DIALOG_ACTION, this.cd);
        hashMap.put("label", this.ce);
        hashMap.put("value", Long.valueOf(this.cf));
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmz zzmzVar) {
        if (!TextUtils.isEmpty(this.mCategory)) {
            zzmzVar.zzee(this.mCategory);
        }
        if (!TextUtils.isEmpty(this.cd)) {
            zzmzVar.zzef(this.cd);
        }
        if (!TextUtils.isEmpty(this.ce)) {
            zzmzVar.zzeg(this.ce);
        }
        if (this.cf != 0) {
            zzmzVar.zzq(this.cf);
        }
    }

    public void zzee(String str) {
        this.mCategory = str;
    }

    public void zzef(String str) {
        this.cd = str;
    }

    public void zzeg(String str) {
        this.ce = str;
    }

    public void zzq(long j) {
        this.cf = j;
    }
}
