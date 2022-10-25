package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.facebook.share.internal.ShareConstants;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzmt extends com.google.android.gms.analytics.zzg<zzmt> {
    private String bQ;
    private String bR;
    private String bS;
    private String bT;
    private String bU;
    private String bV;
    private String bW;
    private String mName;
    private String zzbme;
    private String zzboa;

    public String getContent() {
        return this.zzbme;
    }

    public String getId() {
        return this.zzboa;
    }

    public String getName() {
        return this.mName;
    }

    public String getSource() {
        return this.bQ;
    }

    public void setName(String str) {
        this.mName = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("name", this.mName);
        hashMap.put(ShareConstants.FEED_SOURCE_PARAM, this.bQ);
        hashMap.put("medium", this.bR);
        hashMap.put("keyword", this.bS);
        hashMap.put(UriUtil.LOCAL_CONTENT_SCHEME, this.zzbme);
        hashMap.put("id", this.zzboa);
        hashMap.put("adNetworkId", this.bT);
        hashMap.put("gclid", this.bU);
        hashMap.put("dclid", this.bV);
        hashMap.put("aclid", this.bW);
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmt zzmtVar) {
        if (!TextUtils.isEmpty(this.mName)) {
            zzmtVar.setName(this.mName);
        }
        if (!TextUtils.isEmpty(this.bQ)) {
            zzmtVar.zzdu(this.bQ);
        }
        if (!TextUtils.isEmpty(this.bR)) {
            zzmtVar.zzdv(this.bR);
        }
        if (!TextUtils.isEmpty(this.bS)) {
            zzmtVar.zzdw(this.bS);
        }
        if (!TextUtils.isEmpty(this.zzbme)) {
            zzmtVar.zzdx(this.zzbme);
        }
        if (!TextUtils.isEmpty(this.zzboa)) {
            zzmtVar.zzdy(this.zzboa);
        }
        if (!TextUtils.isEmpty(this.bT)) {
            zzmtVar.zzdz(this.bT);
        }
        if (!TextUtils.isEmpty(this.bU)) {
            zzmtVar.zzea(this.bU);
        }
        if (!TextUtils.isEmpty(this.bV)) {
            zzmtVar.zzeb(this.bV);
        }
        if (!TextUtils.isEmpty(this.bW)) {
            zzmtVar.zzec(this.bW);
        }
    }

    public String zzaah() {
        return this.bR;
    }

    public String zzaai() {
        return this.bS;
    }

    public String zzaaj() {
        return this.bT;
    }

    public String zzaak() {
        return this.bU;
    }

    public String zzaal() {
        return this.bV;
    }

    public String zzaam() {
        return this.bW;
    }

    public void zzdu(String str) {
        this.bQ = str;
    }

    public void zzdv(String str) {
        this.bR = str;
    }

    public void zzdw(String str) {
        this.bS = str;
    }

    public void zzdx(String str) {
        this.zzbme = str;
    }

    public void zzdy(String str) {
        this.zzboa = str;
    }

    public void zzdz(String str) {
        this.bT = str;
    }

    public void zzea(String str) {
        this.bU = str;
    }

    public void zzeb(String str) {
        this.bV = str;
    }

    public void zzec(String str) {
        this.bW = str;
    }
}
